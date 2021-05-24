<?php
    require_once '../login/auth.php';
    if (!$userid=checkAuth())exit;

    header('Content-Type: application/json'); 

    $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) 
    or die("errore:" .mysqli_connect_error());
    $userid=mysqli_escape_string($con,$userid);
    /**
     * ?veicoli acquistati da un singolo cliente
     */
    $query="SELECT V.nome as Nome, v.modello as Modello ,CO.prezzo as Prezzo, CON.nome as Concessionario, CON.via as Indirizzo, ct.nome as Citta,CO.data as data
    FROM (((dati_login d join cliente c on d.CF=c.CF) join compravendita CO on c.CF=CO.cliente) join veicolo v on CO.CODICE_VEICOLO=v.codice join dipendente DP on CO.CODICE_VENDITORE=DP.CODICE) 
    join concessionario CON on DP.CONCESSIONARIO=CON.CODICE join risiede rd on CON.codice=rd.CONCESSIONARIO join citta ct on rd.CITTA=ct.cap
    where d.id_session=".$userid;
    /**
     * ?spesa di un singolo cliente
     */
    $query1="SELECT sum(CO.prezzo) as Spesa_totale
    FROM ((dati_login d join cliente c on d.CF=c.CF) join compravendita CO on c.CF=CO.cliente) join veicolo v on CO.CODICE_VEICOLO=v.codice
    where d.id_session=".$userid;

    $res=mysqli_query($con, $query) or die(mysqli_error($con));
    $res1=mysqli_query($con, $query1) or die(mysqli_error($con));

    $array=array();
    while($row=mysqli_fetch_assoc($res)){
        $array[]=array(
            'nome'=>$row['Nome'],
            'modello'=>$row['Modello'],
            'prezzo'=>$row['Prezzo'],
            'data'=>$row['data'],
            'concessionario'=>$row['Concessionario'],
            // 'indirizzo'=>$row['Indirizzo'],
            // 'citta'=>$row['Citta']
        );
    }
    while($row1=mysqli_fetch_assoc($res1)){
        $array[]=array(
            'tot'=>$row1['Spesa_totale'],
        );
    }
    echo json_encode($array);
?>