<?php
require 'ver_session.php'; /*VERIFICAR SESSION*/
require 'clases/conexion.php';
require 'funciones/lib_funciones.php';

@session_start();

$accion = $_REQUEST['accion'];

if(strcmp($accion,"1") == 0 || strcmp($accion,"2") == 0){ 
    $sql = "select sp_paginas(" . $accion . "," . 
    (!empty($_REQUEST['d_pagina']) ? $_REQUEST['id_pagina'] : 0) . ",'" .
    (!empty($_REQUEST['direccion']) ? strtolower($_REQUEST['direccion']) : 0) . "','" .
    (!empty($_REQUEST['nombre']) ? strtoupper($_REQUEST['nombre']) : '') . "','" .
    (!empty($_REQUEST['id_modulo']) ? $_REQUEST['id_modulo'] : 0) . "') as resul";
}
else if (strcmp($accion,"3") == 0){
    $sql = "select sp_paginas(" . $accion . "," . $_REQUEST['d_pagina'].  ") as resul";
}

// echo $sql;return;

$mensaje = consultas::get_datos($sql);

if (isset($mensaje)) {
        $mensaje = fn_separar_mensajebd($mensaje[0]["resul"]);
        $_SESSION['mensaje'] = $mensaje[0];
        header("location:" . $mensaje[1] . ".php");   
} else {
    $_SESSION['mensaje'] = "Error al procesar " . pg_last_error();
    header("location:" . "paginas_index.php");
}