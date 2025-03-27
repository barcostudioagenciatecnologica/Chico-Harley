Imports System.Data.SqlClient
Imports System.Data

Public Class DalRegistro
    Implements IDisposable
    Private Const Cad As String = "Data Source=chicoharley.cjwysgo0c41u.us-east-2.rds.amazonaws.com;Initial Catalog=adminchhly_ChicoHarley;User ID=admin;Password=chicoharley2025"
    'Private Const Cad As String = "Data Source=.;Initial Catalog=adminchhly_ChicoHarley;User ID=sa;Password=admin123"

    Property ErrorMessage() As String
    Private ReadOnly _con As SqlConnection


    Public Function ObtenerPorCondiciones(ByVal condicion As String) As List(Of BORegistro)
        Dim listaBoRegistro As New List(Of BORegistro)()
        Dim dt As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_ObtenerPorCondiciones_SP", _con)
        cmd.Parameters.AddWithValue("@Condicion", condicion)
        cmd.CommandType = CommandType.StoredProcedure
        'Try
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        da.Fill(dt)
        For Each drw As DataRow In dt.Rows
            Dim dr As DataRow = drw
            Dim temp As New BORegistro()
            temp.Id = CType(dr("ID"), Integer)
            temp.ClaveRegistro = CType(dr("Clave_Registro"), String)
            temp.NombrePiloto = CType(dr("NombrePiloto"), String)
            temp.ApellidoPiloto = CType(dr("ApellidoPiloto"), String)
            temp.NombreCop = CType(dr("NombreCopiloto"), String)
            temp.ApellidoCop = CType(dr("CopilotoApellido"), String)
            temp.Celular = CType(dr("Celular"), String)
            temp.MotoClub = CType(dr("NombreMotoClub"), String)
            temp.Lider = CType(dr("Lider_Miembro"), Boolean)
            temp.MotocicletaMarca = CType(dr("MotocicletaMarca"), String)
            temp.MotocicletaModelo = CType(dr("MotocicletaModelo"), String)
            temp.MotocicletaCilindrada = CType(dr("MotocicletaCilindrada"), String)
            temp.Email = CType(dr("Email"), String)
            temp.FechaRegistro = CType(dr("FechaRegistro"), DateTime)
            temp.NoSerieVin = CType(dr("No_Serie_VIN"), String)
            temp.Folio = CType(dr("Folio"), String)
            temp.Talla = CType(dr("Talla"), String)
            temp.Procedencia = CType(dr("Procedencia"), String)
            temp.Comida = CType(dr("Comida"), String)
            temp.Entregado = CType(dr("entregado"), Boolean)
            listaBoRegistro.Add(temp)
        Next
        'Catch ex As Exception
        '    Throw New Exception(ex.Message)
        'End Try
        Return listaBoRegistro


    End Function
    Public Function ObtenerIDporCorreo(ByVal Correo As String) As Integer
        Dim sql As String = String.Empty
        If _con.State = ConnectionState.Closed Then
            _con.Open()
        End If
        ' Modifica la consulta SQL para seleccionar el ID más reciente asociado al correo electrónico
        sql = "SELECT TOP 1 ID FROM CH_Registro WHERE Email = '" + Correo + "' ORDER BY ID DESC"
        Dim cmd As New SqlCommand(sql, _con)
        Dim id As Integer = 0
        Dim fbdatareader As SqlDataReader = cmd.ExecuteReader
        If fbdatareader.Read Then
            ' Asigna el ID obtenido
            id = fbdatareader.GetInt32(0)
        End If
        fbdatareader.Close()
        Return id
    End Function

    Public Function ObtenerIDporCelular(ByVal telefono As String) As Boolean
        Dim sql As String = String.Empty
        If _con.State = ConnectionState.Closed Then
            _con.Open()
        End If
        sql = "SELECT ID FROM CH_Registro where Celular = '" + telefono + "'"
        Dim cmd As New SqlCommand(sql, _con)
        Dim fbdatareader As SqlDataReader = cmd.ExecuteReader
        Dim id As Integer
        While (fbdatareader.Read)
            id = fbdatareader.GetInt32(0)
            fbdatareader.Close()
            Return True
        End While
        fbdatareader.Close()
        Return False
    End Function
    Public Function ObtenerPorIdRegistro(ByVal idRegistro As Integer) As BORegistro
        Dim objBoRegistro As New BORegistro()
        Dim dt As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_ObtenerPorIdRegistro_SP", _con)
        cmd.Parameters.AddWithValue("@IdRegistro", idRegistro)
        cmd.CommandType = CommandType.StoredProcedure
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            da.Fill(dt)
            For Each drw As DataRow In dt.Rows
                Dim dr As DataRow = drw
                Dim temp As New BORegistro()
                temp.Id = CType(dr("ID"), Integer)
                temp.ClaveRegistro = CType(dr("Clave_Registro"), String)
                temp.NombrePiloto = CType(dr("NombrePiloto"), String)
                temp.ApellidoPiloto = CType(dr("ApellidoPiloto"), String)
                temp.NombreCop = CType(dr("NombreCopiloto"), String)
                temp.ApellidoCop = CType(dr("CopilotoApellido"), String)
                temp.Procedencia = CType(dr("Procedencia"), String)
                temp.Celular = CType(dr("Celular"), String)
                temp.MotoClub = CType(dr("NombreMotoclub"), String)
                temp.Lider = CType(dr("Lider_Miembro"), Boolean)
                temp.MotocicletaMarca = CType(dr("MotocicletaMarca"), String)
                temp.MotocicletaModelo = CType(dr("MotocicletaModelo"), String)
                temp.MotocicletaCilindrada = CType(dr("MotocicletaCilindrada"), String)
                temp.Email = CType(dr("Email"), String)
                temp.NoSerieVin = CType(dr("No_Serie_Vin"), String)
                temp.Folio = CType(dr("Folio"), String)
                temp.Talla = CType(dr("Talla"), String)
                temp.Entregado = CType(dr("entregado"), Boolean)
                objBoRegistro = temp
            Next
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return objBoRegistro
    End Function

    Public Function ActualizarEntregado(ByVal idRegistro As Integer) As String
        Dim resp As String = String.Empty
        Dim cmd As SqlCommand = New SqlCommand("CH_ActualizarEntregado_SP", _con)
        cmd.Parameters.AddWithValue("@Idregistro", idRegistro)
        cmd.CommandType = CommandType.StoredProcedure

        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.VarChar, 7)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = cmd.Parameters("@VResp").Value.ToString()
            _con.Close()
        Catch ex As Exception
            _con.Close()
        End Try
        Return resp
    End Function


    Public Function AsignarClavePorUsuario(ByVal idRegistro As Integer) As String
        Dim resp As String = String.Empty
        Dim cmd As SqlCommand = New SqlCommand("CH_ACTUALIZAR_CLAVE_REGISTRO_SP", _con)
        cmd.Parameters.AddWithValue("@ID", idRegistro)
        cmd.CommandType = CommandType.StoredProcedure

        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.Bit)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)

        Dim clave As SqlParameter = New SqlParameter("@Clave", SqlDbType.NVarChar, 7)
        clave.Direction = ParameterDirection.Output
        cmd.Parameters.Add(clave)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = cmd.Parameters("@Clave").Value.ToString()
            _con.Close()
        Catch ex As Exception
            _con.Close()
        End Try
        Return resp
    End Function

    Public Function Eliminarregistro(idRegistro As Integer) As String
        Dim resp As String = String.Empty
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_Eliminar_SP", _con)
        cmd.Parameters.AddWithValue("@ID", idRegistro)
        cmd.CommandType = CommandType.StoredProcedure

        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.NVarChar, 255)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)

        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = cmd.Parameters("@VResp").Value.ToString()
            _con.Close()
        Catch ex As Exception
            _con.Close()
        End Try
        Return resp
    End Function

    Public Function AsignarFolioPorUsuario(ByVal idRegistro As Integer, clave As String) As String
        Dim resp As String = String.Empty
        Dim cmd As SqlCommand = New SqlCommand("CH_ACTUALIZAR_FOLIO_REGISTRO_SP", _con)
        cmd.Parameters.AddWithValue("@ID", idRegistro)
        cmd.Parameters.AddWithValue("@Clave", clave)
        cmd.CommandType = CommandType.StoredProcedure

        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.Bit)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)

        Dim folio As SqlParameter = New SqlParameter("@Folio", SqlDbType.NVarChar, 7)
        folio.Direction = ParameterDirection.Output
        cmd.Parameters.Add(folio)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = cmd.Parameters("@Folio").Value.ToString()
            _con.Close()
        Catch ex As Exception
            _con.Close()
        End Try
        Return resp
    End Function

    Public Sub New()
        _con = New SqlConnection(Cad)
    End Sub


#Region "CONSULTAR (DATATABLE)"
    ''' <summary>
    ''' <returns>Regresa DataTable</returns>
    ''' <remarks></remarks>
    ''' </summary>
    Public Function ConsultarDataTable() As DataTable
        Dim tb As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_Consultar_SP", _con)
        cmd.CommandType = CommandType.StoredProcedure
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            da.Fill(tb)
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return tb
    End Function

    Public Function ObtenerNoPlayeras(ByVal talla As String) As Integer
        Dim noPlayeras As Integer = 0
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_ObtenerNoPlayeras_SP", _con)
        cmd.Parameters.AddWithValue("@Condicion", talla)
        cmd.CommandType = CommandType.StoredProcedure
        Dim agrego As SqlParameter = New SqlParameter("@NoPLayeras", SqlDbType.VarChar, 7)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            noPlayeras = CInt(cmd.Parameters("@NoPLayeras").Value)
            _con.Close()
        Catch ex As Exception
            _con.Close()
        End Try
        Return noPlayeras
    End Function

#End Region

#Region "CONSULTAR EVENTO (DATATABLE)"
    ''' <summary>
    ''' <returns>Regresa DataTable</returns>
    ''' <remarks></remarks>
    ''' </summary>
    Public Function ConsultarEventoDataTable() As DataTable
        Dim tb As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Evento_Actual_SP", _con)
        cmd.CommandType = CommandType.StoredProcedure
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            da.Fill(tb)
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return tb
    End Function

#End Region

#Region "CREAR"
    ''' <summary>
    ''' Crea un nuevo registro , devuelve true si logra insertar o false si no lo
    ''' puede hacer
    ''' </summary>
    Public Function Crear(registro As BORegistro) As Boolean
        Dim resp As Boolean
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_Insertar", _con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@NombrePiloto", registro.NombrePiloto)
        cmd.Parameters.AddWithValue("@ApellidoPiloto", registro.ApellidoPiloto)
        cmd.Parameters.AddWithValue("@NombreCopiloto", registro.NombreCop)
        cmd.Parameters.AddWithValue("@ApellidoCopiloto", registro.ApellidoCop)
        cmd.Parameters.AddWithValue("@Procedencia", registro.Procedencia)
        cmd.Parameters.AddWithValue("@Celular", registro.Celular)
        cmd.Parameters.AddWithValue("@NombreMotoclub", registro.MotoClub)
        cmd.Parameters.AddWithValue("@Lider", registro.Lider)
        cmd.Parameters.AddWithValue("@MotocicletaMarca", registro.MotocicletaMarca)
        cmd.Parameters.AddWithValue("@MotocicletaModelo", registro.MotocicletaModelo)
        cmd.Parameters.AddWithValue("@MotocicletaCilindrada", registro.MotocicletaCilindrada)
        cmd.Parameters.AddWithValue("@Email", registro.Email)
        cmd.Parameters.AddWithValue("@No_Serie_VIN", registro.NoSerieVin)
        cmd.Parameters.AddWithValue("@Talla", registro.Talla)
        cmd.Parameters.AddWithValue("@Comida ", registro.Comida)

        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.Int)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)
        Dim message As SqlParameter = New SqlParameter("@MensajeError", SqlDbType.NVarChar, 4000)
        message.Direction = ParameterDirection.Output
        cmd.Parameters.Add(message)
        'Try
        _con.Open()
        cmd.ExecuteNonQuery()
        resp = CBool(cmd.Parameters("@VResp").Value)
        If True Then
            ErrorMessage = cmd.Parameters("@MensajeError").Value.ToString()
        End If
        _con.Close()

        'Catch ex As Exception
        '    resp = False
        '    _con.Close()
        'End Try
        Return resp
    End Function

#End Region

    Public Function ObtenerPorClave(clave As String) As BORegistro
        Dim objBoRegistro As New BORegistro()
        Dim dt As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_ObtenerPorClaveRegistro_SP", _con)
        cmd.Parameters.AddWithValue("@clave", clave)
        cmd.CommandType = CommandType.StoredProcedure
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            da.Fill(dt)
            If dt.Rows.Count = 0 Then
                Return Nothing
            End If
            Dim dr As DataRow = dt.Rows(0)
            Dim temp As New BORegistro()
            temp.Id = CType(dr("ID"), Integer)
            temp.ClaveRegistro = CType(dr("Clave_Registro"), String)
            temp.NombrePiloto = CType(dr("NombrePiloto"), String)
            temp.ApellidoPiloto = CType(dr("ApellidoPiloto"), String)
            temp.NombreCop = CType(dr("NombreCopiloto"), String)
            temp.ApellidoCop = CType(dr("CopilotoApellido"), String)
            temp.Procedencia = CType(dr("Procedencia"), String)
            temp.Celular = CType(dr("Celular"), String)
            temp.MotoClub = CType(dr("NombreMotoclub"), String)
            temp.Lider = CType(dr("Lider_Miembro"), Boolean)
            temp.MotocicletaMarca = CType(dr("MotocicletaMarca"), String)
            temp.MotocicletaModelo = CType(dr("MotocicletaModelo"), String)
            temp.MotocicletaCilindrada = CType(dr("MotocicletaCilindrada"), String)
            temp.Email = CType(dr("Email"), String)
            temp.NoSerieVin = CType(dr("No_Serie_Vin"), String)
            temp.Folio = CType(dr("Folio"), String)
            temp.Talla = CType(dr("Talla"), String)
            objBoRegistro = temp

        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return objBoRegistro
    End Function

    ''' <summary>
    ''' Metodo para la realizacion de busqueda de datos previamente registrados en la db
    ''' </summary>
    ''' <param name="valor">Datos que se buscaran en la base de datos</param>
    ''' <param name="opc">1 Email || 2 VIN || 3 Celular</param>
    ''' <returns></returns>
    Public Function ValorRegistradoPreviamente(valor As String, opc As Integer) As Boolean
        Dim res As Boolean
        Dim dt As DataTable = New DataTable()
        Dim cmd As SqlCommand = New SqlCommand("CH_Registro_ObtenerRegistrosPorOpciones_SP", _con)
        cmd.Parameters.AddWithValue("@Opc", opc)
        cmd.Parameters.AddWithValue("@Valor", valor)
        cmd.CommandType = CommandType.StoredProcedure
        'Try
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            res = True
        Else
            res = False
        End If
        'Catch ex As Exception
        '    Throw New Exception(ex.Message)
        'End Try
        Return res
    End Function

    ''' <summary>
    ''' Funcion que obtiene el numero total de playeras registradas por una talla en especifico
    ''' </summary>
    ''' <param name="talla">Tallas S || M || G || XG  </param>
    ''' <returns></returns>
    Public Function ObtenerTotalPlayerasPorTalla(talla As String) As Integer
        Dim resp As Integer
        Dim cmd As SqlCommand = New SqlCommand("OBTENER_TOTAL_PLAYERAS_POR_TALLA_SP", _con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@Talla", talla)
        Dim agrego As SqlParameter = New SqlParameter("@VResp", SqlDbType.Int)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = CInt(cmd.Parameters("@VResp").Value)
            _con.Close()
        Catch ex As Exception
            resp = 0
            _con.Close()
        End Try
        Return resp
    End Function

    Public Function ObtenerTallaPY(talla As String) As Integer
        Dim resp As Integer
        Dim cmd As SqlCommand = New SqlCommand("CH_Material_TallaPY", _con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@Talla", talla)
        Dim agrego As SqlParameter = New SqlParameter("@Resp", SqlDbType.Int)
        agrego.Direction = ParameterDirection.Output
        cmd.Parameters.Add(agrego)
        Try
            _con.Open()
            cmd.ExecuteNonQuery()
            resp = CInt(cmd.Parameters("@Resp").Value)
            _con.Close()
        Catch ex As Exception
            resp = 0
            _con.Close()
        End Try
        Return resp
    End Function


#Region "IDisposable Support"
    Private disposedValue As Boolean ' To detect redundant calls

    ' IDisposable
    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not disposedValue Then
            If disposing Then
                ' TODO: dispose managed state (managed objects).
            End If


            _con.Dispose()
        End If
        disposedValue = True
    End Sub

    ' TODO: override Finalize() only if Dispose(disposing As Boolean) above has code to free unmanaged resources.
    'Protected Overrides Sub Finalize()
    '    ' Do not change this code.  Put cleanup code in Dispose(disposing As Boolean) above.
    '    Dispose(False)
    '    MyBase.Finalize()
    'End Sub

    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(disposing As Boolean) above.
        Dispose(True)
        ' TODO: uncomment the following line if Finalize() is overridden above.
        GC.SuppressFinalize(Me)
    End Sub
#End Region

End Class