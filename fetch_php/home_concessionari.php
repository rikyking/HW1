<?php
    require_once '../login/datiDB.php';
    header('Content-Type: application/json'); 

    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());

    $query="SELECT * FROM dati_conc";
    $res=mysqli_query($con, $query) or die(mysqli_error($con));
    $array=array();
    while($row=mysqli_fetch_assoc($res)){
        $array[]=array(
            'nome'=>$row['nome'],
            'url_img'=>$row['url_img'],
            'descrizione'=>$row['descrizione'],
        );
    }
    echo json_encode($array);
?>