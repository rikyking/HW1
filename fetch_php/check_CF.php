<?php 
    require_once '../login/datiDB.php';

    if (!isset($_GET["CF"])) {
        exit;
    }

    header('Content-Type: application/json');
    
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);

    $CF = mysqli_real_escape_string($conn, $_GET["CF"]);

    $query = "SELECT CF FROM dati_login WHERE CF = '$CF'";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    echo json_encode(array('exists' => mysqli_num_rows($res) > 0 ? true : false));

    mysqli_close($conn);
?>