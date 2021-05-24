<?php
    include 'auth.php';
    if (checkAuth()) {
        header('Location: home.php');
        exit;
    }
    if(isset($_POST["username"]) && isset($_POST["password"]))
    {
        $con=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name']) or die("errore:" .mysqli_connect_error());
        $username = mysqli_real_escape_string($con, $_POST['username']);
        $password = mysqli_real_escape_string($con, $_POST['password']);
        $query="SELECT * FROM dati_login";
        $res=mysqli_query($con,$query) or  die("errore:".mysqli_error());
        while($row=mysqli_fetch_assoc($res)){
            if($username==$row["username"] && password_verify($password,$row["password"])==1)
            {
                $_SESSION["username"]=$row["username"];
                $_SESSION["id_session"]=$row["id_session"];
                header("Location: home.php");
                mysqli_free_result($res);
                mysqli_close($conn);
                exit;
            }
            else {
                $errore=true;
            }
        }
    }
?>

<html lang="it">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../style/login.css">
    <script src="../script/login.js" defer></script>
    <title>Login</title>
</head>
<body>
    <a href="../index.php" id="home">
        <div id="titolo">
            Auto&Moto
        </div>
    </a>
    <section class="sec-box">
        <div class="login-box">
            <h1>Login</h1>
            <?php
                if(isset($errore) && $errore==true){
                    echo "Credenziali non valide";
                }
            ?>
            <form action="login.php" name="form_login" method="POST">
                <div class="txt_field" id="idUsername">
                    <input type="text" placeholder="Username" id="username" name="username" required>
                    <span></span>
                    <span class="errore"></span>
                </div>
                <div class="txt_field" id="idPassword">
                    <input type="password" placeholder="Password" id="password" name="password" required>
                    <span></span>
                    <span class="errore"></span>
                </div>
                <div class="show-pass">
                    <input type="checkbox" id="mostra_pass">
                    <label id="showtext">Mostra password</label>
                </div>             
                <input type="submit" value="Login" id="sub" name="login">
                <div class="sing_up">
                    Non sei registrato? <a href="sing_up.php">Registrati</a>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
