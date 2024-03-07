package Servlets;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EnviarCorreo {
    public static void enviar(String destinatario, String asunto, String cuerpo) {
        final String remitente = "firereports.a.dec.v@gmail.com";
        final String contrasena = "xedl mhga crhu nicv";

        // Configuración de las propiedades de la conexión
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        // Crear una nueva sesión con un autenticador
        Session sesion = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(remitente, contrasena);
            }
        });

        try {
            // Crear un mensaje por defecto
            Message mensaje = new MimeMessage(sesion);
            mensaje.setFrom(new InternetAddress(remitente));
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            mensaje.setSubject(asunto);

            // Cuerpo del correo en HTML
            String cuerpoHtml = "<div style='text-align: center; background-color: #F5DEB3; padding: 50px;'>"
                              + "<h1 style='color: #333;'>Recuperación de contraseña</h1>"
                              + "<p style='color: #555;'>Hemos recibido una solicitud para restablecer tu contraseña. Si no hiciste esta solicitud, puedes ignorar este correo.</p>"
                              + "<p style='color: #555;'>Aquí está tu código de recuperación:</p>"
                              + "<div style='font-size: 24px; color: #333; font-weight: bold; margin: 20px 0;'>" + cuerpo + "</div>"
                              + "<a href='https://www.tusitio.com/recuperar?codigo=" + cuerpo + "' style='background-color: #333; color: #fff; padding: 10px 20px; text-decoration: none;'>Restablecer contraseña</a>"
                              + "</div>";

            mensaje.setContent(cuerpoHtml, "text/html");

            // Enviar el mensaje
            Transport.send(mensaje);

            System.out.println("Correo enviado exitosamente");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
