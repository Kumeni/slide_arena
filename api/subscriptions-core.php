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
        
        //If current time is less than that, return,
        //Active subscription,, subscription time,, expiry time.

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
            //unset($subscription["suspended"]);
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
        }

        return $newArray;
    }
?>