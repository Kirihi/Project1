<%@page import="procesosDb.ProcesosUsuarios"%>
<%@page import="entidades.Usuarios"%>
<%
        try {
                
                String contrasena = request.getParameter("contrasena");
                Integer id = Integer.parseInt(request.getParameter("idUsuario"));

                Usuarios usuario = new Usuarios();
            ProcesosUsuarios procesosUsuarios = new ProcesosUsuarios();
            
            usuario.setContrasena(contrasena);
            usuario.setIdUsuario(id);
            
            procesosUsuarios.ActualizarContrasena(usuario);
            
            session.removeAttribute("idSesion");
    session.removeAttribute("correoSesion");
    session.removeAttribute("usuarioSesion");
            
            response.sendRedirect("../login.jsp");
            } catch (Exception e) {
            }
%>
