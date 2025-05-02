<%@ Page Language="VB" AutoEventWireup="false" CodeFile="formularioContacto.aspx.vb" Inherits="formularioContacto" %>

<!doctype html>
<html lang="es-MX">
<head>
    <meta charset="UTF-8">
    <title>Chico Harley - Formulario</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/formulario.css" rel="stylesheet" type="text/css">
   <link href="regular/stylesheet.css" rel="stylesheet" type="text/css">
   <link href="bold/stylesheet.css" rel="stylesheet" type="text/css">  
   <link href="saelicbold/stylesheet.css" rel="stylesheet" type="text/css">
   <link href="medium/stylesheet.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css">
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

<style>

    .custom-checkbox input[type="checkbox"] {
        width: 20px;
        height: 20px;
        cursor: pointer;
    }
</style>


</head>
<body>
 
    <!--========== HEADER ==========-->
<header class="header navbar-fixed-top" id="topmenu">
<!-- Navbar -->
<nav class="navbar" role="navigation">
<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="menu-container js_nav-item">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="toggle-icon"></span>
		</button>
		<!-- Logo -->
		<div class="logo">
			<a class="logo-wrap" href="Default.aspx">
			<img class="logo-img logo-img-main" src="img/LOGO2025.png">
			<img class="logo-img logo-img-active" src="img/LOGO2025.png">
			</a>
		</div>
		<!-- End Logo -->
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse nav-collapse">
		<div class="adfa">
			<p>
				<a href="https://www.facebook.com/chicoharleytehuacan/" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i> &nbsp;@chicoharleytehuacan&nbsp;&nbsp;</a>
				<a class="active" href="Default.aspx" target="_blank">Registro&nbsp;&nbsp;</a>
				&nbsp;&nbsp;<a href="login.aspx" style="display:none !important">Administrador</a>
			</p>
		</div>
		<br>
		<div class="menu-container" style="display:none !important">
			<ul class="nav navbar-nav navbar-nav-right">
				<li class="js_nav-item nav-item"><a class="nav-item-child  " href="https://chicoharleytehuacan.com/">INICIO </a></li>
				<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover " href="https://chicoharleytehuacan.com/programa/">PROGRAMA </a></li>
				<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="https://chicoharleytehuacan.com/galeria/">GALERÍA </a></li>
				<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover " href="https://chicoharleytehuacan.com/asistentes/">ASISTENTES </a></li>
				<%--<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover active" href="http://3.21.129.7/Default.aspx">INSCRIPCIÓN </a></li>--%>
				<li class="js_nav-item nav-item"><a class="nav-item-child  " href="https://chicoharleytehuacan.com/contacto/">CONTACTO </a></li>
			</ul>
		</div>
	</div>
	<!-- End Navbar Collapse -->
</div>
</nav>
<!-- Navbar -->
</header>
<!--========== END HEADER ==========-->
    <div class="bannerindex">
        <img src="Imagenes Chico Harley/imagen 2.png" style="width: 100%">
    </div>
    <div class="logo2">
        <img src="Imagenes Chico Harley/Legend since 1941.png">
    </div>
    <center>


<div class="tabla1">
	
	<center>
	<div class="letra">
		<form  id="contactForm" runat="server" method="post" novalidate >

		<div class="row">
				<div class="col-md-12">
					<label>Nombre Completo (Piloto):</label>
                    </div>


                    <div class="col-md-6">
 					<asp:TextBox runat="server" id="txtNombre" name="nombrepiloto" type="text" class="form-control1" required="" placeholder="Nombre (s)"></asp:TextBox>
				</div>


				<div class="col-md-6">
 					<asp:TextBox  runat="server" id="txtApellido" name="apellido" type="text" class="form-control1" required="" placeholder="Apellido"></asp:TextBox>
				</div>
			</div>



			<br>
			<div class="row">
				<div class="col-md-12">
					<label>Nombre Completo (Copiloto):</label>
					</div>
                    <div class="col-md-6">
					<asp:TextBox runat="server"  id="txtNombreCopiloto" name="nombrecopiloto" type="text" class="form-control1" required="" placeholder="Nombre (s)"></asp:TextBox>
				</div>
				<div class="col-md-6">
					<asp:TextBox runat="server"  id="txtCopilotoApellido" name="copilotoapellido" type="text" class="form-control1" required="" placeholder="Apellido"></asp:TextBox>
				</div>
			</div>
			<br>


			<div class="row">
				<div class="col-sm-12">
					<label>Procedencia:</label>
					</div>
                  <div class="col-md-6">
             		<asp:TextBox runat="server" id="txtLugar" name="nombre" type="text" class="form-control1" required="" placeholder="Ciudad"></asp:TextBox>
             		</div>
                  <div class="col-md-6">
                <asp:TextBox runat="server" id="txtEstado" name="nombre" type="text" class="form-control1" required="" placeholder="Estado"></asp:TextBox>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-sm-12">
			<label>Teléfono:</label>
			</div>
				<div class="col-sm-12">
					<asp:TextBox runat="server" MaxLength="10" id="txtCelular1" name="Celular1" type="text" class="form-control1" required="" placeholder="0000000000"></asp:TextBox>
				</div>
			</div>

            <br />
            <div class="row">
				<div class="col-sm-12">
					<label>Correo electrónico:</label>
					</div>
                    <div class="col-sm-12">
					<asp:TextBox runat="server" id="txtEmail" name="email" type="email" class="form-control1" required="" placeholder="Correo electrónico"></asp:TextBox>
				</div>
			</div>
            
			<br>
			<div class="row">
				<div class="col-sm-12">
				<label>Nombre del motoclub:</label>
                    </div>
				<div class="col-sm-6">
					<asp:TextBox runat="server"  id="txtNombreMotoclub" name="nombre" type="text" class="form-control1" required="" placeholder="Nombre del motoclub"></asp:TextBox>
				</div>
                <div class="col-sm-6">
                <asp:DropDownList runat="server" id="cboPosicion" name="nombre" class="form-control2" required="">
                       <asp:ListItem active>Seleccionar opción</asp:ListItem>
                       <asp:ListItem>Líder</asp:ListItem>
                        <asp:ListItem>Miembro</asp:ListItem>
               </asp:DropDownList>
                    <input type="hidden" id="Lider" name="Lider" value="false">
				</div>
			</div>


			<br>
            <div class="row">
				<div class="col-sm-12">
			<label>Motocicleta:</label>
                    </div>
				<div class="col-sm-3">
					<asp:TextBox runat="server" id="txtMarca" name="nombre" type="text" class="form-control1" required="" placeholder="Marca"></asp:TextBox>
				</div>
				<div class="col-sm-4">
					<asp:TextBox runat="server" id="txtModelo" name="nombre" type="text" class="form-control1" required="" placeholder="Modelo"></asp:TextBox>
				</div>
				<div class="col-sm-4">
					<asp:TextBox id="txtCilindrada" runat="server" name="nombre" type="text" class="form-control1" required="" placeholder="Cilindrada"></asp:TextBox>
				</div>
			</div>
        <br />


			<div class="row">
				<div class="col-sm-12">
					<label>Número de serie o VIN:</label>
                    </div>
                    <div class="col-sm-12">
					<asp:TextBox runat="server" MaxLength="17" id="txtVin" name="nombre" type="text" class="form-control1" required="" placeholder="Número de serie o VIN"></asp:TextBox>
				</div>
			</div> 
			    <br>

            <div class="row" id="divComida" runat="server" ClientIDMode="Static">
                <div class="col-sm-12">
                    <label>Incluir comida:</label>
                    <span style="margin-left: 20px; font-weight: bold;</span>
                </div>
                <div class="col-sm-12">
                    <asp:CheckBox runat="server" ID="chkComida" class="form-control1" CssClass="custom-checkbox" />
                </div>
            </div> 
            <br>



            <div class="row"  id="divRecuerdos">
                	<div class="col-sm-12">
            			<label>Selecciona tu Recuerdo:</label>
                </div>

                <div class="col-sm-12">
					<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" ForeColor="White">
                        <asp:ListItem Selected="True" OnSelectedIndexChanged="radioButtons_SelectedIndexChanged" style="color:#000;  font-family: 'typewriter_condensedregular';"> &nbsp;&nbsp;&nbsp; Recuerdos</asp:ListItem>
              </asp:RadioButtonList>
                </div>


				<div  class="col-sm-12">
                       <asp:DropDownList runat="server" id="ddlTalla" name="nombre" class="form-control1" required="">
                       </asp:DropDownList>

				</div>			
			</div>
	
            <br>
			<br />
			<center>
			<strong>“NOS RESERVAMOS EL DERECHO DE ADMISIÓN”</strong>
                </center>
			<br>
			<p class="texto">
		El número de participación es único e intransferible, favor de tomar muy en cuenta estos requisitos.
Cualquier duda favor de comunicarse al 2381505344 o bien escribir al correo electrónico:<strong class="correo"> <a href="mailto:chicoharley.teh@hotmail.com">chicoharley.teh@hotmail.com</a></strong>	
			</p>
			<br>
			<br>
			<center>
			<div class="row" style="text-align:center; position:relative; margin:0 auto; width:100%; max-width:1920px  ; float:inherit;">
				
                
                <div style="display: flex; justify-content: center;">
				
                    <asp:button runat="server" ID="btnRegistrate" Text="REGISTRATE" type="submit" CssClass="button8" style="width: auto;"/>
                      
				</div>


				<%--<div class="col-sm-6" style="text-align:center">
                    
					<asp:button PostBackUrl="../Default.aspx" runat="server" ID="btnNuevo" Text="NUEVO REGISTRO" CssClass="button9"  />
                        
				</div>--%>
			</div>
			</center>
			
		</form>
	</div>
	</center>
</div>


    
</center>
    <br>
    <br>
    <br />


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
                    <li> <a>Copyright 2025 © Chico Harley Tehuacán​</a>

                    </li>
                   
                </ul>
          
                <div class="espacios"></div>


                 <h1>DESARROLLADO POR</h1>
                <a href="https://barcostudio.com/" target="_blank">
                    <img src="img/logo-BS.png"  width="70">
                </a>
                

            </div>
            <div class="col-md-5 dos"></div>


        </div>

    </div>
        <div class="espaciogrande"></div>


</footer>

    <!--js menu-->
    <script>
        window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 0 || document.documentElement.scrollTop > 50) {
    document.getElementById("topmenu").style.background = "rgba(0, 0, 0, 0.85)";
    document.getElementById("topmenu").style.setProperty('box-shadow', '0 9px 19px -7px rgba(0,0,0,0.80)');
    document.getElementById("topmenu").style.position = "fixed";
      } else {
    document.getElementById("topmenu").style.background = "rgba(0, 0, 0, 0.35)";
    document.getElementById("topmenu").style.setProperty('box-shadow', 'none');
     }
}

var lastScrollTop = '0';

window.addEventListener("scroll", function(){  
   var st = window.pageYOffset || document.documentElement.scrollTop;  
   if (st > lastScrollTop){
       document.getElementById("topmenu").style.top = "-100%";
    } else {
      document.getElementById("topmenu").style.top = "0";
   }
   lastScrollTop = st;
}, false);


        //////// Ocultar la parte de seleccionar si ponen Independiente en nombre del motoclub

        document.addEventListener("DOMContentLoaded", function () {
            var txtMotoclub = document.getElementById('<%= txtNombreMotoclub.ClientID %>');
            var cboPosicion = document.getElementById('<%= cboPosicion.ClientID %>');
            var inputLider = document.getElementById('Lider'); // Campo oculto 'Lider'

            if (txtMotoclub.value.trim().toLowerCase() === "independiente") {
                cboPosicion.style.display = "none";
                cboPosicion.value = "Miembro"; 
                inputLider.value = "false"; 
            }

            txtMotoclub.addEventListener("input", function (event) {
                event.preventDefault();
                if (txtMotoclub.value.trim().toLowerCase() === "independiente") {
                    cboPosicion.style.display = "none"; 
                    cboPosicion.value = "Miembro"; 
                    inputLider.value = "false"; 
                } else {
                    cboPosicion.style.display = "block"; 
                    inputLider.value = (cboPosicion.value === "Líder") ? "true" : "false";
                }
            });

            txtMotoclub.addEventListener("blur", function (event) {
                event.preventDefault();  
            });
        });







        //// Mostrar solo Parcht y Acceso al evento en Recuerdoss si son de Tehuacan y asignarles Parche 
        document.addEventListener("DOMContentLoaded", function () {
            var txtLugar = document.getElementById('<%= txtLugar.ClientID %>');
            var txtEstado = document.getElementById('<%= txtEstado.ClientID %>');
            var divRecuerdos = document.getElementById('divRecuerdos');
            var ddlTalla = document.getElementById('<%= ddlTalla.ClientID %>');

            function normalizarTexto(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
            }

            function quitarEspacios(texto) {
                return texto.replace(/\s+/g, '');
            }

            function verificarCiudades() {
                var ciudad = quitarEspacios(normalizarTexto(txtLugar.value.trim()));
                var estado = quitarEspacios(normalizarTexto(txtEstado.value.trim()));

               

                var ciudadesBloqueadas = [
                    "tehuacan", "santa maria coapan", "miahuatlan", "ajalpan", "tepanco de lopez",
                    "nicolas bravo", "vicente guerrero", "san antonio cañada", "altepexi",
                    "san gabriel chilac", "zapotitlan", "atexcal"
                ];

                var ciudadesBloqueadasNormalizadas = ciudadesBloqueadas.map(ciudad =>
                    quitarEspacios(normalizarTexto(ciudad))
                );

                // Comparación exacta del lugar y estado completos (no palabra por palabra)
                var ciudadCoincide = ciudadesBloqueadasNormalizadas.includes(ciudad);
                var estadoCoincide = ciudadesBloqueadasNormalizadas.includes(estado);

                // **Primer caso: Ciudad o estado está bloqueado**
                if (ciudadCoincide || estadoCoincide) {
                    divRecuerdos.style.display = "block";

                    var patchDisponible = false;
                    var accesoDisponible = false;

                    for (var i = 0; i < ddlTalla.options.length; i++) {
                        var option = ddlTalla.options[i];

                        if (option.value === "PatchLocal") {
                            patchDisponible = true;
                        }
                        if (option.value === "Acceso al evento") {
                            accesoDisponible = true;
                        }
                    }

                    if (patchDisponible && stockTallas["PatchLocal"] > 0) {
                        for (var i = 0; i < ddlTalla.options.length; i++) {
                            var option = ddlTalla.options[i];
                            option.style.display = (option.value === "PatchLocal") ? "block" : "none";
                        }
                    } else if (accesoDisponible) {
                        for (var i = 0; i < ddlTalla.options.length; i++) {
                            var option = ddlTalla.options[i];
                            option.style.display = (option.value === "Acceso al evento") ? "block" : "none";
                        }
                    }
                }
                // **Segundo caso: Ciudad o estado NO está bloqueado**
                else {
                    var otrosRecuerdosDisponibles = [];
                    var accesoDisponible = false;

                    for (var i = 0; i < ddlTalla.options.length; i++) {
                        var option = ddlTalla.options[i];

                        if (option.value === "PatchLocal") {
                            option.style.display = "none"; // PatchLocal no se muestra en este caso
                        } else if (option.value === "Acceso al evento") {
                            accesoDisponible = true;
                            option.style.display = "none"; // Por defecto, se oculta Acceso al evento
                        } else {
                            otrosRecuerdosDisponibles.push(option.value);
                        }
                    }

                    var hayStockDisponible = otrosRecuerdosDisponibles.some(talla => stockTallas[talla] > 0);

                    // **Mostrar solo los recuerdos con stock disponible**
                    for (var i = 0; i < ddlTalla.options.length; i++) {
                        var option = ddlTalla.options[i];
                        if (otrosRecuerdosDisponibles.includes(option.value)) {
                            option.style.display = (stockTallas[option.value] > 0) ? "block" : "none";
                        }
                    }

                    // **Si ningún recuerdo tiene stock, mostrar "Acceso al evento"**
                    if (!hayStockDisponible && accesoDisponible) {
                        for (var i = 0; i < ddlTalla.options.length; i++) {
                            var option = ddlTalla.options[i];
                            option.style.display = (option.value === "Acceso al evento") ? "block" : "none";
                        }
                    }
                }
            }

            txtLugar.addEventListener("input", verificarCiudades);
            txtEstado.addEventListener("input", verificarCiudades);
        });







        //// Para ocultar la parte del checkBox si son de Tehuacan
        document.addEventListener("DOMContentLoaded", function () {
            var txtLugar = document.getElementById('<%= txtLugar.ClientID %>');
            var txtEstado = document.getElementById('<%= txtEstado.ClientID %>');
            var divComida = document.getElementById("divComida");

            // Función para normalizar el texto eliminando acentos y convirtiendo a minúsculas
            function normalizarTexto(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
            }

            // Función para eliminar espacios en blanco
            function quitarEspacios(texto) {
                return texto.replace(/\s+/g, ''); // Elimina todos los espacios
            }

            // Función para verificar si las ciudades o estados están bloqueados
            function verificarCiudades() {
                var ciudad = quitarEspacios(normalizarTexto(txtLugar.value.trim()));
                var estado = quitarEspacios(normalizarTexto(txtEstado.value.trim()));

                // Lista de ciudades bloqueadas
                var ciudadesBloqueadas = [
                    "tehuacan", "santa maria coapan", "miahuatlan", "ajalpan", "tepanco de lopez",
                    "nicolas bravo", "vicente guerrero", "san antonio cañada", "altepexi",
                    "san gabriel chilac", "zapotitlan", "atexcal"
                ];

                var ciudadesBloqueadasNormalizadas = ciudadesBloqueadas.map(ciudad =>
                    quitarEspacios(normalizarTexto(ciudad))
                );

                // Comparación exacta del lugar y estado completos (no palabra por palabra)
                var ciudadCoincide = ciudadesBloqueadasNormalizadas.includes(ciudad);
                var estadoCoincide = ciudadesBloqueadasNormalizadas.includes(estado);

                // Si la ciudad o el estado coinciden con alguna ciudad bloqueada, ocultamos el div
                if (ciudadCoincide || estadoCoincide) {
                    divComida.style.display = "none"; // Ocultamos el checkbox
                } else {
                    divComida.style.display = "block"; // Mostramos el checkbox
                }
            }

            // Agregamos los eventos para que se ejecute la función al ingresar texto
            txtLugar.addEventListener("input", verificarCiudades);
            txtEstado.addEventListener("input", verificarCiudades);
        });





    </script>

<script src="js/menu/jquery.min.js" type="text/javascript"></script>
<script src="js/menu/owl.carousel.min.js"></script>
<script src="js/menu/bootstrap.min.js" type="text/javascript"></script>
<script src="js/menu/wow.min.js"></script>
<script src="js/menu/jquery.nav.js"></script>
<script src="js/menu/main.js"></script>
<!--menu fin-->
</body>
</html>
