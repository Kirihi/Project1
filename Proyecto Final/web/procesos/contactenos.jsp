<%@page import="procesosDb.ProcesosContactos"%>
<%@page import="entidades.Contacto"%>
<%
    try {
            String nombreContacto = request.getParameter("nombre_contacto");
        String correoContacto = request.getParameter("correo_contacto");
        String tipo = request.getParameter("escoger");
        String asunto = request.getParameter("asunto_contacto");
        String mensaje = request.getParameter("message");

        Contacto contacto = new Contacto();
        ProcesosContactos procesosContacto = new ProcesosContactos();

        contacto.setAsunto(asunto);
        contacto.setCorreoContacto(correoContacto);
        contacto.setMensaje(mensaje);
        contacto.setNombreContacto(nombreContacto);
        contacto.setTipo(tipo);
        
        procesosContacto.recibirMensaje(contacto);
        
        response.sendRedirect("../index.jsp");
        
        } catch (Exception e) {
        }

%>
