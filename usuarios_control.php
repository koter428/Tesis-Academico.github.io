<?php
    require 'ver_session.php'; /*VERIFICAR SESSION*/
    require 'clases/conexion.php';
    require 'funciones/lib_funciones.php';

    @session_start();
    $accion = $_REQUEST['accion'];
    // print_r($_REQUEST); return;
        
    if(strcmp($accion,"1") == 0 || strcmp($accion,"2") == 0){
        $sql = "select sp_usuarios(" . $accion . "," . 
                (!empty($_REQUEST['id_usuario']) ? $_REQUEST['id_usuario'] : 0) . ",'" .
                (!empty($_REQUEST['nick']) ? strtoupper($_REQUEST['nick']) : "") . "','" .
                (!empty($_REQUEST['clave']) ? $_REQUEST['vusu_clave'] : 0) . "'," .
                (!empty($_REQUEST['id_empleado']) ? strtoupper($_REQUEST['id_empleado']) : "") . "," .
                (!empty($_REQUEST['id_grupo']) ? $_REQUEST['id_grupo'] : 0) . "," .
                (!empty($_REQUEST['id_institucion']) ?$_REQUEST['id_institucion'] : 1). ") as resul";
    }
    else if (strcmp($accion,"3") == 0){
        $sql = "select sp_usuarios(" . $accion . "," . $_REQUEST['id_usuario']. ") as resul";
    }
    
    //echo $sql;return; 
    $mensaje = consultas::get_datos($sql);

    if (isset($mensaje)) {
        $mensaje = fn_separar_mensajebd($mensaje[0]["resul"]);
        $_SESSION['mensaje'] = $mensaje[0];
        header("location:usuarios_index.php");
    } else {
        $_SESSION['mensaje'] = "Error al procesar " . pg_last_error();
        header("location:" . "usuarios_index.php");
    }

    