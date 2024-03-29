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
                                    <h3 class="box-title">Editar Compra</h3>
                                    <div class="box-tools">
                                        <a href="compras_index.php" class="btn btn-primary btn-sm" data-title="Volver" rel="tooltip">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                    </div>
                                </div> 
                                <form action="compras_control.php" method="post" accept-charset="utf-8" class="form-horizontal">
                                    <?php $compras = consultas::get_datos("select * from v_compras where com_cod =".$_REQUEST['vcom_cod']);?>
                                    <div class="box-body">
                                        <input type="hidden" name="accion" value="2"/>
                                        <input type="hidden" name="vcom_cod" value="<?php echo $compras[0]['com_cod'];?>"/>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-xs-12">
                                                <label>Fecha:</label>
                                                <input type="text" name="vcom_fecha" class="form-control" value="<?php echo $compras[0]['com_fecha'];?>" readonly=""/>                                                
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-xs-12">
                                                <label>Proveedor:</label>
                                                    <div class="input-group">
                                                        <?php 
                                                            $sql = "select prv_cod, prv_ruc, prv_razonsocial as nombres from proveedor order by prv_cod=".$compras[0]['prv_cod']." desc";
                                                            // echo $sql; return;
                                                            $proveedores = consultas::get_datos($sql);
                                                        ?>
                                                        <select class="form-control select2" name="vprv_cod" required="">
                                                            <?php foreach ($proveedores as $proveedor) { ?>
                                                              <option value="<?php echo $proveedor['prv_cod'];?>"><?php echo "(" . $proveedor['prv_ruc'] . ") ".$proveedor['nombres'];?></option>   
                                                            <?php }?>
                                                        </select>  
                                                        <span class="input-group-btn btn-flat">
                                                            <a class="btn btn-primary" data-title ="Agregar Proveedor " rel="tooltip" data-placement="top"
                                                               data-toggle="modal" data-target="#registrar">
                                                                <i class="fa fa-plus"></i>
                                                            </a>
                                                        </span>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-xs-12">
                                                <label>Sucursal:</label>
                                                <input type="text" class="form-control" value="<?php echo $compras[0]['suc_descri'];?>" readonly=""/>                                                
                                            </div>      
                                            <div class="col-lg-6 col-md-6 col-xs-12">
                                                <label>empleado:</label>
                                                <input type="text" class="form-control" value="<?php echo $compras[0]['empleado'];?>" readonly=""/>                                                
                                            </div>                                                  
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="reset" class="btn btn-default" data-title="Cancelar" rel="tooltip"> 
                                            <i class="fa fa-remove"></i> Cancelar</button>                                        
                                        <button type="submit" class="btn btn-warning pull-right" data-title="Guardar" rel="tooltip"> 
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
         <!-- MODAL REGISTRAR -->
                  <div class="modal fade" id="registrar" role="dialog">
                      <div class="modal-dialog">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" arial-label="Close">x</button>
                                  <h4 class="modal-title"><i class="fa fa-plus"></i> <strong>Registrar Articulo</strong></h4>
                              </div>
                               <form action="compras_control" method="post" accept-charset="utf-8" class="form-horizontal">
                                    <div class="box-body">
                                             <input type="hidden" name="accion" value="1"/>
                                            <input type="hidden" name="vprv_cod" value="0"/>                                             
                                            <label class="control-label col-lg-2 col-md-2 col-sm-2"> Ruc:</label>
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <input type="text" name="vprv_ruc" class="form-control" required="" autofocus=""/>
                                            </div>               
                                        </div>
                                        <div class="form-group">

                                            <label class="control-label col-lg-2 col-md-2 col-sm-2"> Razon Social:</label>
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <input type="text" name="vprv_razonsocial" class="form-control" required="" autofocus=""/>
                                            </div>               
                                        </div> <div class="form-group">

                                            <label class="control-label col-lg-2 col-md-2 col-sm-2"> Direccion:</label>
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <input type="text" name="vprv_direccion" class="form-control" required="" autofocus=""/>
                                            </div>               
                                        </div>
                                        <div class="form-group">

                                            <label class="control-label col-lg-2 col-md-2 col-sm-2"> Telefono:</label>
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <input type="text" name="vprv_telefono" class="form-control" required="" autofocus=""/>
                                            </div>               
                                        </div>
                                  <div class="modal-footer">
                                      <button type="reset" data-dismiss="modal" class="btn btn-default pull-left">
                                          <i class="fa fa-remove"></i> Cerrar</button>
                                          <button type="submit" class="btn btn-primary pull-right">
                                          <i class="fa fa-floppy-o"></i> Editar</button>                                          
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
                  <!-- FIN MODAL REGISTRAR -->
        <?php require 'menu/js_lte.ctp'; ?><!--ARCHIVOS JS-->
    </body>
</html>