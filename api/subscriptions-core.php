<?php

    function getAvailableSubscriptions($host, $user, $password, $database){
        //Fetch all subscriptions that haven't been suspended
        $sql = "SELECT * FROM subscriptions WHERE suspended = 0";
        $subscriptions = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($subscriptions as $index => $subscription) {
            # code...
            unset($subscription["suspended"]);

            //For each subscription get the duration
            $subscriptionDurationId = $subscription["duration_id"];
            $sql = "SELECT * FROM subscription_durations WHERE id= $subscriptionDurationId";
            $subscriptionDurations = find($host, $user, $password, $database, $sql);

            foreach ($subscriptionDurations as $key => $subscriptionDuration) {
                # code...
                $subscription["duration_name"] = $subscriptionDuration["name"];
                //$subscription["duration_seconds"] = $subscriptionDuration["seconds"];
            }

            unset($subscription["duration_id"]);
            $newArray[] = $subscription;
        }

        return $newArray;
    }

    function getSubscription($host, $user, $password, $database, $id){
        //Fetch all subscriptions that haven't been suspended
        $sql = "SELECT * FROM subscriptions WHERE suspended = 0 AND id=$id";
        $subscriptions = find($host, $user, $password, $database, $sql);

        $newArray = [];
        foreach ($subscriptions as $index => $subscription) {
            # code...
            unset($subscription["suspended"]);

            //For each subscription get the duration
            $subscriptionDurationId = $subscription["duration_id"];
            $sql = "SELECT * FROM subscription_durations WHERE id= $subscriptionDurationId";
            $subscriptionDurations = find($host, $user, $password, $database, $sql);

            foreach ($subscriptionDurations as $key => $subscriptionDuration) {
                # code...
                $subscription["duration_name"] = $subscriptionDuration["name"];
                //$subscription["duration_seconds"] = $subscriptionDuration["seconds"];
            }

            //unset($subscription["duration_id"]);
            $newArray[] = $subscription;
        }

        return $subscription;
    }

    function getSubscriptionDuration($host, $user, $password, $database, $id){
        //Fetch subscription duration
        $sql = "SELECT * FROM subscription_durations WHERE id = $id";
        $subscriptionDurations = find($host, $user, $password, $database, $sql);
        $subscriptionDurations = resultToArray($subscriptionDurations);

        return $subscriptionDurations[0];
    }

    function addSecondsToUtcTime(string $utcTime, int $secondsToAdd): string
    {
        $date = new DateTimeImmutable($utcTime, new DateTimeZone('UTC'));

        $date = $date->modify("+{$secondsToAdd} seconds");

        return $date->format("Y-m-d H:i:s");
    }

    function isNotExpired(string $confirmation_time, string $expiry_time): bool
    {
        $utc = new DateTimeZone('UTC');

        // Convert strings to DateTime objects in UTC
        $confirmation = new DateTimeImmutable($confirmation_time, $utc);
        $expiry = new DateTimeImmutable($expiry_time, $utc);

        // Get current UTC time
        $now = new DateTimeImmutable('now', $utc);

        // If expiry time is still in the future, it's valid
        return $expiry > $now;
    }

    function getActiveUserSubscriptions($host, $user, $password, $database, $user_id, $browser_uuid){
        
        // Get bought subscriptions that match the browser_uuid,
        $sql = "SELECT * FROM bought_subscriptions WHERE browser_uuid = '$browser_uuid'";
        $boughtSubscriptions = find($host, $user, $password, $database, $sql);

        $newArray = [];
        $newArray["active_subscriptions"] = [];
        $newArray["expired_subscriptions"] = [];
        $newArray["max_tournaments"] = 0;
        $newArray["expiry_time"] = "0000-00-00 00:00:00";

        foreach ($boughtSubscriptions as $index => $boughtSubscription) {
            # code...
            $subscriptionId = $boughtSubscription["subscription_id"];
            $cryptoPaymentId = $boughtSubscription["crypto_payment_id"];

            //For each subscription get the duration
            $subscription = getSubscription($host, $user, $password, $database, $subscriptionId);
            $boughtSubscription = array_merge($boughtSubscription, $subscription);
            $subscriptionDurationId = $subscription["duration_id"];
            $subscriptionDuration = getSubscriptionDuration($host, $user, $password, $database, $subscriptionDurationId);
            $boughtSubscription = array_merge($boughtSubscription, $subscriptionDuration);

            // Fetch the payment details to check confirmation,
            $sql = "SELECT * FROM crypto_payments WHERE id = $cryptoPaymentId";
            $cryptoPayments = find($host, $user, $password, $database, $sql);
            $cryptoPayments = resultToArray($cryptoPayments);
            $cryptoPayment = $cryptoPayments[0];
            $boughtSubscription["crypto_payment"] = $cryptoPayment;

            //Get the confirmation time,
            $confirmationTime = $cryptoPayment["confirmation_time"];
            $subscriptionDuration = $boughtSubscription["seconds"];

            if(isset($confirmationTime)){
                //Get subscription expiry time
                $subscriptionExpiryTime = addSecondsToUtcTime($confirmationTime, (int)$subscriptionDuration);
                $boughtSubscription["expiry_time"] = $subscriptionExpiryTime;

                //Get if subscription isn't expired;
                $notExpired = isNotExpired($confirmationTime, $subscriptionExpiryTime);

                if($notExpired){
                    $newArray["active_subscriptions"][] = $boughtSubscription;
                    $newArray["max_tournaments"] += (int)$boughtSubscription["max_tournaments"];
                    $newArray["expiry_time"] = $subscriptionExpiryTime;
                } else {
                    $newArray["expired_subscriptions"][] = $boughtSubscription;
                }
            }

            //Get platform sponsored games
            //Add all the games in subscription;
            $totalPlatformSponsoredGames = "Hey";

            //Played platform sponsored games
            //Get games played with sponsored,, during the period of subscription
            $playedPlatformSponsoredGames = "Hey";

            //Remaining platform sponsored games
            //
            $RemainingPlatformSponsoredGames = "Hey";
        }

        return $newArray;
    }

    function getGamesPlayed($host, $user, $password, $database, $browser_uuid){
        $sql = "SELECT * FROM players WHERE browser_uuid = '$browser_uuid'"; 
        $games = find($host, $user, $password, $database, $sql);
        $games = resultToArray($games);

        return $games;
    }

    function getPlatformSponsoredGamesPlayed($host, $user, $password, $database, $browser_uuid){
        $gamesPlayed = getGamesPlayed($host, $user, $password, $database, $browser_uuid);


        $newArray = [];
        foreach ($gamesPlayed as $key => $game) {
            # code...
            $gameId = $game["game_id"];

            $sql = "SELECT * FROM games WHERE id = $gameId AND platform_sponsored = 1"; 
            $platformSponsoredGames = find($host, $user, $password, $database, $sql);
            $platformSponsoredGames = resultToArray($platformSponsoredGames);

            if(count($platformSponsoredGames) > 0){
                $game["game"] = $platformSponsoredGames[0];
                $newArray[] = $game;
            } else {
                continue;
            }
        }
        return $newArray;
    }

    function isGameAfterSubscription( ?string $subscriptionConfirmationTime, ?string $gameStartTime ): bool {
        if (
            $subscriptionConfirmationTime === null ||
            $gameStartTime === null
        ) {
            return false;
        }

        try {
            $utc = new DateTimeZone('UTC');

            $subscriptionTime = DateTime::createFromFormat(
                'Y-m-d H:i:s',
                $subscriptionConfirmationTime,
                $utc
            );

            $gameTime = DateTime::createFromFormat(
                'Y-m-d H:i:s',
                $gameStartTime,
                $utc
            );

            if ($subscriptionTime === false || $gameTime === false) {
                return false;
            }

            return $gameTime > $subscriptionTime;
        } catch (Exception $e) {
            return false;
        }
    }

    function getSubscriptionsWithGamesPlayed($host, $user, $password, $database, $user_id, $browser_uuid){
        $activeSubscriptions = getActiveUserSubscriptions($host, $user, $password, $database, $user_id, $browser_uuid);
        $platformSponsoredGamesPlayed = getPlatformSponsoredGamesPlayed($host, $user, $password, $database, $browser_uuid);

        //$activeSubscriptions = $activeSubscriptions["expired_subscriptions"];
        $activeSubscriptions = $activeSubscriptions["active_subscriptions"];
        $remainingGames = $platformSponsoredGamesPlayed;

        $newArray = [];
        foreach ($activeSubscriptions as $key => $activeSubscription) {
            # code...

            $activeSubscription["platform_sponsored_games_played"] = [];

            $subscriptionConfirmationTime = $activeSubscription["crypto_payment"]["confirmation_time"];
            $newArray2 = [];
            $remainingGamesHolder = [];
            foreach ($remainingGames as $key => $remainingGame) {
                # code...

                //compare the game starttime to the subscription activation time,, if it's bigger then can include in count
                $gameStartingTime = $remainingGame["game"]["start_time"];
                if(count($newArray2) < $activeSubscription["max_tournaments"] && isGameAfterSubscription($subscriptionConfirmationTime, $gameStartingTime)){
                    //only add games that are platform sponsored;
                    $newArray2[] = $remainingGame;
                } else {
                    $remainingGamesHolder[] = $remainingGame;
                }
            }

            $activeSubscription["platform_sponsored_games_played"] = $newArray2;
            $remainingGames = $remainingGamesHolder;
            $newArray[] = $activeSubscription;
        }

        $totalPlatformSponsoredGamesAllowed = 0;
        $totalPlatformSponsoredGamesPlayed = 0;
        $expiryDate = NULL;


        foreach ($newArray as $key => $userSubscription) {
            # code...
            $totalPlatformSponsoredGamesAllowed += (int)$userSubscription["max_tournaments"];
            $totalPlatformSponsoredGamesPlayed += count($userSubscription["platform_sponsored_games_played"]);
            $expiryDate = getGreaterDate($expiryDate, $userSubscription["expiry_time"]);
        }

        $userSubscriptions = [
            "total_maximum_tournaments" => $totalPlatformSponsoredGamesAllowed,
            "total_platform_sponsored_games_played" => $totalPlatformSponsoredGamesPlayed,
            "remaining_platform_sponsored_tournamens" => $totalPlatformSponsoredGamesAllowed - $totalPlatformSponsoredGamesPlayed,
            "expiry_time" => $expiryDate,
            "active_subscriptions" => $newArray
        ];

        return $userSubscriptions;

    }

    function getAllSubscriptions($host, $user, $password, $database, $user_id, $browser_uuid){

        // Get bought subscriptions that match the browser_uuid,
        $sql = "SELECT * FROM bought_subscriptions WHERE browser_uuid = '$browser_uuid'";
        $boughtSubscriptions = find($host, $user, $password, $database, $sql);

        $newArray = [];
        $newArray["active_subscriptions"] = [];
        $newArray["expired_subscriptions"] = [];
        $newArray["max_tournaments"] = 0;
        $newArray["expiry_time"] = "0000-00-00 00:00:00";

        foreach ($boughtSubscriptions as $index => $boughtSubscription) {
            # code...
            $subscriptionId = $boughtSubscription["subscription_id"];
            $cryptoPaymentId = $boughtSubscription["crypto_payment_id"];

            //For each subscription get the duration
            $subscription = getSubscription($host, $user, $password, $database, $subscriptionId);
            $boughtSubscription = array_merge($boughtSubscription, $subscription);
            $subscriptionDurationId = $subscription["duration_id"];
            $subscriptionDuration = getSubscriptionDuration($host, $user, $password, $database, $subscriptionDurationId);
            $boughtSubscription = array_merge($boughtSubscription, $subscriptionDuration);

            // Fetch the payment details to check confirmation,
            $sql = "SELECT * FROM crypto_payments WHERE id = $cryptoPaymentId";
            $cryptoPayments = find($host, $user, $password, $database, $sql);
            $cryptoPayments = resultToArray($cryptoPayments);
            $cryptoPayment = $cryptoPayments[0];
            $boughtSubscription["crypto_payment"] = $cryptoPayment;

            //Get the confirmation time,
            $confirmationTime = $cryptoPayment["confirmation_time"];
            $subscriptionDuration = $boughtSubscription["seconds"];

            if(isset($confirmationTime)){
                //Get subscription expiry time
                $subscriptionExpiryTime = addSecondsToUtcTime($confirmationTime, (int)$subscriptionDuration);
                $boughtSubscription["expiry_time"] = $subscriptionExpiryTime;

                //Get if subscription isn't expired;
                $notExpired = isNotExpired($confirmationTime, $subscriptionExpiryTime);

                if($notExpired){
                    $newArray["active_subscriptions"][] = $boughtSubscription;
                    $newArray["max_tournaments"] += (int)$boughtSubscription["max_tournaments"];
                    $newArray["expiry_time"] = $subscriptionExpiryTime;
                } else {
                    $newArray["expired_subscriptions"][] = $boughtSubscription;
                }
            }

            //Get platform sponsored games
            //Add all the games in subscription;
            $totalPlatformSponsoredGames = "Hey";

            //Played platform sponsored games
            //Get games played with sponsored,, during the period of subscription
            $playedPlatformSponsoredGames = "Hey";

            //Remaining platform sponsored games
            //
            $RemainingPlatformSponsoredGames = "Hey";
        }

        return $newArray;
    }
?>