<?php 
 @session_start();
if ($_SESSION['id_usuario']==null) {
    $_SESSION['error'] = "Porfavor Ingrese Su Usuario";
    header("location:http://localhost/escuela/");
    exit();
}
?>