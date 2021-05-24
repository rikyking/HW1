<?php 
    require_once '../login/auth.php';

    if (!isset($_GET["CF"]))
    exit;
    
    header('Content-Type: application/json');
    
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);
    $userid=$_SESSION['id_session'];
    $CF = mysqli_real_escape_string($conn, $_GET["CF"]);
   
    $query="SELECT * 
    FROM dati_login d join cliente c on d.CF=c.CF and d.CF = '$CF' 
    where d.id_session=".$userid." AND c.eta<=30 OR c.eta>=60";


    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));
    
    echo json_encode(array('exists' => mysqli_num_rows($res) > 0 ? true : false));

    mysqli_close($conn);
?>