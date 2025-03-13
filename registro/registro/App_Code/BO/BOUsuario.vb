
Public Class BOUsuario
    Private _Nombre As String
    Private _Password As String

#Region "Propiedades"

    Public Property Nombre As String
        Get
            Return _Nombre
        End Get
        Set
            _Nombre = Value
        End Set
    End Property

    Public Property Password As String
        Get
            Return _Password
        End Get
        Set
            _Password = Value
        End Set
    End Property

#End Region

End Class
