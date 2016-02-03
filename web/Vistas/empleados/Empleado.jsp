<%-- 
    Document   : registroCliente
    Created on : 21/09/2015, 06:51:41 PM
    Author     : COMPUTER
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Cargo"%>
<%@page import="DAO.CargoDAO"%>
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
                        <a href="../recursos/Recurso.jsp"><i class="fa fa-cart-plus fa-lg"></i> Recursos</a>
                    </li>
                    <li>
                        <a href="../eventos/Evento.jsp"><i class="fa fa-fw fa-calendar-o"></i> Eventos</a>
                    </li>
                    <li>
                        <a href="../clientes/Cliente.jsp"><i class="fa fa-fw fa-users"></i>Clientes</a>
                    </li>
                    <li>
                        <a href="Empleado.jsp"><i class="fa fa-fw fa-briefcase"></i> Empleados</a>
                    </li>
                    <li>
                        <a href="../cargos/Cargos.jsp"><i class="fa fa-fw fa-male"></i> Cargo</a>
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
                            Gesti&oacute;n de Empleados
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="../principal.jsp">Pagina principal</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-briefcase"></i> Empleados
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
            <%
            if(request.getParameter("respuesta")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"+" "+request.getParameter("respuesta")+"</div></div>");
            }
            if(request.getParameter("respuesta_error")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"+" "+request.getParameter("respuesta_eliminacion")+"</div></div>");
            }
        %>
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <span style="font-size: 30px" class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>&nbsp;  
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">            
          Registrar
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
          <form id="formulario" action="registro_Empleado.jsp">
          <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;REGISTRO DE EMPLEADOS</h3>
      </div>
      <div align="left" class="panel-body">
          <label>Identificaci&oacute;n:</label>
          <input type="text" class="form-control"  required name="id_empleado" autofocus="autofocus"/>
          <label>Nombre:</label>
          <input type="text" class="form-control" required name="nombre_empleado"/>
          <label>Apellidos:</label>
          <input type="text" class="form-control" required name="apellidos_empleado" />
          <label>Celular:</label>
          <input type="text" class="form-control" required name="cel_empleado" />
          <label>Telefono:</label>
          <input type="text" class="form-control" required name="tel_empleado" />
          <label>Direcci&oacute;n:</label>
          <input type="text" class="form-control" required name="dir_empleado" />
          <label>Email:</label>
          <input type="email" class="form-control" required name="email_empleado" />
          <label>Ciudad:</label>
          <input type="text" class="form-control" required name="ciudad_empleado"/>
          <label>Cargo:</label>
           <select name="cargo_empleado"class="form-control"  required>
              <%
                CargoDAO cd = new CargoDAO();
                for(Cargo c : cd.getListaCargos()){          
                    out.print("<option value='"+c.getCodigo()+"'>" + c.getNombre() + "</option>");
              }%>
          </select>
          </select>  
          <br>
          <br>
          <input type="submit" value="REGISTRAR EMPLEADO" class="btn btn-primary"/>

      </div>
      </div>
       </div>                     
       </form>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
          <span style="font-size: 30px" class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Editar Datos
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <form id="formulario_edicion">                       
        <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp; EDITAR DATOS</h3>
      </div>
      <div align="left" class="panel-body" id="form">
          <label>Digite identificaci&oacute;n del empleado; *</label><input type="text" value="114569874" class="form-control"  name="id_cliente" autocomplete="off" required/>
          <label style="color: red;"><b>Obligatorio*</b></label>
          <span id="loader_editar"class=""></span>
          <br>
          <button type="button" class="btn btn-primary btn-sm" id="btn_editar"><span style="font-size: 10px" class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;BUSCAR</button><br>
          <label>Identificaci&oacute;n:</label>
          <input type="text" class="form-control" disabled required name="id_cliente" placeholder="114569874"/>
          <label>Nombre:</label>
          <input type="text" class="form-control" disabled required name="nombre_cliente" placeholder="Juan Manuel"/>
          <label>Apellidos:</label>
          <input type="text" class="form-control" disabled required name="apellidos_cliente" placeholder="Perez Hernandez"/>
          <label>Direcci&oacute;n:</label>
          <input type="text" class="form-control" disabled required name="dir_cliente" placeholder="Urb Los Aples Mz41 L20"/>
          <label>Ciudad:</label>
          <input type="text" class="form-control" disabled required name="ciudad_cliente" placeholder="Cartagena,Bolívar"/>
          <br>
          <label>Cargo:</label>
          <select name="cargo" class="form-control" required disabled>
              <option>Cocinero</option>
              <option>Mesero</option>
              <option>Ingeniero de sonido</option>
              <option selected="selected">Coordinador</option>
          </select>    
          <button type="button" class="btn btn-primary btn-sm" id="btn_editar"><span style="font-size: 10px" class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;EDITAR</button><br>
      </div>
      </div>
       </div>      
      </form>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
          <span style="font-size: 30px" class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Consultar Empleado
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        <form id="formulario_buscar">
          <div align="center">
       <div class="panel panel-primary" style="width: 80%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;CONSULTAR EMPLEADO</h3>
      </div>
      <div align="left" class="panel-body">
          <label>Ingrese la identificaci&oacute;n del empleado:&nbsp; *</label><input type="text" class="form-control"  name="id_cliente" autocomplete="off" required disabled value="114569874"/>
          <button type="submit" class="btn btn-primary btn-sm" id="btn_consultar"><span style="font-size: 10px" class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;CONSULTAR EMPLEADO</button><br>
          <label style="color: red;"><b>Obligatorio*</b></label>
          <span id="loader_consultar" class=""></span>
           <table class="table table-bordered table-hover" style="border: solid">
                    <thead>
                        <tr class="warning">
                            <th>IDENTIFICACI&Oacute;N&nbsp;</th>
                            <th>NOMBRE&nbsp;</th>
                            <th>APELLIDOS&nbsp;</th>
                            <th>DIRECCI&Oacute;N</th>
                            <th>CIUDAD</th>
                            <th>CARGO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>114569874</td>
                            <td>Juan Manuel</td>
                            <td>Perez Hern&aacute;ndez</td>
                            <td>Urb los Aples Mz 41 L20</td>
                            <td>Cartagena</td>
                            <td>Coordinador</td>
                        </tr>
                    </tbody>
           </table>        
          <br>
      </div>
      </div>
      </div>
          </form>
    </div>
  </div>
</div>
      <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
          <span style="font-size: 30px" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          Listado de empleados
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
        <form id="formulario_edicion">                       
        <div align="center">
       <div class="panel panel-primary" style="width: 100%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp; LISTADO DE EMPLEADOS</h3>
      </div>
      <div align="left" class="panel-body" id="form">
          <table class="table table-bordered" style="border: solid;width: 100%">     
<tr>
    <td colspan="1"><b>ID</b> </td>
    <td colspan="1"><b>NOMBRE</b> </td>
    <td colspan="1"><b>APELLIDOS</b></td>
    <td colspan="1"><b>TEL&Eacute;FONO</b></td>
    <td colspan="1"><b>DIRECCI&Oacute;N</b></td>
    <td colspan="1"><b>EMAIL</b></td>
    <td colspan="1"><b>CIUDAD</b></td>
    <td colspan="1"><b>CELULAR</b></td>
    <td colspan="1"><b>CARGO</b></td>
    <td colspan="2"><b>ACCI&Oacute;N</b></td>
</tr>
    <%   
    
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","programas");
    
    ResultSet rs=null;
    PreparedStatement ps=null;       
    
    
    try {
          String sql="SELECT e.identificacion,e.nombre,e.apellidos,e.telefono,e.direccion,e.email,e.ciudad,e.celular,c.nombre from empleado e, cargo c "
                  + "WHERE (e.cargo_codigo=c.codigo) ORDER BY e.nombre";
          ps=conexion.prepareStatement(sql);
         
          rs=ps.executeQuery();
         
          while( rs.next()  ){
              %>
  <tr>
  <td rowspan="1"> <%= rs.getInt("e.identificacion")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.nombre")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.apellidos")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.telefono")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.direccion")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.email")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.ciudad")  %>  </td>
  <td rowspan="1"><%= rs.getString("e.celular")  %>  </td>
  <td rowspan="1"><%= rs.getString("c.nombre")  %>  </td>
  <td><a class="btn btn-warning" target="_self" href="#">Editar</a></td>
  <td><a class="btn btn-danger" href="eliminar_Empleado.jsp?cod=<%=rs.getInt("identificacion")%>">Eliminar</a></td>
	</tr>
<%
          }
}catch(SQLException e){
    out.println(e);
    }  
          %>
</table>
      </div>
      </div>
       </div>      
      </form>
      </div>
    </div>
  </div>                  
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
 
    <!-- jQuery -->
    <script src="../js/jquery-2.1.4.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>