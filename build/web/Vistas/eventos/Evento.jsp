<%-- 
    Document   : registroCliente
    Created on : 21/09/2015, 06:51:41 PM
    Author     : COMPUTER
--%>

<%@page import="modelo.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="modelo.Administrador"%>
<%@page import="DAO.AdministradorDAO"%>
<%@page import="modelo.Recurso"%>
<%@page import="DAO.RecursoDAO"%>
<%@page import="modelo.Recinto"%>
<%@page import="DAO.RecintoDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
    <link href="../imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />

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
                        <a href="Evento.jsp"><i class="fa fa-fw fa-calendar-o"></i> Eventos</a>
                    </li>
                    <li>
                        <a href="../recintos/Recintos.jsp"><i class="fa fa-fw fa-bank"></i> Recintos</a>
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
                            Gesti&oacute;n de Eventos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="../principal.jsp">Pagina principal</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-calendar-o"></i> Eventos
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <%
            if(request.getParameter("respuesta")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"+" "+request.getParameter("respuesta")+"</div></div>");
            }
            if(request.getParameter("error")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" "+request.getParameter("error")+"</div></div>");
            }
            if(request.getParameter("respuesta_eliminacion")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"+" "+request.getParameter("respuesta_eliminacion")+"</div></div>");
            }
            if(request.getParameter("error_eliminacion")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" "+request.getParameter("error")+"</div></div>");
            }
        %>
  
            <!-- /.container-fluid -->
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <span style="font-size: 30px" class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;  
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">            
          Agregar
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
          <form id="formulario" action="registro_Evento.jsp">
          <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;REGISTRO DE EVENTOS</h3>
      </div>
      <div align="left" class="panel-body">
          <label>C&oacute;digo:</label>
          <input type="number" class="form-control" name="cod_evento" required placeholder=""/>
          <br>
          <label>Nombre:</label>
          <input type="text" class="form-control" name="nom_evento" required placeholder=""/>
          <label>Lugar donde se realizara:</label>
          <select name="lugar_evento"class="form-control"  required>
              <%
                RecintoDAO rd = new RecintoDAO();
                for(Recinto r : rd.getListaRecintos()){          
                    out.print("<option value='"+r.getCodigo()+"'>" + r.getNombre() + "</option>");
              }%>
          </select><br>
          <label>Numero de participantes:</label>
          <input type="number" class="form-control" name="num_participantes" required placeholder=""/>
          <br>
          <label>Fecha inicio:</label>
          <input type="date" class="form-control" required name="fecha_inicio"/>
          <label>Fecha finalizacion:<font color="red"><b>*</b></font></label>
          <input type="date" class="form-control"  name="fecha_fin"/>
          <label>Hora de inicio:</label>
          <input type="time" class="form-control" required name="hora_inicio"/>
           <label>Hora finalizaci&oacute;n :</label>
          <input type="time" class="form-control" required name="hora_fin"/>
          <label>Seleccione los recursos a utilizar:</label>
          <select name="recursos"class="form-control" multiple="multiple" required>
              <%
                RecursoDAO rdao = new RecursoDAO();
                for(Recurso r : rdao.getListaRecurso()){          
                    out.print("<option value='"+r.getId()+"'>" + r.getNombre() + "</option>");
              }%>
          </select><br>
          <label>Cantidad recurso:</label>
          <input type="text" class="form-control" name="cantidad_recurso" required placeholder=""/>
          <br>     
          <label>Tipo de evento:</label>
          <select name="tipo_evento" class="form-control" required >
           <option selected="selected">Seminario</option>
           <option> Matrimonio </option>
           <option> Grado </option>
	   <option> Fiesta Infantil </option>
	   <option> Rumba Sana </option>
	   <option> Quinceañeros</option>
	   <option> Conferencias empresariales</option>
  </select>
          <br>
          <label>Cliente:</label>
          <select name="cliente"class="form-control"  required>
              <%
                ClienteDAO cdao = new ClienteDAO();
                for(Cliente r : cdao.getListaClientes()){          
                    out.print("<option value='"+r.getIdentificacion()+"'>" + r.getNombres() + " "+r.getApellidos()+ "</option>");
              }%>
          </select><br>
          <label>Coordinador:</label>
          <select name="administrador"class="form-control" required>
              <%
                AdministradorDAO adao = new AdministradorDAO();
                for(Administrador r : adao.getListaAdministradores()){          
                    out.print("<option value='"+r.getIdentificacion()+"'>" + r.getNombre() + " "+r.getApellidos()+ "</option>");
              }%>
          </select><br>
          <label>Estado evento:</label>
          <select name="estado_evento" class="form-control" required >
           <option>Activo</option>
           <option> Cancelado </option>
           <option> Finalizado </option>
           </select>
          <br>
          <input type="submit" value="REGISTRAR CLIENTE" class="btn btn-primary"/><br>
          <p style="color: red; font-weight: bold">*(Opcional)Solo aplica para eventos mayores a 1 d&iacute;a</p>
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
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Listado de eventos
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <form id="formulario_buscar">
       <div class="panel panel-primary" style="width: 100%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;LISTADO DE EVENTOS</h3>
      </div>
      <div align="left" class="panel-body">
          <table  align="center" class="table table-bordered" style="border: solid;width: 60%">
         <%   
    
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","programas");
    
    ResultSet rs=null;
    PreparedStatement ps=null;       
    
    
    try {
          String sql="SELECT ev.codigo,ev.descripcion,ev.nombre,r.cantidad,ev.estado,ev.fecha_inicio,ev.fecha_fin,ev.hora_inicio,ev.hora_fin,ev.no_AproxParticipantes,rc.nombre,rc.direccion,r.nombre,a.nombre,a.apellidos,c.nombre,c.apellidos FROM administrador a,evento ev,recurso r,cliente c,recinto rc  WHERE "
                  + "(ev.Recinto_codigo=rc.codigo) AND (ev.Recurso_codigo=r.codigo) AND (ev.Administrador_identificacion=a.identificacion) AND (ev.Cliente_identificacion=c.identificacion) ORDER BY ev.nombre";
          ps=conexion.prepareStatement(sql);
         
          rs=ps.executeQuery();
         
          while( rs.next()  ){
              %>
              <TR style="border: solid"><TH colspan="2"><center><b>DETALLES DEL EVENTO:&nbsp;<%= rs.getString("ev.nombre")  %> </b></center></TH></TR>      
	<TR><TH><b>C&Oacute;DIGO</b></TH>
		<td rowspan="1"> <%= rs.getInt("ev.codigo")  %>  </td></TR>
	<TR><TH><b>TIPO</b></TH>
		<td rowspan="1"><%= rs.getString("ev.descripcion")%> </td></TR>
	<TR><TH><b>NOMBRE</b></TH>
		<td rowspan="1"><%= rs.getString("ev.nombre")  %>  </td></TR>
        <TR><TH><b>ESTADO</b></TH>
		<td rowspan="1"><%= rs.getString("ev.estado") %> </td></TR>
        <TR><TH><b>FECHA_INICIO</b></TH>
		<td rowspan="1"><%= rs.getString("ev.fecha_inicio")%> </td></TR>
        <TR><TH><b>FECHA_FIN</b></TH>
		<td rowspan="1"><%= rs.getString("ev.fecha_fin")%></td></TR>
        <TR><TH><b>HORA_INICIO</b></TH>
		<td rowspan="1"><%= rs.getString("ev.hora_inicio")  %> </td></TR>
        <TR><TH><b>HORA_FIN</b></TH>
		<td rowspan="1"><%= rs.getString("ev.hora_fin")%></td></TR>
        <TR><TH><b>PARTICIPANTES</b></TH>
		<td rowspan="1"><%= rs.getInt("ev.no_AproxParticipantes")%></td></TR>
        <TR><TH><b>RECINTO</b></TH>
		<td rowspan="1"><%= rs.getString("rc.nombre")  %>  </td></TR>
        <TR><TH><b>DIRECCI&Oacute;N</b></TH>
		<td rowspan="1"><%= rs.getString("rc.direccion")  %>  </td></TR>
        <TR><TH><b>RECURSOS</b></TH>
		<td rowspan="1"><%= rs.getString("r.nombre")  %>  </td></TR>
        <TR><TH><b>CANTIDAD RECURSO</b></TH>
		<td rowspan="1"><%= rs.getInt("r.cantidad")  %>  </td></TR>
        <TR><TH><b>COORDINADOR</b></TH>
            <td rowspan="1"><%= rs.getString("a.nombre")%>&nbsp;<%= rs.getString("a.apellidos")%>  </td></TR>
        <TR><TH><b>CLIENTE</b></TH>
		<td rowspan="1"><%= rs.getString("c.nombre")%>&nbsp;<%= rs.getString("c.apellidos")%>  </td></TR>
        <TR><TH><b>ACCCI&Oacute;N</b></TH>
		<td><a class="btn btn-warning" target="_self" href="#" title="Editar evento"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
		<a class="btn btn-danger" target="_self" href="eliminar_Evento.jsp?cod=<%=rs.getInt("ev.codigo")%>" title="Eliminar evento"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td></TR>
        <tr>
            <td colspan="2"><hr style="width: 100%;border: solid"></td>
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