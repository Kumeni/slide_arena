<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';
    require './subscriptions-core.php';
    require_once "./json-files-core.php";

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
        
        $browser_uuid = getBrowserUUID($host, $user, $password, $database);
        $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];
        $user_id = 1;

        if(isset($_GET["game-id"])){
            $gameId = $_GET["game-id"];

            $sql = "SELECT * FROM players WHERE game_id=$gameId AND browser_uuid='$browser_uuid' AND left_game=0";
            $players = find($host, $user, $password, $database, $sql);
            $players = resultToArray($players);

            if(count($players) == 0){
                $sql = "INSERT INTO players(`game_id`, `browser_uuid`) VALUES('$gameId', '$browser_uuid')";
                $playerId = create($host, $user, $password, $database, $sql);
            }

            $game = getGame($host, $user, $password, $database, $gameId);
            $game = getGamePlayers($host, $user, $password, $database, $game);
            $game = getGameWithRankedPlayers($game);
            echo json_encode($game);
            exit();
        }
        
        $games = getAvailableGames($host, $user, $password, $database);

        logOutPlayer($host, $user, $password, $database, $browser_uuid);
        $games = createGames($host, $user, $password, $database);
        $userSubscriptions = getSubscriptionsWithGamesPlayed($host, $user, $password, $database, $user_id, $browser_uuid);
        if ($userSubscriptions["remaining_platform_sponsored_tournamens"] == 0) {
            # code...
            $games["platform_sponsored_games"] = [];
        }
        // Return JSON response
        header('Content-Type: application/json');
        $response = [
            "browser_uuid" => $browser_uuid,
            "games" => $games
        ];

        echo json_encode($response);
    }