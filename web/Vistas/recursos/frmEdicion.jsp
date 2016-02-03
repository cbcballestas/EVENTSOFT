<%-- 
    Document   : frmEdicion
    Created on : 20/11/2015, 09:46:08 AM
    Author     : USUARIO1
--%>

<%@page import="modelo.Consultas"%>
<%@page import="modelo.Recurso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

        <%
            String user="";
            HttpSession sesionOk=request.getSession();
            if(sesionOk.getAttribute("usuario")==null){
        %>
        <jsp:forward page="../index.jsp">
            <jsp:param name="error" value="Debe iniciar sesi&oacute;n"/>
        </jsp:forward>
        <%
            }else{
          user=""+session.getAttribute("usuario");
          
          
           Consultas con=new Consultas();
           Recurso r= con.consultarRecurso(Integer.parseInt(request.getParameter("cod")));
          
            }
        %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>::Aplicativo web para la gesti&oacute;n de eventos:: Gesti&oacute;n de recursos</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../principal.jsp">EVENTSOFT</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                     <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;USTED HA SIDO IDENTIFICADO COMO:&nbsp;<%=user%> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Ajustes</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="../../cerrarsesion.jsp"><i class="fa fa-fw fa-sign-out"></i>Salir</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="../principal.jsp"> Principal</a>
                    </li>
                    <li>
                        <a href="Recurso.jsp"><i class="fa fa-cart-plus fa-lg"></i> Recursos</a>
                    </li>
                    <li>
                        <a href="../eventos/Evento.jsp"><i class="fa fa-fw fa-calendar-o"></i> Eventos</a>
                    </li>
                    <li>
                        <a href="../clientes/Cliente.jsp"><i class="fa fa-fw fa-users"></i>Clientes</a>
                    </li>
                    <li>
                        <a href="../empleados/Empleado.jsp"><i class="fa fa-fw fa-briefcase"></i> Empleados</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Gesti&oacute;n de Recursos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="../principal.jsp">Pagina principal</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-cart-plus"></i> Editar Recurso
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                 <form id="formulario_edicion">                       
        <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp; EDITAR RECURSO</h3>
      </div>
      <div align="left" class="panel-body" id="form">
          <%
             int cod=Integer.parseInt(request.getParameter("cod"));
          %>
          <label>Digite c&oacute;digo del recurso:&nbsp; *</label><input type="text" value="<%=cod%>" class="form-control"  name="id_cliente" autocomplete="off" required/>
          <label style="color: red;"><b>Obligatorio*</b></label>
          <span id="loader_editar"class=""></span>
          <br>
          <label>C&oacute;digo:</label>
          <input type="text" class="form-control" required disabled name="id_cliente" value="0001"/>
          <label>Nombre:</label>
          <input type="text" class="form-control" required disabled name="nombre_cliente" value="Silla"/>
          <label>Precio por uso:</label>
          <input type="text" class="form-control" required disabled name="apellidos_cliente" value="70000"/>
          <label>Estado:</label>
          <select name="estado_recurso" class="form-control" disabled required>
              <option selected="selected">Excelente</option>
              <option>Presenta problemas</option>
          </select><br>
          <label>Tipo:</label>
          <select name="tipo_recurso"class="form-control" disabled required>
              <option selected="selected">Propio</option>
              <option>Alquilado</option>
          </select><br>
          <label>Cantidad:</label>
          <input type="number" class="form-control"  required disabled name="ciudad_cliente" value="100"/>
          <label>Descripci&oacute;n</label>
          <textarea rows="10" cols="10" class="form-control" disabled>Silla versalles</textarea>
          <button type="button" class="btn btn-primary btn-sm" id="btn_editar"><span style="font-size: 10px" class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;EDITAR</button><br>
      </div>
      </div>
       </div>      
      </form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>