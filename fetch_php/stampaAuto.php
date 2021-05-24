<?php
    require_once '../login/datiDB.php';
    header('Content-Type: application/json'); 

    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());

    $query="SELECT v.codice,v.nome,v.modello,v.prezzo, v.QUANTITA_DISPONIBILI FROM veicolo v";
    $res=mysqli_query($con, $query) or die(mysqli_error($con));

    while($row=mysqli_fetch_assoc($res)){
        $array[]=array(
            'codice'=>$row['codice'],
            'nome'=>$row['nome'],
            'modello'=>$row['modello'],
            'prezzo'=>$row['prezzo'],
            'disp'=>$row['QUANTITA_DISPONIBILI']
        );
    }
    echo json_encode($array);
?>