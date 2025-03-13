USE adminchhly_ChicoHarley
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE CH_Registro_Insertar
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
					,Id_Evento,
					nombreCop				
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
					,@LId_Evento,
					 @nombreCop
					);
	COMMIT TRAN Tra
		SET @VResp = @LFolio
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = ''
	END CATCH
END


