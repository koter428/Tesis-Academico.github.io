<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" type="image/x-icon" href="/escuela/favicon.ico">
        <title>escuela</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        echo $sql;return; 
        <?php 
        @session_start();/*Reanudar sesion*/
        require 'ver_session.php'; /*VERIFICAR SESSION*/
        require 'menu/css_lte.ctp'; ?><!--ARCHIVOS CSS-->

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <?php require 'menu/header_lte.ctp'; ?><!--CABECERA PRINCIPAL-->
            <?php require 'menu/toolbar_lte.ctp';?><!--MENU PRINCIPAL-->
            <div class="content-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <?php if (!empty($_SESSION['mensaje'])) { ?>
                            <div class="alert alert-danger" id="mensaje">
                                <span class="glyphicon glyphicon-info-sign"></span>
                                <?php echo $_SESSION['mensaje'];
                                    $_SESSION['mensaje'] = '';
                                ?>
                            </div>
                            <?php } ?> 
                            <div class="box box-primary">
                            <?php if ($_SESSION['USUARIOS']['leer']==='t') { ?>
                                <div class="box-header">
                                    <i class="fa fa-clipboard"></i>
                                    <h3 class="box-title">Usuarios</h3>
                                    <div class="box-tools">
                                        <a href="usuarios_print.php" class="btn btn-default btn-sm" data-title ="Imprimir" rel="tooltip" data-placement="top" target="print">
                                            <i class="fa fa-print"></i>
                                        </a>
                                        <?php if ($_SESSION['USUARIOS']['insertar']==='t') { ?> 
                                        <a onclick="add()" class="btn btn-primary btn-sm" data-title = "Agregar" rel="tooltip" 
                                           data-placement="top" data-toggle="modal" data-target="#mymodal"> 
                                            <i class="fa fa-plus"></i></a>   
                                            <?php } ?>                                      
                                    </div>
                                </div>
                                <!-- AQUI VA EL CONTENIDO DE LA TABLA-->
                                
                  <!-- FIN MODAL PARA BORRAR-->                   
            </div>      
            <?php }else{ ?>
                             <div>
                                 <div class="box-body">
                                     <div class="alert alert-info flat">
                                    <span class="glyphicon glyphicon-info-sign"></span>
                                   No posee permisos de lectura 
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
        <?php require 'menu/js_lte.ctp'; ?><!--ARCHIVOS JS-->
        <script>
            $('#mensaje').delay(4000).slideUp(200,function(){
               $(this).alert('close'); 
            });            
        </script>
        <script>
            $('.modal').on('shown.bs.modal',function(){
               $(this).find('input:text:visible:first').focus(); 
            });
        </script>    
        <script>
            function add(){
                $.ajax({
                    type    : "GET",
                    url     : "/escuela/usuarios_add.php",
                    cache   : false,
                    beforeSend:function(){
                        $("#detalles").html('<strong>Cargando...</strong>')
                    },
                    success:function(data){
                        $("#detalles").html(data)
                    }
                })
            };            
            
            function editar(datos){
                var dat = datos.split("_");
                // alert(datos);
                $("#vusu_cod").val(dat[0]);     // codigo
                // 1- empleado
                $("#vusu_nick").val(dat[2]);    // nick
                // 3 grupo 
                $("#vid_sucursal").val(dat[4]); // sucursal
                $("#vusu_clave").val(dat[5]);   //clave

                // combo empleados
                var empleados = document.getElementById("vemp_cod");
                var posicionEmpleado = 0;
                for (i = 0; i < empleados.options.length; i++) {
                    if (empleados.options[i].innerText = dat[6]) {
                        posicionEmpleado = i;
                        break;
                    }
                }
                empleados.selectedIndex = posicionEmpleado;

                // combo grupos
                var grupos = document.getElementById("vgru_cod");
                var posicionGrupo = 0;
                for (i = 0; i < grupos.options.length; i++) {
                    if (grupos.options[i].innerText = dat[7]) {
                        posicionGrupo = i;
                        break;
                    }
                }
                document.getElementById("vgru_cod").selectedIndex = posicionGrupo;
            };
            
            function borrar(datos){
                var dat = datos.split("_");
                $('#si').attr('href','usuarios_control.php?vusu_cod='+dat[0]+'&vusu_nick='+dat[1]+'&accion=3');
                $('#confirmacion').html('<span class="glyphicon glyphicon-question-sign"></span> \
                Desea borrar al usuario <i><strong>'+dat[1]+'</strong></i>?');
            }
        </script>        
    </body>
</html>


