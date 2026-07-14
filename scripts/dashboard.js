"use strict";

let games;
let subscription = {
    expiry_time : API.getSubscriptionExpiryTime(),
};
let browser_uuid = API.fetchBrowserUUID();


const updateSubscriptionExpiryTime = (()=>{
    API.updateTimeToExpiry(subscription.expiry_time);
}, 1000);

//get games
const updateGames = (userGames) => {

    games = userGames.games;
    updateAvailableGamesUI(games);
}

const updatePlatformSponsoredGamesUI = games => {
    let availableGames = document.getElementById("platform-sponsored-games");

    let innerHTML = `<tr>
                        <th></th>
                        <th>Reward</th>
                        <th>Min Players</th>
                        <th></th>
                    </tr>`;

    games.forEach((element, index) => {
        innerHTML += `<tr>
                            <th>${index+1}.</th>
                            <td> Ksh. ${element.reward}</td>
                            <td> <span>${element.minimum_players} player${element.minimum_players == 1? "" : "s"}</span><br /><span>${element.remaining_players} remaining</span></td>
                            <td><a href="./waiting-room.php?id=${element.id}"class="join-now-button">JOIN NOW</a></td>
                        </tr>`
    });
    availableGames.innerHTML = innerHTML;

    //document.getElementById("play-now-button").href="./waiting-room.php?id=" + games[0].id;
}

const updateAvailableGamesUI = (games) => {
    let availableGames = document.getElementById("available-games");

    let innerHTML = `<tr>
                        <th></th>
                        <th>Min Players</th>
                        <th></th>
                    </tr>`;

    games.forEach((element, index) => {
        innerHTML += `<tr>
                            <th>${index+1}.</th>
                            <td> <span>${element.minimum_players} player${element.minimum_players == 1? "" : "s"}</span><br /><span>${element.remaining_players} remaining</span></td>
                            <td><a href="./waiting-room.php?id=${element.id}"class="join-now-button">JOIN NOW</a></td>
                        </tr>`
    });
    availableGames.innerHTML = innerHTML;

    document.getElementById("play-now-button").href="./waiting-room.php?id=" + games[0].id;
}

const syncPlayerUUID = (serverUUID) => {
    const STORAGE_KEY = "player_uuid";
    const COOKIE_KEY = "player_uuid";

    // Helper: get cookie
    function getCookie(name) {
        const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
        return match ? match[2] : null;
    }

    // Helper: set cookie (1 year expiry)
    function setCookie(name, value) {
        const expires = new Date();
        expires.setFullYear(expires.getFullYear() + 1);
        document.cookie = `${name}=${value}; expires=${expires.toUTCString()}; path=/`;
    }

    let cookieUUID = getCookie(COOKIE_KEY);
    let localUUID = localStorage.getItem(STORAGE_KEY);

    // 1. If cookie exists → it is the source of truth
    if (cookieUUID) {
        // Sync localStorage if different
        if (localUUID !== cookieUUID) {
            localStorage.setItem(STORAGE_KEY, cookieUUID);
        }
        return cookieUUID;
    }

    // 2. No cookie → use server UUID
    if (!localUUID || localUUID !== serverUUID) {
        localStorage.setItem(STORAGE_KEY, serverUUID);
    }

    // Set cookie from final value
    setCookie(COOKIE_KEY, serverUUID);

    return serverUUID;
}
//update UI
/*Get completed games;
Get unplayed games;
Get proceeding games;*/

const sse = createEventSource("./api/available-games.php", {

    open(event) {
        //console.log("Connection opened.");
    },

    games(event){
        let data = JSON.parse(event.data);
        updateGames(data.games);
        updatePlatformSponsoredGamesUI(data.games.platform_sponsored_games);
        API.updateTimeToExpiry();
    },

    message(event) {
        //console.log("Message:", event.data);
    },

    balance(event){
        console.log("Balance: ", event);
    },

    error(event, source) {
        console.log("Connection error.");

        // Close the connection if desired
        // source.close();
    }

});