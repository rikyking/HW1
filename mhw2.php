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
    <link rel="stylesheet" href="style/mhw2.css">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital@0;1&display=swap" rel="stylesheet">
    
    <script src="script/script.js" defer></script>
    
    <title>MHW2-O46002300</title>
</head>
<body> 
    <header>
        <nav>       
            <a href="mhw1.php" id="home">
                <div id="titolo">
                    Auto&Moto
                </div>
            </a>
            <div id="menu">
                <a href="mhw1.php">Concessionari</a>
                <a href="mhw3.0.php">Galleria</a>
                <a href="mhw3.1.php">VIN decode</a>
                <a href="login/login.php">
                    <?php 
                    if(isset($var) && $var==true){
                        echo $_SESSION["username"];
                    }else 
                        echo "Area personale"?>
                </a>
                <a href="#footer">Contatti</a>
            </div>
            <input type="hidden" id="isLog" value="<?php 
                if(isset($var) && $var==true){
                    echo $var;
                }?>"
            >
            <input type="hidden" id="session" value="<?php
                if(isset($var) && $var==true){
                    echo $_SESSION['id_session'];
                }?>"
            >
        </nav>
        <img id="logo">
        <h1><?php if(isset($_GET['nome'])) echo $_GET['nome'];?></h1>
    </header>
    
    <article>   
        <div class="hidden" id="testoPref">
            <h1>Preferiti</h1>
        </div>
        <section class="hidden" id="preferiti"> 
            <!--Si riempie in automatico con JavaScript-->
        </section>
        <div id="titolo-box">
            <h1>Ricerca le auto e moto disponibili</h1>
            <p>Ricerca auto e moto, e aggiungi i tuoi veicoli ai preferiti. Per acquistare un veicolo vai all'area personale</p>
        </div>
        <div class="ricerca">
            <input type="text" placeholder="Cerca" id="box-ricerca">
        </div>
        <section class="griglia" id="id-griglia">
            <!--Si riempie in automatico con JavaScript-->
        </section>
    </article>
    <footer id="footer">
        <h2>Sito realizzato da</h2>
        <p>Riccardo Patronaggio<br>O46002300<br>Ing.Informatica M-Z <br>Università degli Studi di Catania</p>
    </footer>
</body>
</html>