<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';
    require './subscriptions-core.php';
    require_once "./json-files-core.php";

    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        $browser_uuid = getBrowserUUID($host, $user, $password, $database);

        $data = [
            "browser_uuid" => $browser_uuid
        ];

        echo json_encode($data);
    }
    