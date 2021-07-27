<%@page import="procesosDb.ProcesosUsuarios"%>
<%@page import="entidades.Usuarios"%>
<%
    
    session.removeAttribute("idSesion");
    session.removeAttribute("correoSesion");
    session.removeAttribute("usuarioSesion");
    
    response.sendRedirect("../index.jsp");
%>