<%-- 
    Document   : index
    Created on : 22/09/2015, 11:25:28 PM
    Author     : COMPUTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>::Aplicativo web para la gesti&oacute;n de eventos:: Ingreso al sistema</title>
        
        <!-- Javascript -->
        <script src="assets/js/jquery-2.1.4.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

        <!-- CSS -->
        
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="assets/css/form-elements.css"/>
        <link rel="stylesheet" href="assets/css/style.css"/>

        <!-- Favicon-->
        <link href="imagenes/favicon.png" rel="shortcut icon" type="image/x-icon" />
        
        <meta charset="utf-8">

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
                <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div align="center">
                            <h1 id="titulo">EVENTSOFT <br><br>(APLICATIVO WEB PARA LA GESTION DE <br><br>EVENTOS)</h1>
                            <div class="description">
                            	<p></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%
            if(request.getParameter("error")!=null){
                out.println("<div align='center'><div align='center' style='width: 75%;' class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
                        "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+" "+request.getParameter("error")+"</div></div>");
            }
        %>
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                                            <h3>Inicio de sesi&oacute;n</h3>
                            		<p>Ingrese usuario y contraseña:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="<%=request.getContextPath()%>/Validacion" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
                                                        <input type="text" name="user" placeholder="Username..." class="form-username form-control" id="form-username" autofocus>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="pass" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
                                                <button type="submit" class="btn">Iniciar sesi&oacute;n</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        

    </body>

</html>
