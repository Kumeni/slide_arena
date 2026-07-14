<?php

header("Content-Type: text/plain");

echo "Started at: " . date("H:i:s") . PHP_EOL;

$start = time();

for ($i = 1; $i <= 5; $i++) {

    sleep(1);

    echo "Iteration $i | time() = " . time() . PHP_EOL;

    flush();
}

echo "Elapsed = " . (time() - $start) . PHP_EOL;