<?php

    // Path to the JSON file
    $jsonFile = "./cache/games/latest.json";

    // Check if the file exists
    if (!file_exists($jsonFile)) {
        die("JSON file not found.");
    }

    // Read the file contents
    $jsonString = file_get_contents($jsonFile);

    // Convert JSON to a PHP associative array
    $data = json_decode($jsonString, true);

    // Check for JSON errors
    if (json_last_error() !== JSON_ERROR_NONE) {
        die("Invalid JSON: " . json_last_error_msg());
    }

    // $data now contains the JSON data
    print_r($data);
    echo $data["latest"];

?>