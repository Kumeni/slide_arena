<?php

    function generateJsonFilename(
        string $category,
        int $durationSeconds = 3600,
        ?int $timestamp = null,
        string $baseDir = 'cache'
    ): string
    {
        if ($durationSeconds <= 0) {
            throw new InvalidArgumentException(
                'Duration must be greater than zero seconds.'
            );
        }

        $timestamp ??= time();

        // Round down to the nearest interval
        $roundedTimestamp = intdiv($timestamp, $durationSeconds) * $durationSeconds;

        return sprintf(
            '%s/%s/%s.json',
            rtrim($baseDir, '/'),
            strtolower($category),
            gmdate('Y_m_d_H_i_s', $roundedTimestamp)
        );
    }

    // Every hour
    //echo generateJsonFilename("games", 3600);
    // cache/games/2026_07_04_18_00_00.json

    // Every 30 minutes
    //echo generateJsonFilename("games", 1800);
    // cache/games/2026_07_04_18_30_00.json

    // Every 20 minutes
    //echo generateJsonFilename("games", 1200);
    // cache/games/2026_07_04_18_20_00.json

    // Every 10 minutes
    //echo generateJsonFilename("games", 600);
    // cache/games/2026_07_04_18_40_00.json

    // Every 5 minutes
    //echo generateJsonFilename("games", 300);
    // cache/games/2026_07_04_18_45_00.json

    // Every 30 seconds
    //echo generateJsonFilename("games", 30);
    // cache/games/2026_07_04_18_47_30.json

    // Daily
    //echo generateJsonFilename("games", 86400);
    // cache/games/2026_07_04_00_00_00.json

    function getJsonFilenames(
        string $category,
        int $cacheDurationSeconds,
        int $lookbackSeconds,
        ?int $endTimestamp = null,
        string $baseDir = 'cache'
    ): array
    {
        if ($cacheDurationSeconds <= 0) {
            throw new InvalidArgumentException(
                'Cache duration must be greater than zero.'
            );
        }

        if ($lookbackSeconds < 0) {
            throw new InvalidArgumentException(
                'Lookback duration cannot be negative.'
            );
        }

        $endTimestamp ??= time();

        $files = [];

        // Start at the current cache interval
        $currentInterval = intdiv($endTimestamp, $cacheDurationSeconds) * $cacheDurationSeconds;

        // Oldest interval to include
        $oldestInterval = $currentInterval - $lookbackSeconds;

        for (
            $timestamp = $currentInterval;
            $timestamp >= $oldestInterval;
            $timestamp -= $cacheDurationSeconds
        ) {
            $files[] = generateJsonFilename(
                $category,
                $cacheDurationSeconds,
                $timestamp,
                $baseDir
            );
        }

        return array_reverse($files);
    }

    /**
     * $files = getJsonFilenames(
     *   "games",
     *   300,    // Cache every 5 minutes
     *   3600    // Look back 1 hour
     *);
    */

    function readJsonFile(string $filepath): ?array
    {
        // Path to the JSON file
        $jsonFile = $filepath;

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
            //die("Invalid JSON: " . json_last_error_msg());

        }

        // $data now contains the JSON data
        return $data;
    }

    function readJsonFiles(array $filepaths): array
    {
        $data = [];

        foreach ($filepaths as $filepath) {
            $contents = readJsonFile($filepath);

            if ($contents !== null) {
                $data = array_merge($data, $contents);
            }
        }

        return $data;
    }

    function writeJsonFile(
        string $filepath,
        array $data
    ): bool
    {
        // Ensure the directory exists
        $directory = dirname($filepath);

        if (!is_dir($directory)) {
            if (!mkdir($directory, 0777, true) && !is_dir($directory)) {
                return false;
            }
        }

        // Encode the data
        $json = json_encode(
            $data,
            JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE
        );

        if ($json === false) {
            return false;
        }

        // Write atomically
        $tempFile = $filepath . '.tmp';

        if (file_put_contents($tempFile, $json, LOCK_EX) === false) {
            return false;
        }

        return rename($tempFile, $filepath);
    }