
<?php

    require './api/db.php';
    require './api/db-operations.php';

    //fetch the current game depending on the game Id
    $gameId = $_GET["id"];

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

        return $newArray[0];
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

    $game = getGame($host, $user, $password, $database, $gameId);
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
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=100, initial-scale=1.0">

		<title>Seeded 9-Square Puzzle</title>

        <link rel="stylesheet" href="./styles/global.css" />
        <link rel="stylesheet" href="./styles/header.css" />
        <link rel="stylesheet" type="text/css" href="./styles/game.css" />
        <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>
		
        <script>
            let game = <?php echo $jsonGame?>;
        </script>
	</head>
	<body>
		<div class="game-container">
            <h1>Slide Arena</h1>
            <p>
                Slide the Tiles into Order.<br />
                Beat Everyone &#128175;.
            </p>
			

			<!-- <input id="seedInput" placeholder="Enter seed phrase" />
			<button onclick="generateFromSeed()">Generate</button> -->

			<div class="puzzle" id="puzzle">
                <?php
                    // convert 9 → null before rendering
                    $tilesForRender = array_map(function($v) {
                        return $v === 9 ? null : $v;
                    }, $puzzle);

                    renderPuzzle($tilesForRender);
                ?>
            </div>

			<div class="message" id="message"></div>
		</div>

        <script>
            let tiles = [];

            // rebuild tiles[] from DOM (same structure as your init)
            document.querySelectorAll("#puzzle .tile").forEach(tile => {
                if (tile.classList.contains("empty")) {
                    tiles.push(null);
                } else {
                    tiles.push(parseInt(tile.textContent));
                }
            });
        </script>
        <script src="./scripts/api.js"></script>
        <script src="./scripts/game.js"></script>
		
	</body>
</html>
