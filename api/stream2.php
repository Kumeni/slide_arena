<?php

    // Disable all output buffering
    while (ob_get_level()) {
        ob_end_clean();
    }
    
    // Disable compression (important on some hosts)
    @ini_set('zlib.output_compression', 0);
    @ini_set('output_buffering', 'off');
    @apache_setenv('no-gzip', 1);

    // Prevent PHP from timing out (hosting may ignore this)
    ignore_user_abort(true);
    set_time_limit(0);

    // SSE headers
    header("Content-Type: text/event-stream");
    header("Cache-Control: no-cache, no-store, must-revalidate, max-age=0");
    header("Pragma: no-cache");
    header("Expires: 0");
    header("Connection: keep-alive");
    header("X-Accel-Buffering: no");

    // Disable output buffering
    while (ob_get_level() > 0) {
        ob_end_flush();
    }

    ob_implicit_flush(true);

    $startTime = time();
    $count = 0;

    while (true) {

        if (connection_aborted()) {
            exit;
        }

        $count++;

        $data = [
            "count" => $count,
            "server_time" => gmdate("Y-m-d H:i:s"),
            "elapsed" => time() - $startTime
        ];

        echo str_repeat(" ", 4096); // Push enough bytes to overcome buffering
        echo "data: " . json_encode($data) . "\n\n";

        flush();

        sleep(5);
    }