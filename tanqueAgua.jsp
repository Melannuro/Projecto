<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CHECKLIST.css">
    <title>JSP Page</title>
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
                    <li><a href="menuTecnico.jsp" class="regresar"><img src="regresar1.svg" alt="regresar"/></a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="nombre_check-container">
    <button class="nombre_check">TANQUE DE AGUA</button>
</div>
    
    <body>
        
        <div class="card">
            <form class="form">
                <div class="group">
                    <input placeholder="‎" type="text" required="" id="" name="">
                    <label for="propiedad">Propiedad</label>
                </div>

                <div class="group">
    <input value="<%= session.getAttribute("Nombre") %>" type="text" required id="xd" name="d">
    <label for="tecnico">Tecnico</label>
</div>

              <div class="group">
                    <input required="" id="" name="" type="datetime-local">
                    <label for="fecha">Fecha</label>
                </div>


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
                        <span class="question">El estado del tanque es normal, sin fugas, abolladuras, golpes, oxidación </span>
                        
                    </div>
                    <input type="radio" id="si1" name="p1" value="si1">
                    <label for="si1">SI</label>
                    <input type="radio" id="no1" name="p1" value="no1">
                    <label for="no1">NO</label>
                    
                     
                </div>
                
                 <div class="radio-input">
                    <div class="info">
                        <span class="question">La temperatura del agua es mayor a 40°F (4.4°C) o más </span>
                        
                    </div>
                    <input type="radio" id="si2" name="p2" value="si2">
                    <label for="si2">SI</label>
                    <input type="radio" id="no2" name="p2" value="no2">
                    <label for="no2">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">La válvula de llenado está abierta y candadeada o supervisada</span>
                        
                    </div>
                    <input type="radio" id="si3" name="p3" value="si3">
                    <label for="si3">SI</label>
                    <input type="radio" id="no3" name="p3" value="no3">
                    <label for="no3">NO</label>
                    
                     
                </div>
             
                
                   <div class="radio-input">
                    <div class="info">
                        <span class="question">El flotador de llenado funciona correctamente</span>
                        
                    </div>
                    <input type="radio" id="si4" name="p4" value="si4">
                    <label for="si4">SI</label>
                    <input type="radio" id="no4" name="p4" value="no4">
                    <label for="no4">NO</label>
                    
                     
                </div>
                
                
             
                
                   <div class="radio-input">
                    <div class="info">
                        <span class="question">La válvula de descarga está abierta y candadeada o supervisada</span>
                        
                    </div>
                    <input type="radio" id="si5" name="p5" value="si5">
                    <label for="si5">SI</label>
                    <input type="radio" id="no5" name="p5" value="no5">
                    <label for="no5">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">El nivel de agua está al máximo</span>
                        
                    </div>
                    <input type="radio" id="si6" name="p6" value="si6">
                    <label for="si6">SI</label>
                    <input type="radio" id="no6" name="p6" value="no6">
                    <label for="no6">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">Las condiciones exteriores del tanque son adecuadas</span>
                        
                    </div>
                    <input type="radio" id="si7" name="p7" value="si7">
                    <label for="si7">SI</label>
                    <input type="radio" id="no7" name="p7" value="no7">
                    <label for="no7">NO</label>
                    
                     
                </div>
                <div class="radio-input">
                    <div class="info">
                        <span class="question">La escalera de acceso al depósito está en buenas condiciones</span>
                        
                    </div>
                    <input type="radio" id="si8" name="p8" value="si8">
                    <label for="si8">SI</label>
                    <input type="radio" id="no8" name="p8" value="no8">
                    <label for="no8">NO</label>
                    
                     
                </div>
                
                <div class="radio-input">
                    <div class="info">
                        <span class="question">El área alrededor del tanque está libre de suciedad y no hay signos de fugas</span>
                        
                    </div>
                    <input type="radio" id="si9" name="p9" value="si9">
                    <label for="si9">SI</label>
                    <input type="radio" id="no9" name="p9" value="no9">
                    <label for="no9">NO</label>
                    
                     
                </div>
                
                    



                
                <div class="group">
                    <input placeholder="‎" type="number" required="" id="" name="">
                    <label for="capacidad">Capacidad de Agua</label>
                </div>
                
                <div class="group">
                    <input placeholder="‎" type="number" required="" id="" name="">
                    <label for="nivel">Nivel de Agua</label>
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
<%
            } else {
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
