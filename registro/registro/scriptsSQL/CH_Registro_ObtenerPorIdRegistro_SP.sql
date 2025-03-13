USE [adminchhly_ChicoHarley]
GO
/****** Object:  StoredProcedure [dbo].[CH_Registro_ObtenerPorCondiciones_SP]    Script Date: 5/4/2014 11:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CH_Registro_ObtenerPorIdRegistro_SP]
@IdRegistro       		INT			= 0,			
@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		Select top(50)Id_Registro
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
		FROM	CH_Registro R
		WHERE [Id_Registro]=@IdRegistro
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH 
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END


