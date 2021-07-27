<%@page import="procesosDb.ProcesosEpisodios"%>
<%
    
    try {
            
        Integer temporada = Integer.parseInt(request.getParameter("temporada"));
        Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
        
        ProcesosEpisodios procesosEpisodios = new ProcesosEpisodios();
        
        procesosEpisodios.EliminarTemporada(temporada, idSerie);
        
        response.sendRedirect("../../actualizar-serie.jsp?id="+idSerie);
    
        
        } catch (Exception e) {
        }
%>
