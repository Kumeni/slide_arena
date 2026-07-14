<?php 
    
    //require_once __DIR__ . "/subscriptions-core.php";
    

    function getBrowserUUID($host, $user, $password, $database) {
        /*if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }*/

        // Get UUID from header
        $headerUUID = $_SERVER['HTTP_X_BROWSER_UUID'] ?? NULL;
        /*if(isset($_COOKIE['browser_uuid'])){
            $cookieUUID = $_COOKIE['browser_uuid'];
        }

        //Cookie uuid overwrites the header uuid;
        if(isset($cookieUUID)) {
            $headerUUID = $cookieUUID;
        }*/
        
        // If frontend sends UUID via header, trust and store it
        /**
         * 1. Get all UUIDs stored in the database;
         * 2. If it's in one of them, store it in the session, else generate a new one.
         */
        if(isset($headerUUID) && $headerUUID != NULL){
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
            //$_SESSION['browser_uuid'] = $headerUUID;
            //setcookie("browser_uuid", $headerUUID, time() + (86400 * 30), "/");
        } else {
            
            $browser_uuid = generateUUIDv4();
            //setcookie("browser_uuid", $browser_uuid, time() + (86400 * 30), "/");
            //$_SESSION['browser_uuid'] = $browser_uuid;
            $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];

            $sql = "INSERT INTO browsers_uuid(`browser_uuid`, `IP_Address`) VALUES('$browser_uuid', '$PlayerIPAddress')";
            $gameId = create($host, $user, $password, $database, $sql);
            return $browser_uuid;
        }

        return $browser_uuid["browser_uuid"];
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

    function getGamesNotPlayed($host, $user, $password, $database){
        //Available games are games which satisfy the following:
        //Start-times is null or isn't passed; solution:
        //Fetch all games where
        $sql = "SELECT * FROM games ORDER BY id DESC";
        $games = find($host, $user, $password, $database, $sql);
        $games = resultToArray($games);

        //Game is not yet played if:
        //start time is null
        //start time is greater than current time by 5s;
        $newArray = [];
        foreach ($games as $key => $game) {
            # code...
            if($game["start_time"] == NULL){
                $newArray[] = $game;
            } else if(getSecondsToGameStart($game["start_time"]) > 5){
                $game["seconds_to_start"] = getSecondsToGameStart($game["start_time"]);
                $newArray[] = $game;
            }
        }

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
        /*$gameId = $id;
        $sql = "SELECT * FROM players WHERE game_id=$gameId AND deleted=0";
        $players = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($players as $index => $player) {
            # code...
            //unset($game["winner_user_id"]);
            $newArray[] = $player;
        }

        $game["players"] = $newArray;
        $game["no_of_players"] = count($game["players"]);*/
        if(isset($game["id"])){
            return $game;
        } else return null;
    }

    function getGamePlayers($host, $user, $password, $database, $game){

        /**
         * Fetch all players in the game
         */
        $gameId = $game["id"];
        $sql = "SELECT * FROM players WHERE game_id=$gameId AND left_game=0";
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
        $game["no_of_players"] = count($game["players"]);
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

        //Fetch all games that haven't started

        //Available games are games which satisfy the following:
        //Start-times is null or isn't passed; solution:
        //Fetch all games where

        //Fetch all the available games
        $sql = "SELECT * FROM games ORDER BY id DESC";
        $games = find($host, $user, $password, $database, $sql);
        $games = resultToArray($games);

        //Filter out all the games that have been played
        $games = filterUplayedGames($games);

        //Sort all games by minimum players
        $games = sortGamesByMinimumPlayers($games);

        //Get game rewards
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

    function filterUplayedGames($games = []){
        
        //If there are 0 games return the empty array
        if(count($games) == 0){
            return $games;
        }

        $newArray = [];
        foreach ($games as $key => $game) {
            $secondsToStart = getSecondsToGameStart($game["start_time"]);
            if($secondsToStart == "infinity" || $secondsToStart > 10){
                $newArray[] = $game;
            }
        }

        return $newArray;
    }

    function sortGamesByMinimumPlayers($games){

        usort($games, function ($a, $b) {
            return $a['minimum_players'] <=> $b['minimum_players'];
        });

        return $games;
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
        //$games = getAvailableGames($host, $user, $password, $database);
        $games = getGamesNotPlayed($host, $user, $password, $database);

        //check if each reward has a game, if not create one and add to the database;
        //For each reward, create a platform sponsored game if not exists;
        foreach ($gameRewards as $key => $gameReward) {
            # code...
            // Adding normal games for a certain reward if non exists;;
            $normalGameAvailable = false;
            $gameRewardsId = $gameReward["id"];

            foreach ($games as $key => $game) {
                # code...
                if($gameRewardsId == $game["game_rewards_id"] && $game["platform_sponsored"] == 0){
                    $normalGameAvailable = true;
                }
            }

            if($normalGameAvailable == false){
                $seed = generateSolvableSeed();
                //$seed = $seed . "9";
                $currentTime = getCurrentDateTime();
                $minimum_players = $gameReward["minimum_players"];
                $sql = "INSERT INTO games(`seed`, `minimum_players`, `created_at`, `game_rewards_id`) VALUES('$seed', '$minimum_players', '$currentTime', '$gameRewardsId')";
                $gameId = create($host, $user, $password, $database, $sql);

                //Insert normal games here;
                $newGame = getGame($host, $user, $password, $database, $gameId);
                addNewGameToJsonFile($newGame);
            }

            //Adding platform sponsored games for a certain reward if non exists;;
            $platformSponsoredGameAvailable = false;
            $gameRewardsId = $gameReward["id"];

            foreach ($games as $key => $game) {
                # code...
                if($gameRewardsId == $game["game_rewards_id"] && $game["platform_sponsored"] == 1){
                    $platformSponsoredGameAvailable = true;
                }
            }

            if($platformSponsoredGameAvailable == false){
                $seed = generateSolvableSeed();
                //$seed = $seed . "9";
                $currentTime = getCurrentDateTime();
                $minimum_players = $gameReward["minimum_players"];
                $sql = "INSERT INTO games(`seed`, `minimum_players`, `created_at`, `game_rewards_id`, `platform_sponsored`) VALUES('$seed', '$minimum_players', '$currentTime', '$gameRewardsId', 1)";
                $gameId = create($host, $user, $password, $database, $sql);

                //Insert platform sponsored games here;
                $newGame = getGame($host, $user, $password, $database, $gameId);
                addNewGameToJsonFile($newGame);
            }
        }

        //return getAvailableGames($host, $user, $password, $database);
        return getNormalAndPlatformSponsoredGames($host, $user, $password, $database);
    }

    function getGameRewards($host, $user, $password, $database){
        $sql = "SELECT * FROM game_rewards";
        $gameRewards = find($host, $user, $password, $database, $sql);
        $gameRewards = resultToArray($gameRewards);

        return $gameRewards;
    }

    function addNewGameToJsonFile($newGame){
        unset($newGame["seed"]);
        unset($newGame["formatted_seed"]);

        //Read current Json File
        $latestGameFile = NULL;
        $currentGames = [];
        
        $latestGameFile = readJsonFile("./cache/games/latest.json");
        $currentGames = readJsonFile($latestGameFile["latest"]);

        if($currentGames == NULL){
            $currentGames = [];
        }

        $currentGames[] = $newGame;
        $filename = generateJsonFilename("games", 3600);
        writeJsonFile( $filename,$currentGames);
        
        $latest = [
            "latest" => $filename,
        ];
        
        writeJsonFile("./cache/games/latest.json", $latest);
    }

    function addPlayerToJsonFile($player){
        $gameId = $player["game_id"];

        //Read current Json File
        $latestGameFile = NULL;
        $currentGames = [];
        
        $latestGameFile = readJsonFile( "./cache/games/latest.json");
        $currentGames = readJsonFile("./" . $latestGameFile["latest"]);

        //Loop through the games
        foreach ($currentGames as $key => $currentGame) {
            # code...
            if($currentGame["id"] == $gameId){
                //Add the player into the players array;
                
                if(!isset($currentGames[$key]["players"])){
                    $currentGames[$key]["players"] = [];
                    $currentGame["players"] = [];
                }

                $currentGames[$key]["players"][] = $player;
                $currentGame["players"][] = $player;
            }
        }

        $filename = generateJsonFilename("games", 3600);
        writeJsonFile("./" . $filename, $currentGames);
        
        $latest = [
            "latest" => $filename,
        ];
        
        writeJsonFile("cache/games/latest.json", $latest);
    }

    function getNormalAndPlatformSponsoredGames($host, $user, $password, $database){
        $availableGames = getAvailableGames($host, $user, $password, $database);

        $newArray = [];
        $newArray["platform_sponsored_games"] = [];
        $newArray["games"] = [];
        foreach ($availableGames as $key => $availableGame) {
            # code...
            if($availableGame["platform_sponsored"] == 0){
                $newArray["games"][] = $availableGame;
            } else {
                $newArray["platform_sponsored_games"][] = $availableGame;
            }
        }

        return $newArray;
    }

    /*function getSecondsToGameStart(?string $start_time): ?int
    {
        // Return null if no start time was provided
        if ($start_time === null || trim($start_time) === '') {
            return null;
        }

        try {
            $utc = new DateTimeZone('UTC');

            $gameTime = new DateTime($start_time, $utc);
            $currentTime = new DateTime('now', $utc);

            // Difference in seconds
            return max(0, $gameTime->getTimestamp() - $currentTime->getTimestamp());

        } catch (Exception $e) {
            // Invalid datetime string
            return null;
        }
    }*/

    function getSecondsToGameStart(?string $start_time)
    {
        if ($start_time === null || trim($start_time) === '') {
            return "infinity";
        }

        try {
            // Start time is already UTC
            $gameTimestamp = strtotime($start_time . ' UTC');

            if ($gameTimestamp === false) {
                return null;
            }

            // Current UTC time
            $currentTimestamp = getCurrentDateTime();
            $currentTimestamp = strtotime($currentTimestamp . ' UTC');

            return max(0, $gameTimestamp - $currentTimestamp);

        } catch (Exception $e) {
            return null;
        }
    }

    function logOutPlayer($host, $user, $password, $database, $browser_uuid){
        
        //Fetch all the games the user ever played.
        $sql = "SELECT * FROM players WHERE browser_uuid='$browser_uuid' ORDER BY id DESC";
        $playerGames = find($host, $user, $password, $database, $sql);
        $playerGames = resultToArray($playerGames);

        //Generate sql to get all the games that the user played
        $sql = "SELECT * FROM games WHERE id IN (";
        $gamesJoined = [];
        foreach ($playerGames as $key => $playerGame){
            $gameId = $playerGame["game_id"];

            $gamesJoined[] = $gameId;
            if($key == count($playerGames) - 1){
                $sql .= $gameId;
            } else {
                $sql .= $gameId . " ,";
            }
        }
        $sql .= ")";

        $games = find($host, $user, $password, $database, $sql);
        $games = resultToArray($games);

        $firstPlayer = true;
        $firstGame = true;
        $updatePlayersSQL = "UPDATE players SET left_game=1 WHERE id IN (";
        $updateGameSQL = "UPDATE games SET min_players_time = NULL AND start_time = NULL WHERE id IN (";

        $gamesNotStarted = [];
        foreach ($games as $key => $game){
            # code...
            $gameId = $game["id"];
            $gameStartTime = $game["start_time"];
            $secondsToStart = getSecondsToGameStart($game["start_time"]);
            $game = getGamePlayers($host, $user, $password, $database, $game);

            if($secondsToStart == "infinity" || (int)$secondsToStart >= 5){
                //update the player to exit the players game
                //loop through players,, find browsers_uuid,, get playerId
                //echo "Total Player Games = " . count($playerGames) . " END\n";
                foreach ($playerGames as $key2 => $player) {
                    # code...
                    $playerId = $player["id"];
                    if($player["game_id"] == $gameId){
                        $playerId = $player["id"];
                        if($firstPlayer){
                            $updatePlayersSQL = $updatePlayersSQL . " $playerId ";
                            $firstPlayer = false;
                        } else {
                            $updatePlayersSQL = $updatePlayersSQL . ", $playerId";
                        }
                        $logOutPlayer = true;
                    }
                    
                }

                //get the players in the game, if they still meet the minimum no of players without this player, you've won.
                if(count($game["players"]) <= (int)$game["minimum_players"]){
                    /*if($key == 0){
                        $updateGameSQL = $updateGameSQL + "id";
                    }*/
                    $gamesNotStarted[] = $gameId;
                    if($firstGame){
                        $updateGameSQL = $updateGameSQL . "$gameId";
                        $firstGame = false;
                    } else {
                        $updateGameSQL = $updateGameSQL . ", $gameId";
                    }
                    //$updateGameSQL = "UPDATE games SET min_players_time = NULL AND start_time = NULL WHERE id=$gameId";
                }
            }
        }
        $updatePlayersSQL .= ")";
        $updateGameSQL .= ")";

        //var_dump(json_encode($gamesJoined));
        //var_dump(json_encode($gamesNotStarted));
        //var_dump(json_encode($playersToLeaveGame));
        //echo $updateGameSQL;
        update($host, $user, $password, $database, $updatePlayersSQL);
        update($host, $user, $password, $database, $updateGameSQL);
    }

    function getGreaterDate($date1, $date2)
    {
        // If one date is null, return the other
        if ($date1 === null) {
            return $date2;
        }

        if ($date2 === null) {
            return $date1;
        }

        $dt1 = new DateTimeImmutable($date1, new DateTimeZone('UTC'));
        $dt2 = new DateTimeImmutable($date2, new DateTimeZone('UTC'));

        return ($dt1 >= $dt2)
            ? $dt1->format('Y-m-d H:i:s')
            : $dt2->format('Y-m-d H:i:s');
    }

    ?>