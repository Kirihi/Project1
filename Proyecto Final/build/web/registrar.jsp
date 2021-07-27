<html>
<head>
    <link href="css/registrar.css" rel="stylesheet" />
    <title>�EQUEPLAY | Crear Cuenta</title>
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
                <H2>CREAR CUENTA</H2>
                <form action="procesos/reg.jsp" method="POST">
                    <label class="label">Correo electr�nico</label><br>
                    <input type="email" name=email  class="inputUsuario" required placeholder="ejemplo@ejemplo.com">
                    <br>
                    <br>
                    <label class="label">Contrase�a</label><br>
                    <input type="password" name=pass class="inputContrase�a" required placeholder="***********">
                    <br>
                    <br>
                    <input type="submit" value="Crear Cuenta" class="boton">
                    <div class="enlaces">
                    <p class="noTengo">�Ya tienes cuenta? <a href="#"><span>Iniciar sesi�n</span></a>
                </form>
            </div>
        </section>
    </section>
</body>
    </html>