<?php
require 'ver_session.php'; /*VERIFICAR SESSION*/
require 'clases/conexion.php';
require 'funciones/lib_funciones.php';

@session_start();
$accion = $_REQUEST['accion'];
// print_r($_REQUEST); return;

if(strcmp($accion,"1") == 0 || strcmp($accion,"2") == 0){ 
    $sql = "select sp_periodos_lectivos(" . $accion . "," . (!empty($_REQUEST['id_periodo']) ? $_REQUEST['id_periodo'] : 0) . ",'" .
    (!empty($_REQUEST['ano']) ? $_REQUEST['ano'] : '') . "'," .
    (!empty($_REQUEST['vigente']) ? $_REQUEST['vigente'] :  1) . ") as resul";
}
else if (strcmp($accion,"3") == 0){
    $sql = "select sp_periodos_lectivos(" . $accion . "," . $_REQUEST['id_periodo']. ") as resul";
}

// echo $sql;return;
$mensaje = consultas::get_datos($sql);

if (isset($mensaje)) {
        $mensaje = fn_separar_mensajebd($mensaje[0]["resul"]);
        $_SESSION['mensaje'] = $mensaje[0];
        header("location:" . $mensaje[1] . ".php");   
} else {
    $_SESSION['mensaje'] = "Error al procesar " . pg_last_error();
    header("location:" . "periodos_lectivos_index.php");
}