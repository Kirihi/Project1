<%@page import="entidades.Episodio"%>
<%@page import="java.util.Arrays"%>
<%@page import="entidades.Series"%>
<%@page import="dto.NuevaSerieDTO"%>
<%@page import="procesosDb.ProcesosSeries"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    try {
            //informacion de la serie
            String nombre = request.getParameter("nombre");
            String fotoUrl = request.getParameter("foto");
            String fondoUrl = request.getParameter("fondo");
            String descripcion = request.getParameter("descripcion");

            //informacion de las categorias
            //como me llegan un arreglo de String, tengo que almacenarlo en un arreglo 
            //de numeros y convertir los caracteres a numeros
            List<Integer> categorias= new ArrayList<Integer>();
            String[] categoriasString = request.getParameterValues("categoria"); 
            for(int i = 0; i<categoriasString.length; i++){
                categorias.add(Integer.parseInt(categoriasString[i]));
            }
            
            //informacion de los episodios
            String[] nombreString = request.getParameterValues("nombre_episodio");
            String[] duracionString = request.getParameterValues("duracion_episodio");

            List<String> nombreEpisodios = Arrays.asList(nombreString);
            List<Integer> duracionEpisodios = new ArrayList<Integer>();
            List<Integer> cantidadEpisodios = new ArrayList<Integer>();


            for(int i=0; i<duracionString.length; i++){
                duracionEpisodios.add(Integer.parseInt(duracionString[i]));
                cantidadEpisodios.add(i+1);
            }
            
            
            //se hace el proceso de creacion del dto
            ProcesosSeries procesosSerie = new ProcesosSeries();
            NuevaSerieDTO serieDTO = new NuevaSerieDTO();
            Series serie = new Series();
            Episodio episodios = new Episodio();
            
            serie.setFoto(fotoUrl);
            serie.setDescripcion(descripcion);
            serie.setNombre(nombre);
            serie.setFondo(fondoUrl);
            
            episodios.setNombre(nombreEpisodios);
            episodios.setEpisodio(cantidadEpisodios);
            episodios.setDuracion(duracionEpisodios);

            serieDTO.setSerie(serie);
            serieDTO.setCategorias(categorias);
            serieDTO.setEpisodios(episodios);
            
            
            //se manda el dto
            procesosSerie.CrearSerie(serieDTO);
            
            response.sendRedirect("../../administracion.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("../../index.jsp");
        }
    
    

%>