USE [adminchhly_ChicoHarley]
GO
/****** Object:  UserDefinedFunction [dbo].[GENERAR_CLAVE_ALPHANUMERICA]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GENERAR_CLAVE_ALPHANUMERICA] ( @numCaracteres INT )
RETURNS VARCHAR(10)
AS
    BEGIN
        DECLARE @Length INT;
        DECLARE @CharPool NVARCHAR(MAX);
        DECLARE @PoolLength INT; 
        DECLARE @LoopCount INT;
        DECLARE @RandomString NVARCHAR(MAX);
        SET @Length = @numCaracteres;
        SET @CharPool = 'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ23456789';
		--'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ23456789.,-_!$@#%^&*'
        SET @PoolLength = LEN(@CharPool);
        SET @LoopCount = 0;
        SET @RandomString = '';
        WHILE ( @LoopCount < @Length )
            BEGIN
                SELECT  @RandomString = @RandomString + SUBSTRING(@CharPool,
                                                              CONVERT(INT, ( SELECT
                                                              rndResult
                                                              FROM
                                                              rndView
                                                              ) * @PoolLength),
                                                              1);
                SELECT  @LoopCount = @LoopCount + 1;
            END;
        RETURN @RandomString;
    END;
GO
/****** Object:  View [dbo].[rndView]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[rndView]
AS
SELECT RAND() rndResult
GO
/****** Object:  Table [dbo].[CH_Automumerios]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Automumerios](
	[Id_Autonumericios] [int] IDENTITY(1,1) NOT NULL,
	[Enumeracion] [int] NOT NULL,
	[Id_Evento] [int] NOT NULL,
 CONSTRAINT [PK_Automumerios] PRIMARY KEY CLUSTERED 
(
	[Id_Autonumericios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Evento]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Evento](
	[Id_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [int] NOT NULL,
	[FechaAper] [date] NOT NULL,
	[FechaClau] [date] NOT NULL,
 CONSTRAINT [PK_CH_Evento] PRIMARY KEY CLUSTERED 
(
	[Id_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Material]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Talla] [nvarchar](100) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Registro]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Registro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Clave_Registro] [varchar](7) NOT NULL,
	[NombrePiloto] [varchar](255) NOT NULL,
	[ApellidoPiloto] [varchar](255) NOT NULL,
	[NombreCopiloto] [varchar](255) NULL,
	[CopilotoApellido] [varchar](255) NULL,
	[Celular] [varchar](15) NULL,
	[NombreMotoclub] [varchar](255) NOT NULL,
	[Lider_Miembro] [bit] NOT NULL,
	[MotocicletaMarca] [varchar](255) NOT NULL,
	[MotocicletaModelo] [varchar](255) NULL,
	[MotocicletaCilindrada] [varchar](255) NULL,
	[Email] [varchar](255) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[No_Serie_VIN] [nchar](17) NULL,
	[Folio] [varchar](7) NOT NULL,
	[Talla] [nchar](10) NULL,
	[Procedencia] [varchar](255) NULL,
	[Entregado] [bit] NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CH_Material] ON 

INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (1, N'S', 0, N'Small')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (2, N'M', 0, N'Medium')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (3, N'L', 0, N'Great')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (4, N'XL', 0, N'Xgreat')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (5, N'P', 0, N'Parche')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (6, N'Comida', 0, N'Comida')
INSERT [dbo].[CH_Material] ([ID], [Talla], [Cantidad], [Descripcion]) VALUES (7, N'Nada', 0, N'Acceso al evento')
SET IDENTITY_INSERT [dbo].[CH_Material] OFF
GO
ALTER TABLE [dbo].[CH_Registro] ADD  CONSTRAINT [DF_CH_Registro_Folio]  DEFAULT ('') FOR [Folio]
GO
ALTER TABLE [dbo].[CH_Registro] ADD  CONSTRAINT [DF_CH_Registro_Entregado]  DEFAULT ((0)) FOR [Entregado]
GO
ALTER TABLE [dbo].[CH_Automumerios]  WITH CHECK ADD  CONSTRAINT [FK_CH_Automumerios_CH_Evento] FOREIGN KEY([Id_Evento])
REFERENCES [dbo].[CH_Evento] ([Id_Evento])
GO
ALTER TABLE [dbo].[CH_Automumerios] CHECK CONSTRAINT [FK_CH_Automumerios_CH_Evento]
GO
/****** Object:  StoredProcedure [dbo].[CH_ACTUALIZAR_CLAVE_REGISTRO_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_ACTUALIZAR_CLAVE_REGISTRO_SP]
    @ID INT = 0,
    @Clave NVARCHAR(7) = NULL OUTPUT,
    @VResp BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN Tra;
    BEGIN TRY
        DECLARE @cadena NVARCHAR(7);

        -- Generar una nueva clave única para este registro
        SET @cadena = dbo.GENERAR_CLAVE_ALPHANUMERICA(7);

        DECLARE @ExisteClave INT;
        GeneraNueva:
        SET @ExisteClave = (SELECT COUNT(ID) FROM dbo.CH_Registro WHERE Clave_Registro = @cadena);
        IF @ExisteClave = 0
        BEGIN
            -- Actualizar la clave del registro actual
            UPDATE dbo.CH_Registro SET Clave_Registro = @cadena WHERE ID = @ID;
        END
        ELSE
        BEGIN
            -- Generar una nueva clave si la actual ya existe
            SET @cadena = dbo.GENERAR_CLAVE_ALPHANUMERICA(7);
            GOTO GeneraNueva;
        END;

        COMMIT TRAN Tra;
        SET @Clave = @cadena;
        SET @VResp = 1;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN Tra;
        SET @VResp = 0;
    END CATCH;
END;






GO
/****** Object:  StoredProcedure [dbo].[CH_ACTUALIZAR_FOLIO_REGISTRO_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_ACTUALIZAR_FOLIO_REGISTRO_SP]
    @ID INT = 0,
    @Clave NVARCHAR(7) = NULL,
    @Folio NVARCHAR(7) = NULL OUTPUT,
    @VResp BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN Tra;
    BEGIN TRY
        DECLARE @LFolio VARCHAR(7);
        DECLARE @LId_Evento INT;

        -- Verificar si hay registros con el mismo correo electrónico
        DECLARE @Correo NVARCHAR(255);
        SELECT @Correo = Email FROM dbo.CH_Registro WHERE ID = @ID;

        IF EXISTS (SELECT 1 FROM dbo.CH_Registro WHERE Email = @Correo AND ID <> @ID)
        BEGIN
            -- Generar el folio para cada registro con el mismo correo
            DECLARE @Contador INT;
            SELECT @Contador = Enumeracion FROM dbo.CH_Automumerios WHERE Id_Evento = (SELECT Id_Evento FROM dbo.CH_Evento WHERE Anio = YEAR(GETDATE()));

            DECLARE @ID_Registro INT;
            DECLARE registros_cursor CURSOR FOR SELECT ID FROM dbo.CH_Registro WHERE Email = @Correo;
            OPEN registros_cursor;
            FETCH NEXT FROM registros_cursor INTO @ID_Registro;
            
            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @LFolio = CONVERT(VARCHAR(2), YEAR(GETDATE()) - 2000) + 'J' + CONVERT(VARCHAR(MAX), @Contador) + '-' + RIGHT('000' + CAST(@ID_Registro AS NVARCHAR(4)), 3);

                UPDATE dbo.CH_Registro SET Folio = @LFolio WHERE ID = @ID_Registro;

                SET @Contador = @Contador + 1;
                FETCH NEXT FROM registros_cursor INTO @ID_Registro;
            END

            CLOSE registros_cursor;
            DEALLOCATE registros_cursor;
        END
        ELSE
        BEGIN
            -- Generar el folio como se hacía originalmente
            SET @LId_Evento = (SELECT Id_Evento FROM dbo.CH_Evento WHERE Anio = YEAR(GETDATE()));
            SET @LFolio = CONVERT(VARCHAR(2), YEAR(GETDATE()) - 2000) + 'J' + CONVERT(VARCHAR(MAX), (SELECT Enumeracion + 1 FROM dbo.CH_Automumerios WHERE Id_Evento = @LId_Evento));
            UPDATE CH_Automumerios SET Enumeracion = Enumeracion + 1 WHERE Id_Evento = @LId_Evento;
        END

        -- Actualizar el folio del registro actual
        UPDATE dbo.CH_Registro SET Folio = @LFolio WHERE ID = @ID AND Clave_Registro = @Clave;

        COMMIT TRAN Tra;
        SET @Folio = @LFolio;
        SET @VResp = 1;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN Tra;
        SET @VResp = 0;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[CH_Evento_Actual_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Evento_Actual_SP]
-- =======================================================================================
-- AUTOR:					GERARDO RAMÍREZ SERAPIO
-- MODIFICADO POR:			GERARDO RAMÍREZ SERAPIO
-- FECHA CREACIÓN:			20/12/2011
-- FECHA DEL ULTIMO:		20/12/2011
-- DESCRIPCIÓN:				CONSULTA DE DATOS DE LA TABLA dbo.CH_Registro
-- DESCRIPCIÓN DE LA TABLA:	dbo.CEIESE_ALUMNOGRUPO.
-- ========================================================================================
	@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		Select 	FechaAper,FechaClau,
				Getdate() as 'FActual'
		FROM	dbo.CH_Evento
		WHERE	Anio = YEAR(GETDATE())
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CH_InicializaAutonumerico_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CH_InicializaAutonumerico_SP]
-- =======================================================================================
-- AUTOR:					GERARDO RAMÍREZ SERAPIO
-- MODIFICADO POR:			GERARDO RAMÍREZ SERAPIO
-- FECHA CREACIÓN:			20/12/2011
-- FECHA DEL ULTIMO:		20/12/2011
-- DESCRIPCIÓN:				CONSULTA DE DATOS DE LA TABLA dbo.CH_Registro
-- DESCRIPCIÓN DE LA TABLA:	dbo.CEIESE_ALUMNOGRUPO.
-- ========================================================================================
	@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
				update CH_Automumerios 
		set Enumeracion =0
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Material_TallaPT]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CH_Material_TallaPT]

AS
BEGIN
SELECT [ID]
      ,[Cantidad]
  FROM [adminchhly_ChicoHarley].[dbo].[CH_Material] 
  WHERE Talla =  'P'
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Material_TallaPY]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CH_Material_TallaPY]
 @Talla NVARCHAR(100) = '',
 @Resp Int = 0
 OUTPUT
AS
BEGIN
SET @Resp = (SELECT 
      [Cantidad]
  FROM [adminchhly_ChicoHarley].[dbo].[CH_Material] 
  WHERE Talla = @Talla)

END

GO
/****** Object:  StoredProcedure [dbo].[CH_NuevoEvento]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_NuevoEvento]
-- =========================================================================
-- AUTOR:					GERARDO RAMÍREZ SERAPIO
-- MODIFICADO POR:			GERARDO RAMÍREZ SERAPIO
-- DESCRIPCIÓN:				Crea los datos nesesarios para un nuevo envento, anual
-- DESCRIPCIÓN DE LA TABLA:	
-- FECHA DE CREACIÓN:		20/12/2011
-- FECHA U CAMBIO:			20/12/2011
-- ==========================================================================
@Anio			int   			= null,
@FApertura		date			= null,
@FClausura		date			= null,
-- Determina estado de transaccion 1 -> Se realizo, 0 -> No se realizo
@VResp			int	  			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
BEGIN TRAN Tra
	BEGIN TRY
		INSERT INTO dbo.CH_Evento
					(
					Anio,
					FechaAper,
					FechaClau
					)
				VALUES
					(
					@Anio,
					@FApertura,
					@FClausura
					);
	INSERT INTO dbo.CH_Automumerios
					(
					Enumeracion,
					Id_Evento
					)
				VALUES
					(
					0,
					(SELECT MAX(Id_Evento) FROM dbo.CH_Evento)
					);
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_Consultar_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_Consultar_SP] 
@VResp INT = 0 OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;
        BEGIN TRAN Tra;
        BEGIN TRY
            SELECT  R.ID ,
                    R.Clave_Registro ,
                    R.NombrePiloto ,
                    R.ApellidoPiloto ,
                    R.NombreCopiloto ,
                    R.CopilotoApellido ,
                    R.Celular ,
                    R.NombreMotoclub ,
                    R.Lider_Miembro ,
                    R.MotocicletaMarca ,
                    R.MotocicletaModelo ,
                    R.MotocicletaCilindrada ,
                    R.Email ,
                    R.FechaRegistro ,
                    R.No_Serie_VIN ,
                    R.Folio ,
                    R.Talla ,
                    R.Procedencia,
					R.Entregado
            FROM    CH_Registro R;
		
            COMMIT TRAN Tra;
            SET @VResp = 1;
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN Tra;
            SET @VResp = 0;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_Eliminar_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--****** Object:  StoredProcedure [dbo].[usp_permisoEliminar]    Script Date:20/04/2017 06:22:12 p. m. ******/
    -- =============================================================================================
    -- AUTOR:		        MARCELO LEON
    -- ULTIMO CAMBIO POR: MARCELO LEON
    -- FECHA ULTIMO CAMBIO:20/04/2017 06:22:12 p. m.
    -- DESCRIPCIÓN: ELIMINAR POR ID DE DATOS EN LA TABLA dbo.permiso(ELIMINAR POR ID, POR DEFAULT EL VALOR ACTIVO = 1.
    -- =============================================================================================
CREATE PROCEDURE [dbo].[CH_Registro_Eliminar_SP]
    @id         int=0,
@VResp    nvarchar(4000) output    -- Variable para saber la descripción del error en caso de existir
AS
BEGIN
 SET @VResp = ''
  BEGIN TRANSACTION 
     BEGIN TRY
             DELETE FROM [dbo].[CH_Registro]
             WHERE ID = @id;
			 SET @VResp ='Registro eliminado correctamente';
    END TRY
    BEGIN CATCH
              SET @VResp = '- Database: ' + DB_NAME()
              + ' - Número de error: '    + isnull(convert(varchar, ERROR_NUMBER()), '') + 
              + ' - Mensaje de error: ' + isnull(ERROR_MESSAGE(), '') +
              + ' - Procedimiento almacenado: ' + isnull(ERROR_PROCEDURE(), '') + 
              + ' - Línea de error: '   + isnull(convert(varchar,ERROR_LINE()), '');
              --Si hay una transacción activa en este contexto, y estamos en el try entonces hacemos un ROLLBACKND
              IF (@@TRANCOUNT > 0)
              BEGIN
                ROLLBACK TRANSACTION
              END
     END CATCH;
--Si hay una transacción activa en este contexto, confirmamos la actual
IF (@@TRANCOUNT > 0)
BEGIN
  COMMIT TRANSACTION
END
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_Insertar]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_Insertar]
    @NombrePiloto VARCHAR(MAX) = NULL ,
    @ApellidoPiloto VARCHAR(MAX) = NULL ,
    @NombreCopiloto VARCHAR(MAX) = NULL ,
    @ApellidoCopiloto VARCHAR(MAX) = NULL ,
    @Celular VARCHAR(15) = NULL ,
    @NombreMotoclub VARCHAR(MAX) = NULL ,
    @Lider BIT = NULL ,
    @MotocicletaMarca VARCHAR(MAX) = NULL ,
    @MotocicletaModelo VARCHAR(MAX) = NULL ,
    @MotocicletaCilindrada VARCHAR(MAX) = NULL ,
    @Email VARCHAR(MAX) = NULL ,
    @No_Serie_VIN VARCHAR(MAX) = NULL ,
    @Talla VARCHAR(15)  ,
    @Procedencia VARCHAR(MAX) = NULL ,
	@MensajeError    nvarchar(4000) OUTPUT,    -- Variable para saber la descripción del error en caso de existir
    @VResp bit OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;
        BEGIN TRAN Tra;
        BEGIN TRY

		--INICIO se encarga de actualizar el stock
					--IF (@TallaParche != '') 
					--BEGIN			
					--UPDATE CH_Material SET Cantidad = Cantidad-1 WHERE Talla = 'P';
					--END

					 IF (@Talla != '')
					BEGIN
					UPDATE CH_Material SET Cantidad = Cantidad-1 WHERE Talla = @Talla;
					END
					-- FIN se encarga de actualizar el stock

            --DECLARE @LFolio VARCHAR(7);
            --DECLARE @LId_Evento INT;
            --SET @LId_Evento = ( SELECT  Id_Evento
            --                    FROM    dbo.CH_Evento
            --                    WHERE   Anio = YEAR(GETDATE())
            --                  );
            --SET @LFolio = CONVERT (VARCHAR(2), YEAR(GETDATE()) - 2000) + 'F'
            --    + CONVERT (VARCHAR(MAX), ( SELECT   Enumeracion + 1
            --                               FROM     dbo.CH_Automumerios
            --                               WHERE    Id_Evento = @LId_Evento
            --                             ));
		
            --UPDATE  CH_Automumerios
            --SET     Enumeracion = Enumeracion + 1
            --WHERE   Id_Evento = @LId_Evento;
            INSERT  INTO dbo.CH_Registro
                    ( Clave_Registro ,
                      NombrePiloto ,
                      ApellidoPiloto ,
                      NombreCopiloto ,
                      CopilotoApellido ,
                      Celular ,
                      NombreMotoclub ,
                      Lider_Miembro ,
                      MotocicletaMarca ,
                      MotocicletaModelo ,
                      MotocicletaCilindrada ,
                      Email ,
                      FechaRegistro ,
                      No_Serie_VIN ,
                      Folio ,
                      Talla,
                      Procedencia
                    )
            VALUES  ( ' ' , -- Clave_Registro - varchar(7)
                      @NombrePiloto , -- NombrePiloto - varchar(255)
                      @ApellidoPiloto , -- ApellidoPiloto - varchar(255)
                      @NombreCopiloto , -- NombreCopiloto - varchar(255)
                      @ApellidoCopiloto , -- CopilotoApellido - varchar(255)
                      @Celular , -- Celular - varchar(15)
                      @NombreMotoclub , -- NombreMotoclub - varchar(255)
                      @Lider , -- Lider_Miembro - bit
                      @MotocicletaMarca , -- MotocicletaMarca - varchar(255)
                      @MotocicletaModelo , -- MotocicletaModelo - varchar(255)
                      @MotocicletaCilindrada , -- MotocicletaCilindrada - varchar(255)
                      @Email , -- Email - varchar(255)
                      GETDATE() , -- FechaRegistro - datetime
                      @No_Serie_VIN , -- No_Serie_VIN - nchar(10)
                      ' ' , -- Folio - varchar(7)
                      @Talla , -- Talla - nchar(10)
                      @Procedencia -- Procedencia - varchar(255)
                    );
            COMMIT TRAN Tra;
            SET @VResp = 1;
        END TRY
  BEGIN CATCH
              SET @MensajeError = ' - Mensaje de error: ' + isnull(ERROR_MESSAGE(), '')
              --Si hay una transacción activa en este contexto, y estamos en el try entonces hacemos un ROLLBACKND
              IF (@@TRANCOUNT > 0)
              BEGIN
                ROLLBACK TRANSACTION
              END
			     SET @VResp = 0;
     END CATCH;
--Si hay una transacción activa en este contexto, confirmamos la actual
IF (@@TRANCOUNT > 0)
BEGIN
  COMMIT TRANSACTION
END
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerNombresAps_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CH_Registro_ObtenerNombresAps_SP]
@NombrePiloto           varchar(255)= '',
@ApellidoPiloto         varchar(255)= '',
@NombreCopiloto         varchar(255)= '',
@CopilotoApellido       varchar(255)= '',	
@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		Select   *
		FROM	CH_Registro
		WHERE ( 
			(RTRIM(NombrePiloto )= RTRIM( @NombrePiloto)) and
			(RTRIM(ApellidoPiloto) = RTRIM( @ApellidoPiloto)) and
			(RTRIM(NombreCopiloto) = RTRIM( @NombreCopiloto)) and
			(RTRIM(CopilotoApellido) = RTRIM( @CopilotoApellido)))

	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH 
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerPorClaveRegistro_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_ObtenerPorClaveRegistro_SP]
    @clave NVARCHAR(7) = null,
    @VResp INT = 0 OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;
        BEGIN TRAN Tra;
        BEGIN TRY
    
            SELECT TOP ( 1 )
                    ID ,
                    Clave_Registro ,
                    NombrePiloto ,
                    ApellidoPiloto ,
                    NombreCopiloto ,
                    CopilotoApellido ,
					Procedencia,
                    Celular ,
                    NombreMotoclub ,
                    Lider_Miembro ,
                    MotocicletaMarca ,
                    MotocicletaModelo ,
                    MotocicletaCilindrada ,
                    Email ,
                    FechaRegistro ,
                    No_Serie_VIN ,
                    Folio ,
                    Talla,
					Entregado
            FROM    dbo.CH_Registro
            WHERE   Clave_Registro = @clave;
            COMMIT TRAN Tra;
            SET @VResp = 1;
        END TRY
        BEGIN CATCH 
            ROLLBACK TRAN Tra;
            SET @VResp = 0;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerPorCondiciones_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_ObtenerPorCondiciones_SP]
@Condicion       		varchar(max)	= null,			
@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		Select    R.ID ,
                       R.Clave_Registro ,
                       R.NombrePiloto ,
                       R.ApellidoPiloto ,
                       R.NombreCopiloto ,
                       R.CopilotoApellido ,
                       R.Celular ,
                       R.NombreMotoclub ,
                       R.Lider_Miembro ,
                       R.MotocicletaMarca ,
                       R.MotocicletaModelo ,
                       R.MotocicletaCilindrada ,
                       R.Email ,
                       R.FechaRegistro ,
                       R.No_Serie_VIN ,
                       R.Folio ,
                       R.Talla ,
                       R.Procedencia ,
					   R.Entregado,
                       E.Id_Evento ,
                       E.Anio ,
                       E.FechaAper ,
                       E.FechaClau
		FROM	CH_Registro R, CH_Evento E
		WHERE  
		(RTRIM(R.ID)  like '%' + @Condicion + '%') or
		(RTRIM(R.Celular)  like '%' + @Condicion + '%') or
	    (RTRIM(R.No_Serie_VIN)  like '%' + @Condicion + '%') or
	    (RTRIM(R.NombrePiloto)  like '%' + @Condicion + '%') or
		(RTRIM(R.ApellidoPiloto)  like '%' + @Condicion + '%') or
		(RTRIM(R.NombreCopiloto)  like '%' + @Condicion + '%') or
		(RTRIM(R.CopilotoApellido)  like '%' + @Condicion + '%') or
		(RTRIM(R.NombreMotoclub)  like '%' + @Condicion + '%') or
		(RTRIM(Folio)  like '%' + @Condicion + '%') or
		(RTRIM(Email)  like '%' + @Condicion + '%') or
		(RTRIM(R.Clave_Registro)  like '%' + @Condicion + '%')
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH 
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerPorIdRegistro_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_ObtenerPorIdRegistro_SP]
    @IdRegistro INT = 0 ,
    @VResp INT = 0 OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;
        BEGIN TRAN Tra;
        BEGIN TRY
    
            SELECT TOP ( 50 )
                    ID ,
                    Clave_Registro ,
                    NombrePiloto ,
                    ApellidoPiloto ,
                    NombreCopiloto ,
                    CopilotoApellido ,
					Procedencia,
                    Celular ,
                    NombreMotoclub ,
                    Lider_Miembro ,
                    MotocicletaMarca ,
                    MotocicletaModelo ,
                    MotocicletaCilindrada ,
                    Email ,
                    FechaRegistro ,
                    No_Serie_VIN ,
                    Folio ,
                    Talla,
					Entregado
            FROM    dbo.CH_Registro
            WHERE   ID = @IdRegistro;
            COMMIT TRAN Tra;
            SET @VResp = 1;
        END TRY
        BEGIN CATCH 
            ROLLBACK TRAN Tra;
            SET @VResp = 0;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerRegistrosPorOpciones_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_ObtenerRegistrosPorOpciones_SP]
    @Opc INT = 0 ,
    @Valor NVARCHAR(MAX) = NULL ,
    @VResp INT = 0 OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;

DECLARE @lstDato varchar(36)
DECLARE @lnuPosComa int
Declare @dato varchar(36)
Declare @contador int=1
Declare @NombrePiloto varchar(255)
Declare @ApellidoPiloto varchar(255)
Declare @NombreCopiloto varchar(255)
Declare @CopilotoApellido varchar(255)
        BEGIN TRAN Tra;
        BEGIN TRY
		--Busqueda por email
            IF @Opc = 1
                BEGIN
				if ( @Valor <> 'chicoharley.teh@hotmail.com')
				begin
                    SELECT TOP ( 10 )
                            ID ,
                            Clave_Registro ,
                            NombrePiloto ,
                            ApellidoPiloto ,
                            NombreCopiloto ,
                            CopilotoApellido ,
                            Celular ,
                            NombreMotoclub ,
                            Lider_Miembro ,
                            MotocicletaMarca ,
                            MotocicletaModelo ,
                            MotocicletaCilindrada ,
                            Email ,
                            FechaRegistro ,
                            No_Serie_VIN ,
                            Folio ,
                            Talla ,
                            Procedencia,
							Entregado
                    FROM    dbo.CH_Registro
                    WHERE   Email = @Valor;	
				end
				else
					begin
						 select * from [dbo].[CH_Registro] where 1=7
					end
                END;
		--Busqueda por VIN
            ELSE
                IF @Opc = 2
                    BEGIN
                        SELECT TOP ( 10 )
                                ID ,
                                Clave_Registro ,
                                NombrePiloto ,
                                ApellidoPiloto ,
                                NombreCopiloto ,
                                CopilotoApellido ,
                                Celular ,
                                NombreMotoclub ,
                                Lider_Miembro ,
                                MotocicletaMarca ,
                                MotocicletaModelo ,
                                MotocicletaCilindrada ,
                                Email ,
                                FechaRegistro ,
                                No_Serie_VIN ,
                                Folio ,
                                Talla ,
                                Procedencia
                        FROM    dbo.CH_Registro
                        WHERE   No_Serie_VIN = @Valor;			
                    END;
						--Busqueda por Celular
                ELSE
                    IF @Opc = 3
                        BEGIN
                            SELECT TOP ( 10 )
                                    ID ,
                                    Clave_Registro ,
                                    NombrePiloto ,
                                    ApellidoPiloto ,
                                    NombreCopiloto ,
                                    CopilotoApellido ,
                                    Celular ,
                                    NombreMotoclub ,
                                    Lider_Miembro ,
                                    MotocicletaMarca ,
                                    MotocicletaModelo ,
                                    MotocicletaCilindrada ,
                                    Email ,
                                    FechaRegistro ,
                                    No_Serie_VIN ,
                                    Folio ,
                                    Talla ,
                                    Procedencia
                            FROM    dbo.CH_Registro
                            WHERE   Celular = @Valor;			
                        END;
                                ELSE
								--Busqueda por Nombres
                    IF @Opc = 4
                        BEGIN
							WHILE  LEN( @Valor)> 0
							BEGIN
								SET @lnuPosComa = CHARINDEX(',',  @Valor ) -- Buscamos el caracter separador
								IF ( @lnuPosComa=0 )
									BEGIN
										SET @lstDato =  @Valor
										SET  @Valor = ''
									END
								ELSE
									BEGIN
										SET @lstDato = Substring(  @Valor , 1  , @lnuPosComa-1)
										SET  @Valor = Substring(  @Valor , @lnuPosComa + 1 , LEN( @Valor))
									END
								if (@contador=4) set @CopilotoApellido=@lstDato
								if (@contador=3) set @NombreCopiloto=@lstDato
								if (@contador=2) set @ApellidoPiloto=@lstDato
								if (@contador=1) set @NombrePiloto=@lstDato
								set @contador=@contador+1
							END
                           SELECT TOP ( 10 )
                                    ID ,
                                    Clave_Registro ,
                                    NombrePiloto ,
                                    ApellidoPiloto ,
                                    NombreCopiloto ,
                                    CopilotoApellido ,
                                    Celular ,
                                    NombreMotoclub ,
                                    Lider_Miembro ,
                                    MotocicletaMarca ,
                                    MotocicletaModelo ,
                                    MotocicletaCilindrada ,
                                    Email ,
                                    FechaRegistro ,
                                    No_Serie_VIN ,
                                    Folio ,
                                    Talla ,
                                    Procedencia
                            FROM    dbo.CH_Registro
                            WHERE   NombrePiloto = @NombrePiloto and		
									ApellidoPiloto= @ApellidoPiloto and
									NombreCopiloto= @NombreCopiloto and
									CopilotoApellido=@CopilotoApellido
                        END;
			
            COMMIT TRAN Tra;
            SET @VResp = 1;
        END TRY
        BEGIN CATCH 
            ROLLBACK TRAN Tra;
            SET @VResp = 0;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[OBTENER_TOTAL_PLAYERAS_POR_TALLA_SP]    Script Date: 13/03/2025 04:52:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANDRES RAMIREZ SALAZAR
-- Create date: 22:49 05-08-2017
-- Description:	REGRESA LA CANTIDAD DE PLAYERAS REGISTRADAS EN BASE A UNA TALLA PROPORCIONA
-- =============================================
CREATE PROCEDURE [dbo].[OBTENER_TOTAL_PLAYERAS_POR_TALLA_SP] 
	-- Add the parameters for the stored procedure here
    @Talla NVARCHAR(100) = '' ,
    @VResp INT = 0 OUTPUT
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        BEGIN TRAN Tra;
        BEGIN TRY
            SET @VResp = ( SELECT   COUNT(ID)
                           FROM     [adminchhly_ChicoHarley].[dbo].[CH_Registro]
                           WHERE    Talla = @Talla
						   AND Folio !=''
                         );
            COMMIT TRAN Tra;
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN Tra;
            SET @VResp = 0;
        END CATCH;
    END;
GO
