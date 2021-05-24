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
    <link rel="stylesheet" href="style/mhw1.css">
    <script src="script/home_concessionari.js" defer></script>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital@0;1&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <title>MHW1-O46002300</title>
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
            <div id="menu-mobile">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </nav>
        <h1>Trova il concessionario più conveniente per te<br/>
            <strong>CONSULTA I NOSTRI PARTNER</strong><br/>
            <a class="button" href="#main">Vai</a>
        </h1>
    </header>
    <section>
        <div id="main">
            <h1>Benvenuti nel sito che rintraccia i migliori concessionari per voi</h1><br>
            <p>Qui sotto elencati alcuni dei nostri più importanti concessionari partner</p>
        </div>
        <div id="contents">

        </div>
    </section>
    <footer id="footer">
        <h2>Sito realizzato da</h2>
        <p>Riccardo Patronaggio<br>O46002300<br>Ing.Informatica M-Z <br>Università degli Studi di Catania</p>
    </footer>
</body>
</html>
