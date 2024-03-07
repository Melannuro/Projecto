/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VerificarCodigo")
public class VerificarCodigo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Comprobar si la sesión contiene los atributos "codigo" y "correo"
        if (request.getSession().getAttribute("codigo") != null && request.getSession().getAttribute("correo") != null) {
            int codigoIngresado = Integer.parseInt(request.getParameter("codigo"));
            int codigoGuardado = (int) request.getSession().getAttribute("codigo");
            
            if (codigoIngresado == codigoGuardado) {
                // Si los códigos coinciden, redirigir a la página para cambiar la contraseña
                response.sendRedirect("cambiar_contrasenia.jsp");
            } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                    response.getWriter().println("alert('El código de verificación es incorrecto.');");
response.getWriter().println("window.location.href = 'ingresar_codigo.jsp';"); // AQUI VA EL RELOAD
                    response.getWriter().println("</script>");
            }
        } else {
            // Si la sesión no contiene los atributos "codigo" y "correo", redirigir al usuario a index.html
            response.sendRedirect("index.html");
        }
    }
}

