<?php

    require './db.php';
    require './db-operations.php';

    // Only allow GET requests
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        http_response_code(405);
        echo json_encode(["error" => "Only GET requests allowed"]);
        exit;
    }

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $games = getAvailableGames($host, $user, $password, $database);
        $userId = 1;
        if(isset($_GET["game-id"])){
            $gameId = $_GET["game-id"];
            $game = getGame($host, $user, $password, $database, $gameId);
            echo json_encode($game);
            exit();
        }

        if(count($games) == 0){

            $seed = generateSolvableSeed();
            //$seed = $seed . "9";

            $sql = "INSERT INTO games(`seed`) VALUES('$seed')";
            $seedId = create($host, $user, $password, $database, $sql);

            $games = getAvailableGames($host, $user, $password, $database);
        }

        if($userId != null){
            /**
             * Filter, unplayed games
             * Continuing games where the useris part of the players.
             */

        }

        
        // Return JSON response
        header('Content-Type: application/json');

        echo json_encode($games);
        
    }

    function getGame($host, $user, $password, $database, $id){

        /**
         * Fetch all games that haven't started
         */
        //$sql = "SELECT * FROM games WHERE started_at IS NULL AND winner_user_id IS NULL AND id=$id";
        $sql = "SELECT * FROM games WHERE id=$id";
        $games = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($games as $index => $game) {
            # code...
            //unset($game["winner_user_id"]);
            $game["formatted_seed"] = convertSeed($game["seed"]);
            $newArray[] = $game;
        }


        $game = $newArray[0];

        /**
         * Fetch the players 
         */
        $gameId = $_GET["game-id"];
        $sql = "SELECT * FROM players WHERE game_id=$gameId AND deleted=0";
        $players = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($players as $index => $player) {
            # code...
            //unset($game["winner_user_id"]);
            $newArray[] = $player;
        }

        $game["players"] = $newArray;
        $game["no_of_players"] = count($game["players"]);

        return $game;
    }

    function generateSolvableSeed($moves = 100) {
        // Start from solved board (9 = blank)
        $board = [1,2,3,4,5,6,7,8,9];

        $lastBlankIndex = null;

        for ($i = 0; $i < $moves; $i++) {
            $blankIndex = array_search(9, $board);
            $row = intdiv($blankIndex, 3);
            $col = $blankIndex % 3;

            $possibleMoves = [];

            if ($row > 0) $possibleMoves[] = $blankIndex - 3; // up
            if ($row < 2) $possibleMoves[] = $blankIndex + 3; // down
            if ($col > 0) $possibleMoves[] = $blankIndex - 1; // left
            if ($col < 2) $possibleMoves[] = $blankIndex + 1; // right

            // 🔥 Avoid undoing the previous move
            if ($lastBlankIndex !== null) {
                $possibleMoves = array_values(array_filter(
                    $possibleMoves,
                    fn($move) => $move !== $lastBlankIndex
                ));
            }

            // Pick random move
            $swapIndex = $possibleMoves[random_int(0, count($possibleMoves) - 1)];

            // Swap
            [$board[$blankIndex], $board[$swapIndex]] = [$board[$swapIndex], $board[$blankIndex]];

            // Track previous position
            $lastBlankIndex = $blankIndex;
        }

        // 🔥 Optional: avoid returning solved state
        if ($board === [1,2,3,4,5,6,7,8,9]) {
            return generateSolvableSeed($moves);
        }

        return (int) implode('', $board);
    }

    function convertSeed($seed) {
        // Split string into array of characters
        $digits = str_split($seed);

        // Convert each value
        foreach ($digits as &$digit) {
            if ($digit == '9') {
                $digit = null;
            } else {
                $digit = (int)$digit;
            }
        }

        return $digits;
    }

    function getAvailableGames($host, $user, $password, $database){

        /**
         * Fetch all games that haven't started
         */
        $sql = "SELECT * FROM games WHERE start_time IS NULL AND winner_user_id IS NULL";
        $games = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($games as $index => $game) {
            # code...
            unset($game["winner_user_id"]);
            unset($game["started_at"]);
            $game["formatted_seed"] = convertSeed($game["seed"]);
            $newArray[] = $game;
        }

        return $newArray;
    }

    function getCurrentDateTime() {
        $date = new DateTime("now", new DateTimeZone("Africa/Nairobi"));
        return $date->format("Y-m-d H:i:s");
    }