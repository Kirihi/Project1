<%@page import="entidades.Categorias"%>
<%@page import="procesosDb.ProcesosCategorias"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Series"%>
<%@page import="procesosDb.ProcesosBusqueda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion</title>
                    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:ital,wght@0,400;1,600&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
               String admin = (String)session.getAttribute("admin");
               if(admin.equalsIgnoreCase("s")){
           %>
       
        <div class="container-md mt-4" style="background-color: #3d3d3d">
            <div class="row justify-content-md-center pt-4 pb-2">
                <div class="col-md-auto">
                    <h1 style="color: white">Agregar Serie</h1>
                </div>
            </div>
            <div class="row justify-content-md-center pb-4">
                <div class="col-md-auto">
                    <a href="nueva-serie.jsp">
                        <button type="button" class="btn" style="color:black; background-color: #dbdbdb">
                            Nueva serie
                        </button>
                    </a>
                </div>
            </div>
            <div class="row text-center pt-4">
                <div class="col">
                    <h1 style="color: white">Editar</h1>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <form action="administracion.jsp">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Nombre de la serie" aria-label="Recipient's username" aria-describedby="button-addon2" name="nombre">
                            <button class="btn btn-outline-secondary btn-info" type="submit" id="button-addon2" style="background-color: #dbdbdb"><i class="bi bi-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            
            <% 
                try {
                    String search = request.getParameter("nombre");
                    ProcesosBusqueda procesosBusqueda = new ProcesosBusqueda();
                    List<Series> series = procesosBusqueda.ListarBusqueda(search);
                    for(int i=0; i<series.size(); i +=3){
                        %>
                        
                        <div class="row justify-content-md-center p-2">
                            <div class="col-md-auto">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="<%=series.get(i).getFoto()%>">
                                    <div class="card-body text-center">
                                      <h5 class="card-title"><%=series.get(i).getNombre()%></h5>
                                      <a href="actualizar-serie.jsp?id=<%=series.get(i).getId()%>" class="btn btn-primary"><i class="bi bi-pencil"></i></a>
                                    </div>
                                </div>
                            </div>
                            
                            <%
                            if((i + 1) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="<%=series.get(i+1).getFoto()%>">
                                    <div class="card-body text-center">
                                        <h5 class="card-title"><%=series.get(i+1).getNombre()%></h5>
                                        <a href="actualizar-serie.jsp?id=<%=series.get(i+1).getId()%>" class="btn btn-primary"><i class="bi bi-pencil"></i></a>
                                    </div>
                                </div>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                            <%
                            if((i + 2) < series.size()){
                                %>
                                
                            <div class="col-md-auto">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="<%=series.get(i+2).getFoto()%>">
                                    <div class="card-body text-center">
                                        <h5 class="card-title"><%=series.get(i+2).getNombre()%></h5>
                                        <a href="actualizar-serie.jsp?id=<%=series.get(i+2).getId()%>" class="btn btn-primary"><i class="bi bi-pencil"></i></a>
                                    </div>
                                </div>
                            </div>
                                
                                <%
                            }
                                
                            %>
                            
                        </div>
                        
                        
                        <%
                    }
                }catch (Exception e) {
                    }
            %> 
        </div>
        
        
            <%
                Integer sesion = (int)(session.getAttribute("idSesion"));
                String correo = (String)session.getAttribute("correoSesion");
                String contrasena = (String)session.getAttribute("contrasenaSesion");

            %>
        <div class="container-md mt-4 pt-4" style="background-color: #3d3d3d">
                <div class="row justify-content-md-center pt-4" >
                <div class="col-md-auto">
                    <h1 style="color:white">Actualizacion de usuario</h1>
                </div>
            </div>
                
            <div class="row justify-content-md-center pt-4" >
                        <div class="col-md-auto" hidden>
                                            <form action="procesos/actualizar-correo.jsp">

                        <div class="form-group text-center">
                            <div class="input-group mb-4">
                                        <span class="input-group-text" id="inputGroup-sizing-default">idUsuario</span>
                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="idUsuario" required value="<%=sesion%>">
                            </div>
                        </div>
                        </div>
                    
                    <div class="col-md-4">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Correo</span>
                            <input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="correo" required value="<%=correo%>">
                </div>
            </div>
                </div>
                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-info">Actualizar</button>
                                        </form>
                                    </div>
            </div>
            
            <div class="row justify-content-md-center">
                <div class="col-md-auto" hidden>
                    <form action="procesos/actualizar-contrasena.jsp">
                        <div class="form-group text-center">
                            <div class="input-group mb-4">
                                        <span class="input-group-text" id="inputGroup-sizing-default">idUsuario</span>
                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="idUsuario" required value="<%=sesion%>">
                            </div>
                        </div>
                        </div>
                
                <div class="col-md-4">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Contrasena</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="contrasena" required value="<%=contrasena%>">
                    </div>
                </div>
            </div>
                </div>
                    <div class="col-md-2">
                        <a href="procesos/actualizar-usuario.jsp?">
                                        <button type="submit" class="btn btn-info">Actualizar</button>
                        </a>
                                                        </form>

                                    </div>

            </div>
        </div>
                    
                    
                    
                    <%
               }else{
 Integer sesion = (int)(session.getAttribute("idSesion"));
                String correo = (String)session.getAttribute("correoSesion");
                String contrasena = (String)session.getAttribute("contrasenaSesion");
           %>
           <div class="container-md mt-4 pt-4" style="background-color: #3d3d3d">
                <div class="row justify-content-md-center pt-4" >
                <div class="col-md-auto">
                    <h1 style="color:white">Actualizacion de usuario</h1>
                </div>
            </div>
                
            <div class="row justify-content-md-center pt-4" >
                        <div class="col-md-auto" hidden>
                                            <form action="procesos/actualizar-correo.jsp">

                        <div class="form-group text-center">
                            <div class="input-group mb-4">
                                        <span class="input-group-text" id="inputGroup-sizing-default">idUsuario</span>
                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="idUsuario" required value="<%=sesion%>">
                            </div>
                        </div>
                        </div>
                    
                    <div class="col-md-4">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Correo</span>
                            <input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="correo" required value="<%=correo%>">
                </div>
            </div>
                </div>
                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-info">Actualizar</button>
                                        </form>
                                    </div>
            </div>
            
            <div class="row justify-content-md-center">
                <div class="col-md-auto" hidden>
                    <form action="procesos/actualizar-contrasena.jsp">
                        <div class="form-group text-center">
                            <div class="input-group mb-4">
                                        <span class="input-group-text" id="inputGroup-sizing-default">idUsuario</span>
                                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="idUsuario" required value="<%=sesion%>">
                            </div>
                        </div>
                        </div>
                
                <div class="col-md-4">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Contrasena</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="contrasena" required value="<%=contrasena%>">
                    </div>
                </div>
            </div>
                </div>
                    <div class="col-md-2">
                        <a href="procesos/actualizar-usuario.jsp?">
                                        <button type="submit" class="btn btn-info">Actualizar</button>
                        </a>
                                                        </form>

                                    </div>

            </div>
        </div>
               <%

}
           %>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
<%@include file="footer.jsp" %>