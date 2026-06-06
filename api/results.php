<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $userId = $_GET["user-id"];
        $gameId = $_GET["game-id"];
        
        $game = getGame($host, $user, $password, $database, $gameId);
        $gameWithPlayers = getGamePlayers($host, $user, $password, $database, $game);
        $gameWithRankedPlayers = getGameWithRankedPlayers($gameWithPlayers);
        
        header('Content-Type: application/json');
        echo json_encode($gameWithRankedPlayers);
    }
    