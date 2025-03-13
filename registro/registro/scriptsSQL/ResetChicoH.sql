GO
DELETE FROM [CH_Automumerios]
go
DBCC CHECKIDENT ('[CH_Automumerios]',reseed,0)
go
GO
DELETE FROM [CH_Evento]
go
DBCC CHECKIDENT ('[CH_Evento]',reseed,0)
GO
DELETE FROM [CH_Material]
go
DBCC CHECKIDENT ('[CH_Material]',reseed,0)
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
DELETE FROM [CH_Registro]
go
DBCC CHECKIDENT ('[CH_Registro]',reseed,0)