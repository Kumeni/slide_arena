const getResults = async (userId, gameId) => {

    let game = await API.get("./api/results.php?user-id="+userId+"&game-id="+gameId);
    console.log(game);
    let innerHTML = `<tr>
            <th>No.</th>
            <th>Duration (Seconds)</th>
            <th>Moves</th>
            <th>Finish time</th>
            <th>Player id</th>
        </tr>`;

    game.players.forEach((player, index) => {
        
        let me = false;

        console.log(player.browser_uuid);
        console.log(localStorage.browser_uuid);
        if(player.browser_uuid == localStorage.browser_uuid) me = true;
        innerHTML += `<tr ${me? "class='me'": ""}>
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