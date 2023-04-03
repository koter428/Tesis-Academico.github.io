<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" type="image/x-icon" href="/escuela/favicon.ico">
        <title>escuela</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

        <?php 
        require 'ver_session.php'; /*VERIFICAR SESSION*/
        @session_start();/*Reanudar sesion*/
        require 'menu/css_lte.ctp'; ?><!--ARCHIVOS CSS-->

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <?php require 'menu/header_lte.ctp'; ?><!--CABECERA PRINCIPAL-->
            <?php require 'menu/toolbar_lte.ctp';?><!--MENU PRINCIPAL-->
            <div class="content-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="box box-warning">
                                <div class="box-header">
                                    <i class="fa fa-edit"></i>
                                    <h3 class="box-title">Editar empleado</h3>
                                    <div class="box-tools">
                                        <a href="empleado_index.php" class="btn btn-primary btn-sm" data-title="Volver">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                    </div>
                                </div> 
                                <form action="empleado_control.php" method="post" accept-charset="utf-8" class="form-horizontal">
                                    <div class="box-body">
                                        <?php $resultado = consultas::get_datos("select * from empleado where id_empleado=".$_GET['vid_empleado']);?>
                                        <div class="form-group">
                                            <input type="hidden" name="accion" value="2"/>
                                            <input type="hidden" name="vid_empleado" value="<?php echo $resultado[0]['id_empleado']?>"/>
                                           <!-- AGREGAR LISTA DESPLEGABLE CARGO -->
                                          <div class="form-group">
                                            <label class="control-label col-lg-2">Cargo:</label>
                                            <div class="col-lg-6">
                                              <div class="input-group">
                                                   <?php
                                                    $sql = "select * from cargo order by car_cod = " . $resultado[0]["car_cod"];
                                                    $cargo = consultas::get_datos($sql);
                                                    ?>
                                                    <select class="form-control select2" name="vcar_cod" required="">
                                                        <option value="">Seleccione un cargo</option>
                                                        <?php foreach ($cargo as $car) { ?>
                                                          <option value="<?php echo $car['car_cod'];?>" selected><?php echo $car['car_descri'];?></option>   
                                                        <?php }?>
                                                    </select>  
                                                    <span class="input-group-btn btn-flat">
                                                        <a class="btn btn-primary" data-title ="Agregar Cargo " rel="tooltip" data-placement="top"
                                                           data-toggle="modal" data-target="#registrar">
                                                            <i class="fa fa-plus"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                        </div>
                                    </div>
                                    <!-- FIN LISTA DESPLEGABLE CARGO -->
                                              <div class="form-group">
                                           <label class="col-lg-2 control-label">Nombres:</label>
                                         <div class="col-lg-6">
                                           <input type="text" name="vnombre_empleado" class="form-control" required=""  
                                                       value="<?php echo $resultado[0]['nombre_empleado']?>"/>
                                            </div>
                                         </div>
                                        <div class="form-group">
                                           <label class="col-lg-2 control-label">Apellidos:</label>
                                         <div class="col-lg-6">
                                           <input type="text" name="vnombre_empleado" class="form-control" required=""  
                                                       value="<?php echo $resultado[0]['nombre_empleado']?>"/>
                                            </div>
                                         </div>
                                             <div class="form-group">
                                           <label class="col-lg-2 control-label">Teléfono:</label>
                                         <div class="col-lg-6">
                                           <input type="text" name="vemp_tel" class="form-control" required=""  
                                                       value="<?php echo $resultado[0]['emp_tel']?>"/>
                                            </div>
                                         </div>
                                             <div class="form-group">
                                           <label class="col-lg-2 control-label">Dirección:</label>
                                         <div class="col-lg-6">
                                           <input type="text" name="vemp_direcc" class="form-control" required=""  
                                                       value="<?php echo $resultado[0]['emp_direcc']?>"/>
                                            </div>
                                         </div>
                                        </div>
                                        
                                    </div>
                                    <div class="box-footer">
                                        <button type="reset" class="btn btn-default" data-title="Cancelar" > 
                                            <i class="fa fa-remove"></i> Cancelar</button>                                        
                                        <button type="submit" class="btn btn-warning pull-right" data-title="Guardar" > 
                                            <i class="fa fa-edit"></i> Actualizar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                  <?php require 'menu/footer_lte.ctp'; ?><!--ARCHIVOS JS-->  
            </div>                  
             <!-- MODAL REGISTRAR CARGO -->
             <div class="modal fade" id="registrar" role="dialog">
                      <div class="modal-dialog">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" arial-label="Close">x</button>
                                  <h4 class="modal-title"><i class="fa fa-plus"></i> <strong>Registrar Cargo</strong></h4>
                              </div>
                              <form action="cargo_control.php" method="post" accept-charset="utf-8" class="form-horizontal">
                                  <input type="hidden" name="accion" value="5">
                                  <input type="hidden" name="vcar_cod" value="0">
                                  <div class="modal-body">
                                      <div class="form-group">
                                          <label class="control-label col-sm-3">Agregar una Cargo:</label>
                                          <div class="col-sm-9">
                                              <input type="text" name="vcar_descri" class="form-control" required="" autofocus=""/>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="reset" data-dismiss="modal" class="btn btn-default pull-left">
                                          <i class="fa fa-remove"></i> Cerrar</button>
                                          <button type="submit" class="btn btn-primary pull-right">
                                          <i class="fa fa-floppy-o"></i> Registrar</button>                                          
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
                  <!-- FIN MODAL REGISTRAR CARGO -->
        <?php require 'menu/js_lte.ctp'; ?><!--ARCHIVOS JS-->
    </body>
</html>
