<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contáctenos</title>
        <link rel="stylesheet" href="css/contactenos.css">
    </head>
    
    <body>
        <main>
            <h2>Contáctenos</h2>
            <form name="form" action="procesos/contactenos.jsp">
                <div class="form-group">
                    <label>Nombre completo:</label>
                    <input type="text" name="nombre_contacto" class="form-control" required>
                    <br>
                    <label>Correo electrónico:</label>
                    <input type="email" name="correo_contacto" class="form-control" required>
                    <br>
                    <label>Tipo de contacto</label>
                    <select name="escoger" class="select-control" required>
                    <option hidden selected></option>
                    <option value="consulta">Consulta</option>
                    <option value="queja">Queja</option>
                    <option value="sugerencia">Sugerencia</option>
                    <option value="otros">Otros</option>
                    </select>
                    <br>
                    <label>Asunto:</label>
                    <input type="text" name="asunto_contacto" class="form-control" required>
                    <br>
                    <label>Descripcion:</label>
                    <textarea name="message" rows="10" cols="50" class="textarea-control" required placeholder="Escriba su mensaje aquí"></textarea>
                    <br>
                    <input type="submit" value="Enviar" class="btn">                    
                </div>
            </form>
        </main>
    </body>
</html>