<?php

    require_once __DIR__ . "/../vendor/autoload.php";

    use Web3p\EthereumTx\Transaction;

    function sendPolygonUSDT(
        string $recipientAddress,
        string $amountUSDT,
        string $privateKey,
        string $senderAddress,
        string $rpcUrl = "https://polygon-bor-rpc.publicnode.com",
        string $usdtContract = "0xc2132D05D31c914a87C6611C10748AeB04B58e8F"
    ) {

        $rpcCall = function ($method, $params = []) use ($rpcUrl) {

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

            if ($response === false) {
                throw new Exception(curl_error($ch));
            }

            curl_close($ch);

            return json_decode($response, true);
        };

        // USDT uses 6 decimals
        $amount = bcmul($amountUSDT, '1000000', 0);

        // Get nonce
        $nonceResult = $rpcCall(
            "eth_getTransactionCount",
            [$senderAddress, "pending"]
        );

        if (!isset($nonceResult['result'])) {
            throw new Exception("Failed to retrieve nonce");
        }

        $nonce = hexdec($nonceResult['result']);

        // Get gas price
        $gasPriceResult = $rpcCall("eth_gasPrice");

        if (!isset($gasPriceResult['result'])) {
            throw new Exception("Failed to retrieve gas price");
        }

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
            'nonce'    => '0x' . dechex($nonce),
            'gasPrice' => $gasPrice,
            'gasLimit' => '0x186A0', // 100000
            'to'       => $usdtContract,
            'value'    => '0x0',
            'data'     => $data,
            'chainId'  => 137
        ];

        $transaction = new Transaction($tx);

        $signed = '0x' . $transaction->sign($privateKey);

        return $rpcCall(
            "eth_sendRawTransaction",
            [$signed]
        );
    }

    /*$result = sendPolygonUSDT(
        "0x7bBAE8AA2C4745C406Bd552fE0203DB3E29ee066",
        "0.01",
        "YOUR_PRIVATE_KEY",
        "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf"
    );

    print_r($result);*/