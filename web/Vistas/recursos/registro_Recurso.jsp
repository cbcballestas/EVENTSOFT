<%-- 
    Document   : registro_Cliente
    Created on : 3/11/2015, 09:20:25 AM
    Author     : USUARIO1
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro cliente</title>
        <link href="../imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />
    </head>
    <body>
        <%
        int codigo=Integer.parseInt(request.getParameter("cod_recurso"));
        String nombreRecurso=request.getParameter("nombre_recurso");
        int precio=Integer.parseInt(request.getParameter("precio_recurso"));
        String estado=request.getParameter("estado_recurso");
        String tipo=request.getParameter("tipo_recurso");
        int proveedor;
        String proveedor2=request.getParameter("proveedor");
        if(proveedor2.equals("Ninguno")){
            proveedor=0;
        }else{
        proveedor=Integer.parseInt(proveedor2);
        }
        int cantidad=Integer.parseInt(request.getParameter("cantidad_recurso"));
        String descripcion=request.getParameter("descripcion_recurso");
        
        %>
        
        <%   
               
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","");
    
    ResultSet rs=null;
    PreparedStatement ps=null;
    
    try {
          String sql = "INSERT INTO recurso values (?,?,?,?,?,?,?,?)";
          ps=conexion.prepareStatement(sql);
          ps.setInt(1, codigo);
          ps.setString(2,nombreRecurso);
          ps.setDouble(3, precio);
          ps.setString(4, estado);
          ps.setString(5, tipo);
          ps.setInt(6, cantidad);
          ps.setString(7, descripcion);
          ps.setInt(8, proveedor);
          int r=ps.executeUpdate();
          RequestDispatcher a = request.getRequestDispatcher("Recurso.jsp?respuesta=Recurso " +"guardado exitosamente");
			a.forward(request, response);
          %>
          <%--<jsp:forward page="Cliente.jsp">
            <jsp:param name="respuesta" value="Cliente guardado exitosamente"/>
        </jsp:forward>--%>
          <%
          //response.sendRedirect("Cliente.jsp");
          //out.println("Cliente guardado exitosamente");
       }catch(SQLException e){
           RequestDispatcher a = request.getRequestDispatcher("Recurso.jsp?error=Error al " +"guardar recurso");
			a.forward(request, response);
        %>
        <%--<jsp:forward page="Cliente.jsp">
            <jsp:param name="error" value="Error al guardar cliente"/>
        </jsp:forward>--%>
        <%
           //response.sendRedirect("Cliente.jsp");
       out.println(e);
    } %> 
          
    </body>
</html>
