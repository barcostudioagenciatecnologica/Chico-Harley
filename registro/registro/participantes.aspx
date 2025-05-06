<%@ Page Language="VB" AutoEventWireup="false" CodeFile="participantes.aspx.vb" Inherits="participantes" %>

<!doctype html>
<html lang="es-MX">
<head>
    <meta charset="UTF-8">
    <title>Chico Harley - Participantes</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/participantes.css" rel="stylesheet" type="text/css">
    <link href="font/stylesheet.css" rel="stylesheet" type="text/css">
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
    <link href="css/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script type="text/javascript" src="tools/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="loginForm" runat="server" method="post">
        <header>

            <div id="header">
                <div class="centrar" >
                    <div class="logo">
                        <a style="outline: none; text-decoration: none; outline-color: none" href="participantes.aspx">
                             <img src="img/LOGO2025.png"></a>
                    </div>
                    <nav>
                        <ul>
                             <li>
                                <a id="stock" href="#" onclick="abrirModal(); return false;"><i class="fa fa-boxes"></i> STOCK</a>
                            </li>
                             <li>
                                <a id="entrega" href="entrega.aspx"><i class="fa fa-certificate" aria-hidden="true"></i> ENTREGA DE ARTICULOS</a>
                            </li>
                           <li>
                                <a id="active" href="participantes.aspx"><i class="fa fa-users" aria-hidden="true"></i> PARTICIPANTES</a>
                            </li>
                            <li>
                                <asp:LinkButton  aria-hidden="true" ID="LinkButton1" runat="server"> <i class="fa fa-sign-out"></i> CERRAR SESIÓN</asp:LinkButton>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        
  	    <div class="letra" >
		    <div  data-ng-controller="UserController"  class="modal-dialog modal-sm">

            <!-- Modal content no 1-->
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title text-center form-title">Panel de participantes</h1>
              </div>
              <div class="modal-body padtrbl">
                <div class="login-box-body">
                  <div class="form-group">
                      <div>
                           <div class="row">
                   <div class="col-xs-12">
    		     <label style=" color:#000;  font-family: 'typewriter_condensedregular'; font-size:18px">Búsqueda: </label>
                 </div>
                                <div class="col-xs-9">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control3 " type="search" placeholder="Escriba aquí"  MaxLength="50" autocomplete="off" name=""   ></asp:TextBox>
                                    </div>
                    &nbsp;
                               <div  class="col-xs-3 ">
                               
                    <asp:Button ID="btnBuscar" runat="server" type="submit" CssClass="button8" Text="Buscar" ValidationGroup="CamposLlenos"
                         OnClick="btnBuscar_Click"  ToolTip="Click Para Buscar "/>
                                   </div>
                       </div>
                    <br />  
		    <div  >
                
            <!-- Modal content no 1-->
            <div  class="form-group">
                   <div  class="card">
                       <div  class="card-content table-responsive">
                    <asp:GridView  ID="DatosDG" runat="server" AutoGenerateColumns="False" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="854px" 
                            CssClass="table table-bordered table-hover" DataKeyNames="ID" AllowPaging="True">
                            <Columns >    
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="Folio" HeaderText="Folio" />
                                <asp:BoundField DataField="NombrePiloto" HeaderText="Nombre (Piloto)" />
                                <asp:BoundField DataField="ApellidoPiloto" HeaderText="Apellidos (Piloto)" />
                                <asp:BoundField DataField="NombreCopiloto" HeaderText="Nombre (Copiloto)" />
                                <asp:BoundField DataField="CopilotoApellido" HeaderText="Apellidos (Copiloto)" />   
                                <asp:BoundField DataField="MotocicletaMarca" HeaderText="Marca"/>
                                <asp:BoundField DataField="MotocicletaModelo" HeaderText="Modelo" />
                                <asp:BoundField DataField="MotocicletaCilindrada" HeaderText="Cilindrado" />
                                <asp:BoundField DataField="No_Serie_VIN" HeaderText="No_Serie_VIN" />
                                <asp:BoundField DataField="NombreMotoclub" HeaderText="Motoclub"  />
                                <asp:BoundField DataField="Celular" HeaderText="Celular"  />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Talla" HeaderText="Articulos" />
                                <asp:TemplateField HeaderText="Comida">
                                <ItemTemplate>
                                    <%# IIf(Convert.ToBoolean(Eval("Comida")), "Si", "No") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                 <asp:BoundField DataField="Procedencia" HeaderText="Procedencia" />
                                <asp:BoundField DataField="Clave_Registro" HeaderText="Clave"/>
                               <asp:TemplateField HeaderText="Generar">
                                    <ItemTemplate>
                                        <asp:Button style="top:5px; position:relative" ID="btnGenerarClave"
                                            class="btn btn-primary"
                                            Text="Clave"
                                            CommandArgument='<%#Eval("ID")%>'
                                            OnClick="GenerarClave"
                                            runat="server" />
                                    </ItemTemplate>
                               </asp:TemplateField>
                          <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:Button style="top:5px; position:relative" ID="btnEliminar"
                                        class="btn btn-primary"
                                        Text="Eliminar"
                                        CommandArgument='<%#Eval("ID")%>'
                                        OnClick="EliminarRegistro"
                                        OnClientClick="return confirm('Deseas eliminar este registro?');"
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>     
                                
<%--                                
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/site/img/icons/cross.png"
                    CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"
                    AlternateText="Delete" />               
            </ItemTemplate>
        </asp:TemplateField> --%>                                           
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066"/>
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
			       </div>
                  </div>
                </div>
                </div>
        </div>
                        </div>
                    </div> </div> </div></div></div>


   
    </form>
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
                    <li> <a>Copyright 2025 © Chico Harley Tehuacán​</a>

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
              
<!-- Modal de STOCK -->
<div id="modalStock" class="modal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5); z-index:9999; justify-content:center; align-items:center;">
    <div class="modal-content" style="background:#fff; padding:20px; border-radius:8px; width:400px; max-width:90%; box-shadow:0 0 10px rgba(0,0,0,0.3);">
        <h2 style="margin-top:0;">Stock de Material</h2>
        <table id="tablaStock" style="width:100%; border-collapse:collapse;">
            <thead>
                <tr>
                    <th style="border-bottom:1px solid #ccc; padding:8px; text-align:left;">Talla</th>
                    <th style="border-bottom:1px solid #ccc; padding:8px; text-align:left;">Cantidad</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <div style="margin-top:20px; text-align:right;">
            <button onclick="cerrarModal()" style="padding:8px 12px;">Cerrar</button>
        </div>
    </div>
</div>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function checar() {
            if (boton.disabled == true) {
                boton.disabled = false;
            } else {
                boton.disabled = true;
            }
        }

        function abrirModal() {
            document.getElementById('modalStock').style.display = 'flex';
            cargarStock();
        }

        function cerrarModal() {
            document.getElementById('modalStock').style.display = 'none';
        }

        function cargarStock() {
            $.ajax({
                type: "POST",
                url: "entrega.aspx/ObtenerStock",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var datos = response.d;
                    var html = "";
                    for (var i = 0; i < datos.length; i++) {
                        html += `<tr>
                    <td>${datos[i].Talla}</td>
                    <td style="display: flex; align-items: center;">
                        <input type='number' value='${datos[i].Cantidad}' data-id='${datos[i].Id}' style="flex: 1; padding: 4px;" />
                        <button onclick='actualizarCantidad(${datos[i].Id}, this)' style="margin-left: 8px; padding: 4px 8px;">Actualizar</button>
                    </td>
                </tr>`;
                    }
                    $("#tablaStock tbody").html(html);
                },
                error: function (err) {
                    alert("Error al obtener stock.");
                }
            });
        }


        function actualizarCantidad(id, boton) {
            var input = $(boton).siblings("input");
            var cantidad = input.val();

            $.ajax({
                type: "POST",
                url: "participantes.aspx/ActualizarStock",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: id, cantidad: parseInt(cantidad) }),
                success: function (response) {
                    alert("Cantidad actualizada correctamente.");
                },
                error: function () {
                    alert("Error al actualizar la cantidad.");
                }
            });
        }

    </script>
    <script type="text/javascript" src="js/menu1.js"></script>
</body>
</html>
