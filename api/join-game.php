<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';
    require './subscriptions-core.php';
    require_once "./json-files-core.php";

    //fetch the current game depending on the game Id
    $browserUUID = getBrowserUUID($host, $user, $password, $database);
    $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];


    // Read the raw request body
    $json = file_get_contents("php://input");

    // Decode it into an associative array
    $data = json_decode($json, true);
    $gameId = $data["gameId"];
    $secondsToStart = 15;


    $userId = getVisitorIP();

    function getVisitorIP() {
        // Check if user is behind a proxy or load balancer
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            return $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            // Can contain multiple IPs, take the first one
            $ipList = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            return trim($ipList[0]);
        } else {
            return $_SERVER['REMOTE_ADDR'];
        }
    }

    $game = getGame($host, $user, $password, $database, $gameId);
    $minimumPlayersPerGame = $game["minimum_players"];
    /**
     * If game is completed, redirect to the dashboard
     */

    $jsonGame = json_encode($game);
    
    $puzzle = $game["formatted_seed"];
    

    $game = getGamePlayers($host, $user, $password, $database, $game);
    
    /**
     * Insert the player if time is greater more than 30s to start;
     */
    
    if(count($game["players"]) >= (int)$minimumPlayersPerGame){

        /**
         * If the players are more than minimum, update the game start time to 15s after.
         */
        $currentTime = getCurrentDateTime();
        $startTime = addSecondsToDateTime($currentTime, $secondsToStart);

        if($game["start_time"] === null){
            $sql = "UPDATE games SET min_players_time='$currentTime', start_time='$startTime' WHERE id=$gameId";
            update($host, $user, $password, $database, $sql);
        }
        
        /**
         * Check time remaining for game to start. If it's less than 30 seconds, no new user can join.                                                                                                                                                                                                                                                                                                                                  
         */
        $timeToStart = getTimeDifferenceInSeconds($currentTime, $game["start_time"]);

        if($timeToStart > 5){
            /**
             * Adding the player to the game
             */

            $playerExists = false;
            $newArray = [];

            foreach ($game["players"] as $index => $player) {
                # code...
                //unset($product["deleted"]);
                //$newArray[] = $product;
                if( $player["browser_uuid"] == $browserUUID){
                    $playerExists = true;
                }
            }


            //$products = $newArray;
            if(!$playerExists){

                if(isset($userId)){
                    $sql = "INSERT INTO players(`game_id`, `user_id`, `browser_uuid`) VALUES('$gameId', '$userId', '$browserUUID')";
                } else {
                    $sql = "INSERT INTO players(`game_id`, `browser_uuid`) VALUES('$gameId', '$browserUUID')";
                }
                
                $playerId = create($host, $user, $password, $database, $sql);
                
                //Adding player to the JSON file
                $player = [
                    "game_id" => $gameId,
                    "user_id" => $userId,
                    "browser_uuid" => $browserUUID,
                    "id" => $playerId
                ];

                addPlayerToJsonFile($player);
                echo json_encode($player);
            }

            /**
             * Return success
             */
            
            // Fetch the game with updated fields
            // Get the players to the game, and show the no of active players. 

            //$game = getGame($host, $user, $password, $database, $gameId);
            //echo json_encode($game);

        } else {
            //echo $timeToStart;
            //throw and error to say the user can't join.
            //header("Location: ./dashboard.html");
            /*http_response_code(400);

            $response = [
                "message" => "Bad Request, timeout",
            ];

            echo json_encode($response);*/
        }
    } else if(count($game["players"]) < $minimumPlayersPerGame){
        
        /**
         * If the players are less than 5, update the game to not started,
         * Insert the players into the players if the player hasn't joined the game yet.
         */

        $playerExists = false;
        $newArray = [];

        foreach ($game["players"] as $index => $player) {
            # code...
            //unset($product["deleted"]);
            //$newArray[] = $product;
            if($player["user_id"] == $userId || $player["browser_uuid"] == $browserUUID){
                $playerExists = true;
            }
        }

        //$products = $newArray;
        //var_dump($playerExists);
        if(!$playerExists){

            if(isset($userId)){
                $sql = "INSERT INTO players(`game_id`, `user_id`, `browser_uuid`) VALUES('$gameId', '$userId', '$browserUUID')";
            } else {
                $sql = "INSERT INTO players(`game_id`, `browser_uuid`) VALUES('$gameId', '$browserUUID')";
            }
            
            $playerId = create($host, $user, $password, $database, $sql);
            //Adding player to the JSON file
            $player = [
                "game_id" => $gameId,
                "user_id" => $userId,
                "browser_uuid" => $browserUUID,
                "id" => $playerId
            ];

            addPlayerToJsonFile($player);
            echo json_encode($player);
        }

        //After inserting the player get players again, and update the game
        $game = getGamePlayers($host, $user, $password, $database, $game);

        if(count($game["players"]) >= (int)$minimumPlayersPerGame){

            /**
             * If the players are more than minimum, update the game start time to 90s after.
             */

            $currentTime = getCurrentDateTime();
            $startTime = addSecondsToDateTime($currentTime, $secondsToStart);

            if($game["start_time"] === null){
                $sql = "UPDATE games SET min_players_time='$currentTime', start_time='$startTime' WHERE id=$gameId";
                update($host, $user, $password, $database, $sql);
            }
        }
    }

    $players = getGamePlayers($host, $user, $password, $database, $game);

    function addSecondsToDateTime($dateTime, $seconds) {
        // Convert to timestamp
        $timestamp = strtotime($dateTime);

        // Add seconds
        $newTimestamp = $timestamp + $seconds;

        // Return in DATETIME format
        return date('Y-m-d H:i:s', $newTimestamp);
    }
    
    function getTimeDifferenceInSeconds($dateTime1, $dateTime2) {
        // Convert both to timestamps
        $timestamp1 = strtotime($dateTime1);
        $timestamp2 = strtotime($dateTime2);

        // Return absolute difference in seconds
        return $timestamp2 - $timestamp1;
    }

    /**
     * Fetch game details
     */

?>