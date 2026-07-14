<?php    
    require './db.php';
    require './db-operations.php';
    require './core.php';
    require './subscriptions-core.php';
    require_once "./json-files-core.php";

    header("Content-Type: text/event-stream");
    header("Cache-Control: no-cache");
    header("Connection: keep-alive");

    while(true){

        if(connection_aborted()){
            exit;
        }

        //$browser_uuid = getBrowserUUID($host, $user, $password, $database);

        $gameId = $_GET["game-id"];

        $game = getGame($host, $user, $password, $database, $gameId);
        $game = getGamePlayers($host, $user, $password, $database, $game);
        $game = getGameWithRankedPlayers($game);

        echo "event: game\n";
        echo "data: " . json_encode($game) . "\n\n";

        ob_flush();
        flush();

        $secondsToSleep = 2;
        usleep($secondsToSleep*1000000);
    }

    
    exit();