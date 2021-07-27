<%@page import="procesosDb.ProcesosEpisodios"%>
<%@page import="entidades.Episodios"%>
<%
    try {
            Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
            String temporada = request.getParameter("temporada");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            Integer duracion = Integer.parseInt(request.getParameter("duracion"));
            
            ProcesosEpisodios procesosEpisodios = new ProcesosEpisodios();
            Episodios episodio = new Episodios();
            
            episodio.setDescripcion(descripcion);
            episodio.setDuracion(duracion);
            episodio.setIdSerie(idSerie);
            episodio.setNombre(nombre);
            episodio.setTemporada(temporada);
            
            procesosEpisodios.AgregarEpisodio(episodio);
            
            response.sendRedirect("../../episodios.jsp?idSerie="+idSerie+"&temporada="+temporada);
            
        } catch (Exception e) {
        }
    
    
%>
