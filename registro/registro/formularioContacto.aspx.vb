Imports System.Net.Mail
Imports System.Net
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Diagnostics


Partial Class formularioContacto
    Inherits System.Web.UI.Page

#Region "Sección: Eventos"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        'Response.Redirect("Cierre.aspx")
        'Exit Sub

        If Not IsPostBack Then
            ValidarDisponibilidadComida()
            GenerarStockTallasJS()
        End If
    End Sub

    Private Sub ValidarDisponibilidadComida()
        Dim comidaDisponible As Integer = New DalRegistro().ObtenerTallaPY("Comida")

        ' Si la cantidad de comida es 0 o menor, ocultamos el checkbox
        If comidaDisponible <= 0 Then
            divComida.Visible = False
        Else
            divComida.Visible = True
        End If

        If Not IsPostBack Then
            CargarPlayeras()
        End If

    End Sub

    Private Sub GenerarStockTallasJS()
        Dim stockTallas As New Dictionary(Of String, Integer)
        Dim jsonSerializer As New System.Web.Script.Serialization.JavaScriptSerializer()

        ' Recorremos las opciones del DropDownList para obtener stock de cada talla
        For Each item As ListItem In ddlTalla.Items
            stockTallas(item.Value) = ValidarStockTalla(item.Value)
        Next

        ' Convertimos a JSON
        Dim stockTallasJson As String = jsonSerializer.Serialize(stockTallas)

        ' Insertamos el JSON en la página
        Dim script As String = "var stockTallas = " & stockTallasJson & ";"
        ClientScript.RegisterStartupScript(Me.GetType(), "StockTallasScript", script, True)
    End Sub

    Protected Function ValidarStockTalla(talla As String) As Integer
        Dim dal As New DalRegistro()
        Return dal.ObtenerTallaPY(talla) ' Llama al método que ya tienes en DalRegistro
    End Function

#End Region

#Region "Sección: Opciones del Formulario"

    Protected Sub btnRegistrate_Click(sender As Object, e As EventArgs) Handles btnRegistrate.Click

        Dim boRegistro As New BORegistro()
        Dim valido As Boolean = True
        'Select Case txtLugar.Text.ToLower().Trim()
        '    Case "ajalpan"
        '        valido = False
        '    'Case "tehuacán"
        '    '    valido = False
        '    'Case "tehuacan"
        '    '    valido = False
        '    Case "coapan"
        '        valido = False
        '    Case "santa maria coapan"
        '        valido = False
        '    Case "miahuatlan"
        '        valido = False
        '    Case "santiago miahuatlan"
        '        valido = False
        'End Select
        'Select Case txtEstado.Text.ToLower().Trim()
        '    Case "ajalpan"
        'valido = False
        'Case "tehuacán"
        '    valido = False
        'Case "tehuacan"
        '    valido = False
        '    Case "coapan"
        '        valido = False
        '    Case "santa maria coapan"
        '        valido = False
        '    Case "miahuatlan"
        '        valido = False
        '    Case "santiago miahuatlan"
        '        valido = False
        'End Select
        'If valido = False Then
        '    Response.Write("<script>alert('Para la inscripción debe ponerse en contacto al número 2381505344 con Blanca González Solis');</script>")
        '    Exit Sub
        'End If
        ' Verificar si el correo ya está registrado
        If ExisteDatoPreviamente(txtEmail.Text.ToLower().Trim(), ValoresUnicos.Email) Then
            ' Si el correo ya está registrado, asigna una cadena vacía a ClaveRegistro
            boRegistro.ClaveRegistro = ""
        End If

        ' Verificar si el teléfono tiene la lada "238"
        'If txtCelular1.Text.Trim().StartsWith("238") Then
        '    Response.Write("<script>alert('Para la inscripción con ese teléfono debe ponerse en contacto al número 2381505344 con Blanca González Solis');</script>")
        '    Exit Sub
        'End If

        If ExisteDatoPreviamente(txtNombre.Text.ToLower().Trim() + "," + txtApellido.Text.ToLower().Trim() + "," + txtNombreCopiloto.Text.ToLower().Trim() + "," + txtCopilotoApellido.Text.ToLower().Trim(), ValoresUnicos.Nombres) = True Then
            Response.Write("<script>alert('Usuario ya registrado.');</script>")
            Return
        End If

        If ValidarInformacion() Then
            '  If ExisteDatoPreviamente(String.Format("{0}-{1}-{2}", txtCelular1.Text.Trim(),txtCelular2.Text.Trim(),txtCelular3.Text.Trim()), ValoresUnicos.Celular) = False Then
            If ExisteDatoPreviamente(String.Format("{0}-{1}-{2}", txtCelular1.Text.Trim(), txtCelular1.Text.Trim(), txtCelular1.Text.Trim()), ValoresUnicos.Celular) = False Then
                If ValidaCorreo(txtEmail.Text.ToLower().Trim()) = False Then
                    Response.Write("<script>alert('Correo no valido.');</script>")
                    Exit Sub
                End If
                If ExisteDatoPreviamente(txtEmail.Text.ToLower().Trim(), ValoresUnicos.Email) = False Then
                    If ExisteDatoPreviamente(txtVin.Text.ToLower().Trim(), ValoresUnicos.Vin) = False Then

                        Select Case ddlTalla.SelectedValue
                            'Case "S" : Dim s As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("S")
                            '    Dim ae As Integer = New DalRegistro().ObtenerTallaPY("S")
                            '    If s >= ae Then
                            '        If ae = 0 Then
                            '            Response.Write("<script>alert('Lo sentimos pero la talla S de esta playera se ha terminado');</script>")
                            '            Exit Sub
                            '        End If
                            '    End If
                            Case "Medium" : Dim m As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Medium")
                                Dim als As Integer = New DalRegistro().ObtenerTallaPY("Medium")
                                If m >= als Then
                                    If als = 0 Then
                                        Response.Write("<script>alert('Lo sentimos pero la talla Medium de esta playera se ha terminado');</script>")
                                        Exit Sub
                                    End If
                                End If
                            Case "Large" : Dim l As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Large")
                                Dim alq As Integer = New DalRegistro().ObtenerTallaPY("Large")
                                If l >= alq Then
                                    If alq = 0 Then
                                        Response.Write("<script>alert('Lo sentimos pero la talla Large de esta playera se ha terminado');</script>")
                                        Exit Sub
                                    End If
                                End If
                            Case "XLarge" : Dim xl As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("XLarge")
                                Dim alm As Integer = New DalRegistro().ObtenerTallaPY("XLarge")
                                If xl >= alm Then
                                    If alm = 0 Then
                                        Response.Write("<script>alert('Lo sentimos pero la talla XLarge de esta playera se ha terminado');</script>")
                                        Exit Sub
                                    End If
                                End If
                            Case "Patch" : Dim P As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Patch")
                                Dim alx As Integer = New DalRegistro().ObtenerTallaPY("Patch")
                                If P >= alx Then
                                    If alx = 0 Then
                                        Response.Write("<script>alert('Lo sentimos pero los parches se han terminado');</script>")
                                        Exit Sub
                                    End If
                                End If
                            Case "Acceso al evento" : Dim nada As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Acceso al evento")
                                Dim nda As Integer = New DalRegistro().ObtenerTallaPY("Acceso al evento")
                                If nada >= nda Then
                                    If nda = 0 Then
                                        Response.Write("<script>alert('Lo sentimos ya no se puede REGISTRAR');</script>")
                                        Exit Sub
                                    End If
                                End If
                            Case "PatchLocal" : Dim pl As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("PatchLocal")
                                Dim plo As Integer = New DalRegistro().ObtenerTallaPY("PatchLocal")
                                If pl >= plo Then
                                    If plo = 0 Then
                                        Response.Write("<script>alert('Lo sentimos pero los Parches Locales se han terminado');</script>")
                                        Exit Sub
                                    End If
                                End If
                        End Select
                        Dim objRegistro As New DalRegistro
                        If objRegistro.ObtenerIDporCelular(txtCelular1.Text) = True Then
                            Response.Write("<script>alert('Télefono ya registrado.');</script>")
                            Exit Sub
                        End If
                        If GuardarInformacion() Then
                            'Dim idRegistro As Integer = objRegistro.ObtenerIDporCorreo(txtEmail.Text)
                            'EnviarCorreo(idRegistro)
                            ClearControls()
                            Response.Write("<script>alert('Registro realizado correctamente.');</script>")
                        Else
                            Response.Write("<script>alert('Favor de intentarlo más tarde.');</script>")
                        End If
                        CargarPlayeras()


                    Else
                        Response.Write("<script>alert('El VIN proporcionado ya ha sido registrado por otro participante. Favor de comprobarlo.');</script>")
                    End If
                Else
                    Response.Write("<script>alert('El Email proporcionado ya ha sido registrado por otro participante. Favor de comprobarlo.');</script>")
                End If
            Else
                Response.Write("<script>alert('El Numero de Celular proporcionado ya ha sido registrado por otro participante. Favor de comprobarlo.');</script>")
            End If
        End If
    End Sub

    Protected Function EnviarCorreo(ByVal id As Integer) As Boolean
        Dim boRegistro As BORegistro = New DalRegistro().ObtenerPorIdRegistro(id)
        Dim dalRegistro As New DalRegistro()
        boRegistro.ClaveRegistro = ""
        If String.IsNullOrEmpty(boRegistro.ClaveRegistro.Trim()) Then
            ' Generar una nueva clave solo si ClaveRegistro está vacío
            boRegistro.ClaveRegistro = dalRegistro.AsignarClavePorUsuario(boRegistro.Id)
        End If
        Dim urlBase As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Dim urlVerificador As String = "validacion.aspx?clave=" + boRegistro.ClaveRegistro
        Dim folio As String = New DalRegistro().AsignarFolioPorUsuario(boRegistro.Id, boRegistro.ClaveRegistro)
        Dim cadenaUrl As String = String.Format("{0}{1}", urlBase, urlVerificador)
        Dim cuerpo As String = String.Empty
        cuerpo = cuerpo + "<FONT SIZE=15>Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos:</font><br>"
        cuerpo = cuerpo + "<strong>Folio: </strong><FONT SIZE=40>" + folio + "</font><br>"
        cuerpo = cuerpo + "<strong>Nombre: </strong>" + boRegistro.NombrePiloto.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Nombre Copiloto: </strong>" + boRegistro.NombreCop.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Procedencia: </strong>" + boRegistro.Procedencia.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Número de celular:</strong>" + boRegistro.Celular + "<br>"
        cuerpo = cuerpo + "<strong>MotoClub: </strong>" + boRegistro.MotoClub + "<br>"
        cuerpo = cuerpo + "<strong>Correo electronico: </strong>" + boRegistro.Email + "<br>"
        cuerpo = cuerpo + "<strong>Numero de Serie o VIN: </strong>" + boRegistro.NoSerieVin + "<br><br>"
        'cuerpo = cuerpo + "<strong>Confirmar Registro: </strong><a href=""" + cadenaUrl + """>Confirmar Registro dando Click Aqui</a><br><br>"
        cuerpo = cuerpo + "<FONT SIZE=20><strong>IMPORTANTE: EL DÍA DEL REGISTRO EN EL EVENTO ES OBLIGATORIO PRESENTAR SU NÚMERO DE FOLIO (IMPRESO O EN IMAGEN) ASÍ COMO IDENTIFICACIÓN OFICIAL (FÍSICA) PARA VALIDAR SU REGISTRO Y RECIBIR SU KIT DE BIENVENIDA</strong></font><br>"
        cuerpo = cuerpo + "<FONT SIZE=15><strong>El número de participación es único e intransferible. Favor de tomar en cuenta estos requisitos para agilizar el proceso. Cualquier duda comunicarse al 2381505344 o bien escribir al correo: chicoharley.teh@hotmail.com</strong></font><br>"
        Dim correo As New MailMessage()
        'correo.From = New MailAddress("contactohosting1@gmail.com")
        correo.From = New MailAddress("chico.harley2024@gmail.com")
        'Destinatario
        correo.[To].Add(boRegistro.Email.Trim)
        'correo.Bcc.Add("marceloleon@outlook.com")
        correo.Priority = MailPriority.High
        correo.Subject = "Confirmación de Registro"
        correo.Body = "Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: <br><br>" + cuerpo
        'Dim servicio As New SmtpClient()
        'servicio.Host = "localhost"
        Dim servicio As New SmtpClient
        servicio.Host = "smtp.gmail.com"
        servicio.Port = 587
        servicio.EnableSsl = True
        servicio.UseDefaultCredentials = False
        servicio.Credentials = New NetworkCredential("chico.harley2024@gmail.com", "rfdssdjgtyhevvbc")

        Dim respuesta As Boolean = False
        Dim html As AlternateView = AlternateView.CreateAlternateViewFromString("<img src=" + "18.220.166.31/imageMail/header.png" + " alt=""Logo"" /><br />Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: <br><br>" + cuerpo, System.Text.Encoding.UTF8, "text/html")
        correo.AlternateViews.Add(html)
        Try
            servicio.Send(correo)
            'If tabla.Rows.Count Mod 20 = 0 Then
            '    servicio.Send(correo2)
            '    respuesta = True
            'Else
            respuesta = True
            'End If
        Catch ex As Exception
            EnviarCorreo(id)
        End Try
        Return respuesta
    End Function
    Function ValidaCorreo(ByVal Correo As String) As Boolean
        Dim CorreoRegex As New System.Text.RegularExpressions.Regex(
        "^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$")
        '"^(?<user>[^@]+)@(?<host>.+)$")
        Dim CorreoMatch As System.Text.RegularExpressions.Match =
          CorreoRegex.Match(LCase(Correo))
        Return CorreoMatch.Success
    End Function


#End Region

#Region "Sección: Métodos"

    Private Sub ClearControls()
        txtNombre.Text = String.Empty
        txtApellido.Text = String.Empty
        txtNombreCopiloto.Text = String.Empty
        txtCopilotoApellido.Text = String.Empty
        txtLugar.Text = String.Empty
        txtEstado.Text = String.Empty
        txtCelular1.Text = String.Empty
        txtNombreMotoclub.Text = String.Empty
        cboPosicion.SelectedIndex = 0
        ddlTalla.SelectedIndex = 0
        txtMarca.Text = String.Empty
        txtModelo.Text = String.Empty
        txtCilindrada.Text = String.Empty
        txtEmail.Text = String.Empty
        txtVin.Text = String.Empty
        chkComida.Checked = False

    End Sub

    Private Sub CargarPlayeras()
        Dim boItems As New List(Of BOItem)
        Dim s As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Small")
        Dim m As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Medium")
        Dim l As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Large")
        Dim xl As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("XLarge")
        Dim p As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Patch")
        Dim nda As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("Acceso al evento")
        Dim PL As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("PatchLocal")

        ' Mensajes de depuración para verificar los valores
        Debug.WriteLine("s: " & s)
        Debug.WriteLine("m: " & m)
        Debug.WriteLine("l: " & l)
        Debug.WriteLine("xl: " & xl)
        Debug.WriteLine("p: " & p)
        Debug.WriteLine("nda: " & nda)
        Debug.WriteLine("pl: " & pl)

        boItems.Add(New BOItem("SELECCIONE...", "Z"))
        boItems.Add(New BOItem("Medium", "Medium"))
        boItems.Add(New BOItem("Large", "Large"))
        boItems.Add(New BOItem("XLarge", "XLarge"))
        boItems.Add(New BOItem("Patch", "Patch"))
        boItems.Add(New BOItem("Acceso al evento", "Acceso al evento"))
        boItems.Add(New BOItem("Parche Local", "PatchLocal"))

        ' Mensaje de depuración para verificar las opciones agregadas
        For Each item As BOItem In boItems
            Debug.WriteLine("Talla: " & item.Talla)
        Next

        ' Enlazar los datos al RadioButtonList
        ddlTalla.DataSource = boItems
        ddlTalla.DataValueField = "Valor"
        ddlTalla.DataTextField = "Talla"
        ddlTalla.DataBind()

        'ddlTalla.Items.FindByValue("PatchLocal").Attributes.Add("style", "display:none;")

    End Sub

    'Private Sub CargarParche()
    '    Dim boItems As New List(Of BOItem)

    '    Dim p As Integer = New DalRegistro().ObtenerTotalPlayerasPorTalla("P")

    '    boItems.Add(New BOItem("SELECCIONE...", "P"))

    '    If p < MaxTallas.Patch Then
    '        boItems.Add(New BOItem("Patch", "P"))

    '        RadioButtonList1.Items(1).Enabled = True
    '    Else
    '        RadioButtonList1.Items(1).Enabled = False
    '    End If

    '    ddlTalla.DataSource = boItems
    '    ddlTalla.DataValueField = "Valor"
    '    ddlTalla.DataTextField = "Talla"
    '    ddlTalla.DataBind()
    'End Sub

#End Region

#Region "Sección: Funciones"

    Private Function ExisteDatoPreviamente(s As String, valor As ValoresUnicos) As Boolean
        If valor = ValoresUnicos.Email AndAlso s.ToLower().Trim() = "chicoharley.teh@hotmail.com" Then
            ' Si el correo es el permitido, no realizamos la validación y retornamos False
            Return False
        Else
            ' Si el correo no es el permitido, realizamos la validación normal
            Return New DalRegistro().ValorRegistradoPreviamente(s, valor)
        End If
    End Function


    Private Function ValidarInformacion() As Boolean
        If (ValidarCampos() = False) Then
            Return False
        End If
        If (ValidarSoloNumeros(txtCelular1) = False) Then
            Return False
        End If
        If (IsValidEmail(txtEmail.Text.Trim()) = False) Then
            Return False
        End If
        Return True
    End Function

    Private Function GuardarInformacion() As Boolean
        Dim resp As Boolean
        'Try
        '  .Celular = String.Format("{0}-{1}-{2}", txtCelular1.Text.Trim(),txtCelular2.Text.Trim(),txtCelular3.Text.Trim()),
        Dim obj As New BORegistro With {
                   .ApellidoCop = txtCopilotoApellido.Text.ToLower().Trim(),
                   .ApellidoPiloto = txtApellido.Text.ToLower().Trim(),
                   .Celular = String.Format("{0}", txtCelular1.Text.Trim()),
                   .Email = txtEmail.Text.ToLower().Trim(),
                   .MotocicletaCilindrada = txtCilindrada.Text.ToLower().Trim(),
                   .MotocicletaMarca = txtMarca.Text.ToLower().Trim(),
                   .MotocicletaModelo = txtModelo.Text.ToLower().Trim(),
                   .MotoClub = txtNombreMotoclub.Text.ToLower().Trim(),
                   .NombreCop = txtNombreCopiloto.Text.ToLower().Trim(),
                   .NombrePiloto = txtNombre.Text.ToLower().Trim(),
                   .NoSerieVin = txtVin.Text.ToLower().Trim(),
                   .Procedencia = txtLugar.Text.ToLower().Trim() + ", " + txtEstado.Text.ToLower().Trim(),
                   .Talla = "NA",
                   .Lider = Convert.ToBoolean(Request.Form("Lider")),
                   .Comida = chkComida.Checked
               }
        If ddlTalla.SelectedValue <> "Z" Then
            obj.Talla = ddlTalla.SelectedValue
        End If
        If RadioButtonList1.SelectedItem.Value = "Parche" Then
            obj.Talla = "P"
        End If
        'If rbParche.Checked Then
        '   
        'End If

        resp = New DalRegistro().Crear(obj)
        'Catch ex As Exception
        '    resp = False
        'End Try
        Return resp
    End Function

    Private Function ValidarSoloNumeros(textBox As TextBox) As Boolean
        If Not IsNumeric(textBox.Text.Trim()) Then
            Response.Write("<script>alert('Favor de ingresar solo numeros.');</script>")
            textBox.Focus()
            Return False
        End If
        Return True
    End Function

    Private Function ValidarCampos() As Boolean
        If String.IsNullOrEmpty(txtNombre.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el Nombre del asistente.');</script>")
            txtNombre.Focus()
            Return False
        End If

        If String.IsNullOrEmpty(txtApellido.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar al menos un Apellido del asistente.');</script>")
            txtApellido.Focus()
            Return False
        End If

        If Not String.IsNullOrEmpty(txtNombreCopiloto.Text.Trim()) Then
            If String.IsNullOrEmpty(txtCopilotoApellido.Text.Trim()) Then
                Response.Write("<script>alert('Favor de Proporcionar al menos un Apellido del Copiloto.');</script>")
                txtCopilotoApellido.Focus()
                Return False
            End If
        End If

        If String.IsNullOrEmpty(txtLugar.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el Lugar de Origen del asistente.');</script>")
            txtLugar.Focus()
            Return False
        End If
        If String.IsNullOrEmpty(txtEstado.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el Lugar de Origen del asistente.');</script>")
            txtEstado.Focus()
            Return False
        End If
        If String.IsNullOrEmpty(txtNombreMotoclub.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el Nombre del Club del asistente.');</script>")
            txtNombreMotoclub.Focus()
            Return False
        End If

        If cboPosicion.Text = "Seleccionar opción" Then
            Response.Write("<script>alert('Favor de Seleccionar una opcion valida en la sección motoclub.');</script>")
            cboPosicion.Focus()
            Return False
        End If

        If String.IsNullOrEmpty(txtMarca.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar la Marca de la moto del asistente.');</script>")
            txtMarca.Focus()
            Return False
        End If

        If String.IsNullOrEmpty(txtModelo.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el modelo de la moto del asistente.');</script>")
            txtModelo.Focus()
            Return False
        End If

        If String.IsNullOrEmpty(txtCilindrada.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar la cilindrada de la moto del asistente.');</script>")
            txtCilindrada.Focus()
            Return False
        End If

        If String.IsNullOrEmpty(txtEmail.Text.Trim()) Then
            Response.Write("<script>alert('Favor de Proporcionar el Email del asistente.');</script>")
            txtEmail.Focus()
            Return False
        End If

        If (RadioButtonList1.SelectedItem.Value = "Parche") Then
            Return True
        End If
        If ddlTalla.SelectedIndex = 0 And ddlTalla.Items.Count() > 1 Then
            Response.Write("<script>alert('Favor de Seleccionar una talla de playera.');</script>")
            ddlTalla.Focus()
            Return False
        End If
        Return True
    End Function

    Function IsValidEmail(email As String) As Boolean
        Try
            Dim addr = New Net.Mail.MailAddress(email)
            Return addr.Address = email
        Catch ex As Exception
            Response.Write("<script>alert('Favor de Proporcionar un Email valido.');</script>")
            txtEmail.Focus()
            Return False
        End Try
    End Function


#End Region

    'Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click

    'End Sub
    'Protected Sub rbPlayera_CheckedChanged(sender As Object, e As EventArgs) Handles rbPlayera.CheckedChanged
    '    ddlTalla.Enabled = True
    '    rbParche.Checked = False

    'End Sub
    'Protected Sub rbParche_CheckedChanged(sender As Object, e As EventArgs) Handles rbParche.CheckedChanged
    '    ddlTalla.Enabled = False
    '    rbPlayera.Checked = False

    'End Sub
    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If RadioButtonList1.SelectedItem.Value = "Parche" Then
            ddlTalla.Enabled = False
        Else
            ddlTalla.Enabled = True
        End If
    End Sub

End Class

Public Enum ValoresUnicos
    Email = 1
    Vin = 2
    Celular = 3
    Nombres = 4
End Enum

'Todo: actualizar los campos ya que estos son solo para prueba
Public Enum MaxTallas

    Small = 150 ''180 '150
    Medium = 190 ''330 '300 '250
    Great = 430 ''400 ''250 '300
    Xgreat = 150 ''190 '170 '80
    Patch = 800 '1000 '80
    Comida = 280
    Nada = 1000
End Enum