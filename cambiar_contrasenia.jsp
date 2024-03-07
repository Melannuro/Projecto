<%-- 
    Document   : cambiar_contrasenia
    Created on : 24 feb 2024, 00:02:06
    Author     : artur
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Contraseña</title>
    </head>
    
    <body>
        <%
            // Comprobar si la sesión contiene los atributos "codigo" y "correo"
            if (session.getAttribute("codigo") != null && session.getAttribute("correo") != null) {
        %>
        <h1>Introduce tu nueva contraseña</h1>
        <form action="CambiarContrasenia" method="post">
            <label for="contrasenia">Nueva contraseña:</label>
            <input type="password" id="contrasenia" name="contrasenia" required>
            <label for="confirmar">Confirma tu contraseña:</label>
            <input type="password" id="confirmar" name="confirmar" required>
            <input type="submit" value="Cambiar contraseña">
        </form>
        <%
            } else {
                // Si la sesión no contiene los atributos "codigo" y "correo", redirigir al usuario a index.html
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
