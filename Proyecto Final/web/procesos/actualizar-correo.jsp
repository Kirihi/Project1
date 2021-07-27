<%@page import="procesosDb.ProcesosUsuarios"%>
<%@page import="entidades.Usuarios"%>
<%
    
    try {
            
            String correo = request.getParameter("correo");
            Integer id = Integer.parseInt(request.getParameter("idUsuario"));
            
            Usuarios usuario = new Usuarios();
            ProcesosUsuarios procesosUsuarios = new ProcesosUsuarios();
            
            usuario.setCorreo(correo);
            usuario.setIdUsuario(id);
            
            procesosUsuarios.ActualizarCorreo(usuario);
            
            session.removeAttribute("idSesion");
    session.removeAttribute("correoSesion");
    session.removeAttribute("usuarioSesion");
            
            response.sendRedirect("../login.jsp");
            
        
        } catch (Exception e) {
        }
%>
