<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.PrintWriter,javax.servlet.http.HttpServletResponse,Clasesita.Conectadita" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="login.css" media="">
    <title>JSP Page</title>
    <script>
            window.addEventListener('DOMContentLoaded', function () {
                const elementoTransicion = document.querySelector('.transicion-pagina');
                elementoTransicion.classList.add('mostrar');
            });
        </script>
        <style>
            .bienvenida {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: black;
                color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                z-index: 999;
            }
            .transicion-pagina {
                opacity: 0;
                transition: opacity 2s ease-in-out;
            }

            .transicion-pagina.mostrar {
                opacity: 1;
            }
        </style>
    </head>
</head>
<body>
<header class="titulo">
    <b>Inspector</b>
</header>
<div class="contenido">
    <div class="login">
        <div class="preguntas">
                   
            <b2>Para realizar una inspeccion</b2>
            <br>
            <b2>ingrese sus datos</b2>
            <br><br>
            <form method="post" onsubmit="return validateForm()">
                <div class="coolinput">
                    <label for="correo" class="text">Correo:  </label>
                    <input type="email" required placeholder="Correo Electronico..." name="correo" id="correo" class="input">
                </div>
                <div class="coolinput">
                        <label for="input" class="text">Contraseña:&nbsp; </label>
                        <input type="password" required placeholder="Contraseña..." name="contra" id="contra" class="input">
                    </div>
                <br><br><br><br><br>
                <button class="button" type="submit" id="btngrabar" name="btngrabar">
                    Ingresar
                    <svg fill="currentColor" viewBox="0 0 24 24" class="icon">
                        <path
                                clip-rule="evenodd"
                                d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
                                fill-rule="evenodd"
                        ></path>
                    </svg>
                </button>
            </form>
            <p>¿Olvidaste tu contraseña? <a href="recuperarInspector.jsp">Haz clic aquí</a></p>
        </div>
    </div>
    <div class="logoin">
        <div class="logologin">
            <img class='logoimg' src='logo.png' alt='' height="200" width="200">
        </div>
        <div class="bienvenido">
            <h1>Bienvenido</h1>
        </div>
    </div>
</div>
    
<%
    if (request.getParameter("btngrabar") != null) {
        String correo = request.getParameter("correo");
        String contra= request.getParameter("contra");
        Connection cnx = null;
        ResultSet res = null;
        PreparedStatement pstatement = null;
        try {
            Conectadita conecta = new Conectadita();
            cnx = conecta.getConectarDB();
            String querystring = "SELECT * FROM tecnicos WHERE correo_tec = ? AND contrasenia_tec = ?";
            if(cnx == null){
            out.println("<div class='bienvenida'>");
                        out.println("<h2>Disculpa Estamos teniendo dificultades Tecnicas, vuelve a intentarlo mas tarde"+ "</h2>");
                        out.println("<p></p>");
                        out.println("</div>");
                        out.println("<script>");
                        out.println("setTimeout(function() {");
                        out.println("  window.location.href = 'index.html';");
                        out.println("}, 2200);");
                        out.println("</script>");
    }else{
            pstatement = cnx.prepareStatement(querystring);
            pstatement.setString(1, correo);
            pstatement.setString(2, contra);
            res = pstatement.executeQuery();
            if (res.next()) {
            String Nombre = res.getString(1);
            String correotecnico = res.getString(2);
            String empresa = res.getString(4);
            request.getSession().setAttribute("Nombre", Nombre);
    request.getSession().setAttribute("Correo", correotecnico);
    out.println("<div class='bienvenida'>");
                        out.println("<h2>Bienvenido Técnico " + Nombre + " de la empresa " + empresa + "</h2>");
                        out.println("<p></p>");
                        out.println("</div>");
                        out.println("<script>");
                        out.println("setTimeout(function() {");
                        out.println("  window.location.href = 'menuTecnico.jsp';");
                        out.println("}, 2200);");
                        out.println("</script>");
            } else{
            out.println("<div class='bienvenida' id='bienvenida'>");
                        out.println("<h2>Los datos que ingresaste son incorrectos, porfavor verifica o habla con tus Supervisores" + "</h2>");
                        out.println("</div>");
                        out.println("<script>");
                        out.println("setTimeout(function() {");
                        out.println("var x = document.getElementById('bienvenida');");
                        out.println("x.style.display ='none'");
                        out.println("}, 1000);");
                        out.println("</script>");
    }
    }
    } catch (SQLException error) {
            out.println("<div class='bienvenida'>");
                        out.println("<h2>Disculpa Estamos teniendo dificultades Tecnicas, vuelve a intentarlo mas tarde"+ "</h2>");
                        out.println("<p></p>");
                        out.println("</div>");
                        out.println("<script>");
                        out.println("setTimeout(function() {");
                        out.println("  window.location.href = 'index.html';");
                        out.println("}, 2200);");
                        out.println("</script>");
        } finally {
            try {
                if (res != null) res.close();
                if (pstatement != null) pstatement.close();
                if (cnx != null) cnx.close();
            } catch (SQLException e) {
            out.println("<div class='bienvenida'>");
                        out.println("<h2>Disculpa Estamos teniendo dificultades Tecnicas, vuelve a intentarlo mas tarde"+ "</h2>");
                        out.println("<p></p>");
                        out.println("</div>");
                        out.println("<script>");
                        out.println("setTimeout(function() {");
                        out.println("  window.location.href = 'index.html';");
                        out.println("}, 2200);");
                        out.println("</script>");
            }
        }
        
        
    }
%>
</body>
</html>
