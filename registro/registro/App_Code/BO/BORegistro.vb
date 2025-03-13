
Public Class BORegistro
    Private _id As Integer
    Private _claveRegistro As String
    Private _nombrePiloto As String
    Private _apellidoPiloto As String
    Private _nombreCop As String
    Private _apellidoCop As String
    Private _procedencia As String
    Private _celular As String
    Private _motoClub As String
    Private _lider As Boolean
    Private _motocicletaMarca As String
    Private _motocicletaModelo As String
    Private _motocicletaCilindrada As String
    Private _email As String
    Private _noSerieVin As String
    Private _folio As String
    Private _talla As String
    Private _FechaRegistro As DateTime
    Private _Entregado As Boolean



#Region "Propiedades"


#End Region

    Public Property Id as Integer
        Get
            return _id
        End Get
        Set
            _id = value
        End Set
    End Property

    Public Property ClaveRegistro as String
        Get
            return _claveRegistro
        End Get
        Set
            _claveRegistro = value
        End Set
    End Property

    Public Property NombrePiloto as String
        Get
            return _nombrePiloto
        End Get
        Set
            _nombrePiloto = value
        End Set
    End Property

    Public Property ApellidoPiloto as String
        Get
            return _apellidoPiloto
        End Get
        Set
            _apellidoPiloto = value
        End Set
    End Property

    Public Property NombreCop as String
        Get
            return _nombreCop
        End Get
        Set
            _nombreCop = value
        End Set
    End Property

    Public Property ApellidoCop as String
        Get
            return _apellidoCop
        End Get
        Set
            _apellidoCop = value
        End Set
    End Property

    Public Property Procedencia as String
        Get
            return _procedencia
        End Get
        Set
            _procedencia = value
        End Set
    End Property

    Public Property Celular as String
        Get
            return _celular
        End Get
        Set
            _celular = value
        End Set
    End Property

    Public Property MotoClub as String
        Get
            return _motoClub
        End Get
        Set
            _motoClub = value
        End Set
    End Property

    Public Property Lider as Boolean
        Get
            return _lider
        End Get
        Set
            _lider = value
        End Set
    End Property

    Public Property MotocicletaMarca as String
        Get
            return _motocicletaMarca
        End Get
        Set
            _motocicletaMarca = value
        End Set
    End Property

    Public Property MotocicletaModelo as String
        Get
            return _motocicletaModelo
        End Get
        Set
            _motocicletaModelo = value
        End Set
    End Property

    Public Property MotocicletaCilindrada as String
        Get
            return _motocicletaCilindrada
        End Get
        Set
            _motocicletaCilindrada = value
        End Set
    End Property

    Public Property Email as String
        Get
            return _email
        End Get
        Set
            _email = value
        End Set
    End Property

    Public Property NoSerieVin as String
        Get
            return _noSerieVin
        End Get
        Set
            _noSerieVin = value
        End Set
    End Property

    Public Property Folio as String
        Get
            return _folio
        End Get
        Set
            _folio = value
        End Set
    End Property

    Public Property Talla As String
        Get
            Return _talla
        End Get
        Set
            _talla = Value
        End Set
    End Property

    Public Property FechaRegistro As DateTime

        Get
            Return _FechaRegistro
        End Get
        Set
            _FechaRegistro = Value
        End Set
    End Property

    Public Property Entregado As Boolean
        Get
            Return _Entregado
        End Get
        Set(value As Boolean)
            _Entregado = value
        End Set
    End Property
End Class
