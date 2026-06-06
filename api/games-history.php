<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';

    $browser_uuid = getBrowserUUID($host, $user, $password, $database);
    $games_participated = getGamesUserPlayed($host, $user, $password, $database, $browser_uuid);

    //var_dump($games_participated);
    echo json_encode($games_participated);
?>