<?php
    @session_start();
    require './clases/conexion.php';

    //echo "Usuario:".$_REQUEST['usuario'];
    //echo "   Clave:".$_REQUEST['clave'];

    $sql = "select * from v_usuarios where nick='" . $_REQUEST['usuario']
            . "' and clave = md5('".$_REQUEST['clave']."')";

    $resultado = consultas::get_datos($sql);

    // echo($sql); return;
    // print_r($resultado); return;

    if ($resultado[0]['id_usuario'] == null) {
        $_SESSION['#error'] = 'Usuario o contraseña incorrectos';
        header('location:index.php');
    }else{
        $_SESSION['id_usuario'] 	= $resultado[0]['id_usuario'];
        $_SESSION['nick'] 			= $resultado[0]['nick'];
		$_SESSION['foto']			= "";
        $_SESSION['id_empleado'] 	= $resultado[0]['id_empleado'];
        $_SESSION['nombre_empleado']= $resultado[0]['nombre_empleado'];
        $_SESSION['nombre_cargo']	= $resultado[0]['nombre_cargo'];
        $_SESSION['id_grupo']		= $resultado[0]['id_grupo'];
        $_SESSION['nombre_grupo']	= $resultado[0]['nombre_grupo'];
        $_SESSION['id_institucion']	= $resultado[0]['id_institucion'];
        $_SESSION['nombre_institucion']=$resultado[0]['nombre_institucion'];
         
		header('location:menu.php');
	}

?>
  <!--<?php require 'menu/js_lte.ctp'; ?>
        <script>
            $("#error").delay(4000).slideUp(200,function(){
                $(this).alert('close');
            })
        </script>-->