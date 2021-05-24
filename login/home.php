<?php
    require_once 'auth.php';
    if (!checkAuth()){
        header('Location: login.php');
        exit;
    }
    
?>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/mhw3.css">
    <script src="../script/fetch_dati_utente.js" defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <title>Home</title>
</head>
    <body>
        <header>
            <nav>       
            <a href="../mhw1.php" id="home">
                <div id="titolo">
                    Auto&Moto
                </div>
            </a>
                <div id="menu">
                    <a href="../mhw1.php">Concessionari</a>
                    <a href="../mhw3.0.php">Galleria</a>
                    <a href="../mhw3.1.php">VIN decode</a>
                    <a href="logout.php">Logout</a>
                    <a href="#footer">Contatti</a>
                </div>
            </nav>
            <h1>Benvenuto <?php echo $_SESSION["username"]?></h1>
        </header>
        <article id="article1">
            <section id="button">
                <div class="pulsanti" id="pulsante1"><p>Storico acquisti</p></div>
                <div class="pulsanti" id="pulsante2"><p>Compra veicolo</p></div>
                <div class="pulsanti" id="pulsante3"><p>Richiedi sconto</p></div>
            </section>    
        </article>
        <article id="sezione" class="hidden">
          
        </article>
        <footer id="footer">
            <h2>Sito realizzato da</h2>
            <p>Riccardo Patronaggio<br>O46002300<br>Ing.Informatica M-Z<br>Università degli Studi di Catania</p>
        </footer>
    </body>
</html>