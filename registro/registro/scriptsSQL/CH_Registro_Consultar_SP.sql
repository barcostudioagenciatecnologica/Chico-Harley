USE adminchhly_ChicoHarley
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE CH_Registro_Consultar_SP
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
				,FechaRegistro,
				nombreCop
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

