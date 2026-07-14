<?php

    require "../vendor/autoload.php";

    $rpcUrl = "https://polygon-rpc.com";
    $rpcUrl = "https://polygon-bor-rpc.publicnode.com";
    $privateKey = "a99993c3b088ae4af3d8bfc7811cf684eaab662558a9b10710905875d948468e";
    $senderAddress = "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf";
    $usdtContract = "0xc2132D05D31c914a87C6611C10748AeB04B58e8F"; // Polygon USDT

    function rpcCall($rpcUrl, $method, $params = []){
        $payload = [
            "jsonrpc" => "2.0",
            "method"  => $method,
            "params"  => $params,
            "id"      => 1
        ];

        $ch = curl_init($rpcUrl);

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/json'
            ],
            CURLOPT_POSTFIELDS => json_encode($payload)
        ]);

        $response = curl_exec($ch);

        curl_close($ch);

        return json_decode($response, true);
    }

    use Web3p\EthereumTx\Transaction;

    function sendUSDT( $rpcUrl, $privateKey, $senderAddress, $recipientAddress, $amountUSDT, $usdtContract ){
        // USDT uses 6 decimals
        $amount = bcmul($amountUSDT, '1000000');

        // Get nonce
        $nonceResult = rpcCall(
            $rpcUrl,
            "eth_getTransactionCount",
            [$senderAddress, "pending"]
        );

        var_dump($nonceResult);
        $nonce = hexdec($nonceResult['result']);

        // Get gas price
        $gasPriceResult = rpcCall(
            $rpcUrl,
            "eth_gasPrice"
        );

        $gasPrice = $gasPriceResult['result'];

        // ERC20 transfer(address,uint256)
        $methodId = "a9059cbb";

        $to = str_pad(
            substr(strtolower($recipientAddress), 2),
            64,
            "0",
            STR_PAD_LEFT
        );

        $value = str_pad(
            dechex($amount),
            64,
            "0",
            STR_PAD_LEFT
        );

        $data = "0x" . $methodId . $to . $value;

        $tx = [
            'nonce' => '0x' . dechex($nonce),
            'gasPrice' => $gasPrice,
            'gasLimit' => '0x186A0', // 100000
            'to' => $usdtContract,
            'value' => '0x0',
            'data' => $data,
            'chainId' => 137
        ];

        $transaction = new Transaction($tx);

        $signed = '0x' . $transaction->sign($privateKey);

        $broadcast = rpcCall(
            $rpcUrl,
            "eth_sendRawTransaction",
            [$signed]
        );

        return $broadcast;
    }

    $result = sendUSDT(
        $rpcUrl,
        $privateKey,
        $senderAddress,
        "0x7bBAE8AA2C4745C406Bd552fE0203DB3E29ee066",
        "0.01", // 10 USDT
        $usdtContract
    );

    print_r($result);