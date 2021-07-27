<%@page import="procesosDb.ProcesosEpisodios"%>
<%
    try {
            
        Integer idEpisodio = Integer.parseInt(request.getParameter("idEpisodio"));
        Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
        Integer temporada = Integer.parseInt(request.getParameter("temporada"));
        
        ProcesosEpisodios procesosEpisodios = new ProcesosEpisodios();

        procesosEpisodios.EliminarEpisodio(idEpisodio);
        
        response.sendRedirect("../../episodios.jsp?idSerie="+idSerie+"&temporada="+temporada);
                
        } catch (Exception e) {
        }
%>
