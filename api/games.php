<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';

    // Only allow GET requests
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $playerUUID = getBrowserUUID($host, $user, $password, $database);

        /**
         * After creating a player UUID, it should be stored in the server, under devices
         */

        // You can now use this UUID
        // Example: return it in API response or use in DB queries
        echo json_encode([
            "player_uuid" => $playerUUID,
            "message" => "Latest games fetched successfully"
        ]);

        exit;
    }

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $games = getAvailableGames($host, $user, $password, $database);
        $browser_uuid = getBrowserUUID($host, $user, $password, $database);
        $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];

        if(isset($_GET["game-id"])){
            $gameId = $_GET["game-id"];

            $sql = "SELECT * FROM players WHERE game_id=$gameId AND browser_uuid='$browser_uuid'";
            $players = find($host, $user, $password, $database, $sql);
            $players = resultToArray($players);

            if(count($players) == 0){
                $sql = "INSERT INTO players(`game_id`, `browser_uuid`) VALUES('$gameId', '$browser_uuid')";
                $playerId = create($host, $user, $password, $database, $sql);
            }

            $gameId = $_GET["game-id"];
            $game = getGame($host, $user, $password, $database, $gameId);
            $game = getGamePlayers($host, $user, $password, $database, $game);
            $game = getGameWithRankedPlayers($game);
            echo json_encode($game);
            exit();
        }

        /*if(count($games) == 0){

            $seed = generateSolvableSeed();
            //$seed = $seed . "9";
            $currentTime = getCurrentDateTime();
            $sql = "INSERT INTO games(`seed`, `minimum_players`, `created_at`) VALUES('$seed', '1', '$currentTime')";
            $gameId = create($host, $user, $password, $database, $sql);

            $games = getAvailableGames($host, $user, $password, $database);
        }*/
        
        $games = createGames($host, $user, $password, $database);
        
        // Return JSON response
        header('Content-Type: application/json');
        $response = [
            "browser_uuid" => $browser_uuid,
            "games" => $games
        ];

        echo json_encode($response);
        
    }