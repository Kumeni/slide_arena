<?php

    require './db.php';
    require './db-operations.php';
    require './core.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST'){

        $rawData = file_get_contents("php://input");
        $moveData = json_decode($rawData, true); // true = associative array
        $moveData = $moveData["body"];
        
        $userId = $moveData["user_id"];
        $browser_uuid = getBrowserUUID($host, $user, $password, $database);
        $gameId = $moveData["game_id"];
        $moves = $moveData["moves"];
        $currentTime = getCurrentDateTime();

        $userId = $_SERVER['REMOTE_ADDR'];


        if($moves == "1,2,3,4,5,6,7,8,"){
            /**Game Completed */
            // Show the player that completed the game, the time, create a new game;

            //$sql = "UPDATE articles SET html='$html', text='$text' WHERE id=$articleId";
            //$sql = "UPDATE games SET completed_at = '$currentTime' WHERE id=$gameId";
            //update($host, $user, $password, $database, $sql);

            $games = getAvailableGames($host, $user, $password, $database);

        }

        $currentTime = getCurrentDateTime();
        
        if(isset($userId)){
            $sql = "INSERT INTO game_moves(`browser_uuid`, `user_id`, `game_id`, `moves`, `created_at`) VALUES('$browser_uuid','$userId', '$gameId', '$moves', '$currentTime')";
        } else {
            $sql = "INSERT INTO game_moves(`browser_uuid`, `game_id`, `moves`, `created_at`) VALUES('$browser_uuid', '$gameId', '$moves', '$currentTime')";
        }
        
        $gameMovesId = create($host, $user, $password, $database, $sql);

        $gameMoves = getPlayerGameMoves($host, $user, $password, $database, $gameId, $browser_uuid);
        // Return JSON response
        
        header('Content-Type: application/json');
        echo json_encode($gameMoves);
    }
    
    function getPlayerGameMoves($host, $user, $password, $database, $gameId, $browser_uuid){

        /**
         * Fetch all games that haven't started
         */
        $sql = "SELECT * FROM game_moves WHERE game_id=$gameId AND browser_uuid='$browser_uuid'";
        $gameMoves = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($gameMoves as $index => $gameMove) {
            # code...
            //unset($game["winner_user_id"]);
            $newArray[] = $gameMove;
        }

        return $newArray;
    }
