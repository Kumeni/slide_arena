<?php

    require_once './db.php';
    require_once './db-operations.php';
    require_once './core.php';
    require_once './subscriptions-core.php';
    require_once './json-files-core.php';
    //This is a streaming file, it'sends to the users, the following
    /**
     * New games
     * Subscription Data
     * 
     */
    header("Content-Type: text/event-stream");
    header("Cache-Control: no-cache");
    header("Connection: keep-alive");

    
    while(true){

        if(connection_aborted()){
            exit;
        }

        $games = getAvailableGames($host, $user, $password, $database);
        $games = createGames($host, $user, $password, $database);
        $userSubscriptions = getSubscriptionsWithGamesPlayed($host, $user, $password, $database, $user_id, $browser_uuid);
        if ($userSubscriptions["remaining_platform_sponsored_tournamens"] == 0) {
            # code...
            $games["platform_sponsored_games"] = [];
        }
        // Return JSON response
        $response = [
            "games" => $games
        ];

        echo "event: games\n";
        echo "data: " . json_encode($response) . "\n\n";

        ob_flush();
        flush();

        $secondsToSleep = 2;
        usleep($secondsToSleep*1000000);
    }