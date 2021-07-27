<%@page import="procesosDb.ProcesosSeries"%>
<%@page import="entidades.Series"%>
<%
    try {
            Integer idSerie = Integer.parseInt(request.getParameter("id"));
            String nombreNuevo = request.getParameter("nombre");
            String descripcionNueva = request.getParameter("descripcion");
            String fotoNueva = request.getParameter("foto");
            String fondoNueva = request.getParameter("fondo");

            ProcesosSeries procesosSeries = new ProcesosSeries();
            Series serie = new Series();

            serie.setNombre(nombreNuevo);
            serie.setDescripcion(descripcionNueva);
            serie.setFoto(fotoNueva);
            serie.setId(idSerie);
            serie.setFondo(fondoNueva);
            
            procesosSeries.ActualizarSerie(serie);
            
            response.sendRedirect("../../actualizar-serie.jsp?id="+idSerie);
        } catch (Exception e) {
        }
%>