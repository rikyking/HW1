<?php
    require_once 'datiDB.php';
    session_start();

    function checkAuth() {
        if(isset($_SESSION['id_session'])) {
            return $_SESSION['id_session'];
        } else {
            return 0;
        }
    }
?>