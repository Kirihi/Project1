<%@page import="entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="procesosDb.ProcesosCategorias"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
                    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:ital,wght@0,400;1,600&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>Nueva Serie</title>


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
    
    <div class="container mt-4" style="background-color: #3d3d3d">
        <div class="row p-4">
            <div class="col-sm-12 text-center">
                <h1 style="color: white">Agregar serie</h1>
            </div>
        </div>
        <form action="procesos/crud/nueva.jsp" method="post">
            <div class="row justify-content-center">
                <div class="col-sm-3">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="nombre" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-4">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                            <div class="input-group">
                                <span class="input-group-text">Descripcion</span>
                                <textarea class="form-control" aria-label="With textarea" rows="7" name="descripcion"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-auto">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Imagen</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="foto" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-auto">
                    <div class="form-group text-center">
                        <div class="input-group mb-4">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="inputGroup-sizing-default">Fondo</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="fondo" required>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-auto">
                    <div class="form-group text-center">
                        <p class="fs-4" style="color: white">Categorias</p>
                        
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="1" name="categoria">Accion</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="2" name="categoria">Drama</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="8" name="categoria">Fantasía</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="9" name="categoria">Shounen</label>
                        <label class="checkbox-inline" style="color: white"<input type="checkbox" value="10" name="categoria">Superpoderes</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="11" name="categoria">Sobrenatural</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="12" name="categoria">Histórico</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="13" name="categoria">Gore</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="14" name="categoria">Aventuras</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="15" name="categoria">Comedia</label>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-sm-auto">
                    <div class="form-group text-center">
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="16" name="categoria">Artes Marciales</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="17" name="categoria">Infantil</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="18" name="categoria">Ecchi</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="19" name="categoria">Ciencia Ficción</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="20" name="categoria">Misterio</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="21" name="categoria">Terror</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="22" name="categoria">Psicológico</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="23" name="categoria">Recuentos de la vida</label>
                        <label class="checkbox-inline" style="color: white"><input type="checkbox" value="24" name="categoria">Escolares</label>

                    </div>
                </div>
            </div>
                <div class="row justify-content-center text-center mt-4">
                        <div class="col-md-auto">
                            <p class="m-4 fs-4" style="color: white">Episodios</p>
                        </div>
                </div>

                <div class="row justify-content-center text-center mb-3 align-items-center" id="fila">
                    <div class="col-sm-3">
                        <label for="nombre_episodio" class="fs-5" style="color: white">Nombre</label>
                        <input type="text" class="form-control" id="nombre_episodio" name="nombre_episodio" required>
                    </div>


                    <div class="col-sm-1">
                        <label for="duracion_episodio" class="fs-5" style="color: white">Duracion</label>
                        <input type="number" class="form-control" id="nombre_episodio" name="duracion_episodio" required>
                    </div>

                    <div class="col-sm-1"></div>
                </div>

            <div class="row justify-content-center text-center">
                <div class="col-sm-2">
                    <button type="button" class="m-4" onclick="agregarEpisodio()">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                </div>
            </div>
            
            <div class="row justify-content-center text-center mb-3">
                <div class="col-sm-2">
                    <button type="submit" class="btn btn-default bg-success m-4">Aceptar</button>
                </div>
                
                <div class="col-sm-2">
                    <a href="administracion.jsp">
                        <button type="button" class="btn btn-default bg-danger m-4">Cancelar</button>
                    </a>
                </div>
            </div>

            
        </form>
    </div>
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/episodios.js"></script>
</body>
</html>

<%@include file="footer.jsp" %>