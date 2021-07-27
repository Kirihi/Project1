<%@page import="procesosDb.ProcesosUsuarios"%>
<%@page import="entidades.Usuarios"%>
<% 

    try{
        
        String correo = request.getParameter("email");
        String contrasena = request.getParameter("pass");

        ProcesosUsuarios procesosUsuarios = new ProcesosUsuarios();
        Usuarios usuario = new Usuarios();
        
        usuario.setContrasena(contrasena);
        usuario.setCorreo(correo);
        
        Usuarios usuarioDB = procesosUsuarios.ValidarUsuarios(usuario);
        
        if(usuarioDB != null){
            session.setAttribute("idSesion", usuarioDB.getIdUsuario());
            session.setAttribute("correoSesion", usuarioDB.getCorreo());
            session.setAttribute("contrasenaSesion", usuarioDB.getContrasena());
            session.setAttribute("admin", usuarioDB.getAdmin());

            response.sendRedirect("../index.jsp");
        }
        
    }catch(Exception e){
        System.out.println("Exception: " + e);
        response.sendRedirect("../index.jsp");
    }
    
%>