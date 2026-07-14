<?php

    require './api/db.php';
    require './api/db-operations.php';
    require './api/core.php';
    require './api/subscriptions-core.php';
    require_once "./api//json-files-core.php";

    //fetch the current game depending on the game Id
    $gameId = $_GET["id"];
    $game = getGame($host, $user, $password, $database, $gameId);
    $minimumPlayersPerGame = $game["minimum_players"];
    /**
     * If game is completed, redirect to the dashboard
     */

    $jsonGame = json_encode($game);
    
    $puzzle = $game["formatted_seed"];
    
    function renderPuzzle($tiles) {
        foreach ($tiles as $index => $value) {
            $isEmpty = $value === null;

            echo '<div class="tile' . ($isEmpty ? ' empty' : '') . '"';

            if (!$isEmpty) {
                echo ' onclick="moveTile(' . $index . ')"';
            }

            echo '>';

            if (!$isEmpty) {
                echo $value;
            }

            echo '</div>';
        }
    }

    $game = getGamePlayers($host, $user, $password, $database, $game);
    
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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=f, initial-scale=1.0">

    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/header.css" />
    <link rel="stylesheet" href="./styles/action-buttons.css" />
    <link rel="stylesheet" href="./styles/waiting-room.css" />
    <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>

    <title>Waiting room</title>

    <?php echo "<script> let game=$jsonGame </script>" ?>
</head>
<body>
    <section class="landing">
        <div>
            <h1>Waiting for players...</h1>
        </div>
        <br />
        <p><span id="no-of-players">...</span> player<span id="no-of-players-state">s</span> joined.</p>
        <div class="timer">
            <span class="seconds" id="players-remaining">...</span><span>players remaining</span>
        </div>
        <div>
            <button class="leave-room-button"><a href="./dashboard.php">LEAVE ROOM</a></button>
        </div>
    </section>
    <section class="landing" id="time-remaining">
        <div>
            <h1>Game starts in</h1>
        </div>
        <div class="timer">
            <span class="seconds" id="remaining-time">75</span><span>seconds</span>
        </div>
    </section>
    
    <script src="./scripts/api.js"></script>
    <script src="./scripts/waiting-room.js"></script>
</body>
</html>