<%@ Page Language="VB" AutoEventWireup="false" CodeFile="validacion.aspx.vb" Inherits="validacion" %>

<!doctype html>
<html lang="es-MX">
<head>
<meta charset="UTF-8">
<title>Chico Harley</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Refresh" content="6; url=formularioContacto.aspx" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href= "css/validacion.css"  rel="stylesheet" type="text/css" />
<link href="font/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css" />
   <link href="regular/stylesheet.css" rel="stylesheet" type="text/css">
   <link href="bold/stylesheet.css" rel="stylesheet" type="text/css">
   <link href="saelicbold/stylesheet.css" rel="stylesheet" type="text/css">
   <link href="medium/stylesheet.css" rel="stylesheet" type="text/css">
    <!--favicon-->
<link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192" href="favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
</head>
<body>
<header>
<div id="header">
	<div class="logo">
	<a style="outline:none; text-decoration:none; outline-color:none" href="login.aspx"><img src="img/logo2024.png"></a>
	</div>
</div>
</header>
    
<center>
    
  	<div class="letra">
		<div  ng-controller="UserController"  class="modal-dialog modal-sm">
        <!-- Modal content no 1-->
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title text-center form-title">Validación de cuenta</h1>
          </div>
          <div class="modal-body padtrbl">
            <div class="login-box-body">
              <div class="form-group">
              <!----- alert -------------->
               <div class="row">
               <div class="col-xs-12 alert-success">
		<p class="fuente">
La clave única de registro así como el número de participación, son únicos e intransferibles, favor de tomar muy en cuenta estos requisitos.<br>
Cualquier duda favor de comunicarse al 2381505344 o bien escribir al correo electrónico: <strong>chicoharley.teh@hotmail.com</strong>	
			</p>
             </div>
                   </div>
                   <br>
       <%--           <form id="loginForm" runat="server" method="post">--%>
                   <!---btn login --> 
                    <div class="row" align="center">
                         <div class="col-xs-12">
                             <div class="button8" >
                                 
                                 Tu cuenta ha sido validada. 


                             </div>




                              <%--<button type="button" class="btn" >Tu cuenta ha sido validada, a continuación recibirás un email.</button>--%>
                           <%--<asp:Button ID="btnvalidar" runat="server" type="button" CssClass="btn"  Text="Tu cuenta ha sido validada, a continuación recibirás un email." />--%>
                             <%--<asp:Button ID="Button1" runat="server" type="button" class="btn" onclick="userlogin()" Text="Tu cuenta ha sido validada, a continuación recibirás un email." />--%>
                        </div>
                    </div>
                   <%--   </form>--%>
                    
             
              </div>
            </div>
            </div>
            </div>
            </div>
            </div>
</center>
       
<br>
<br>
<!-- footer -->
         <!-- footer -->
<footer role="footer">

    <div class="espaciogrande"></div>

    <div class="contenido">

        <div class="row">

            <div class="col-md-5 cinco"></div>
            <div class="col-md-5 trienta">
                <h1>DETALLES DE CONTACTO</h1>
               <a>+52 1 238 150 5344</a><br />
                <a>chicoharley.teh@hotmail.com</a>
               
                <div class="espacios"></div>
                 <div style="display:none !important">
                <h1>MENÚ DE NAVEGACIÓN</h1>
                <ul>
          <li>
                         <a href="https://chicoharleytehuacan.com/programa/">NUESTRO PROGRAMA</a>
                    </li>
                    <li>
                         <a href="Default.aspx">REGÍSTRATE</a>
                    </li>
                    <li> <a href="https://chicoharleytehuacan.com/asistentes/">NUESTROS ASISTENTES</a>

                    </li>
                    <li>
                         <a>RECORDAR ES VOLVER A VIVIR</a>
                    </li>
                </ul>
                     </div>
  <div class="espacios"></div>

                 <h1>SÍGUENOS EN:</h1>
                <a href="https://www.facebook.com/chicoharleytehuacan/">@CHICOHARLEYTEHUACAN</a>

            </div>
            <div class="col-md-5 quince"></div>
            <div class="col-md-5 diezchioso"></div>
            <div class="col-md-5 vientidos">
                     <h1>UBICACIÓN</h1>
                <p>
Tehuacán, Puebla. Casa Club en San Diego Chalma
</p>

  <div class="espacios"></div>


                <h1>POLÍTICAS</h1>
               <ul>
                    <li style="display:none !important">
                         <a>Política de privacidad
</a>
                    </li>
                    <li style="display:none !important">
                         <a>Términos y condiciones</a>
                    </li>
                    <li> <a>Copyright 2024 © Chico Harley Tehuacán​</a>

                    </li>
                   
                </ul>
          
                <div class="espacios"></div>


                 <h1>DESARROLLADO POR</h1>
                <a href="https://barcostudio.com/" target="_blank">
                      <img src="img/logo-BS.png"  alt="" width="70" >
                </a>
                

            </div>
            <div class="col-md-5 dos"></div>


        </div>

    </div>
        <div class="espaciogrande"></div>


</footer>
<script>

function checar(){

    if (boton.disabled == true){

        boton.disabled = false;

    }else{

        boton.disabled = true;

    }

}

</script>
</body>
</html>