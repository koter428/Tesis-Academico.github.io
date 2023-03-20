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
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="fa fa-plus"></i>
                                    <h3 class="box-title">Agregar Ajustes</h3>
                                    <div class="box-tools">
                                        <a href="ajustes_index.php" class="btn btn-primary btn-sm" data-title="Volver" rel="tooltip">
                                            <i class="fa fa-arrow-left"></i> VOLVER
                                        </a>
                                    </div>
                                </div> 
                                <form action="ajustes_control.php" method="post" accept-charset="utf-8" class="form-horizontal">
                                    <input type="hidden" name="accion" value="1">
                                    <input type="hidden" name="vaju_cod" value="0">
                                    <div class="box-body">
                                        <div class="form-group">                                            
                                        <?php $fecha = consultas::get_datos("select current_date as fecha");?>
                                            <label class="control-label col-lg-2 col-md-2 col-sm-2"> Fecha:</label>
                                            <div class="col-lg-4 col-md-4 col-sm-5"> 
                                                <input type="date" name="vaju_fecha" class="form-control" readonly="" value="<?php echo $fecha[0]['fecha'];?>"/>
                                            </div>
                                            <label class="control-label col-lg-2 col-md-2">Empleado:</label>
                                            <div class="col-lg-4 col-md-4 col-sm-5">
                                            <input type="text" class="form-control" value="<?php echo $_SESSION['nombres'];?>" readonly=""/>
                                            </div>                                            
                                        </div>     
                                        <div class="form-group">                                            
                                            <label class="control-label col-lg-2">Observacion</label>
                                            <div class="col-lg-4">
                                                <textarea class="form-control" name="vaju_obser" placeholder="Ingrese la Observacion correspondiente..."></textarea>
                                            </div>
                                            <label class="control-label col-lg-2 col-md-2">Sucursal:</label>
                                            <div class="col-lg-4 col-md-4 col-sm-5">
                                                <input type="text" class="form-control" value="<?php echo $_SESSION['sucursal'];?>" readonly=""/>
                                            </div>                                            
                                        </div>                                           
                                    </div>
                                            <div class="box-footer">
                                                <button type="reset" class="btn btn-default" data-title="Cancelar" rel="tooltip"> 
                                                <i class="fa fa-remove"></i> Cancelar</button>                                        
                                                <button type="submit" class="btn btn-primary pull-right" data-title="Guardar" rel="tooltip"> 
                                                <i class="fa fa-floppy-o"></i> Registrar</button>
                                    </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                  <?php require 'menu/footer_lte.ctp'; ?><!--ARCHIVOS JS-->  
            </div>                  
        <?php require 'menu/js_lte.ctp'; ?><!--ARCHIVOS JS-->
        <script>
            function tipocompra(){
//                alert($("#tipo_compra").val())
                  if ($('#tipo_compra').val()==='CONTADO') {
                      $('.tipo').hide();
                       $("#cuotas").val(1);
                      $("#cuotas").prop('readonly',true);
                      $("#intervalo").val(0);                      
                      $("#intervalo").prop('readonly',true);                                              
                  }else{
                      $('.tipo').show();
                      $("#cuotas").prop('readonly',false);
                      $("#intervalo").prop('readonly',false);  
                  }
            };
            /*FUNCION PARA OBTENER LOS PEDIDOS 
             * DEL PROVEEDOR SELECCIONADO */
            
            function pedidos(){
                $.ajax({
                   type     : "GET",
                   url      : "/escuela/compras_pedidos.php?vprv_cod="+$('#proveedor').val(),
                   cache    : false,
                beforeSend:function(){
                   $("#det_pedidos").html('<img src="img/loader.gif"/ width="60" height="40"><strong>&nbsp;&nbsp;Cargando...</strong>')
                },
                success:function(data){
                    $("#det_pedidos").html(data)
                }                   
                });
            }
        </script>
    </body>
</html>


