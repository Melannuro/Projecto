<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresa el código de verificación</title>
    </head>
    <body>
        <%
            // Comprobar si la sesión contiene los atributos "codigo" y "correo"
            if (session.getAttribute("codigo") != null && session.getAttribute("correo") != null) {
        %>
            <form action="VerificarCodigo" method="post">
                <label for="codigo">Código de verificación:</label>
                <input type="number" id="codigo" name="codigo" required>
                <input type="submit" value="Verificar código">
            </form>
        <%
            } else {
                // Si la sesión no contiene los atributos "codigo" y "correo", redirigir al usuario a index.html
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
