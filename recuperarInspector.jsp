<%-- 
    Document   : recuperarInspector
    Created on : 23 feb 2024, 23:00:37
    Author     : artur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
    </head>
    <body>
        <form action="RecuperarContrasenia" method="post">
            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>
            <input type="submit" value="Recuperar contraseña">
        </form>
    </body>
</html>
