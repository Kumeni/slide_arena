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
    <link rel="shortcut icon" href="./assets/slide-arena-logo.png"/>

    <title>My Profile | Slide Puzzle</title>
</head>
<body>
    <section class="landing">
        <div class="sign-in-n-quick-links">
            <button class="sign-in-with-google"><img src="./assets/google icon.png" /> <span>Sign in with Google</span></button>
            <ul class="quick-links">
                <a href="./">Home</a>
                <a href="#">My Profile</a>
                <a href="#">My Subscriptions</a>
                <a href="#">Terms of Service</a>
                <a href="#">Privacy Policy</a>
            </ul>
        </div>

        <div class="slide-arena-logo-container">
            <img class="slide-arena-logo" src="./assets/slide-arena-logo.png" alt="Slide Arena Logo"/>
            <!-- <img class="rotating-triangle" src="./assets/triangle.png" /> -->
        </div>
    </section>

    <section class="rewards-container" id="rewards">
        <!-- <div class="available-rewards">  -->
            <h2>My Profile</h2>
            <div class="underline"></div>

            <table>
                <thead></thead>
                <tbody id="available-games">
                    <tr>
                        <th>Username</th>
                        <td>Samson Kumeni</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>samsonkumenisande@gmail.com</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <header style="visibility: hidden;">
        <div>
            <div class="header-items">
                <div>
                    <div class="menu-bars" onclick="toggleNavigation()">
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                    <a href="./"><img src="" class="yosambranding-logo"/></a>
                </div>
                <ul>
                    <a href="./buy-subscription.html" class="buy-subscription">Buy Subscription</a>
                </ul>
                <ul>
                    <a href="./contact-us.html">Contact Us</a>
                    <a href="./about-us.html">Log Out</a>
                </ul>
            </div>
        </div>
    </header>
    
    <section class="games-and-stats" id="quick-games">
        <div>
            <div class="games-category">
                <h2>Quick Games</h2>
                <div class="underline"></div>

                
            </div>
        </div>
    </section>


    <footer>
        <p>Copyright &#169; 2025 | All Rights Reserved</p>
    </footer>
    <script src="./scripts/api.js"></script>
    <script src="./scripts/dashboard.js"></script>
</body>
</html>