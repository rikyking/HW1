<?php
    require_once '../login/datiDB.php';
    header('Content-Type: application/json'); 

   
    if(!isset($_GET["nome"])){
        echo "gesu";
        exit;
    }
    $nome=$_GET["nome"];
    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());
    
  
    $query="SELECT * FROM dati_conc WHERE nome='".$nome."'";
    $query1="SELECT v.*, c.via,c.nome
    from (veicolo v join disponibile d on v.CODICE=d.id_auto) join concessionario c on d.concessionario=c.codice
    where c.nome='".$nome."'
    group by  v.CODICE";

    $res=mysqli_query($con, $query) or die(mysqli_error($con));
    $res1=mysqli_query($con, $query1) or die(mysqli_error($con));
    $array=array();
    while($row=mysqli_fetch_assoc($res)){
        $array[]=array(
            'url_img'=>$row['url_img'],
        );
    }
    $i=1;
    while($row1=mysqli_fetch_assoc($res1)){
        $array[]=array(
            'codice'=>$row1['CODICE'],
            'nome'=>$row1['NOME']." ".$row1['MODELLO'],
            'url'=>$row1['url_img'],
            'descrizione'=>$row1['descrizione'],
        );
        $i++;
    }
    echo json_encode($array);
?>