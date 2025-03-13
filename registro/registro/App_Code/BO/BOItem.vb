Option Strict On
Option Explicit On
Public Class BOItem

    Property Talla() As String
    Property Valor() As String

    Sub New(size As String, value As String)
        Talla = size
        Valor = value
    End Sub

    Public Overrides Function ToString() As String
        Return Talla
    End Function
End Class
