<?php
    require_once '../login/auth.php';
    if (!$userid=checkAuth()){
        exit;
    }
    $userid=$_GET['id_session'];
    $idPrefe=$_GET['idPref'];
    $concessionario=$_GET['concessionario'];
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);
    echo $userid .$idPrefe;
    $query="INSERT INTO preferiti(id_session,id_pref,concessionario)
            values('$userid','$idPrefe','$concessionario')";
    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));
    mysqli_close($conn);
?>