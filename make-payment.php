<?php
    require './api/db.php';
    require './api/db-operations.php';
    require './api/subscriptions-core.php';

    $subscriptionId = $_GET["subscription-id"];
    //$walletAddress = "0x7bBAE8AA2C4745C406Bd552fE0203DB3E29ee066";
    $walletAddress = "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf";
    $subscription =  getSubscription($host, $user, $password, $database, $subscriptionId);
    $subscriptionCost = $subscription["cost"];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=100, initial-scale=1.0">

    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/header.css" />
    <link rel="stylesheet" href="./styles/dashboard.css" />
    <link rel="stylesheet" href="./styles/action-buttons.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="stylesheet" href="./styles/subscription-timer.css" />
    <link rel="stylesheet" href="./styles/make-payment.css" />
    <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>

    <script>
        <?php echo "const SUBSCRIPTION_ID = $subscriptionId;\nconst USER_ID = 1;" ?>
    </script>

    <title>Make Payment | Slide Arena</title>
</head>
<body>
    <section class="landing">
        <div class="sign-in-n-quick-links">
            <button class="sign-in-with-google"><img src="./assets/google icon.png" /> <span>Sign in with Google</span></button>
            <div>
                <div class="subscription-timer">
                    <p>Active Subscription</p>
                    <div class="underline"></div>
                    <div class="timer">
                        <div>
                            <p id="remaining-days">12</p>
                            <p>days</p>
                        </div>
                        <span>:</span>
                        <div>
                            <p id="remaining-hours">12</p>
                            <p>hours</p>
                        </div>
                        <span>:</span>
                        <div>
                            <p id="remaining-minutes">32</p>
                            <p>mins</p>
                        </div>
                        <span>:</span>
                        <div>
                            <p id="remaining-seconds">12</p>
                            <p>seconds</p>
                        </div>
                    </div>
                </div>
                <ul class="quick-links">
                    <a href="./">Home</a>
                    <a href="#">My Profile</a>
                    <a href="./dashboard.html">Dashboard</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Privacy Policy</a>
                </ul>
            </div>
            
        </div>

        <div class="slide-arena-logo-container">
            <img class="slide-arena-logo" src="./assets/slide-arena-logo.png" alt="Slide Arena Logo"/>
            <img class="rotating-triangle" src="./assets/triangle.png" />
        </div>
        <section class="subscriptions">
            <h1>Initiating payment<br /> via Metamask...</h1>
            <div class="underline"></div>
            <div class="terms-of-service">
                <p>
                    By proceeding with this payment, you are purchasing a <?php echo $subscription["cost"] ?> USDT platform subscription for access to features and services available on the gaming platform.
                </p>
                <p>
                    Your subscription includes:
                </p>
                <ul>
                    <li>Eligibility to participate in up to <?php echo $subscription["max_tournaments"] ?> promotional tournaments during the subscription period.</li>
                    <li>Subscription validity for <?php echo $subscription["duration_name"] ?> from the date of successful payment.</li>
                    <li>Access to features available under this subscription tier.</li>
                </ul>
                <p>
                    Please note the following important information before continuing:
                </p>
                <ul>
                    <li>This payment is strictly for a platform subscription and is not a tournament entry fee, wager, stake, or pooled contribution toward tournament rewards.</li>
                    <li>Tournaments available on the platform are independently sponsored and funded by the platform as part of promotional and marketing activities.</li>
                    <li>Your subscription only grants access eligibility to participate in qualifying tournaments during the active subscription period.</li>
                    <li>Unused participation eligibility may expire once the subscription period ends.</li>
                    <li>Subscription payments become final once successfully processed.</li>
                </ul>
                <p>
                    By completing this purchase, you confirm that you understand the nature of the subscription service and agree to the platform’s subscription and participation terms.
                </p>
            </div>
        </section>

        
    </section>

    <footer>
        <p>Copyright &#169; 2025 | All Rights Reserved</p>
    </footer>
    <script src="./scripts/api.js"></script>
    <!-- <script src="./scripts/dashboard.js"></script> -->
    <script src="./node_modules/ethers/dist/ethers.umd.min.js"></script>
    <script src="./scripts/crypto-payment.js"></script>
    
</body>
</html>