        <%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CHECKLIST.css">
        <title>JSP Page</title>
    </head>
    
     
        <div class="nombre_check-container">
        <button class="nombre_check">RISER</button>
        </div>
    
    <body>
         <%
            if (session.getAttribute("Nombre") != null && session.getAttribute("Correo") != null) {
    String tecnico = (String) session.getAttribute("Nombre");
    String correo = (String) session.getAttribute("Correo");
%>
 <header>
             
            <div class="content">

                <div class="menu container">

                    <a class="logo"><img src="firebase.svg" alt="logo_firereport"/></a>
                    <input type="checkbox" id="menu">
                    <label for="menu">
                        <img src="cuadricula.png" alt="" class="menu-icono">
                    </label>
                    <nav class="navbar">
                        <ul>
                            <li><a>TECNICO <%= tecnico%></a></li>
                            <li><a href="menuTecnico.jsp" class="regresar"><img src="regresar1.svg" alt="regresar"/></a></li>
                            <li><a class="logout-btn" href="<%=request.getContextPath()%>/Clasesita/CerrarSesionServlet">Cerrar Sesión</a></li>
                        </ul>
                    </nav>  
                </div>
            </div>
        </header>
        <div class="card">
          
            <form class="form">
                <div class="group">
                    <input placeholder="‎" type="text" required="" id="" name="">
                    <label for="propiedad">Propiedad</label>
                </div>

                <div class="group">
    <input disabled value="<%= session.getAttribute("Nombre") %>" type="text" required id="xd" name="d">
    <label for="tecnico">Tecnico</label>
</div>

                  <div class="group">
        <input required id="fechaInput" name="fecha" type="datetime-local">
        <label for="fecha">Fecha</label>
    </div>
    <script>
        // Obtener el elemento de entrada de fecha
        var fechaInput = document.getElementById("fechaInput");

        // Obtener la fecha y hora actuales
        var fechaActual = new Date();

        // Formatear la fecha y hora actual en formato ISO (YYYY-MM-DDTHH:MM)
        var fechaFormateada = fechaActual.toISOString().slice(0,16);

        // Establecer el valor del campo de fecha
        fechaInput.value = fechaFormateada;
    </script>


                <div class="group">
                    <input placeholder="‎"  required="" id="" name="">
                    <label for="numero">Numero de designacion</label>
                </div>

                <div class="group">
                    <input placeholder="‎" type="text" required="" id="" name="">
                    <label for="ubicacion">Ubicacion</label>
                </div>

                <div class="group">
                    <input placeholder="‎" type="text" required="" id="" name="">
                    <label for="tipo">Tipo</label>
                </div>
                <br>
                <div class="group">
                    <label>Preguntas:</label>
                </div>

                <!-- PREGUNTAS -->
                
                 <div class="radio-input">
                    <div class="info">
                        <span class="question">Válvula de control abierta y asegurada </span>
                        
                    </div>
                    <input type="radio" id="si1" name="p1" value="si1">
                    <label for="si1">SI</label>
                    <input type="radio" id="no1" name="p1" value="no1">
                    <label for="no1">NO</label>
                    
                     
                </div>
                
                 <div class="radio-input">
                    <div class="info">
                        <span class="question">Válvula angular de 2" cerrada y precintada </span>
                        
                    </div>
                    <input type="radio" id="si2" name="p2" value="si2">
                    <label for="si2">SI</label>
                    <input type="radio" id="no2" name="p2" value="no2">
                    <label for="no2">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">Válvula de alarma sin fugas, ni daños físicos</span>
                        
                    </div>
                    <input type="radio" id="si3" name="p3" value="si3">
                    <label for="si3">SI</label>
                    <input type="radio" id="no3" name="p3" value="no3">
                    <label for="no3">NO</label>
                    
                     
                </div>
             
                
                   <div class="radio-input">
                    <div class="info">
                        <span class="question">Dispositivos eléctricos de supervisión en buenas condiciones</span>
                        
                    </div>
                    <input type="radio" id="si4" name="p4" value="si4">
                    <label for="si4">SI</label>
                    <input type="radio" id="no4" name="p4" value="no4">
                    <label for="no4">NO</label>
                    
                     
                </div>
                
                
             
                
                   <div class="radio-input">
                    <div class="info">
                        <span class="question">Presión del sistema en PSI</span>
                        
                    </div>
                    <input type="radio" id="si5" name="p5" value="si5">
                    <label for="si5">SI</label>
                    <input type="radio" id="no5" name="p5" value="no5">
                    <label for="no5">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">Presión de base en PSI</span>
                        
                    </div>
                    <input type="radio" id="si6" name="p6" value="si6">
                    <label for="si6">SI</label>
                    <input type="radio" id="no6" name="p6" value="no6">
                    <label for="no6">NO</label>
                    
                     
                </div>
                
                
                    




                <div class="group">
                    <textarea placeholder="‎" id="comment" name="comment" rows="5" required=""></textarea>
                    <label for="observaciones">Observaciones</label>
                </div>
        
                <button type="submit" value="submit">Enviar Formulario</button>
                <br>
                <button type="reset" value="reset">Resetear Datos</button>
            </form>
        </div>
    <%@page import="java.sql.*,java.io.PrintWriter,javax.servlet.http.HttpServletResponse,Clasesita.Conectadita" %>
    <%
<%@page import="java.util.Date" %>
<%
    if (request.getParameter("submit") != null) {
        String propiedad = request.getParameter("propiedad");
        String tecnico = (String) session.getAttribute("Nombre");
        String designacion = request.getParameter("designacion");
        Date fecha = new Date(); // Utiliza la fecha actual
        String[] respuestas = new String[6];
        for (int i = 1; i <= 6; i++) {
            respuestas[i-1] = request.getParameter("p" + i);
        }
        
        String observaciones = request.getParameter("observaciones");
        
        // Preparar consulta SQL
        String insertQuery = "INSERT INTO check_riser (propiedad, tecnico, fecha, designacion, p1, p2, p3, p4, p5, p6, observaciones) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        Connection cnx = null;
        PreparedStatement pstatement = null;
        try {
            Conectadita conecta = new Conectadita();
            cnx = conecta.getConectarDB();
            pstatement = cnx.prepareStatement(insertQuery);
            
            // Establecer parámetros de la consulta
            pstatement.setString(1, propiedad);
            pstatement.setString(2, tecnico);
            pstatement.setTimestamp(3, new Timestamp(fecha.getTime()));
            pstatement.setString(4, designacion);
            for (int i = 0; i < 6; i++) {
                pstatement.setString(5 + i, respuestas[i]);
            }
            pstatement.setString(11, observaciones);
            
            // Ejecutar la consulta
            int rowsAffected = pstatement.executeUpdate();
            
            // Comprobar el resultado
            if (rowsAffected > 0) {
                out.println("<p>Los datos se han insertado correctamente en la tabla check_riser.</p>");
            } else {
                out.println("<p>Ocurrió un error al insertar los datos en la tabla check_riser.</p>");
            }
        } catch (SQLException error) {
            error.printStackTrace();
            out.println("<p>Ocurrió un error al procesar la solicitud.</p>");
        } finally {
            try {
                if (pstatement != null) pstatement.close();
                if (cnx != null) cnx.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Ocurrió un error al cerrar la conexión con la base de datos.</p>");
            }
        }
    } else {
        response.sendRedirect("index.html");
    }
%>

            } else {
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
