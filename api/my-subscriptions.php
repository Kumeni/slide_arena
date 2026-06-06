<?php

    require './db.php';
    require './db-operations.php';
    require './subscriptions-core.php';
    require './core.php';

    $browserUUID = getBrowserUUID($host, $user, $password, $database);
    $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];

    $user_id = 1;
    $userSubscriptions = getActiveUserSubscriptions($host, $user, $password, $database, $user_id, $browserUUID);
    echo json_encode($userSubscriptions);

?>