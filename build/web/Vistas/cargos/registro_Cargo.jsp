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
        <title>Registro Cargo</title>
        <link href="../imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />
    </head>
    <body>
        <%
        int id_cargo=Integer.parseInt(request.getParameter("id_cargo"));
        String nombre_cargo=request.getParameter("nombre_cargo");
        
        %>
        
        <%   
               
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","");
    
    ResultSet rs=null;
    PreparedStatement ps=null;
    
    try {
          String sql = "INSERT INTO cargo values (?,?)";
          ps=conexion.prepareStatement(sql);
          ps.setInt(1, id_cargo);
          ps.setString(2,nombre_cargo);
          int r=ps.executeUpdate();
          RequestDispatcher a = request.getRequestDispatcher("Cargos.jsp?respuesta=Cargo " +"guardado exitosamente");
			a.forward(request, response);
          %>
          <%
          //response.sendRedirect("Cliente.jsp");
          //out.println("Cliente guardado exitosamente");
       }catch(SQLException e){
           RequestDispatcher a = request.getRequestDispatcher("Cargos.jsp?error=Error al " +"guardar cargo");
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
