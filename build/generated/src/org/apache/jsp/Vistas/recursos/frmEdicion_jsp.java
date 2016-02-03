package org.apache.jsp.Vistas.recursos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Consultas;
import modelo.Recurso;

public final class frmEdicion_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            String user="";
            HttpSession sesionOk=request.getSession();
            if(sesionOk.getAttribute("usuario")==null){
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("../index.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("error", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Debe iniciar sesi&oacute;n", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("        ");

            }else{
          user=""+session.getAttribute("usuario");
          
          
           Consultas con=new Consultas();
           Recurso r= con.consultarRecurso(Integer.parseInt(request.getParameter("cod")));
          
            }
        
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>::Aplicativo web para la gesti&oacute;n de eventos:: Gesti&oacute;n de recursos</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap Core CSS -->\n");
      out.write("    <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom CSS -->\n");
      out.write("    <link href=\"../css/sb-admin.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom Fonts -->\n");
      out.write("    <link href=\"../font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("        <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n");
      out.write("        <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("        <!-- Navigation -->\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("            <!-- Brand and toggle get grouped for better mobile display -->\n");
      out.write("            <div class=\"navbar-header\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("                <a class=\"navbar-brand\" href=\"../principal.jsp\">EVENTSOFT</a>\n");
      out.write("            </div>\n");
      out.write("            <!-- Top Menu Items -->\n");
      out.write("            <ul class=\"nav navbar-right top-nav\">\n");
      out.write("                     <li class=\"dropdown\">\n");
      out.write("                         <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-user\"></i>&nbsp;USTED HA SIDO IDENTIFICADO COMO:&nbsp;");
      out.print(user);
      out.write(" <b class=\"caret\"></b></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\"><i class=\"fa fa-fw fa-gear\"></i> Ajustes</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"../../cerrarsesion.jsp\"><i class=\"fa fa-fw fa-sign-out\"></i>Salir</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->\n");
      out.write("            <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n");
      out.write("                <ul class=\"nav navbar-nav side-nav\">\n");
      out.write("                    <li class=\"active\">\n");
      out.write("                        <a href=\"../principal.jsp\"> Principal</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"Recurso.jsp\"><i class=\"fa fa-cart-plus fa-lg\"></i> Recursos</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"../eventos/Evento.jsp\"><i class=\"fa fa-fw fa-calendar-o\"></i> Eventos</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"../clientes/Cliente.jsp\"><i class=\"fa fa-fw fa-users\"></i>Clientes</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"../empleados/Empleado.jsp\"><i class=\"fa fa-fw fa-briefcase\"></i> Empleados</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <!-- /.navbar-collapse -->\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div id=\"page-wrapper\">\n");
      out.write("\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                <!-- Page Heading -->\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                        <h1 class=\"page-header\">\n");
      out.write("                            Gesti&oacute;n de Recursos\n");
      out.write("                        </h1>\n");
      out.write("                        <ol class=\"breadcrumb\">\n");
      out.write("                            <li>\n");
      out.write("                                <i class=\"fa fa-dashboard\"></i>  <a href=\"../principal.jsp\">Pagina principal</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"active\">\n");
      out.write("                                <i class=\"fa fa-cart-plus\"></i> Editar Recurso\n");
      out.write("                            </li>\n");
      out.write("                        </ol>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- /.row -->\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <!-- /.container-fluid -->\n");
      out.write("          <div class=\"panel-group\" id=\"accordion\" role=\"tablist\" aria-multiselectable=\"true\">\n");
      out.write("                 <form id=\"formulario_edicion\">                       \n");
      out.write("        <div align=\"center\">\n");
      out.write("       <div class=\"panel panel-primary\" style=\"width: 50%\">\n");
      out.write("      <div class=\"panel-heading\">\n");
      out.write("          <h3 class=\"panel-title\">&nbsp; EDITAR RECURSO</h3>\n");
      out.write("      </div>\n");
      out.write("      <div align=\"left\" class=\"panel-body\" id=\"form\">\n");
      out.write("          <label>Digite c&oacute;digo del recurso:&nbsp; *</label><input type=\"text\" value=\"0001\" class=\"form-control\"  name=\"id_cliente\" autocomplete=\"off\" required/>\n");
      out.write("          <label style=\"color: red;\"><b>Obligatorio*</b></label>\n");
      out.write("          <span id=\"loader_editar\"class=\"\"></span>\n");
      out.write("          <br>\n");
      out.write("          <button type=\"button\" class=\"btn btn-primary btn-sm\" id=\"btn_editar\"><span style=\"font-size: 10px\" class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span>&nbsp;BUSCAR</button><br>\n");
      out.write("          <label>C&oacute;digo:</label>\n");
      out.write("          <input type=\"text\" class=\"form-control\" required disabled name=\"id_cliente\" value=\"0001\"/>\n");
      out.write("          <label>Nombre:</label>\n");
      out.write("          <input type=\"text\" class=\"form-control\" required disabled name=\"nombre_cliente\" value=\"Silla\"/>\n");
      out.write("          <label>Precio por uso:</label>\n");
      out.write("          <input type=\"text\" class=\"form-control\" required disabled name=\"apellidos_cliente\" value=\"70000\"/>\n");
      out.write("          <label>Estado:</label>\n");
      out.write("          <select name=\"estado_recurso\" class=\"form-control\" disabled required>\n");
      out.write("              <option selected=\"selected\">Excelente</option>\n");
      out.write("              <option>Presenta problemas</option>\n");
      out.write("          </select><br>\n");
      out.write("          <label>Tipo:</label>\n");
      out.write("          <select name=\"tipo_recurso\"class=\"form-control\" disabled required>\n");
      out.write("              <option selected=\"selected\">Propio</option>\n");
      out.write("              <option>Alquilado</option>\n");
      out.write("          </select><br>\n");
      out.write("          <label>Cantidad:</label>\n");
      out.write("          <input type=\"number\" class=\"form-control\"  required disabled name=\"ciudad_cliente\" value=\"100\"/>\n");
      out.write("          <label>Descripci&oacute;n</label>\n");
      out.write("          <textarea rows=\"10\" cols=\"10\" class=\"form-control\" disabled>Silla versalles</textarea>\n");
      out.write("          <button type=\"button\" class=\"btn btn-primary btn-sm\" id=\"btn_editar\"><span style=\"font-size: 10px\" class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>&nbsp;EDITAR</button><br>\n");
      out.write("      </div>\n");
      out.write("      </div>\n");
      out.write("       </div>      \n");
      out.write("      </form>\n");
      out.write("        </div>\n");
      out.write("        <!-- /#page-wrapper -->\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <!-- /#wrapper -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
