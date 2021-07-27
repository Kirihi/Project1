<%@page import="entidades.Usuarios"%>
<%@page import="procesosDb.ProcesosUsuarios"%>
<% 
    
    try{
        String correo = request.getParameter("email");
        String contrasena = request.getParameter("pass");

        ProcesosUsuarios procesos = new ProcesosUsuarios();

        Usuarios usuarios = new Usuarios();

        usuarios.setCorreo(correo);
        usuarios.setContrasena(contrasena);
        
        procesos.GuardarUsuario(usuarios);
        response.sendRedirect("../login.jsp");
        

    }catch(Exception e){
        System.out.println("Excepcion: " + e);
    }
    
%>
    