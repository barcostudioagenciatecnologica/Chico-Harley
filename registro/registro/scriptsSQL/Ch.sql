USE [adminchhly_ChicoHarley]
GO
/****** Object:  StoredProcedure [dbo].[CH_Evento_Actual_SP]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Evento_Actual_SP]
-- =======================================================================================
-- AUTOR:					MARCELO ALEJANDRO LEON MENDEZ
-- MODIFICADO POR:			MARCELO ALEJANDRO LEON MENDEZ
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
/****** Object:  StoredProcedure [dbo].[CH_InicializaAutonumerico_SP]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CH_InicializaAutonumerico_SP]
-- =======================================================================================
-- AUTOR:					MARCELO ALEJANDRO LEON MENDEZ
-- MODIFICADO POR:			MARCELO ALEJANDRO LEON MENDEZ
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
/****** Object:  StoredProcedure [dbo].[CH_NuevoEvento]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_NuevoEvento]
-- =========================================================================
-- AUTOR:					MARCELO ALEJANDRO LEON MENDEZ
-- MODIFICADO POR:			MARCELO ALEJANDRO LEON MENDEZ
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
/****** Object:  StoredProcedure [dbo].[CH_Registro_Consultar_SP]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_Consultar_SP]
@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		Select 	 Folio
				,Nombre
				,Procedencia
				,Telefono
				,Celular
				,Motoclub
				,Lider
				,Motocicleta
				,Email
				,FolioUnico
				,FechaRegistro
				,nombreCop
				,Entregado
				,tallaCam
		FROM	CH_Registro R, CH_Evento E
		WHERE	R.Id_Evento = E.Id_Evento And E.Anio = YEAR(GETDATE())
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_Insertar]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CH_Registro_Insertar]
@Nombre			varchar(max)	= null,
@Procedencia	varchar(max)	= null,
@Telefono		varchar(15)		= null,
@Celular		varchar(15)		= null,
@Motoclub		varchar(max)	= null,
@Lider			bit				= null,
@Motocicleta	varchar(max)	= null,
@Email			varchar(max)	= null,
@FolioUnico 	varchar(20)		= null,
@nombreCop		varchar(max)	= null,
@Entregado		varchar(20)		= null,
@tallaCam    	varchar(20)		= null,
@VResp			varchar(7)	  	= '' OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
BEGIN TRAN Tra
	BEGIN TRY
	Declare @LFolio varchar(7)
	Declare @LId_Evento int
	Set	@LId_Evento	= (SELECT Id_Evento FROM dbo.CH_Evento WHERE Anio = YEAR(GETDATE()))
	Set @LFolio		= CONVERT (VARCHAR(2),YEAR(GETDATE())-2000) +'F'+ CONVERT (VARCHAR(MAX),(SELECT Enumeracion + 1 FROM dbo.CH_Automumerios WHERE Id_Evento = @LId_Evento))
		
	UPDATE CH_Automumerios
	SET Enumeracion	= Enumeracion+1
	WHERE Id_Evento = @LId_Evento

		INSERT INTO CH_Registro
					(
					 Folio			
					,Nombre		
					,Procedencia
					,Telefono		
					,Celular	
					,Motoclub
					,Lider		
					,Motocicleta		
					,Email			
					,FolioUnico
					,FechaRegistro
					,Id_Evento
					,nombreCop
					,Entregado	
					,tallaCam			
					)
			  VALUES
					(
					 @LFolio			
					,@Nombre			
					,@Procedencia	
					,@Telefono		
					,@Celular		
					,@Motoclub
					,@Lider		
					,@Motocicleta			
					,@Email			
					,@FolioUnico
					,GETDATE()
					,@LId_Evento
					 ,@nombreCop
					 ,@Entregado
					 ,@tallaCam
					);
	COMMIT TRAN Tra
		SET @VResp = @LFolio
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = ''
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerPorCondiciones_SP]    Script Date: 5/3/2014 11:15:36 AM ******/
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
		Select 	 Id_Registro
		        ,Folio
				,Nombre
				,Procedencia
				,Telefono
				,Celular
				,Motoclub
				,Lider
				,Motocicleta
				,Email
				,FolioUnico
				,FechaRegistro
				,nombreCop
				,Entregado
				,tallaCam
		FROM	CH_Registro R, CH_Evento E
		WHERE  (RTRIM(Nombre)  like '%' + @Condicion + '%') or
		(RTRIM(Folio)  like '%' + @Condicion + '%') or
		(RTRIM(Email)  like '%' + @Condicion + '%') or
		(RTRIM(FolioUnico)  like '%' + @Condicion + '%')
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH 
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END


GO
/****** Object:  Table [dbo].[CH_Automumerios]    Script Date: 5/3/2014 11:15:36 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CH_Evento]    Script Date: 5/3/2014 11:15:36 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CH_Registro]    Script Date: 5/3/2014 11:15:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CH_Registro](
	[Id_Registro] [int] IDENTITY(1,1) NOT NULL,
	[Folio] [varchar](7) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Procedencia] [varchar](max) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Celular] [varchar](15) NULL,
	[Motoclub] [varchar](max) NOT NULL,
	[Lider] [bit] NOT NULL,
	[Motocicleta] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[FolioUnico] [varchar](20) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Id_Evento] [int] NOT NULL,
	[nombreCop] [varchar](max) NOT NULL,
	[entregado] [varchar](20) NOT NULL,
	[tallaCam] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[Id_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CH_Registro] ADD  CONSTRAINT [DF_CH_Registro_nombreCop]  DEFAULT ('') FOR [nombreCop]
GO
ALTER TABLE [dbo].[CH_Registro] ADD  CONSTRAINT [DF_CH_Registro_entregado]  DEFAULT ((0)) FOR [entregado]
GO
ALTER TABLE [dbo].[CH_Automumerios]  WITH CHECK ADD  CONSTRAINT [FK_CH_Automumerios_CH_Evento] FOREIGN KEY([Id_Evento])
REFERENCES [dbo].[CH_Evento] ([Id_Evento])
GO
ALTER TABLE [dbo].[CH_Automumerios] CHECK CONSTRAINT [FK_CH_Automumerios_CH_Evento]
GO
ALTER TABLE [dbo].[CH_Registro]  WITH CHECK ADD  CONSTRAINT [FK_CH_Registro_CH_Evento] FOREIGN KEY([Id_Evento])
REFERENCES [dbo].[CH_Evento] ([Id_Evento])
GO
ALTER TABLE [dbo].[CH_Registro] CHECK CONSTRAINT [FK_CH_Registro_CH_Evento]
GO
USE [master]
GO
ALTER DATABASE [adminchhly_ChicoHarley] SET  READ_WRITE 
GO
