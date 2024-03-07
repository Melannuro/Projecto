package Servlets;

import Clasesita.Conectadita;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/RecuperarContrasenia")
public class RecuperarContrasenia extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        
        // Conexión a la base de datos
        Conectadita conecta = new Conectadita();
        Connection cnx = conecta.getConectarDB();
        
        // Buscar el correo en la base de datos
        String querystring = "SELECT correo_tec FROM tecnicos WHERE correo_tec = ?";
        PreparedStatement pstatement = null;
        try {
            pstatement = cnx.prepareStatement(querystring);
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            pstatement.setString(1, correo);
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        ResultSet res = null;
        try {
            res = pstatement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            // Si el correo existe en la base de datos
            if (res.next()) {
            // Generar un número aleatorio
            int codigo = (int)(Math.random() * 9000) + 1000;  // Genera un número de 4 dígitos
            
            // Guardar el código en la sesión
            request.getSession().setAttribute("codigo", codigo);
    request.getSession().setAttribute("correo", correo);
            
            // Llamar a la función enviar de la clase EnviarCorreo
            EnviarCorreo.enviar(correo, "Recuperar contraseña", "Tu código de verificación es: " + codigo);
            
            // Redirigir a la página para ingresar el código
            response.sendRedirect("ingresar_codigo.jsp");
            } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('El correo electrónico no existe en nuestra base de datos.');");
response.getWriter().println("window.location.href = 'recuperarInspector.jsp';"); // AQUI VA EL RELOAD
                response.getWriter().println("</script>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            res.close();
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            pstatement.close();
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            cnx.close();
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasenia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
