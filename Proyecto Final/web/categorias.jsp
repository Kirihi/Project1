<%@page import="entidades.Series"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Categorias"%>
<%@page import="procesosDb.ProcesosCategorias"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
          <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:ital,wght@0,400;1,600&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
  <link rel="stylesheet" type="text/css" href="css/categorias.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <title>Categorías</title>
</head>

<body style="background-color: #141414">
    
    <header>
            <%
            ProcesosCategorias procesosCategoriasDos = new ProcesosCategorias();
            List<Categorias> categoriasDos = procesosCategoriasDos.ListarCategorias();
        %>
            <nav class="navbar navbar-dark navbar-expand-lg navSettings bg-secundary" >
                <span class="navbar-brand mb-0 h1 "><a href="index.jsp" style="text-decoration: none; color:white">ÑEQUEPLAY</a></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
         Categorias
       </a>
       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
           <%
               for(int i = 0; i<categoriasDos.size(); i++){
           %>
           <a class="dropdown-item" href="categorias.jsp?idCategoria=<%=categoriasDos.get(i).getIdCategorias()%>"><%=categoriasDos.get(i).getNombre()%></a>
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
        Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        ProcesosCategorias procesosCategorias = new ProcesosCategorias();
        Categorias categoria = procesosCategorias.obtenerCategoria(idCategoria);
        List<Series> series = procesosCategorias.BuscarPorId(idCategoria);
    %>
  <div class="Body">
    <div class="Container">
      <div class="Title Page fa-star B12" >
        <h1 style="color: white">Animes de <%=categoria.getNombre()%></h1>
      </div>
      <main class="Main">
        <ul class="ListAnimes AX Rows A03 C02 D02">

            <%
                for(int i = 0; i<series.size(); i++){
            %>
            <li>
              <article class="Anime alt B">
                  <a href="serie.jsp?idSerie=<%=series.get(i).getId()%>">
                <div class="Image fa-play-circle-o">
                      <figure><img src="<%=series.get(i).getFoto()%>" ></figure>
                </div>
                <h3 class="Title"><%=series.get(i).getNombre()%></h3>
                <div class="Description">
                  <div class="Title"><strong><%=series.get(i).getNombre()%></strong></div>
                  <p><%=series.get(i).getDescripcion()%></p>
                </div>
                </a>
              </article>
            </li>
            
            <%
                }
            %>
        </ul>>
      </main>
          </div>
        <script src="js/creacion-episodios.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
<%@include file="footer.jsp" %>