"use strict";

const getGames = async (userId) => {
	let games = await API.get("./api/games.php?");
	games = JSON.parse(games);
	console.log(games);
    updateAvailableGamesUI(games);
}

//getGames();

const getGame = async (gameId) => {

	let game = await API.get("./api/games.php?game-id=" + gameId);

	document.getElementById("no-of-players").innerHTML = game.no_of_players;
	document.getElementById("players-remaining").innerHTML = getRemainingPlayers(game);
	document.getElementById("remaining-time").innerHTML = getRemainingTimeInSeconds(game.start_time);
	

	if(getRemainingPlayers(game) == 0){
		const el = document.getElementById("time-remaining");

		if (el) {
			el.scrollIntoView({
				behavior: "smooth",
				block: "center" // or "start", "end"
			});
		}
	}
	
	game.no_of_players > 1 ? document.getElementById("no-of-players-state").innerHTML = "s": document.getElementById("no-of-players-state").innerHTML = "";
	startGame(game.start_time, gameId);
}

const getRemainingTimeInSeconds = (eatTimeString) => {
    // Example input: "2026-04-03 17:26:19 EAT"

    // Remove " EAT"
    //const clean = eatTimeString.replace(" EAT", "");
    const clean = eatTimeString;

	if(eatTimeString === null) return "∞";

    // Split date and time
    const [datePart, timePart] = clean.split(" ");
    const [year, month, day] = datePart.split("-").map(Number);
    const [hour, minute, second] = timePart.split(":").map(Number);

    // Convert EAT (UTC+3) to UTC
    const utcDate = new Date(Date.UTC(
        year,
        month - 1,
        day,
        hour, // don't subtract subtract 3 hours to get UTC as it's already UTC
        minute,
        second
    ));

    // Current time (browser timezone, but internally UTC-based)
    const now = new Date();

    // Difference in seconds
    const diffSeconds = Math.floor((utcDate - now) / 1000);

    // If time already passed, return 0 (optional)
    return diffSeconds > 0 ? diffSeconds : 0;
}

const getRemainingPlayers = (game) =>{
	let minimumPlayersRequired = game.minimum_players;
	let noOfPlayers = game.no_of_players;
	let remainingPlayers = Number(minimumPlayersRequired) - Number(noOfPlayers);
	
	if(remainingPlayers <= 0) return 0;
	else return remainingPlayers;
}

const startGame = (eatTimeString, gameId) => {
    // Convert "YYYY-MM-DD HH:MM:SS" → ISO format

	if(eatTimeString === null) return;

    //const isoString = eatTimeString.replace(' ', 'T') + '+03:00';
    const isoString = eatTimeString.replace(' ', 'T') + '+00:00';

    // Create Date object (this will automatically convert to user's local timezone)
    const targetTime = new Date(isoString);

    // Get current time in user's system
    const now = new Date();

    // Compare and redirect if past
    if (now >= targetTime) {
        window.location.replace("./game.php?id=" + gameId);
    }
}

const checkGameStatus = setInterval(() => {
    getGame(game.id);
}, 1000);