Imports BOUsuario

Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub btnuserlogin_Click(sender As Object, e As EventArgs) Handles btnuserlogin.Click
        Dim _BOUsuario As New BOUsuario()
        _BOUsuario.Nombre = Me.txtuserpsw.Text
        _BOUsuario.Password = Me.txtloginpsw.Text

        If _BOUsuario.Nombre = "Administrator" Then
            If _BOUsuario.Password.ToLower = "chico007" Then
                Session("user") = _BOUsuario
                Response.Redirect("participantes.aspx")
            End If
        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
