<?php
    require './db.php';
    require './db-operations.php';
    require './subscriptions-core.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        $subscriptions =  getAvailableSubscriptions($host, $user, $password, $database);

        echo json_encode($subscriptions);
    }
?>