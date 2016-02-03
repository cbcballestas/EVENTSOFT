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
        int identificacion=Integer.parseInt(request.getParameter("identificacion"));
        String nombres=request.getParameter("nombres");
        String apellidos=request.getParameter("apellidos");
        String telefono=request.getParameter("telefono");
        String ciudad=request.getParameter("ciudad");
        String direccion=request.getParameter("direccion");
        String email=request.getParameter("email");
        String celular=request.getParameter("celular");
        
        %>
        
        <%   
               
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","");
    
    ResultSet rs=null;
    PreparedStatement ps=null;
    
    try {
          String sql = "INSERT INTO cliente values (?,?,?,?,?,?,?,?)";
          ps=conexion.prepareStatement(sql);
          ps.setInt(1, identificacion);
          ps.setString(2,nombres);
          ps.setString(3, apellidos);
          ps.setString(4, telefono);
          ps.setString(5, direccion);
          ps.setString(6, email);
          ps.setString(7, ciudad);
          ps.setString(8, celular);
          int r=ps.executeUpdate();
          RequestDispatcher a = request.getRequestDispatcher("Cliente.jsp?respuesta=Cliente " +"guardado exitosamente");
			a.forward(request, response);
          %>
          <%--<jsp:forward page="Cliente.jsp">
            <jsp:param name="respuesta" value="Cliente guardado exitosamente"/>
        </jsp:forward>--%>
          <%
          //response.sendRedirect("Cliente.jsp");
          //out.println("Cliente guardado exitosamente");
       }catch(SQLException e){
           RequestDispatcher a = request.getRequestDispatcher("Cliente.jsp?error=Error al " +"guardar cliente");
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
