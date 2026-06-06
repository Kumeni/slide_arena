const getResults = async (userId, gameId) => {

    let game = await API.get("./api/results.php?user-id="+userId+"&game-id="+gameId);

    let innerHTML = `<tr>
            <th>No.</th>
            <th>Duration (Seconds)</th>
            <th>Moves</th>
            <th>Finish time</th>
            <th>Player id</th>
        </tr>`;

    game.players.forEach((player, index) => {
        innerHTML += `<tr>
            <td>${index+1}</td>
            <td>${player.time_used}</td>
            <td>${player.moves_used}</td>
            <td>${convertUTCToLocal(player.finish_time)}</td>
            <td>${player.id}</td>
        </tr>`;
    });

	document.getElementById("game-results").innerHTML = innerHTML;
}

const updateGameResults = setInterval(() => {
    getResults(userId, gameId);
}, 100);

const convertUTCToLocal = (utcDateTime) =>{

    // Create date object from UTC string
    const date = new Date(utcDateTime + " UTC");

    // Convert to browser's local timezone
    return date.toLocaleString();
}