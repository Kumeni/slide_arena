"use strict";

let games = [];
const puzzle = document.getElementById("puzzle");
const message = document.getElementById("message");

let player = {
	id:1,
	name:"samson"
};

//let game = {};

//let tiles = [];

const init = () => {
	tiles = [1, 2, 3, 4, 5, 6, 7, 8, null];
	render();
}

const render = () => {
	puzzle.innerHTML = "";

	tiles.forEach((value, index) => {
		const tile = document.createElement("div");
		tile.className = "tile";

		if (value === null) {
			tile.classList.add("empty");
		} else {
			tile.textContent = value;
			tile.onclick = () => moveTile(index);
		}

		puzzle.appendChild(tile);
	});

	checkWin();
}

const moveTile = (index) => {
    const emptyIndex = tiles.indexOf(null);

    // Calculate row and column for clicked tile and empty tile
    const rowIndex = Math.floor(index / 3);
    const colIndex = index % 3;

    const emptyRow = Math.floor(emptyIndex / 3);
    const emptyCol = emptyIndex % 3;

    // Check if the tile is adjacent to the empty space
    const isAdjacent =
        (rowIndex === emptyRow && Math.abs(colIndex - emptyCol) === 1) || // horizontal
        (colIndex === emptyCol && Math.abs(rowIndex - emptyRow) === 1);    // vertical

    if (isAdjacent) {
        // Swap the tile with the empty space
        [tiles[index], tiles[emptyIndex]] = [tiles[emptyIndex], tiles[index]];
        render();
        uploadMove(tiles);
    }
}

// 🔑 Convert seed string → number
const hashSeed = (seed) => {
	let hash = 0;
	for (let i = 0; i < seed.length; i++) {
		hash = (hash << 5) - hash + seed.charCodeAt(i);
		hash |= 0;
	}
	return Math.abs(hash);
}

// 🎲 Seeded random generator
const seededRandom = (seed) => {
	let value = seed % 2147483647;
	return function () {
		value = value * 16807 % 2147483647;
		return (value - 1) / 2147483646;
	};
}

// 🔀 Shuffle using seed
const shuffleWithSeed = (seedPhrase) => {
	message.textContent = "";
	tiles = [1, 2, 3, 4, 5, 6, 7, 8, null];

	const seed = hashSeed(seedPhrase);
	const random = seededRandom(seed);

	for (let i = tiles.length - 1; i > 0; i--) {
		const j = Math.floor(random() * (i + 1));
		[tiles[i], tiles[j]] = [tiles[j], tiles[i]];
	}

	render();
}

/*function generateFromSeed() {
	const seed = document.getElementById("seedInput").value || "default";
	shuffleWithSeed(seed);
}*/
const generateFromSeed = (seed) => {
	shuffleWithSeed(seed);
}

const checkWin = () => {
	const solved = tiles
		.slice(0, 8)
		.every((value, index) => value === index + 1);

	if (solved) {
		message.textContent = "🎉 Puzzle Solved!";
		setTimeout(() => {
			window.location.href='./game-results.php?game-id='+game.id+'&user-id='+player.id;
		}, 200);
		
	}
}

const getGames = () => {
	const API_ENDPOINT = "./api/games.php";
	const request = new XMLHttpRequest();

	request.open("GET", API_ENDPOINT, true);
	request.onreadystatechange = () => {
		if(request.readyState === 4 && request.status === 200){

			console.log(request.response);
			games = JSON.parse(request.response);

			if(games.length > 0){
				game = games[0];
				tiles = games[0].formatted_seed;
				render();
			}
			
		}
	}
	request.send();
}

const uploadMove = async (tiles) => {
	
	/*let formData = new FormData()
	console.log(game);*/
	if(tiles.toString() !== ""){

		let response = await API.post("./api/game-play.php", {
			body:{
				moves: tiles.toString(),
				user_id: player.id,
				game_id: game.id,
			}
		})

		console.log(response);
		/*formData.append("moves", tiles.toString());
		formData.append("user_id", player.id);
		formData.append("game_id", game.id);

		const API_ENDPOINT = "./api/game-play.php";
		const request = new XMLHttpRequest();

		request.open("POST", API_ENDPOINT, true);
		request.onreadystatechange = () => {
			if(request.readyState === 4 && request.status === 200){

				console.log(request.response);
				let response = JSON.parse(request.response);
				console.log(response);
				if(tiles.toString() == "1,2,3,4,5,6,7,8,"){
					window.location.href='./game-results.php?game-id='+game.id+'&user-id='+player.id;
				}
			} else {
				if(request.status == 403 || request.status == 403){
					console.log(request.response);
				}
			}
		}

		request.send(formData);*/
	} else {
		console.log("Something went wrong");
	}
}
