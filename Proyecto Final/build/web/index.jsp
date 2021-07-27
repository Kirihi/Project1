<%@page import="procesosDb.ProcesosBusqueda"%>
<%@page import="procesosDb.ProcesosCategorias"%>
<%@page import="entidades.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesosDb.ProcesosSeries"%>
<%@page import="entidades.Series"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset= "UTF-8">
    <meta name= "viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="footer, address, phone, icons" />
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:ital,wght@0,400;1,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>Ñequeplay</title>
    <link rel= "stylesheet" href="css/estilos.css">

</head>

<body>
    <%
        if(session.getAttribute("idSesion") == null){
    %>
    
    <header>
            
            <nav class="navbar navbar-dark navbar-expand-lg navSettings bg-secundary" >
                <span class="navbar-brand mb-0 h1 "><a href="index.jsp" style="text-decoration: none; color:white">ÑEQUEPLAY</a></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
          
        <li class="nav-item active">
          <a class="nav-link" href="login.jsp">Iniciar Sesión <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="registrar.jsp">Registrarse</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactenos.jsp">Contactenos</a>
        </li>
        
      </ul>
    </div>
  </nav>
        </header>
    
    <section class="showcase">
         <div class="overlay"></div>
         <div class="text">
        <h2>ÑEQUEPLAY</h2> 
          <p>El mejor sitio web para ver animes, tenemos todos los animes más populares y los más recientes, !QUE ESPERAS SUSCRIBETE YA!, </p>
          <a href="registrar.jsp">REGISTRATE</a>
          <a href="login.jsp">INICIA SESIÓN</a>
         </div>
    </section>
    
    
    <%
        }else{


    %>
    <header>
            <%
            ProcesosCategorias procesosCategorias = new ProcesosCategorias();
            List<Categorias> categorias = procesosCategorias.ListarCategorias();
        %>
            <nav class="navbar navbar-dark navbar-expand-lg navSettings bg-secundary" >
                <span class="navbar-brand mb-0 h1 "><a href="index.jsp" style="text-decoration: none; color:white">ÑEQUEPLAY</a></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Categorias
       </a>
       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
           <%
               for(int i = 0; i<categorias.size(); i++){
           %>
           <a class="dropdown-item" href="categorias.jsp?idCategoria=<%=categorias.get(i).getIdCategorias()%>"><%=categorias.get(i).getNombre()%></a>
         <%
               }
           %>
       </div>
     </li>
        <li class="nav-item active">
          <a class="nav-link" href="administracion.jsp">Administracion<span class="sr-only">(current)</span></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="contactenos.jsp">Contactanos</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="procesos/clog.jsp">Cerrar sesion</a>
        </li>
      </ul>
    </div>
  </nav>
        </header>
    <% 
                    ProcesosSeries procesosSeries = new ProcesosSeries();
                    List<Series> series = new ArrayList<Series>();
                    series = procesosSeries.getAllSeries();
                        %>

    <main>
        <div class="slider">
            <!-- fade css -->
            <div class="myslide">
                <div class="txt">
                    <h1><%=series.get(0).getNombre()%></h1>
                </div>
                <img src="<%=series.get(0).getFondo()%>" style="width: 100%; height: 100%;">
            </div>
            
            <!-- /fade css -->
            
            <% 
                    for(int i=1; i<5; i++){
                        %>
            <div class="myslide fade">
                <div class="txt">
                    <h1><%=series.get(i).getNombre()%></h1>
                </div>
                <img src="<%=series.get(i).getFondo()%>" style="width: 80%; height: 100%;">
            </div>
            <% 
                    }
                        %>
            
            <!-- onclick js -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            
            <div class="dotsbox" style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
            </div>
            <!-- /onclick js -->
        </div>

    </main>
    
    <!--contenedor-->
    
    <div class="container-flux mt-5">
        <div class="row justify-content-center text-center">
            <div class="col-3">
                <form action="index.jsp">

                <div class="input-group mb-3">
                    <form action="index.jsp">
                        <input type="text" class="form-control" placeholder="Buscar serie" aria-label="Recipient's username" aria-describedby="button-addon2" name="nombre">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="bi bi-search"></i></button>
                </div>
                                        </form>
        </div>
        </div>

                
                <%
                    try {  
                        String nombre = request.getParameter("nombre"); 
                        ProcesosBusqueda procesosBusqueda = new ProcesosBusqueda();
                        List<Series> seriesBuscadas = procesosBusqueda.ListarBusqueda(nombre); 
                        for(int i=0; i<seriesBuscadas.size(); i +=5){
                %>
                    
                    <div class="row justify-content-md-center p-2">
                            <div class="col-md-auto">
                                <article class="Anime alt B">
                                    <a href="serie.jsp?idSerie=<%=seriesBuscadas.get(i).getId()%>">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=seriesBuscadas.get(i).getFoto()%>"></figure>
                                  </div>
                                  </a>
                                        <h3 class="Title" style="color: white"><%=seriesBuscadas.get(i).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=seriesBuscadas.get(i).getNombre()%></strong></div>
                                    <p><%=seriesBuscadas.get(i).getDescripcion()%></p>
                                  </div>
                                </article>
                            </div>
                                  
                                  <%
                            if((i + 1) < seriesBuscadas.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=seriesBuscadas.get(i+1).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=seriesBuscadas.get(i+1).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=seriesBuscadas.get(i+1).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=seriesBuscadas.get(i+1).getNombre()%></strong></div>
                                    <p><%=seriesBuscadas.get(i+1).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 2) < seriesBuscadas.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=seriesBuscadas.get(i+2).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=seriesBuscadas.get(i+2).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=seriesBuscadas.get(i+2).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=seriesBuscadas.get(i+2).getNombre()%></strong></div>
                                    <p><%=seriesBuscadas.get(i+2).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 3) < seriesBuscadas.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=seriesBuscadas.get(i+3).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=seriesBuscadas.get(i+3).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=seriesBuscadas.get(i+3).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=seriesBuscadas.get(i+3).getNombre()%></strong></div>
                                    <p><%=seriesBuscadas.get(i+3).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 4) < seriesBuscadas.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=seriesBuscadas.get(i+4).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=seriesBuscadas.get(i+4).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=seriesBuscadas.get(i+4).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=seriesBuscadas.get(i+4).getNombre()%></strong></div>
                                    <p><%=seriesBuscadas.get(i+4).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                                                        </div>
                <%
                        }
                %>
                <hr class="mt-4">

                <%
                        } catch (Exception e) { 
}
                %>
                
                <% 
                    for(int i=0; i<series.size(); i +=5){
                        %>
                        <div class="row justify-content-md-center p-2">
                            <div class="col-md-auto">
                                <article class="Anime alt B">
                                    <a href="serie.jsp?idSerie=<%=series.get(i).getId()%>">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=series.get(i).getFoto()%>"></figure>
                                  </div>
                                  </a>
                                        <h3 class="Title" style="color: white"><%=series.get(i).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=series.get(i).getNombre()%></strong></div>
                                    <p><%=series.get(i).getDescripcion()%></p>
                                  </div>
                                </article>
                            </div>
                
                <%
                            if((i + 1) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=series.get(i+1).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=series.get(i+1).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=series.get(i+1).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=series.get(i+1).getNombre()%></strong></div>
                                    <p><%=series.get(i+1).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 2) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=series.get(i+2).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=series.get(i+2).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=series.get(i+2).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=series.get(i+2).getNombre()%></strong></div>
                                    <p><%=series.get(i+2).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 3) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=series.get(i+3).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=series.get(i+3).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=series.get(i+3).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=series.get(i+3).getNombre()%></strong></div>
                                    <p><%=series.get(i+3).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 4) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <a href="serie.jsp?idSerie=<%=series.get(i+4).getId()%>">
                                <article class="Anime alt B">
                                  <div class="Image fa-play-circle-o">
                                        <figure style="width: 200px;height: 125px;"><img src="<%=series.get(i+4).getFoto()%>"></figure>
                                  </div>
                                  <h3 class="Title" style="color: white"><%=series.get(i+4).getNombre()%></h3>
                                  <div class="Description">
                                    <div class="Title"><strong><%=series.get(i+4).getNombre()%></strong></div>
                                    <p><%=series.get(i+4).getDescripcion()%></p>
                                  </div>
                                </article>
                                  </a>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                                                        </div>


                <% 
                    }
                        %>
<%@include file="footer.jsp" %>
<% 
                    }
                        %>
            </div>
        </div>
    </div>

    
        
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
