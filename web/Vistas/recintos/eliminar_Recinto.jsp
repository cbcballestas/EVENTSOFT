<%-- 
    Document   : eliminar_Cliente
    Created on : 23/11/2015, 07:29:01 AM
    Author     : cuadrosco
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
        <title>Eliminar Cliente</title>
        <link href="../imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />
    </head>
    <body>
        <%
        int identificacion=Integer.parseInt(request.getParameter("cod"));
        %>
        
        <%   
               
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","");
    
    ResultSet rs=null;
    PreparedStatement ps=null;
    
    try {
          String sql = "DELETE FROM recinto where codigo=?";
          ps=conexion.prepareStatement(sql);
          ps.setInt(1, identificacion);
          int r=ps.executeUpdate();
          RequestDispatcher a = request.getRequestDispatcher("Recintos.jsp?respuesta_eliminacion=Recinto " +"eliminado exitosamente");
			a.forward(request, response);
          %>
          <%
       }catch(SQLException e){
           RequestDispatcher a = request.getRequestDispatcher("Recintos.jsp?error_eliminacion=Error al " +"eliminar recinto");
			a.forward(request, response);
        %>
        <%--<jsp:forward page="Cliente.jsp">
            <jsp:param name="error" value="Error al eliminar cliente"/>
        </jsp:forward>--%>
        <%
           //response.sendRedirect("Cliente.jsp");
       out.println(e);
    } %> 
          
    </body>
</html>