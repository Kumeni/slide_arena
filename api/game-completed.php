<?php

/*
  {
  "completionTime": 120,
  "moves": [
      {"emptyIndex": 8, "tilePushed": 6, "timestamp": "2026-02-08T10:12:34.000Z"},
      {"emptyIndex": 7, "tilePushed": 5, "timestamp": "2026-02-08T10:12:36.000Z"}
    ]
  }
*/
header("Content-Type: application/json");

//require_once "../utils/db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['completionTime'], $data['moves'])) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid payload"]);
    exit;
}

$values = [
    "completion_time" => (int)$data['completionTime'],
    "moves_json"      => json_encode($data['moves']),
    "completed_at"    => date("Y-m-d H:i:s")
];

create("game_completions", $values);

echo json_encode(["status" => "game_completed"]);

/*
//Suggested tables
game sessions
| column      | type     |
| ----------- | -------- |
| id          | int      |
| user_id     | varchar  |
| seed_phrase | varchar  |
| started_at  | datetime |

game moves
| column      | type     |
| ----------- | -------- |
| id          | int      |
| empty_index | int      |
| tile_pushed | int      |
| played_at   | datetime |

game completions
| column          | type     |
| --------------- | -------- |
| id              | int      |
| completion_time | int      |
| moves_json      | json     |
| completed_at    | datetime |
*/