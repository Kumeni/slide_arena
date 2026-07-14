<?php

    header("Content-Type: text/event-stream");
    header("Cache-Control: no-cache");
    header("Connection: keep-alive");

    while(true){

        if(connection_aborted()){
            exit;
        }
        
        $data = [
            "time" => gmdate("Y-m-d H:i:s"),
            "random" => rand(1,100)
        ];

        echo "event: balance\n";
        echo "data: " . json_encode($data) . "\n\n";

        ob_flush();
        flush();

        sleep(1);

    }