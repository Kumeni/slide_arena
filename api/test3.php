<?php

$start = microtime(true);

echo "Before: " . date('H:i:s') . "<br>";

flush();

usleep(5000000);

echo "After: " . date('H:i:s') . "<br>";

echo "Elapsed: " . round(microtime(true) - $start, 3);