/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clasesita.Conectadita;

@WebServlet("/CambiarContrasenia")
public class CambiarContrasenia extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("codigo") != null && request.getSession().getAttribute("correo") != null) {
            String contrasenia = request.getParameter("contrasenia");
            String confirmar = request.getParameter("confirmar");

            if (contrasenia != null && confirmar != null && contrasenia.equals(confirmar)) {
                try (Connection cnx = new Conectadita().getConectarDB(); PreparedStatement pstatement = cnx.prepareStatement("UPDATE `tecnicos` SET `contrasenia_tec` = ? WHERE `tecnicos`.`correo_tec` = ?")) {
                    pstatement.setString(1, contrasenia);
                    pstatement.setString(2, (String) request.getSession().getAttribute("correo"));
                    pstatement.executeUpdate();
                    int rowsUpdated = pstatement.executeUpdate();
                    if (rowsUpdated > 0) {
                        response.getWriter().println("<script type=\"text/javascript\">");
                        response.getWriter().println("alert('La contraseña se actualizó correctamente.');");
                        response.getWriter().println("window.location.href='" + request.getContextPath() + "/Clasesita/CerrarSesionServlet';");
                        response.getWriter().println("</script>");
                    } else {
                        response.getWriter().println("<script type=\"text/javascript\">");
                        response.getWriter().println("alert('No se encontró ningún registro para actualizar.');");
response.getWriter().println("window.location.href = 'cambiar_contrasenia.jsp';"); // AQUI VA EL RELOAD
                        response.getWriter().println("</script>");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CambiarContrasenia.class.getName()).log(Level.SEVERE, "Error al cambiar la contraseña", ex);
                    response.getWriter().println("<script type=\"text/javascript\">");
                    response.getWriter().println("alert('Error al cambiar la contraseña.');");
response.getWriter().println("window.location.href = 'cambiar_contrasenia.jsp';"); // AQUI VA EL RELOAD
                    response.getWriter().println("</script>");
                }
            } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('Las contraseñas no coinciden.');");
response.getWriter().println("window.location.href = 'cambiar_contrasenia.jsp';"); // AQUI VA EL RELOAD
                response.getWriter().println("</script>");
            }
        } else {
            // Si la sesión no contiene los atributos "codigo" y "correo", redirigir al usuario a index.html
            response.sendRedirect("index.html");
        }
    }
}
