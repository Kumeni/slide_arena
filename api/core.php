<?php 
    
    function getBrowserUUID($host, $user, $password, $database) {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Get UUID from header
        $headerUUID = $_SERVER['HTTP_X_BROWSER_UUID'] ?? null;
        if(isset($_COOKIE['browser_uuid'])){
            $cookieUUID = $_COOKIE['browser_uuid'];
        }

        //Cookie uuid overwrites the header uuid;
        if(isset($cookieUUID)) {
            $headerUUID = $cookieUUID;
        }
        
        // If frontend sends UUID via header, trust and store it
        /**
         * 1. Get all UUIDs stored in the database;
         * 2. If it's in one of them, store it in the session, else generate a new one.
         */
        if(isset($headerUUID)){
             $sql = "SELECT * FROM browsers_uuid WHERE browser_uuid='$headerUUID'";
        } else {
            $sql = "SELECT * FROM browsers_uuid";
        }
        
        $browser_uuids = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($browser_uuids as $index => $browser_uuid) {
            # code...
            //unset($game["winner_user_id"]);
            $newArray[] = $browser_uuid;
        }
        $browser_uuids = $newArray;

        if (count($browser_uuids) > 0) {
            $_SESSION['browser_uuid'] = $headerUUID;
            setcookie("browser_uuid", $headerUUID, time() + (86400 * 30), "/");
        } else {
            
            $browser_uuid = generateUUIDv4();
            setcookie("browser_uuid", $browser_uuid, time() + (86400 * 30), "/");
            $_SESSION['browser_uuid'] = $browser_uuid;
            $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];

            $sql = "INSERT INTO browsers_uuid(`browser_uuid`, `IP_Address`) VALUES('$browser_uuid', '$PlayerIPAddress')";
            $gameId = create($host, $user, $password, $database, $sql);
        }

        $browser_uuid = $_SESSION['browser_uuid'];
        return $_SESSION['browser_uuid'];
    }

    function generateUUIDv4() {
        $data = random_bytes(16);

        // Set version to 0100 (UUID v4)
        $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);

        // Set bits 6-7 to 10 (variant)
        $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);

        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

    function getGamesUserPlayed($host, $user, $password, $database, $browser_uuid){

        /**
         * Fetch all games the user has played
         */
        $sql = "SELECT * FROM players WHERE browser_uuid = '$browser_uuid' ORDER BY created_at DESC";
        $games_participated = find($host, $user, $password, $database, $sql);
        $games_participated = resultToArray($games_participated);

        $newArray = $games_participated;
        $newArray = [];
        foreach ($games_participated as $key => $game_participated) {
            # code...
            $gameId = $game_participated["game_id"];
            $game = getGame($host, $user, $password, $database, $gameId);
            
            if($game == NULL){
                continue;
            }
            $game = getGamePlayers($host, $user, $password, $database, $game);
            $newArray[] = getGameWithRankedPlayers($game);
        }

        /**
         * Creating the desired output array
         */

        return $newArray;
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

        //$game = $newArray[0];

        /**
         * Fetch the players 
         */
        $gameId = $id;
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
        if(isset($game["id"])){
            return $game;
        } else return null;
    }

    function getGamePlayers($host, $user, $password, $database, $game){

        /**
         * Fetch all games that haven't started
         */
        $gameId = $game["id"];
        $sql = "SELECT * FROM players WHERE game_id=$gameId";
        $players = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($players as $index => $player) {
            # code...
            //unset($game["winner_user_id"]);
            $userId = $player["user_id"];
            $browser_uuid = $player["browser_uuid"];

            //$sql = "SELECT * FROM game_moves WHERE game_id=$gameId AND user_id=$userId";
            $sql = "SELECT * FROM game_moves WHERE game_id=$gameId AND browser_uuid='$browser_uuid'";
            $playerMoves = find($host, $user, $password, $database, $sql);

            $newArray2 = [];
            foreach ($playerMoves as $index => $playerMove) {
                # code...
                //unset($game["winner_user_id"]);
                $newArray2[] = $playerMove;
            }

            $player["playerMoves"] = $newArray2;
            $newArray[] = $player;
        }

        $game["players"] = $newArray;

        $game["winner"] = getWinner($host, $user, $password, $database, $game);
        return $game;
    }

    function getWinner($host, $user, $password, $database, $gameWithPlayers){
        /**
         * Calculate and validate winner
         * Add him to the game object
         */
        // Decode JSON if needed
        $startTime = strtotime($gameWithPlayers['start_time']);
        $target = "1,2,3,4,5,6,7,8,";

        $bestPlayer = null;
        $bestTime = null;
        $bestMoves = [];

        foreach ($gameWithPlayers['players'] as $player) {

            // Sort moves by time (important for accuracy)
            usort($player['playerMoves'], function($a, $b) {
                return strtotime($a['created_at']) - strtotime($b['created_at']);
            });

            foreach ($player['playerMoves'] as $move) {

                if ($move['moves'] === $target) {
                    $endTime = strtotime($move['created_at']);
                    $timeTaken = $endTime - $startTime;

                    // If first winner OR faster than current best
                    if ($bestTime === null || $timeTaken < $bestTime) {
                        $bestTime = $timeTaken;
                        $bestPlayer = $player;

                        // Store moves up to winning point
                        $bestMoves = [];
                        foreach ($player['playerMoves'] as $m) {
                            $bestMoves[] = $m;
                            if ($m['id'] == $move['id']) break;
                        }
                    }

                    // Stop checking this player after first solve
                    break;
                }
            }
        }

        if ($bestPlayer === null) {
            return null; // No winner
        }

        return [
            "player" => $bestPlayer,
            "time_taken" => $bestTime,
        ];

    }

    function resultToArray($result) {

        $data = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return $data;
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
        $sql = "SELECT * FROM games WHERE start_time IS NULL AND winner_user_id IS NULL ORDER BY minimum_players ASC";
        $games = find($host, $user, $password, $database, $sql);
        $gameRewards = getGameRewards($host, $user, $password, $database);

        $newArray = [];
        foreach ($games as $index => $game) {
            # code...
            unset($game["winner_user_id"]);
            unset($game["started_at"]);
            foreach ($gameRewards as $key => $gameReward) {
                # code...
                if($game["game_rewards_id"] == $gameReward["id"]){
                    $game["reward"] = $gameReward["reward"];
                }
            }
            $game = getGamePlayers($host, $user, $password, $database, $game);
            $game["formatted_seed"] = convertSeed($game["seed"]);
            $game["remaining_players"] = $game["minimum_players"]-count($game['players']);
            $newArray[] = $game;
        }

        return $newArray;
    }

    function getCurrentDateTime() {
        $date = new DateTime("now", new DateTimeZone("UTC"));
        return $date->format("Y-m-d H:i:s");
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


    /**
     * Rank players directly inside game object.
     *
     * Returns same $gameJson structure, but:
     * $game["players"] is reordered from winner to last.
     *
     * @param string|array $gameJson
     * @return array
     */
    function getGameWithRankedPlayers($game){
        // Accept JSON string or array
        $solvedState = "1,2,3,4,5,6,7,8,";
        $startTime = strtotime($game['start_time']);

        // Add ranking info to each player
        foreach ($game['players'] as &$player) {

            $player['finished'] = false;
            $player['time_used'] = null;
            $player['finish_time'] = null;
            $player['moves_used'] = null;

            if (!isset($player['playerMoves'])) {
                continue;
            }

            foreach ($player['playerMoves'] as $index => $move) {

                $player['time_used'] = strtotime($move['created_at']) - $startTime;
                // moves taken until solved move
                $player['moves_used'] = $index + 1;

                if (trim($move['moves']) === $solvedState) {

                    $player['finished'] = true;
                    $player['finish_time'] = $move['created_at'];

                    break;
                }
            }
        }

        unset($player);

        // Sort players inside game object
        usort($game['players'], function ($a, $b) {

            // Finished players first
            if ($a['finished'] && !$b['finished']) return -1;
            if (!$a['finished'] && $b['finished']) return 1;

            // If both unfinished keep equal
            if (!$a['finished'] && !$b['finished']) return 0;

            // Faster time first
            if ($a['time_used'] != $b['time_used']) {
                return $a['time_used'] <=> $b['time_used'];
            }

            // Tie breaker: fewer moves wins
            return $a['moves_used'] <=> $b['moves_used'];
        });

        // Add rank numbers
        foreach ($game['players'] as $i => &$player) {
            $player['rank'] = $i + 1;
        }

        unset($player);

        return $game;
    }

    function createGames($host, $user, $password, $database){
        // Fetch all the game rewards;
        $gameRewards = getGameRewards($host, $user, $password, $database);
        $games = getAvailableGames($host, $user, $password, $database);

        foreach ($gameRewards as $key => $gameReward) {
            # code...
            $available = false;
            $gameRewardsId = $gameReward["id"];

            foreach ($games as $key => $game) {
                # code...
                if($gameRewardsId == $game["game_rewards_id"]){
                    $available = true;
                }
            }

            if($available == false){
                $seed = generateSolvableSeed();
                //$seed = $seed . "9";
                $currentTime = getCurrentDateTime();
                $minimum_players = $gameReward["minimum_players"];
                $sql = "INSERT INTO games(`seed`, `minimum_players`, `created_at`, `game_rewards_id`) VALUES('$seed', '$minimum_players', '$currentTime', '$gameRewardsId')";
                $gameId = create($host, $user, $password, $database, $sql);
            }
        }

        return getAvailableGames($host, $user, $password, $database);

    }

    function getGameRewards($host, $user, $password, $database){
        $sql = "SELECT * FROM game_rewards";
        $gameRewards = find($host, $user, $password, $database, $sql);
        $gameRewards = resultToArray($gameRewards);

        return $gameRewards;
    }
    ?>