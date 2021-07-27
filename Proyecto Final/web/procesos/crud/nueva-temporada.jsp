<%@page import="entidades.Episodio"%>
<%@page import="procesosDb.ProcesosSeries"%>
<%@page import="dto.NuevaTemporadaDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    try {
            Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
            Integer temporada = Integer.parseInt(request.getParameter("temporada"));
            
            String[] nombreString = request.getParameterValues("nombre_episodio");
            String[] duracionString = request.getParameterValues("duracion_episodio"); 
            
            List<String> nombreEpisodios = Arrays.asList(nombreString);
            List<Integer> duracionEpisodios = new ArrayList<Integer>();
            List<Integer> cantidadEpisodios = new ArrayList<Integer>();
            
            for(int i=0; i<duracionString.length; i++){
                duracionEpisodios.add(Integer.parseInt(duracionString[i]));
                cantidadEpisodios.add(i+1);
            }
            
            NuevaTemporadaDTO nuevaTemporada = new NuevaTemporadaDTO();
            ProcesosSeries procesosSeries = new ProcesosSeries();
            Episodio episodios = new Episodio();
            
            episodios.setNombre(nombreEpisodios);
            episodios.setEpisodio(cantidadEpisodios);
            episodios.setDuracion(duracionEpisodios);
            
            nuevaTemporada.setEpisodios(episodios);
            nuevaTemporada.setIdSerie(idSerie);
            nuevaTemporada.setTemporada(temporada);
            
            procesosSeries.CrearTemporada(nuevaTemporada);
            
            response.sendRedirect("../../actualizar-serie.jsp?id="+idSerie);
            
        } catch (Exception e) {
        }
%>