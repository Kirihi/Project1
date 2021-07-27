<%@page import="java.util.List"%>
<%@page import="entidades.Categorias"%>
<%@page import="procesosDb.ProcesosCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:ital,wght@0,400;1,600&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #141414">
        
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
            Integer idSerie = Integer.parseInt(request.getParameter("idSerie"));
            Integer temporada = Integer.parseInt(request.getParameter("temporada"));
        %>
        
        <form action="procesos/crud/agregar-episodio.jsp">
            <div class="container mt-4" style="background-color: #3d3d3d"> 
                <div class="row justify-content-md-center text-center pt-4" hidden>
                    <div class="input-group mb-4">
                        <span class="input-group-text" id="inputGroup-sizing-default">ID</span>
                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="idSerie" value="<%=idSerie%>">
                    </div>
                </div>
                
                <div class="row justify-content-md-center text-center pt-4" hidden>
                    <div class="input-group mb-4">
                        <span class="input-group-text" id="inputGroup-sizing-default">Temporada</span>
                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="temporada" value="<%=temporada%>">
                    </div>
                </div>
                
                <div class="row justify-content-md-center text-center pt-4">
                    <div class="col-sm-3">
                        <p class="fs-4" style="color:white">Agregar episodio</p>
                    </div>
                </div>
                
                <div class="row justify-content-md-center pt-4">
                    <div class="col-sm-3">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="nombre">
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-md-center pt-4 pb-4">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-text">Descripcion</span>
                            <textarea class="form-control" aria-label="With textarea" rows='4' name="descripcion"></textarea>
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-md-center pt-4 pb-4">
                    <div class="col-sm-2">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">Duracion</span>
                            <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="duracion">
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-md-center pt-4 pb-4">
                    
                    <div class="col-sm-auto">
                        <button type="submit" class="btn btn-success">Guardar</button>    
                    </div>
                    
                    <div class="col-sm-auto">
                        <a href="episodios.jsp?idSerie=<%=idSerie%>&temporada=<%=temporada%>">
                            <button type="button" class="btn btn-danger">Cancelar</button>
                        </a>
                    </div>
                </div>
            </div>
        </form>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/episodios.js"></script>
    </body>
</html>


<%@include file="footer.jsp" %>