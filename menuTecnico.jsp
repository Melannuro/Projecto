<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="menuTecnico.css" media="">
    </head>
    <body>
        <%@page import="javax.servlet.http.HttpSession" %>

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
                            
                            <li><a href="Menu_TEC.html" class="regresar"><img src="regresar1.svg" alt="regresar"/></a></li>
                            <li><a class="logout-btn" href="<%=request.getContextPath()%>/Clasesita/CerrarSesionServlet">Cerrar Sesión</a></li>
                        </ul>
                    </nav>  
                </div>
            </div>
        </header>
       
        <div class="checks">


            <a href="tanqueAgua.jsp" class="tanque">
                <div class="card-image"><img src="tanque_agua.svg" alt="Tanque de agua"/></div>
                <p class="card-title">TANQUE DE AGUA </p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="diesel.jsp" class="bcid">
                <div class="card-image"><img src="diesel.svg" alt="diesel"/></div>
                <p class="card-title">BOMBA CONTRA INCENDIOS DIESEL</p>
                <p class="card-body">CONTENIDO</p>
            </a>
            <a href="" class="bcij">
                <div class="card-image"><img src="jockey.svg" alt="jockey"/></div>
                <p class="card-title">BOMBA CONTRA INCENDIOS JOCKEY</p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="risers.jsp" class="riser">
                <div class="card-image"><img src="riser.svg" alt="riser"/></div>
                <p class="card-title">RISER</p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="valvulas.jsp"  class="valvula">
                <div class="card-image"><img src="valvula.svg" alt="valvula"/></div>
                <p class="card-title">VALVULAS</p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="piv.jsp" class="piv">
                <div class="card-image"><img src="piv.svg" alt="PIV"/></div>
                <p class="card-title">POSTE INDICADOR DE VALVULA</p>
                <p class="card-body">CONTENIDO</p>
            </a>  
            <a href="mangueras.jsp" class="manguera">
                <div class="card-image"><img src="manguera.svg" alt="manguera"/></div>
                <p class="card-title">MANGUERAS</p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="siamesa.jsp" class="siamesa">
                <div class="card-image"><img src="siamesa.svg" alt="Toma Siamesa"/></div>
                <p class="card-title">TOMA SIAMESA</p>
                <p class="card-body">CONTENIDO</p>
            </a>
            <a href="hidrante_patio.jsp" class="hidrante">
                <div class="card-image"><img src="hidrante_patio.svg" alt="Hidrante de Patio"/></div>
                <p class="card-title">HIDRANTE DE PATIO</p>
                <p class="card-body">CONTENIDO</p>
            </a> 
            <a href="tablero.jsp" class="tablero">
                <div class="card-image"><img src="tablero_alarma.svg" alt="Tablero de Alarmas"/></div>
                <p class="card-title">TABLERO DE ALARMAS</p>
                <p class="card-body">CONTENIDO</p>
            </a> 

        </div>
        <%
            } else {
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
