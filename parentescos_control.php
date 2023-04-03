<?php
require 'ver_session.php'; /*VERIFICAR SESSION*/
require 'clases/conexion.php';
require 'funciones/lib_funciones.php';

@session_start();

$accion = $_REQUEST['accion'];

if(strcmp($accion,"1") == 0 || strcmp($accion,"2") == 0){
    $sql = "select sp_parentescos(" . $accion . "," . 
    (!empty($_REQUEST['id_parentesco']) ? $_REQUEST['id_parentesco'] : 0) . ",'" .
    (!empty($_REQUEST['nombre']) ? $_REQUEST['nombre'] : "") . "') as resul";
}  
else if (strcmp($accion,"3") == 0){
    $sql = "select sp_parentescos(" . $accion . "," . $_REQUEST['id_parentesco'] . ") as resul";
}
//echo $sql; return;

$mensaje = consultas::get_datos($sql);

if (isset($mensaje)) {
    $mensaje = fn_separar_mensajebd($mensaje[0]["resul"]);
    $_SESSION['mensaje'] = $mensaje[0];
    header("location:" . $mensaje[1] . ".php");
} else {
    $_SESSION['mensaje'] = "Error al procesar " . pg_last_error();
    header("location:" . "parentescos_index.php");
}