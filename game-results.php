<?php

    require './api/db.php';
    require './api/db-operations.php';

    $gameId = $_GET["game-id"];
    $userId = $_GET["user-id"];

    /**
     * Write a function that gets the game status;
     */
    ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=f, initial-scale=1.0">

    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/header.css" />
    <link rel="stylesheet" href="./styles/action-buttons.css" />
    <link rel="stylesheet" href="./styles/game-results.css" />
    <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>

    <script>
            const gameId = <?php echo $_GET["game-id"]?>;
            const userId = <?php echo $_GET["user-id"]?>;
        </script>
    <title>Game Results</title>
</head>
<body>
    <section class="landing">
        <div>
            <h1>Game Results</h1>
        </div>
        <div class="underline"></div>
        <br />
        <div class="results-table-container">
            <table class="results-table">
                <thead>
                </thead>
                <tbody id="game-results">
                    <tr>
                        <th>No.</th>
                        <th>Duration (Seconds)</th>
                        <th>Moves</th>
                        <th>Finish time</th>
                        <th>User id</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div>
            <a href="./dashboard.html?#rewards" class="back-to-dashboard">Dashboard</a>
        </div>
    </section>
    <script src="./scripts/api.js"></script>
    <script src="./scripts/game-results.js"></script>
</body>
</html>