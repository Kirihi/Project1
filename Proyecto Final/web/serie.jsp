<%@page import="procesosDb.ProcesosCategorias"%>
<%@page import="entidades.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="procesosDb.ProcesosEpisodios"%>
<%@page import="entidades.Episodios"%>
<%@page import="entidades.Series"%>
<%@page import="procesosDb.ProcesosSeries"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ÑEQUEPLAY | Kindom 3ed Season</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/descripcion.css">
    <link rel="stylesheet" href="css/styles.css">

</head>
<body>
<% 
    Integer serieId = Integer.parseInt(request.getParameter("idSerie"));
    ProcesosSeries procesosSeries = new ProcesosSeries();
    Series serie = procesosSeries.ObtenerInformacion(serieId);
    List<Episodios> episodios = new ArrayList<Episodios>();
    ProcesosEpisodios procesosEpisodios = new ProcesosEpisodios();
    episodios = procesosEpisodios.ListarEpisodios(serieId);
    ProcesosCategorias procesosCategoriasDos = new ProcesosCategorias();
    List<Categorias> categoriasSerie = procesosCategoriasDos.BuscarEnSerie(serieId);
%>
        <article class="Tpost serie single">
                <section class="Banner">
                    <img src="<%=serie.getFondo()%>" alt="Background">
                    <div class="filtr"></div>
                </section>
                <div class="container">
                    <br>
                    <br>
                        <div class="row mt-2">
                            <div class="col-sm-3 pr-4 justify-content-center text-center">
                                <div class="Image">
                                    <figure>
                                        <img src="<%=serie.getFoto()%>" alt="" width="200px" height="250px"> 
                                    </figure>
                                </div> 
                            </div>
                                    
                            <div class="col-sm-9 justify-content-center text-center">
                                <h1 class="Title"><%=serie.getNombre()%></h1>
                                <div class="Description">
                                    <p>"<%=serie.getDescripcion()%>"</p>
                                </div>
                                <div class="generos">
                                    <%
                                        for(int i = 0; i<categoriasSerie.size(); i++){
                                    %>
                                    <a class="btnWeb" href="categorias.jsp?idCategoria=<%=categoriasSerie.get(i).getIdCategorias()%>"><%=categoriasSerie.get(i).getNombre()%></a>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>

                        </div>
                </div>
            </section>
            <div class="mt-2">
                <div class="row">
                    <div class="col-12 col-sm-12 col-lg-10">
                        <br>
                        <h2 class="Title-Serie">Listado de Capitulos</h2>
                        <br>
                        <div class="SerieCaps">
                            <%
                                for(int i = 0; i<episodios.size(); i++){
                                  
                            %>
                            <hr>
                            <a class="item" href="">
                                Temporada: <%=episodios.get(i).getTemporada()%>, <%=episodios.get(i).getNombre()%>
                            </a>
                            <%
                                }
                            %>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>   
        </article>
</body>
</html>

<%@include file="footer.jsp" %>
                            
