<%-- 
    Document   : registroRecurso
    Created on : 21/09/2015, 06:51:41 PM
    Author     : COMPUTER
--%>

<%@page import="modelo.Proveedor"%>
<%@page import="DAO.ProveedorDAO"%>
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
                                <i class="fa fa-cart-plus"></i> Recursos
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
          <form id="formulario" action="registro_Recurso.jsp">
          <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;REGISTRO DE RECURSOS</h3>
      </div>
      <div align="left" class="panel-body">
          <label>C&oacute;digo:</label>
          <input type="text" class="form-control" required name="cod_recurso"/>
          <label>Nombre:</label>
          <input type="text" class="form-control" required name="nombre_recurso"/>
          <label>Precio:</label>
          <input type="text" class="form-control" required name="precio_recurso" />
          <label>Estado:</label>
          <select name="estado_recurso" class="form-control" required>
              <option>Excelente</option>
              <option>Presenta problemas</option>
          </select><br>
          <label>Tipo:</label>
          <select name="tipo_recurso"class="form-control"  required>
              <option>Propio</option>
              <option>Alquilado</option>
          </select><br>
          <label>Proveedor:<font color="red"><b>* Solo para recursos que no son propios</b></font></label>
          
          <select name="proveedor"class="form-control"  required>
              <%
                ProveedorDAO pd = new ProveedorDAO();
                for(Proveedor p : pd.getListaProveedores()){          
                    out.print("<option value='"+p.getId()+"'>" + p.getNombre() + "</option>");
              }%>
          </select><br>
          <label>Cantidad:</label>
          <input type="number" class="form-control"  required name="cantidad_recurso"/>
          <label>Descripci&oacute;n</label>
          <textarea rows="10" cols="10" class="form-control" name="descripcion_recurso"></textarea>
          <br>
          <input type="submit" value="REGISTRAR RECURSO" class="btn btn-primary"/><br><br>
          
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
          <span style="font-size: 30px" class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Consultar
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <form id="formulario_buscar">
          <div align="center">
       <div class="panel panel-primary" style="width: 50%">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp;CONSULTAR RECURSO</h3>
      </div>
      <div align="left" class="panel-body">
          <label>Digite c&oacute;digo de recurso:&nbsp; *</label><input type="text" class="form-control"  name="id_cliente" autocomplete="off" required/>
          <label style="color: red;"><b>Obligatorio*</b></label>
          <span id="loader_consultar" class=""></span>
           <table class="table table-bordered table-hover" style="border: solid; width: 100%">
                    <thead>
                        <tr class="warning">
                            <th>CODIGO&nbsp;</th>
                            <th>NOMBRE&nbsp;</th>
                            <th>TIPO&nbsp;</th>
                            <th>DESCRIPCI&Oacute;N</th>
                            <th>CANTIDAD</th>
                            <th>ESTADO</th>
                        </tr>
                    </thead>
                    
           </table>        
          <br>
          <button type="submit" class="btn btn-primary btn-sm" id="btn_consultar"><span style="font-size: 10px" class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;CONSULTAR RECURSO</button>
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
          Listado de recursos
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
        <form id="formulario_edicion">                       
        <div align="center">
       <div class="panel panel-primary">
      <div class="panel-heading">
          <h3 class="panel-title">&nbsp; LISTADO DE RECURSOS</h3>
      </div>
      <div align="left" class="panel-body" id="tblListado">
          <table class="table table-bordered table-hover" style="width: 100%">
                    <thead>
                        <tr>
                            <th>CODIGO&nbsp;</th>
                            <th>NOMBRE&nbsp;</th>
                            <th>PRECIO POR USO&nbsp;</th>
                            <th>ESTADO&nbsp;</th>
                            <th>TIPO /PROPIEDAD&nbsp;</th>
                            <th>CANTIDAD</th>
                            <th>DESCRIPCI&Oacute;N&nbsp;</th>
                            <th>PROVEEDOR&nbsp;</th>
                            <th colspan="2">ACCI&Oacute;N</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%   
    
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
   conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","programas");
    
    ResultSet rs=null;
    PreparedStatement ps=null;       
    
    
    try {
          String sql="SELECT r.codigo,r.nombre,r.precio_uso,r.estado,r.tipo_propiedad,r.cantidad,r.descripcion,p.nombre from recurso r, proveedor p WHERE (r.Proveedor_id=p.id)ORDER BY r.nombre";
          ps=conexion.prepareStatement(sql);
         
          rs=ps.executeQuery();
         
          while( rs.next()  ){
              %>
  <tr>
  <td rowspan="1"> <%= rs.getInt("r.codigo")  %>  </td>
  <td rowspan="1"><%= rs.getString("r.nombre")  %>  </td>
  <td rowspan="1"><%= rs.getDouble("r.precio_uso")  %>  </td>
  <td rowspan="1"><%= rs.getString("r.estado")  %>  </td>
  <td rowspan="1"><%= rs.getString("r.tipo_propiedad")  %>  </td>
  <td rowspan="1"><%= rs.getInt("r.cantidad")  %>  </td>
  <td rowspan="1"><%= rs.getString("r.descripcion")  %>  </td>
  <td rowspan="1"><%= rs.getString("p.nombre")  %>  </td>
  <td><a class="btn btn-warning" target="_self" href="frmEdicion.jsp?cod=<%=rs.getInt("r.codigo")%>">Editar</a></td>
  <td><a class="btn btn-danger" href="eliminar_Recurso.jsp?cod=<%=rs.getInt("r.codigo")%>">Eliminar</a></td>
	</tr>
<%
          }
}catch(SQLException e){
    out.println(e);
    }  
          %>
                        
                    </tbody>
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