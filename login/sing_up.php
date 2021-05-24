<?php
    require_once 'auth.php';
    if (checkAuth()) {
        header('Location: home.php');
        exit;
    }
    if(isset($_POST["nome"]) && isset($_POST["cognome"]) && isset($_POST["CF"]) &&
        isset($_POST["username"]) && isset($_POST["password"]))
    {
        $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) or die("errore:" .mysqli_connect_error());

        $username = mysqli_real_escape_string($con, $_POST['username']);
        $password = mysqli_real_escape_string($con, $_POST['password']);
        $nome = mysqli_real_escape_string($con, $_POST['nome']);
        $cognome = mysqli_real_escape_string($con, $_POST['cognome']);
        $CF = mysqli_real_escape_string($con, $_POST['CF']);
        $compleanno = mysqli_real_escape_string($con, $_POST['compleanno']);

        
        /**
         * !CONTROLLO PASSWORD
         */
        $pattern = '/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[_.\-()?#;:!@])[0-9A-Za-z_.\-()?#;:!@]{8,20}$/';
        if(!preg_match($pattern, $password)) {
           $errore[]="La password non rispetta i requisiti! <br>";
        }
        $password=password_hash($password,PASSWORD_BCRYPT);
        /**
         * !COCNTROLLO USERNAME
         */
        $query="SELECT username FROM dati_login WHERE username='$username'";
        $res=mysqli_query($con,$query) or  die("errore:".mysqli_error($con));
        if(mysqli_num_rows($res)>0)
        {
            $errore[]="Username già in uso <br>";
        }
        /**
         * !CONTROLLO CF
         */
        $query1="SELECT * FROM cliente where CF='$CF'";
        $query2="SELECT * FROM dati_login WHERE CF='$CF'";
        $res=mysqli_query($con,$query1) or  die("errore:".mysqli_error($con));
        $res2=mysqli_query($con,$query2) or  die("errore:".mysqli_error($con));
        if(mysqli_num_rows($res)>0 && mysqli_num_rows($res2)>0)
        {
           $errore[]="Codice fiscale già in uso <br>";
        }else if(mysqli_num_rows($res)==0 && mysqli_num_rows($res2)==0){
            $comple=new DateTime($compleanno);
            $data_oggi=new DateTime(date("Y-m-d"));
            $diff=$data_oggi->diff($comple);
            $eta=$diff->y;

            $query="INSERT INTO CLIENTE VALUES('$CF','$nome','$cognome','$eta','$compleanno')";
            mysqli_query($con,$query) or  die("errore:".mysqli_error($con));
        }
        /**
         * ?SE TUTTO OK, INSERISCE NEL DATABASE
         */
        if(count($errore)==0){
            
            $query="INSERT INTO dati_login(username,password,nome,cognome,CF) VALUE ('$username','$password','$nome','$cognome','$CF')";
            if($res1=mysqli_query($con,$query)){
                $_SESSION["username"]=$_POST["username"];
                $_SESSION["id_session"] = mysqli_insert_id($con);
                mysqli_close($conn);
                header("Location: login.php");
                exit;
            }
        }
    }
?>

<html lang="it">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../style/login.css">
        <script src="../script/sing_up.js" defer></script>
        <title>Login</title>
    </head>
    <body>
        <a href="../index.php" id="home">
            <div id="titolo">
                Auto&Moto
            </div>
        </a>
        <section class="sec-box">
            <div class="hidden"  id="req-box">
                <ul>
                La password deve avare:
                    <li>Min 8 max 20 caratteri</li>
                    <li>Almeno una lettera maiusciola e una minuscola</li>
                    <li>Almeno un numero</li>
                    <li>Almeno un simbolo tra _.\-()?#;:!@</li>
                </ul>
            </div>
            <div class="singup-box">
                <h1>Registrazione</h1>
                <form action="sing_up.php" name="form_login" method="POST">
                    <div class="txt_field" id="idNome">
                        <input type="text" placeholder="Nome" id="nome" name="nome" required>
                        <span></span>
                        <span class="errore">Nome non valido</span>
                    </div>
                    <div class="txt_field" id="idCognome">
                        <input type="text" placeholder="Cognome" id="cognome" name="cognome" required>
                        <span></span>
                        <span class="errore">Cognome non valido</span>
                    </div>
                    <div class="txt_field" id="idCompleanno">
                        <input type="text" placeholder="Data di nascita(yyyy-mm-dd)" id="compleanno" name="compleanno" required>
                        <span></span>
                        <span class="errore">Data non valida</span>
                    </div>
                    <div class="txt_field" id="idCF">
                        <input type="text" placeholder="Code fiscale" id="CF" name="CF" required>
                        <span></span>
                        <span class="errore">Codice fiscale non valido,7 caratteri MAX</span>
                    </div>
                    <div class="txt_field" id="idUsername">
                        <input type="text" placeholder="Username" id="username" name="username" required>
                        <span></span>
                        <span class="errore">Username non valido</span>
                    </div>
                    <div class="txt_field" id="idPassword">
                        <input type="password" placeholder="Password" id="password" name="password" required>
                        <span></span>
                        <span class="errore">Password non valida</span>
                    </div>
                    <div class="show-pass">
                        <input type="checkbox" id="mostra_pass">
                        <label id="showtext">Mostra password</label> <br>
                        <a id="info">Info password</a>
                    </div>             
                    <input type="submit" value="Registrati" id="sub" name="registrati" disabled>
                    <div class="sing_up">
                    Hai già un account? <a href="login.php">Login</a>
                    </div>
                </form>
            </div>
        </section>
    </body>
</html>
