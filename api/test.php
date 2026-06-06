<?php 

    require './db.php';
    require './db-operations.php';
    require './core.php';

    $playerUUID = getBrowserUUID($host, $user, $password, $database);

    echo $_SESSION['browser_uuid'];
    echo "<br />";
    echo $playerUUID;
?>