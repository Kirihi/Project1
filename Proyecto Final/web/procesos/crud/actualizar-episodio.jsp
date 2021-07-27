<%@page import="procesosDb.ProcesosEpisodios"%>
<%@page import="entidades.Episodios"%>
<%
    try {
        
        Integer idEpisodio = Integer.parseInt(request.getParameter("idEpisodio"));
        Integer duracion = Integer.parseInt(request.getParameter("duracion"));
        String nombre = request.getParameter("nombre");
        Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
        Integer temporada = Integer.parseInt(request.getParameter("temporada"));


        Episodios episodio = new Episodios();


        episodio.setDuracion(duracion);
        episodio.setNombre(nombre);
        episodio.setIdEpisodio(idEpisodio);
        
        ProcesosEpisodios procesosEpisodios = new ProcesosEpisodios();
        procesosEpisodios.ActualizarEpisodios(episodio);
        
        response.sendRedirect("../../episodios.jsp?idSerie="+idSerie+"&temporada="+temporada);
        
        } catch (Exception e) {
        }
    
%>