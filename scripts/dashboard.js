"use strict";

let games;
//get games
const updateGames = (userGames) => {

    let browserUUID = userGames.browser_uuid;

    games = userGames.games;

    storeBrowserUUID(browserUUID);
    updateAvailableGamesUI(games);
}

const updateAvailableGamesUI = (games) => {
    let availableGames = document.getElementById("available-games");

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

    document.getElementById("play-now-button").href="./waiting-room.php?id=" + games[0].id;
}

const updateUI = setInterval(async () => {
    
    let userGames = await API.get("./api/games.php?");
    updateGames(userGames);
    API.updateTimeToExpiry();

}, 1000);

const storeBrowserUUID = (browserUUID) => {
    if (!browserUUID) return false;

    const existingUUID = localStorage.getItem("browser_uuid");

    if (existingUUID !== browserUUID) {
        localStorage.setItem("browser_uuid", browserUUID);
    }

    return true;
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