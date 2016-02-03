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
        <title>Registro eventos</title>
        <link href="../imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />
    </head>
    <body>
        <%
        int codigo=Integer.parseInt(request.getParameter("cod_evento"));
        String descripcion=request.getParameter("tipo_evento");
        String nombre=request.getParameter("nom_evento");
        String estado=request.getParameter("estado_evento");
        String fecha_inicio=request.getParameter("fecha_inicio");
        String fecha_fin=request.getParameter("fecha_fin");
        String hora_inicio=request.getParameter("hora_inicio");
        String hora_fin=request.getParameter("hora_fin");
        int participantes=Integer.parseInt(request.getParameter("num_participantes"));
        int cantidad=Integer.parseInt(request.getParameter("cantidad_recurso"));
        int recinto=Integer.parseInt(request.getParameter("lugar_evento"));
        int recurso=Integer.parseInt(request.getParameter("recursos"));
        int coordinador=Integer.parseInt(request.getParameter("administrador"));
        int cliente=Integer.parseInt(request.getParameter("cliente"));
        
        %>
        
        <%   
               
    Connection conexion=null;
    Class.forName("org.gjt.mm.mysql.Driver");
    conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_eventos","root","");
    
    ResultSet rs=null;
    PreparedStatement ps=null;
    
    try {
          String sql = "INSERT INTO evento values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
          ps=conexion.prepareStatement(sql);
          ps.setInt(1, codigo);
          ps.setString(2,descripcion);
          ps.setString(3,nombre);
          ps.setString(4, estado);
          ps.setString(5, fecha_inicio);
          ps.setString(6, fecha_fin);
          ps.setString(7, hora_inicio);
          ps.setString(8, hora_fin);
          ps.setInt(9, participantes);
          ps.setInt(10, recinto);
          ps.setInt(11, recurso);
          ps.setInt(12, cantidad);
          ps.setInt(13, coordinador);
          ps.setInt(14, cliente);
          int r=ps.executeUpdate();
          RequestDispatcher a = request.getRequestDispatcher("Evento.jsp?respuesta=Evento " +"guardado exitosamente");
			a.forward(request, response);
          %>
          <%--<jsp:forward page="Cliente.jsp">
            <jsp:param name="respuesta" value="Cliente guardado exitosamente"/>
        </jsp:forward>--%>
          <%
          //response.sendRedirect("Cliente.jsp");
          //out.println("Cliente guardado exitosamente");
       }catch(SQLException e){
           RequestDispatcher a = request.getRequestDispatcher("Evento.jsp?error=Error al " +"guardar evento");
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
