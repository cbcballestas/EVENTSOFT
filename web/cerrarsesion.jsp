<%-- 
    Document   : cerrarsesion
    Created on : 23/09/2015, 08:36:11 PM
    Author     : COMPUTER
--%>

<%@page session="true"%>
<%
    HttpSession sesionOk=request.getSession();
    sesionOk.invalidate();
%>
<jsp:forward page="index.jsp"/>
