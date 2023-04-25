<?php
require 'ver_session.php'; /*VERIFICAR SESSION*/
require 'clases/conexion.php';
require 'funciones/lib_funciones.php';

@session_start();
$accion = $_REQUEST['accion'];
// print_r($_REQUEST); return;

if(strcmp($accion,"1") == 0 || strcmp($accion,"2") == 0){ 
    $sql = "select sp_barrios(" . $accion . "," . (!empty($_REQUEST['id_barrio']) ? $_REQUEST['id_barrio'] : 0) . ",'" .
    (!empty($_REQUEST['nombre']) ? $_REQUEST['nombre'] : '') . "'," .
    (!empty($_REQUEST['id_ciudad']) ? $_REQUEST['id_ciudad'] :  1) . ") as resul";
}
else if (strcmp($accion,"3") == 0){
    $sql = "select sp_barrios(" . $accion . "," . $_REQUEST['id_barrio']. ") as resul";
}

// echo $sql;return;
$mensaje = consultas::get_datos($sql);

if (isset($mensaje)) {
        $mensaje = fn_separar_mensajebd($mensaje[0]["resul"]);
        $_SESSION['mensaje'] = $mensaje[0];
        header("location:" . $mensaje[1] . ".php");   
} else {
    $_SESSION['mensaje'] = "Error al procesar " . pg_last_error();
    header("location:" . "barrios_index.php");
}