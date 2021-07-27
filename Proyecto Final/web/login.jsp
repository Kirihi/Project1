<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�EQUEPLAY | Iniciar Sesi�n</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/sign_in.css">
</head>

<body>
    <section class="contenedor">
        <section class="contenedorTitulo">
            <div class="titulo">
                <img src="icono.svg" alt="">
                <h1>�EQUEPLAY</h1>
            <div>
        </section>
        <section class="contenedorFormulario">
            <div class="formulario">
                <H2>INICIAR SESI�N</H2>
                <form action="procesos/log.jsp" method="POST">
                    <label class="label">Correo electr�nico</label><br>
                    <input type="email" name=email  class="inputUsuario" required placeholder="ejemplo@ejemplo.com">
                    <br>
                    <br>
                    <label class="label">Contrase�a</label><br>
                    <input type="password" name=pass class="inputUsuario" required placeholder="***********">
                    <br>
                    <br>
                    <input type="submit" value="Iniciar Sesi�n" class="boton">
                    <div class="enlaces">
                    <p class="noTengo">�No tienes cuenta? <a href="registrar.jsp"><span>Crea una cuenta</span></a>
                    </div>
                    </div>
                </form>
            </div>
        </section>
    </section>
</body>
</html>
