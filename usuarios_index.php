<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" type="image/x-icon" href="/escuela/favicon.ico">
        <title>escuela</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

        <?php 
			@session_start();/*Reanudar sesion*/
			require 'ver_session.php'; /*VERIFICAR SESSION*/
			require 'menu/css_lte.ctp'; 
		?><!--ARCHIVOS CSS-->
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
										<?php /*usuarios_print.php*/ ?>
										<a href="" class="btn btn-default btn-sm" data-title ="Imprimir" rel="tooltip" data-placement="top" target="print">
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
                                <div class="box-body">           
                                    <div class="row">
                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                        <form action="usuarios_index.php" method="post" accept-charset="utf-8" class="form-horizontal">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="input-group custom-search-form">
                                                                <input type="search" class="form-control" name="buscar"
                                                                       placeholder="Ingrese valor a buscar..." autofocus=""/>
                                                                <span class="input-group-btn">
                                                                    <button type="submit" class="btn btn-primary btn-flat" data-title="Buscar" 
                                                                            rel="tooltip"><i class="fa fa-search"></i></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <?php 
												//consulta a la tabla usuarios
												$sql = "select * from vista_usuarios where nombre_empleado ilike '%".(isset($_REQUEST['buscar'])?$_REQUEST['buscar']:"") . "%' order by id_cargo";
												// echo $sql; return;
                                                $usuarios = consultas::get_datos($sql);
                                                if (!empty($usuarios)) { ?>
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-hover table-condensed">
                                                        <thead>
                                                            <tr>
                                                                <th>Nombre</th>
                                                                <th>Nick</th>
                                                                <th>Grupo</th>
                                                                <th>Escuela</th>
                                                                <th>Código</th>
                                                                <th class="text-center">Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php foreach ($usuarios as $usuario) { ?>
                                                            <tr>
                                                                <td data-title="Nombre"><?php echo $usuario['nombre_empleado']?></td>
                                                                <td data-title="Nick"><?php echo $usuario['nick']?></td>
                                                                <td data-title="Grupo"><?php echo $usuario['nombre_grupo']?></td>
                                                                <td data-title="Escuela"><?php echo $usuario['nombre_escuela']?></td>
                                                                <td data-title="Código"><?php echo $usuario['id_usuario']?></td>
                                                                <td data-title="Acciones" class="text-center">
                                                                <?php if ($_SESSION['USUARIOS']['editar']=='t') { ?>
																	<?php /*editar(echo "'".$usuario['id_usuario']."_".$usuario['id_funcionario']."_".$usuario['nick']."_".$usuario['id_grupo']."_".$usuario['id_escuela']."_".$usuario['clave']."_".$usuario['nombre_empleado']."_".$usuario['nombre_grupo'] . "'")*/?>
                                                                    <a onclick="" class="btn btn-warning btn-sm" role="button" data-title="Editar" 
                                                                       data-toggle="modal" data-target="#editar" rel="tooltip" data-placement="top">
                                                                        <span class="glyphicon glyphicon-edit"></span></a>
                                                                        <?php }?>
                                                                        <?php if ($_SESSION['USUARIOS']['borrar']=='t') { ?>
                                                                    <a onclick="borrar(<?php echo "'".$usuario['id_usuario']."_".$usuario['nick']."'"?>)" class="btn btn-danger btn-sm" role="button" data-title="Borrar" 
                                                                       rel="tooltip" data-placement="top" data-toggle='modal' data-target='#borrar'>
                                                                        <span class="glyphicon glyphicon-trash"></span></a>        
                                                                        <?php }?>                
                                                                </td>
                                                            </tr>
                                                            <?php } ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                               <?php }else{ ?>
                                            <div class="alert alert-info flat">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                                No se han registrado ...
                                            </div>  
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                  <?php require 'menu/footer_lte.ctp'; ?><!--PIE DE PAGINA-->  
                  <!-- FIN MODAL POR PAGINA-->  
                  <div class="modal fade" id="mymodal" role="dialog">
                      <div class="modal-dialog">
                          <div class="modal-content" id="detalles">
                              
                          </div>
                      </div>                      
                  </div>                  
                  <!-- FIN MODAL POR PAGINA--> 
                  <!-- MODAL PARA EDITAR-->
                  <div class="modal fade" id="editar" role="dialog">
                      <div class="modal-dialog">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <button class="close" data-dismiss="modal" aria-label="Close">
                                      <i class="fa fa-remove"></i></button>
                                      <h4 class="modal-title"><i class="fa fa-edit"></i> Editar Usuario</h4>
                                 </div>
                              <form action="usuarios_control.php" method="POST" accept-charset="utf-8" class="form-horizontal">
                                <input type="hidden" name="accion" id="accion" value="2">
                                <input type="hidden" name="id_usuario" id="id_usuario" value="0">
                                <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label col-lg-2 col-md-2 col-sm-2">Funcionario:</label>
                                    <div class="col-lg-8 col-md-8">
                                        <?php $funcionarios = consultas::get_datos("select * from funcionarios order by nombre");?>
                                        <select class="form-control select2" name="id_funcionario" id="id_funcionario" required="">
                                            <?php 
											if (!empty($funcionarios)) {                                                         
                                            foreach ($funcionarios as $funcionario) { ?>
                                            <option value="<?php echo $funcionario['id_funcionario']?>"><?php echo $funcionario['nombre']." ".$funcionario['apellido']?></option>
                                            <?php }                                                    
                                            }else{ ?>
                                            <option value="">No se encontraron funcionarios sin usuario</option>
                                            <?php }?>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2 col-md-2 col-sm-2">Alias/Nick:</label>
                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                        <input type="text" class="form-control" name="nick" id="nick" minlength="4"/>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2 col-md-2 col-sm-2">Grupo:</label>
                                <div class="col-lg-6 col-md-6">
                                        <?php $grupos = consultas::get_datos("select * from usuarios_grupos order by nombre");?>
                                        <select class="form-control select2" name="vgru_cod" id="vgru_cod" required="">
                                            <?php if (!empty($grupos)) {                                                         
                                            foreach ($grupos as $grupo) { ?>
                                            <option value="<?php echo $grupo['id_grupo']?>"><?php echo $grupo['nombre']?></option>
                                            <?php }                                                    
                                            }else{ ?>
                                            <option value="">Debe insertar al menos un grupo</option>
                                            <?php }?>
                                        </select> 
                                </div>
                            </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2 col-md-2 col-sm-2">Escuela:</label>
                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                        <input type="text" class="form-control" name="id_escuela" id="id_escuela" minlength="4"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2 col-md-2 col-sm-2">Contraseña:</label>
                                    <div class="col-lg-8 col-md-8">
                                        <input type="password" class="form-control" name="clave" id="clave" minlength="4"/>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="reset" data-dismiss="modal" class="btn btn-default pull-left"><i class="fa fa-remove"></i> Cerrar</button>
                                <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-floppy-o"></i> Editar</button>
                            </div>
                        </form>
                          </div>
                      </div>                      
                  </div>
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
            
            /*function editar(datos){
                var dat = datos.split("_");
                // alert(datos);
                $("#id_usuario").val(dat[0]);     // codigo
                // 1- empleado
                $("#nick").val(dat[2]);    // nick
                // 3 grupo 
                $("#id_escuela").val(dat[4]); // sucursal
                $("#clave").val(dat[5]);   //clave

                // combo empleado
                var empleado = document.getElementById("id_empleado");
                var posicionempleado = 0;
                for (i = 0; i < empleado.options.length; i++) {
                    if (empleado.options[i].innerText = dat[6]) {
                        posicionempleado = i;
                        break;
                    }
                }
                empleado.selectedIndex = posicionempleado;

                // combo grupos
                var grupos = document.getElementById("id_grupo");
                var posicionGrupo = 0;
                for (i = 0; i < grupos.options.length; i++) {
                    if (grupos.options[i].innerText = dat[7]) {
                        posicionGrupo = i;
                        break;
                    }
                }
                document.getElementById("id_grupo").selectedIndex = posicionGrupo;
            };*/
            
            function borrar(datos){
                var dat = datos.split("_");
                $('#si').attr('href','usuarios_control.php?id_usuario='+dat[0]+'&nick='+dat[1]+'&accion=3');
                $('#confirmacion').html('<span class="glyphicon glyphicon-question-sign"></span> \
                Desea borrar al usuario <i><strong>'+dat[1]+'</strong></i>?');
            }
        </script>        
    </body>
</html>


