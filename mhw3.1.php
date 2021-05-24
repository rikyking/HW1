<?php
    require_once 'login/auth.php';
    if(checkAuth()!=0){
        $var=true;
    }
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/mhw3.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <script src="script/apiVIN.js" defer></script>
    <title>MHW3-O46002300</title>
</head>
<body> 
    <header>
        <nav>       
            <a href="index.php" id="home">
                <div id="titolo">
                    Auto&Moto
                </div>
            </a>
            <div id="menu">
                <a href="index.php">Concessionari</a>
                <a href="mhw3.0.php">Galleria</a>
                <a href="mhw3.1.php">VIN decode</a>
                <a href="login/login.php">
                <?php 
                if(isset($var) && $var==true){
                    echo $_SESSION["username"];
                }else 
                echo "Area personale"?></a>
                <a href="#footer">Contatti</a>
            </div>
        </nav>
        <h1>VIN decode</h1>
    </header>
    <article id="article1">
        <h1>Cosa è il VIN?</h1>
        <p>Il numero di identificazione del veicolo, meglio noto come numero di telaio (Vehicle Identification Number), 
            <br>è un codice univoco alfanumerico che include un numero di serie, utilizzato dal settore automobilistico <br>per l'identificazione dei singoli autoveicoli, dei rimorchi, dei motocicli, degli scooter e dei ciclomotori. <br> <strong>Il nostro sito offre la possibilità di decodificare il codice VIN per repire informazioni sul vieicolo.</strong></p>
            <form>
                <div class="ricerca">
                    <img src="images/reload.ico" id="reload">
                    <input type="text" placeholder="Inserisci il VIN" id="VIN">
                    <input type="submit" value="Decodifica" id="cercaVIN">
                </div>
            </form>
    </article>
    <article id="contenuti">

    </article>
    <footer id="footer">
        <h2>Sito realizzato da</h2>
        <p>Riccardo Patronaggio<br>O46002300<br>Ing.Informatica M-Z <br>Università degli Studi di Catania</p>
    </footer>
</body>
</html>
