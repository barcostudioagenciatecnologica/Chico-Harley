﻿Imports System.Data
Imports System.Net
Imports System.Net.Mail

Partial Class validar
    Inherits System.Web.UI.Page
    'Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    '    If String.IsNullOrEmpty(Request.QueryString("clave")) Then
    '        Response.Write("<script>alert('No se proporcionado una clave. Favor de verificar.');</script>")
    '    Else
    '        Dim clave As String
    '        Try
    '            clave = Request.QueryString("clave")
    '        Catch ex As Exception
    '            Response.Write("<script>alert('La clave no contiene el formato permitido.');</script>")
    '            Exit Sub
    '        End Try
    '        Dim objRegistro As BORegistro = New DalRegistro().ObtenerPorClave(clave)
    '        If objRegistro Is Nothing Then
    '            Exit Sub
    '        ElseIf objRegistro.Folio.Length >= 5 Then
    '            Response.Write("<script>alert('Usted ya fue registrado!!.');</script>")
    '            Exit Sub
    '        End If
    '        If clave <> objRegistro.ClaveRegistro Then
    '            Response.Write("<script>alert('La clave proporcionada no es una clave validas!!.');</script>")
    '            Exit Sub
    '        End If
    '        Dim folio As String = New DalRegistro().AsignarFolioPorUsuario(objRegistro.Id, objRegistro.ClaveRegistro)
    '        If String.IsNullOrEmpty(folio) = False Then
    '            EnviarCorreo(objRegistro.Id)
    '        End If
    '    End If
    'End Sub


    'Protected Function EnviarCorreo(ByVal id As Integer) As Boolean
    '    Dim boRegistro As BORegistro = New DalRegistro().ObtenerPorIdRegistro(id)
    '    Dim cuerpo As String = String.Empty
    '    cuerpo = cuerpo + "<strong>Folio: </strong><FONT SIZE=5>" + boRegistro.Folio + "</font><br>"
    '    Dim correo As New MailMessage()
    '    correo.From = New MailAddress("chicoharley.teh@gmail.com")
    '    'Destinatario
    '    correo.[To].Add(boRegistro.Email.Trim)
    '    'correo.Bcc.Add("marceloleon@outlook.com")
    '    correo.Priority = MailPriority.High
    '    correo.Subject = "Folio de Registro"
    '    correo.Body = "Su Folio de registro es el siguiente: <br><br>" + cuerpo
    '    'Dim servicio As New SmtpClient()
    '    'servicio.Host = "localhost"
    '    Dim servicio As New SmtpClient
    '    servicio.Host = "smtp.gmail.com"
    '    servicio.Port = 587
    '    servicio.EnableSsl = True
    '    servicio.UseDefaultCredentials = False
    '    servicio.Credentials = New NetworkCredential("chicoharley.teh@gmail.com", "ch1c0h@r13y")


    '    Dim respuesta As Boolean = False
    '    Dim html As AlternateView = AlternateView.CreateAlternateViewFromString("<img src=""http://chicoharleytehuacan.com/imageMail/header.png"" alt=""Logo"" /><br />Usted ha quedado registrado para el evento de Chico Harley con los siguientes datos: <br><br>" + cuerpo, System.Text.Encoding.UTF8, "text/html")
    '    'Dim logo As LinkedResource = New LinkedResource(Server.MapPath("~/Images/header.png"))
    '    'logo.ContentId = "buayacorp_logo"
    '    'html.LinkedResources.Add(logo)
    '    correo.AlternateViews.Add(html)
    '    Try
    '        servicio.Send(correo)
    '        'If tabla.Rows.Count Mod 20 = 0 Then
    '        '    servicio.Send(correo2)
    '        '    respuesta = True
    '        'Else
    '        respuesta = True
    '        'End If
    '    Catch ex As Exception
    '        EnviarCorreo(id)
    '    End Try
    '    Return respuesta
    'End Function
End Class
