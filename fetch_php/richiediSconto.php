<?php 
    require_once '../login/datiDB.php';

    if (!isset($_GET["CF"])) {
        exit;
    }

    header('Content-Type: application/json');
    
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);

    $CF = mysqli_real_escape_string($conn, $_GET["CF"]);

    $query = "CALL p3('$CF')";

    if(mysqli_num_rows(mysqli_query($conn, $query))>0){
        header('Location: ../login/home.php');
    }

    mysqli_close($conn);
?>