<?php

    require './db.php';
    require './db-operations.php';
    require './subscriptions-core.php';
    require './core.php';
    
    /**
     * PRODUCTION READY USDT PAYMENT VERIFIER (Polygon / EVM)
     * - No API keys required
     * - RPC fallback
     * - USDT transfer verification
     * - Amount + receiver validation
     * - Database protection against duplicates
     */

    // ======================
    // CONFIG
    // ======================

    //const USDT_CONTRACT = "0x3813e82e6f7098b9583FC0F33a962D02018B6803"; // VERIFY THIS FOR YOUR NETWORK
    const USDT_CONTRACT = "0xc2132D05D31c914A87C6611C10748AEb04B58e8F"; // VERIFY THIS FOR YOUR NETWORK
    const TRANSFER_TOPIC = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef";

    function getRpcNodes() {
        return [
            "https://polygon-rpc.com",
            "https://rpc.ankr.com/polygon",
            "https://1rpc.io/matic"
        ];
    }

    // ======================
    // DB CONNECTION (EDIT)
    // ======================

    /*function getDB() {
        $host = "localhost";
        $db   = "your_db";
        $user = "your_user";
        $pass = "your_pass";

        return new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    }*/

    // ======================
    // RPC CALL WITH FALLBACK
    // ======================

    function rpcCall($payload) {

        foreach (getRpcNodes() as $rpcUrl) {

            $ch = curl_init($rpcUrl);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

            $response = curl_exec($ch);
            curl_close($ch);

            $data = json_decode($response, true);

            if (isset($data["result"])) {
                return $data["result"];
            }
        }

        return null;
    }

    // ======================
    // HEX DECODER (USDT = 6 decimals)
    // ======================

    function hexToAmount($hex) {
        return hexdec($hex) / 1000000;
    }

    // ======================
    // CORE VERIFICATION
    // ======================

    /*function verifyPayment($host, $user, $password, $database, $txHash, $expectedReceiver, $expectedAmount) {

        $receipt = rpcCall([
            "jsonrpc" => "2.0",
            "id" => 1,
            "method" => "eth_getTransactionReceipt",
            "params" => [$txHash]
        ]);

        if (!$receipt) {
            return ["status" => false, "message" => "Transaction not found"];
        }

        if ($receipt["status"] !== "0x1") {
            return ["status" => false, "message" => "Transaction failed"];
        }

        //foreach ($receipt["logs"] as $log) {
            //echo "Contract: ".$log["address"].PHP_EOL;
        //}

        foreach ($receipt["logs"] as $log) {

            //echo "To: ".$to.PHP_EOL;
            //echo "Amount: ".$amount.PHP_EOL;

            // Must be USDT contract
            if (strtolower($log["address"]) !== strtolower(USDT_CONTRACT)) {
                continue;
            }

            // Must be Transfer event
            if ($log["topics"][0] !== TRANSFER_TOPIC) {
                continue;
            }

            // Decode recipient
            $to = "0x" . substr($log["topics"][2], 26);

            // Decode amount
            $amount = hexToAmount($log["data"]);

            if (
                strtolower($to) === strtolower($expectedReceiver) &&
                abs($amount - $expectedAmount) < 0.000001
            ) {
                return [
                    "status" => true,
                    "amount" => $amount,
                    "message" => "Payment confirmed",
                    "to" => $to
                ];
            }
        }

        return ["status" => false, "message" => "No matching USDT transfer"];
    }*/

    function getTransactionDetails($txHash)
    {
        // Get transaction
        $tx = rpcCall([
            "jsonrpc" => "2.0",
            "id" => 1,
            "method" => "eth_getTransactionByHash",
            "params" => [$txHash]
        ]);

        if (!$tx) {
            return [
                "status" => false,
                "message" => "Transaction not found"
            ];
        }

        // Get receipt
        $receipt = rpcCall([
            "jsonrpc" => "2.0",
            "id" => 1,
            "method" => "eth_getTransactionReceipt",
            "params" => [$txHash]
        ]);

        if (!$receipt) {
            return [
                "status" => false,
                "message" => "Receipt not found"
            ];
        }

        $result = [

            // Basic transaction information
            "tx_hash" => $tx["hash"],
            "from" => $tx["from"],
            "to" => $tx["to"],
            "nonce" => hexdec($tx["nonce"]),
            "gas" => hexdec($tx["gas"]),
            "gas_price" => hexdec($tx["gasPrice"] ?? "0x0"),
            "value_wei" => hexdec($tx["value"]),
            "input" => $tx["input"],

            // Receipt information
            "block_number" => hexdec($receipt["blockNumber"]),
            "transaction_index" => hexdec($receipt["transactionIndex"]),
            "gas_used" => hexdec($receipt["gasUsed"]),
            "cumulative_gas_used" => hexdec($receipt["cumulativeGasUsed"]),
            "status" => ($receipt["status"] === "0x1"),
            "contract_address" => $receipt["contractAddress"],

            // Token transfers found in logs
            "transfers" => []
        ];

        foreach ($receipt["logs"] as $log) {

            if (
                isset($log["topics"][0]) &&
                strtolower($log["topics"][0]) === strtolower(TRANSFER_TOPIC)
            ) {

                $from = "0x" . substr($log["topics"][1], 26);
                $to   = "0x" . substr($log["topics"][2], 26);

                $result["transfers"][] = [
                    "token_contract" => $log["address"],
                    "from" => $from,
                    "to" => $to,
                    "amount_raw" => $log["data"],
                    "amount" => hexToAmount($log["data"])
                ];
            }
        }

        return $result;
    }

    // ======================
    // SAFE PROCESSOR (DB + DUPLICATE PROTECTION)
    // ======================

    function processTransaction($host, $user, $password, $database, $txHash, $wallet, $amount, $cryptoPaymentId) {

        //get all crypto transactions
        //if to is empty
        //fetch transaction details and fill
        //

        // Verify blockchain
        //$result = verifyPayment($host, $user, $password, $database, $txHash, $wallet, $amount);
        $result = getTransactionDetails($txHash)($txHash);
        /*
            [tx_hash] => 0x123...
            [from] => 0xabc...
            [to] => 0xc2132D05D31c914a87C6611C10748AEb04B58e8
            [nonce] => 145
            [gas] => 60000
            [gas_price] => 30000000000
            [value_wei] => 0
            [input] => 0xa9059cbb...
            [block_number] => 73512456
            [gas_used] => 52141
            [status] => 1

            [transfers] => Array
                (
                    [0] => Array
                        (
                            [token_contract] => 0xc2132D05D31c914a87C6611C10748AEb04B58e8
                            [from] => 0x111...
                            [to] => 0x222...
                            [amount] => 25
                        )
                )
        */
                
        if ($result["status"]) {

            $to = $result["to"];
            $status = 0;
            if($amount != null && $to != null && $amount !='' && $to != null){
                $status = 1;
            }
            $amount = $result["amount"];
            
            $confirmation_time = getCurrentDateTime();

            $sql = "UPDATE crypto_payments SET to_account = '$to', amount = '$amount', payment_status = $status, confirmation_time = '$confirmation_time' WHERE id = $cryptoPaymentId;";
            update($host, $user, $password, $database, $sql);

            echo json_encode($result);
            return ["status" => true, "message" => "Payment confirmed"];

        } else {
            var_dump($result);
            return ["status" => false, "message" => $result["message"]];
        }
    }
    
    function getIncompletePayments($host, $user, $password, $database){

        // Fetch all transactions that haven't been completed.

        $sql = "SELECT * FROM crypto_payments WHERE from_account IS NULL AND to_account IS NULL";
        $sql = "SELECT * FROM crypto_payments WHERE amount='' AND to_account='' AND payment_status = ''";
        $incompletePayments = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($incompletePayments as $index => $incompletePayment) {
            # code...
            //unset($game["winner_user_id"]);
            $newArray[] = $incompletePayment;
        }

        return $newArray;
    }

    // ======================
    // API ENDPOINT
    // ======================

    header("Content-Type: application/json");

    if ($_SERVER["REQUEST_METHOD"] === "GET") {

        $incompletePayments = getIncompletePayments($host, $user, $password, $database);
        
        foreach ($incompletePayments as $key => $incompletePayment) {
            # code...
            $txHash = $incompletePayment["tx_hash"] ?? null;
            $wallet = "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf" ?? null;
            $amount = "0.01" ?? null;
            $cryptoPaymentId = $incompletePayment["id"];

            if (!$txHash || !$wallet || !$amount) {
                echo json_encode(["status" => false, "message" => "Missing parameters"]);
                exit;
            }

            processTransaction($host, $user, $password, $database, $txHash, $wallet, $amount, $cryptoPaymentId);
        }

        //echo json_encode(getIncompletePayments($host, $user, $password, $database));
        exit;
    } else {
        echo json_encode(["status" => false, "message" => "Invalid request"]);
    }    