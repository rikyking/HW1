<?php
    require_once '../login/datiDB.php';

    if(!isset($_POST['cf_input']) && !isset($_POST['codici'])){
        exit;
    }
    $CF=$_POST['cf_input'];
    $codice=$_POST['codici'];
    
    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());

    $query="SELECT PREZZO FROM VEICOLO WHERE CODICE=".$codice;
    $res=mysqli_query($con,$query) or die(mysqli_error($con));
    
    while($row=mysqli_fetch_assoc($res)){
        $prezzo_a=$row['PREZZO'];
    }
    $dipendente=rand(1,9);
    $data=date("Y-m-d");

    $query1="INSERT into compravendita 
    values('$CF'," .$dipendente . ",'$codice',".$prezzo_a. ",'$data')";
    if($res=mysqli_query($con, $query1)){
        header('Location: ../login/home.php');
    }
    
    mysqli_close($con);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../style/mhw3.css">
    <title>Errore</title>
</head>
    <body>
        <div class="nonDispo">
            <img src="../images/sad.svg">
            <h1>Veicolo non disponibile<br>Clicca <a href="../login/home.php">qui</a> per tornare alla home</h1>
        </div>
    </body>
</html>