
Imports System.Net
Imports System.Net.Mail

Partial Class validacion
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Request.QueryString("clave")) Then
            Response.Write("<script>alert('No se proporcionado una clave. Favor de verificar.');</script>")
        Else
            Dim clave As String
            Try
                clave = Request.QueryString("clave")
            Catch ex As Exception
                Response.Write("<script>alert('La clave no contiene el formato permitido.');</script>")
                Exit Sub
            End Try
            Dim objRegistro As BORegistro = New DalRegistro().ObtenerPorClave(clave)
            If objRegistro Is Nothing Then
                Response.Write("<script>alert('La clave proporcionada no es una clave validas!!.');</script>")
                Exit Sub
            ElseIf objRegistro.Folio <> " " Then
                Response.Write("<script>alert('Usted ya fue registrado!!.');</script>")
                Exit Sub
            End If
            If clave <> objRegistro.ClaveRegistro Then
                Response.Write("<script>alert('La clave proporcionada no es una clave validas!!.');</script>")
                Exit Sub
            End If
            Dim folio As String = New DalRegistro().AsignarFolioPorUsuario(objRegistro.Id, objRegistro.ClaveRegistro)
            If String.IsNullOrEmpty(folio) = False Then
                'EnviarCorreo(objRegistro.Id)
            End If
        End If
    End Sub


    Protected Function EnviarCorreo(ByVal id As Integer) As Boolean
        Dim boRegistro As BORegistro = New DalRegistro().ObtenerPorIdRegistro(id)
        Dim cuerpo As String = String.Empty
        cuerpo = cuerpo + "<strong>Folio: </strong><FONT SIZE=5>" + boRegistro.Folio + "</font><br>"
        cuerpo = cuerpo + "<FONT SIZE=20><strong>IMPORTANTE: EL DÍA DEL REGISTRO EN EL EVENTO ES OBLIGATORIO PRESENTAR SU NÚMERO DE FOLIO (IMPRESO O EN IMAGEN) ASÍ COMO IDENTIFICACIÓN OFICIAL (FÍSICA) PARA VALIDAR SU REGISTRO Y RECIBIR SU KIT DE BIENVENIDA</strong></font><br>"
        cuerpo = cuerpo + "<FONT SIZE=15><strong>El número de participación es único e intransferible. Favor de tomar en cuenta estos requisitos para agilizar el proceso. Cualquier duda comunicarse al 2381505344 o bien escribir al correo: chicoharley.teh@hotmail.com</strong></font><br>"
        Dim correo As New MailMessage()
        correo.From = New MailAddress("chico.harley2024@gmail.com")
        'Destinatario
        correo.[To].Add(boRegistro.Email.Trim)
        'correo.Bcc.Add("marceloleon@outlook.com")
        correo.Priority = MailPriority.High
        correo.Subject = "Folio de Registro"
        correo.Body = "Su Folio de registro es el siguiente: <br><br>" + cuerpo
        Dim servicio As New SmtpClient
        servicio.Host = "smtp.gmail.com"
        servicio.Port = 587
        servicio.EnableSsl = True
        servicio.UseDefaultCredentials = False
        servicio.Credentials = New NetworkCredential("chico.harley2024@gmail.com", "rfdssdjgtyhevvbc")

        Dim respuesta As Boolean = False
        Dim html As AlternateView = AlternateView.CreateAlternateViewFromString("<img src=" + "3.21.129.7/imageMail/header.png" + " alt=""Logo"" /><br />Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: <br><br>" + cuerpo, System.Text.Encoding.UTF8, "text/html")
        correo.AlternateViews.Add(html)
        Try
            servicio.Send(correo)
            respuesta = True
        Catch ex As Exception
            EnviarCorreo(id)
        End Try
        Return respuesta
    End Function
End Class
