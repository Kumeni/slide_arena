<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';

    $browserUUID = getBrowserUUID($host, $user, $password, $database);
    $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];

    $data = json_decode(file_get_contents("php://input"), true);

    $tx_hash = $data["tx_hash"];
    $subscriptionId = $data["subscription_id"];
    $userId = 1;


    if(isset($tx_hash)){
        $sql = "INSERT INTO crypto_payments(`user_id`, `browser_uuid`, `subscription_id`, `tx_hash`) VALUES('$userId', '$browserUUID', '$subscriptionId', '$tx_hash')";
        $cryptoPaymentId = create($host, $user, $password, $database, $sql);

        $sql = "INSERT INTO bought_subscriptions(`user_id`, `browser_uuid`, `subscription_id`, `crypto_payment_id`) VALUES('$userId', '$browserUUID', '$subscriptionId', '$cryptoPaymentId')";
        $boughtSubscriptionId = create($host, $user, $password, $database, $sql);
    }

    echo json_encode([
        "success" => true,
        "tx_hash" => $tx_hash
    ]);
?>