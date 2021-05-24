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
    <script src="script/apiIMG.js" defer></script>
    <title>MHW3-O46002300</title>
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
                echo "Area personale"?></a>
                <a href="#footer">Contatti</a>
            </div>
        </nav>
        <h1>Photo Gallery</h1>
        <h3>Powerd by Unsplash</h3>
    </header>
    <article id="article1">
        <h1>Cerca immagini di auto e moto su Unsplash</h1>
            <form>
                <img src="images/unsplash.png">
                <div class="ricerca">
                    <img src="images/reload.ico" id="reload">
                    <input type="text" placeholder="cerca" id="inputID">
                    <select name="serch_content" id="tipo">
                        <option value="auto">auto</option>
                        <option value="moto">moto</option>
                    </select>
                    <input type="text" placeholder="page" size="1" id="page">
                    <input type="submit" value="cerca" id="submit">
                </div>
            </form>
    </article>
    <article id="contenuti">

    </article>
    <section id="modal-view" class="hidden">
    </section>
    <footer id="footer">
        <h2>Sito realizzato da</h2>
        <p>Riccardo Patronaggio<br>O46002300<br>Ing.Informatica M-Z <br>Università degli Studi di Catania</p>
    </footer>
</body>
</html>