<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.PrintWriter,javax.servlet.http.HttpServletResponse,Clasesita.Conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="login.css" media="">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="titulo">
            <b>Empresa</b>
        </header>
        <div class="contenido">
            <div class="login">
                <div class="preguntas">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b2>Para ver las inspecciones realizadas por sus tecnicos</b2> <br>
                    <b2>ingrese sus datos</b2><br><br>
                    <form method="post">
                <div class="coolinput">
                    <label for="correo" class="text">Correo:&nbsp; </label>
                    <input type="text" placeholder="Correo Electronico..." name="correo" id="correo" class="input">
                </div>
                <div class="coolinput">
                        <label for="input" class="text">Contraseña:&nbsp; </label>
                        <input type="text" placeholder="Contraseña..." name="contra" id="contra" class="input">
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
            String querystring = "SELECT * FROM empresasci WHERE correo_emp = ? AND contrasenia_emp = ?";
            pstatement = cnx.prepareStatement(querystring);
            pstatement.setString(1, correo);
            pstatement.setString(2, contra);
            res = pstatement.executeQuery();
            if (res.next()) {
            String Nombre = res.getString(1);
            String correotecnico = res.getString(2);
            request.getSession().setAttribute("Nombre", Nombre);
    request.getSession().setAttribute("Correo", correotecnico);
               response.sendRedirect("menuEmpresaSCI.jsp");
            } else {
               %>
                        <div class="alert">
                            Credenciales incorrectas
                        </div>
            <%
            }
        } catch (SQLException error) {
            out.print(error.toString());
        } finally {
            try {
                if (res != null) res.close();
                if (pstatement != null) pstatement.close();
                if (cnx != null) cnx.close();
            } catch (SQLException e) {
                out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }
%>
    </body>
</html>
