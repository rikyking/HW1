<?php
    require_once '../login/auth.php';
    if (!$userid=checkAuth()){
        exit;
    }
    header('Content-Type: application/json'); 

    $userid=$_GET['id_session'];
    $concessionario=$_GET['concessionario'];    
    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());
    

    
    $query="SELECT id_pref,v.nome,v.modello,v.url_img
    from preferiti p join veicolo v on p.id_pref=v.codice
    where id_session=$userid and concessionario='$concessionario'";
    $res=mysqli_query($con, $query) or die(mysqli_error($con));
   
    $array=array();
    while($row=mysqli_fetch_assoc($res)){
        $array[]=array(
           'id_pref'=>$row['id_pref'],
           'nome'=>$row['nome']." ".$row['modello'],
           'url'=>$row['url_img'],
        );
    }

    echo json_encode($array);
?>