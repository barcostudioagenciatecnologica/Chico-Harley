USE [adminchhly_ChicoHarley]
GO
/****** Object:  StoredProcedure [dbo].[CH_InicializaAutonumerico_SP]    Script Date: 5/4/2014 10:52:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CH_ActualizarEntregado_SP]
-- =======================================================================================
-- AUTOR:					Marcelo Leon
-- MODIFICADO POR:			Marcelo Leon
-- FECHA CREACIÓN:			20/12/2011
-- FECHA DEL ULTIMO:		20/12/2011
-- DESCRIPCIÓN:				CONSULTA DE DATOS DE LA TABLA dbo.CH_Registro
-- DESCRIPCIÓN DE LA TABLA:	dbo.CH_Registro
-- ========================================================================================
	@Idregistro				int=0,
	@VResp					INT			= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
Begin Tran Tra
	Begin Try
		update [dbo].[CH_Registro] 
		set [entregado] = 1
		where [ID]=@Idregistro
	COMMIT TRAN Tra
		SET @VResp = 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN Tra
		SET @VResp = 0
	END CATCH
END


