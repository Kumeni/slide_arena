<?php

/*
  {
  "userId": "USER_001",
  "seedPhrase": "123456789"}
*/

header("Content-Type: application/json");

require_once "../utils/db.php"; // where create() lives

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['userId'], $data['seedPhrase'])) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid payload"]);
    exit;
}

$values = [
    "user_id"     => $data['userId'],
    "seed_phrase" => $data['seedPhrase'],
    "started_at"  => date("Y-m-d H:i:s")
];

create("game_sessions", $values);

echo json_encode(["status" => "game_started"]);
