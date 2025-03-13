use [adminchhly_ChicoHarley]
ALTER TABLE dbo.CH_Registro ADD
	nombreCop varchar(MAX) NOT NULL CONSTRAINT DF_CH_Registro_nombreCop DEFAULT ''
ALTER TABLE dbo.CH_Registro SET (LOCK_ESCALATION = TABLE)

