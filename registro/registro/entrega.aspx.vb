Imports System.Data
Imports System.Net
Imports System.Net.Mail

Partial Class entrega
    Inherits System.Web.UI.Page

    Protected lista_Registros As List(Of BORegistro)
    Dim strCondicion As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim _BOUsuario As New BOUsuario()

        If Not IsNothing(Session("user")) Then
            _BOUsuario = Session("user")
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub DatosDG_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles DatosDG.RowCommand
        DatosDG.SelectedIndex = CInt(e.CommandArgument.ToString())
        If (e.CommandName = "Entregar") Then
            Dim id As Integer = seleccionarId()
            If id = 0 Then Return
            Entregar(id)
        End If
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        strCondicion = txtNombre.Text.Trim
        llenarGrid(strCondicion)
    End Sub

    Private Sub llenarGrid(ByVal Condicion As String)
        Dim ObjDALeel_Curriculums As New DalRegistro
        'ObjDALeel_Curriculums.Conexion = cn.obtenerCadena(id_usuario)
        lista_Registros = ObjDALeel_Curriculums.ObtenerPorCondiciones(Condicion)
        Dim tablagv As New DataTable
        tablagv.Columns.Add("ID")
        tablagv.Columns.Add("Folio")
        tablagv.Columns.Add("NombrePiloto")
        tablagv.Columns.Add("ApellidoPiloto")
        tablagv.Columns.Add("NombreCopiloto")
        tablagv.Columns.Add("CopilotoApellido")
        tablagv.Columns.Add("MotocicletaMarca")
        tablagv.Columns.Add("MotocicletaModelo")
        tablagv.Columns.Add("MotocicletaCilindrada")
        tablagv.Columns.Add("No_Serie_VIN")
        tablagv.Columns.Add("NombreMotoclub")
        tablagv.Columns.Add("Motocicleta")
        tablagv.Columns.Add("Celular")
        tablagv.Columns.Add("Email")
        tablagv.Columns.Add("TallaPlayera")
        tablagv.Columns.Add("TallaParche")
        tablagv.Columns.Add("Clave_Registro")
        tablagv.Columns.Add("Procedencia")
        tablagv.Columns.Add("Entregado")

        For Each temp As BORegistro In lista_Registros
            Dim rw1 As DataRow = tablagv.NewRow
            rw1("ID") = temp.Id
            rw1("Folio") = temp.Folio
            rw1("NombrePiloto") = temp.NombrePiloto
            rw1("ApellidoPiloto") = temp.ApellidoPiloto
            rw1("NombreCopiloto") = temp.NombreCop
            rw1("CopilotoApellido") = temp.ApellidoCop
            rw1("MotocicletaMarca") = temp.MotocicletaMarca
            rw1("MotocicletaModelo") = temp.MotocicletaModelo
            rw1("MotocicletaCilindrada") = temp.MotocicletaCilindrada
            rw1("No_Serie_VIN") = temp.NoSerieVin
            rw1("NombreMotoclub") = temp.MotoClub
            rw1("Motocicleta") = temp.MotocicletaMarca
            rw1("Celular") = temp.Celular
            rw1("Email") = temp.Email
            rw1("TallaPlayera") = temp.Talla
            rw1("TallaParche") = temp.Talla
            rw1("Clave_Registro") = String.Empty
            rw1("Procedencia") = temp.Procedencia
            rw1("Entregado") = temp.Entregado
            tablagv.Rows.Add(rw1)
        Next
        tablagv.AcceptChanges()
        Me.DatosDG.DataSource = tablagv
        Me.DatosDG.DataBind()
        Session.Add("listaRegistros", lista_Registros)
    End Sub

    Private Function seleccionarId() As Integer
        Dim row As GridViewRow = DatosDG.SelectedRow
        Dim id As Integer
        Dim resp As Boolean
        Dim val As Integer
        resp = Integer.TryParse(row.Cells(0).Text, val)
        If resp = False Then Return 0
        id = row.Cells(0).Text
        Return id
    End Function

    Private Sub Entregar(ByVal id As Integer)
        Dim ObjDALeel_Curriculums As New DalRegistro
        Dim ObjRegistro As New BORegistro
        ObjRegistro = ObjDALeel_Curriculums.ObtenerPorIdRegistro(id)
        ' If ObjRegistro.Entregado.Trim = "Entregado" Then Mensaje("La entrega ya habia sido realizada") : Return
        ObjDALeel_Curriculums.ActualizarEntregado(id)
        Mensaje("Se ha cambiado el registro a Entregado")
        strCondicion = txtNombre.Text.Trim
        llenarGrid(strCondicion)
    End Sub

    Public Sub Mensaje(ByVal texto As String)
        ClientScript.RegisterStartupScript(GetType(Page),
            "Alerta", "<script languaje=javascript> alert('" + texto + "');</script>")
    End Sub

    'Protected Sub _Registro_Unload(sender As Object, e As EventArgs) Handles Me.Unload
    '    Session("user") = Nothing
    'End Sub

    Protected Sub DatosDG_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles DatosDG.PageIndexChanging
        Dim tabla As GridView = CType(sender, GridView)
        tabla.PageIndex = e.NewPageIndex
        strCondicion = txtNombre.Text.Trim
        llenarGrid(strCondicion)
    End Sub

    Protected Sub txtNombre_TextChanged(sender As Object, e As EventArgs) Handles txtNombre.TextChanged

    End Sub

    Protected Sub ActualizarEntregado(sender As Object, e As EventArgs)
        Dim boton As Button = TryCast(sender, Button)
        If boton IsNot Nothing Then
            Dim idRegistro As Integer = CInt(boton.CommandArgument)
            Dim resp As String = New DalRegistro().ActualizarEntregado(idRegistro)
            Mensaje(resp)
            Response.Redirect("entrega.aspx")
        End If
    End Sub

    Protected Function EnviarCorreo(ByVal id As Integer) As Boolean
        Dim boRegistro As BORegistro = New DalRegistro().ObtenerPorIdRegistro(id)
        If String.IsNullOrEmpty(boRegistro.ClaveRegistro) Then
            boRegistro.ClaveRegistro = New DalRegistro().AsignarClavePorUsuario(boRegistro.Id)
        End If
        Dim urlBase As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Dim urlVerificador As String = "validacion.aspx?clave=" + boRegistro.ClaveRegistro
        Dim cadenaUrl As String = String.Format("{0}{1}", urlBase, urlVerificador)
        Dim cuerpo As String = String.Empty
        Dim folio As String = New DalRegistro().AsignarFolioPorUsuario(boRegistro.Id, boRegistro.ClaveRegistro)
        cuerpo = cuerpo + "<strong>Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: </strong><br>"
        cuerpo = cuerpo + "<strong>Folio: </strong><FONT SIZE=25>" + folio + "</font><br>"
        cuerpo = cuerpo + "<strong>Nombre: </strong>" + boRegistro.NombrePiloto.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Nombre Copiloto: </strong>" + boRegistro.NombreCop.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Procedencia: </strong>" + boRegistro.Procedencia.ToUpper() + "<br>"
        cuerpo = cuerpo + "<strong>Número de celular:</strong>" + boRegistro.Celular + "<br>"
        cuerpo = cuerpo + "<strong>MotoClub: </strong>" + boRegistro.MotoClub + "<br>"
        cuerpo = cuerpo + "<strong>Correo electronico: </strong>" + boRegistro.Email + "<br>"
        cuerpo = cuerpo + "<strong>Numero de Serie o VIN: </strong>" + boRegistro.NoSerieVin + "<br><br>"
        cuerpo = cuerpo + "<FONT SIZE=20><strong>IMPORTANTE: EL DÍA DEL REGISTRO EN EL EVENTO ES OBLIGATORIO PRESENTAR SU NÚMERO DE FOLIO (IMPRESO O EN IMAGEN) ASÍ COMO IDENTIFICACIÓN OFICIAL (FÍSICA) PARA VALIDAR SU REGISTRO Y RECIBIR SU KIT DE BIENVENIDA</strong></font><br>"
        cuerpo = cuerpo + "<FONT SIZE=15><strong>El número de participación es único e intransferible. Favor de tomar en cuenta estos requisitos para agilizar el proceso. Cualquier duda comunicarse al 2381505344 o bien escribir al correo: chicoharley.teh@hotmail.com</strong></font><br>"
        'Dim objRegistro As DalRegistro = New DalRegistro()
        'Dim tabla As DataTable = objRegistro.ConsultarDataTable()
        'Dim correo2 As New MailMessage()
        'If tabla.Rows.Count Mod 20 = 0 Then
        '    Dim cuerpotabla As String = "<table BORDER='3'>" 'INICIAMOS TABLA
        '    cuerpotabla = cuerpotabla + "<tr>" ''FILA DE ENCABEZADO
        '    cuerpotabla = cuerpotabla + "<th>NUM</th>"
        '    cuerpotabla = cuerpotabla + "<th>CLAVE</th>"
        '    cuerpotabla = cuerpotabla + "<th>NOMBRE</th>"
        '    cuerpotabla = cuerpotabla + "<th>PROCEDENCIA</th>"
        '    cuerpotabla = cuerpotabla + "<th>CELULAR</th>"
        '    cuerpotabla = cuerpotabla + "<th>MOTOCLUB</th>"
        '    cuerpotabla = cuerpotabla + "<th>LIDER</th>"
        '    cuerpotabla = cuerpotabla + "<th>MARCA MOTOCICLETA</th>"
        '    cuerpotabla = cuerpotabla + "<th>MODELO MOTOCICLETA</th>"
        '    cuerpotabla = cuerpotabla + "<th>CILINDRADA MOTOCICLETA</th>"
        '    cuerpotabla = cuerpotabla + "<th>CORREO ELECTRONICO</th>"
        '    cuerpotabla = cuerpotabla + "<th>NUM. SERIE O VIN</th>"
        '    cuerpotabla = cuerpotabla + "<th>FECHA REGISTRO</th>"

        '    cuerpotabla = cuerpotabla + "</tr>" 'FIN FILA ENCABEZADO
        '    For i As Integer = 0 To tabla.Rows.Count - 1
        '        cuerpotabla = cuerpotabla + "<tr>"
        '        cuerpotabla = cuerpotabla + "<td>" + (i + 1).ToString + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("Clave_Registro").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("NombrePiloto").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("Procedencia").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("Celular").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("NombreMotoclub").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("Lider_Miembro").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("MotocicletaMarca").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("MotocicletaModelo").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("MotocicletaCilindrada").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("Email").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("No_Serie_VIN").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "<td>" + tabla.Rows(i)("FechaRegistro").ToString() + "</td>"
        '        cuerpotabla = cuerpotabla + "</tr>"
        '    Next
        '    cuerpotabla = cuerpotabla + "</table>"
        '    'correo para administrador 
        '    correo2.From = New MailAddress("chicoharley.teh@gmail.com")
        '    'Destinatario
        '    'correo2.[To].Add("blank.glez.12@gmail.com") 'correo del administrador
        '    correo2.[To].Add("andres.rsa@outlook.com") 'correo del adminsitrador
        '    correo2.Priority = MailPriority.High
        '    correo2.Subject = "Reporte de registros"
        '    correo2.Body = "Reporte de registro para evento: <br>" + cuerpotabla
        '    correo2.IsBodyHtml = True
        'End If

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
        'servicio.Credentials = New NetworkCredential("contactohosting1@gmail.com", "M@r1@n1t@")
        'servicio.Credentials = New NetworkCredential("chico.harley2023@gmail.com", "dkflhqofvxxhviro")
        servicio.Credentials = New NetworkCredential("chico.harley2024@gmail.com", "rfdssdjgtyhevvbc")

        Dim respuesta As Boolean = False
        Dim html As AlternateView = AlternateView.CreateAlternateViewFromString("<img src=" + "3.21.129.7/imageMail/header.png" + " alt=""Logo"" /><br />Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: <br><br>" + cuerpo, System.Text.Encoding.UTF8, "text/html")
        '  Dim logo As LinkedResource = New LinkedResource(Server.MapPath("Encabezado-imagen.jpg"))
        ' logo.ContentId = "buayacorp_logo"
        'html.LinkedResources.Add(logo)
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

    'Protected Sub HyperLink1_Unload(sender As Object, e As EventArgs) Handles HyperLink1.Unload
    '    Session("user") = Nothing
    'End Sub
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session("user") = Nothing
        Response.Redirect("login.aspx")
    End Sub
End Class
