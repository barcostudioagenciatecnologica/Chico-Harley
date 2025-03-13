USE [adminchhly_ChicoHarley]
GO
/****** Object:  StoredProcedure [dbo].[CH_Evento_Actual_SP]    Script Date: 4/28/2014 1:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CH_InicializaAutonumerico_SP]
-- =======================================================================================
-- AUTOR:					GERARDO RAM�REZ SERAPIO
-- MODIFICADO POR:			GERARDO RAM�REZ SERAPIO
-- FECHA CREACI�N:			20/12/2011
-- FECHA DEL ULTIMO:		20/12/2011
-- DESCRIPCI�N:				CONSULTA DE DATOS DE LA TABLA dbo.CH_Registro
-- DESCRIPCI�N DE LA TABLA:	dbo.CEIESE_ALUMNOGRUPO.
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

