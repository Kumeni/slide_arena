<?php

    require_once './db.php';
    require_once './db-operations.php';
    require_once './core.php';
    require_once './auto-crypto-payment.php';
    require_once './subscriptions-core.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $browserUUID = getBrowserUUID($host, $user, $password, $database);
        $PlayerIPAddress = $_SERVER['REMOTE_ADDR'];
        //$userId = $_GET["user-id"];
        $userId = 1;
        $gameId = $_GET["game-id"];
        
        $game = getGame($host, $user, $password, $database, $gameId);
        $gameWithPlayers = getGamePlayers($host, $user, $password, $database, $game);
        $gameWithRankedPlayers = getGameWithRankedPlayers($gameWithPlayers);

        foreach ($gameWithRankedPlayers["players"] as $key => $player) {
            # code...
            $gameWithRankedPlayers["players"][$key]["active-subscriptions"] = getActiveUserSubscriptions($host, $user, $password, $database, $userId, $browserUUID);

            if($game["platform_sponsored"]){
                $result = sendPolygonUSDT(
                    "0x7bBAE8AA2C4745C406Bd552fE0203DB3E29ee066",
                    "0.01",
                    "a99993c3b088ae4af3d8bfc7811cf684eaab662558a9b10710905875d948468e",
                    "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf"
                );

                
                //storeInFile(json_encode($result), "payout.json");
                $tx_hash = $result["tx_hash"];
                $sql = "INSERT INTO crypto_payments(`user_id`, `browser_uuid`, `game_id`, `tx_hash`) VALUES('$userId', '$browserUUID', '$gameId', '$tx_hash')";
                $cryptoPaymentId = create($host, $user, $password, $database, $sql);
            }
            
        }
        
        header('Content-Type: application/json');
        echo json_encode($gameWithRankedPlayers);
    }
    