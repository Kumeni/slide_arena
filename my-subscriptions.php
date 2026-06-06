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
    <link rel="stylesheet" href="./styles/my-subscriptions.css" />
    <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>

    <title>My Subscriptions | Slide Arena</title>
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

        
        <section class="subscriptions">
            <h1>Available Subscriptions</h1>
            <div class="underline"></div>
            <table>
                <thead></thead>
                <tbody id="subscriptions-container"                            >
                    <tr>
                        <th>#</th>
                        <th>Cost (USDT)</th>
                        <th>Max tournaments</th>
                        <th>Duration</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>01</td>
                        <td>1</td>
                        <td>5</td>
                        <td>24 hrs</td>
                        <td><a href="./make-payment.php?subscription-id=1">Buy subscription</a></td>
                    </tr>
                    <tr>
                        <td>01</td>
                        <td>2</td>
                        <td>10</td>
                        <td>24 hrs</td>
                        <td><a href="./make-payment.php?subscription-id=1">Buy subscription</a></td>
                    </tr>
                    <tr>
                        <td>01</td>
                        <td>3</td>
                        <td>15</td>
                        <td>3 days</td>
                        <td><a href="./make-payment.php?subscription-id=1">Buy subscription</a></td>
                    </tr>
                    <tr>
                        <td>01</td>
                        <td>6</td>
                        <td>30</td>
                        <td>3 days</td>
                        <td><a href="./make-payment.php?subscription-id=1">Buy subscription</a></td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="terms-of-service">
            <p>
                Choosing a subscription is more than unlocking access — it’s a smart move for players who want consistency, priority access to tournaments, and a better competitive experience.
            </p>
            <p>
                Your subscription gives you the freedom to participate in multiple tournaments without interruptions, while securing your place on the platform for the selected duration. As the competition grows, subscribed players stay ahead by gaining reliable access, exclusive features, and a smoother gaming experience designed for committed competitors.
            </p>
            <p>
                By subscribing today, you’re investing in more opportunities to play, compete, and win. Whether you’re here for the challenge, the rewards, or the excitement of tournament play, your subscription puts you in control and keeps you ready for every upcoming event.
            </p>
        </section>

        <div class="slide-arena-logo-container">
            <img class="slide-arena-logo" src="./assets/slide-arena-logo.png" alt="Slide Arena Logo"/>
            <img class="rotating-triangle" src="./assets/triangle.png" />
        </div>
    </section>

    <footer>
        <p>Copyright &#169; 2025 | All Rights Reserved</p>
    </footer>
    <script src="./scripts/api.js"></script>
    <script src="./scripts/my-subscriptions.js"></script>
</body>
</html>