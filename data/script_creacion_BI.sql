USE [GD2C2023]
GO

/* DROP INICIAL */

-- TABLAS --

-- Tablas antiguas
DROP TABLE IF EXISTS [KERNELSINFLOW].[BI_Operacion]
DROP TABLE IF EXISTS [KERNELSINFLOW].[BI_Pago_Alquiler]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Hechos_Venta')
    DROP TABLE [KERNELSINFLOW].[BI_Hechos_Venta]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Hechos_Alquiler')
    DROP TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Hechos_Anuncio')
    DROP TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio]
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Tiempo')
    DROP TABLE [KERNELSINFLOW].[BI_Tiempo]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Ubicacion')
    DROP TABLE [KERNELSINFLOW].[BI_Ubicacion]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Sucursal')
    DROP TABLE [KERNELSINFLOW].[BI_Sucursal]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Rango_Etario')
    DROP TABLE [KERNELSINFLOW].[BI_Rango_Etario]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Rango_m2')
    DROP TABLE [KERNELSINFLOW].[BI_Rango_m2]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Tipo_Operacion')
    DROP TABLE [KERNELSINFLOW].[BI_Tipo_Operacion]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Moneda')
    DROP TABLE [KERNELSINFLOW].[BI_Moneda]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Tipo_Inmueble')
    DROP TABLE [KERNELSINFLOW].[BI_Tipo_Inmueble]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'BI_Ambientes')
    DROP TABLE [KERNELSINFLOW].[BI_Ambientes]
GO

-- FUNCIONES --

DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBITiempoCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBIUbicacionCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBISucursalCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBIRangoEtarioCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBIRangoM2Codigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBITipoOperacionCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBIMonedaCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBITipoInmuebleCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getBIAmbientesCodigo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fn_getEdadPersona]

-- STORE PROCEDURES --

DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Tiempo]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Ubicacion]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Sucursal]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Rango_Etario]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Rango_m2]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Tipo_Operacion]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Moneda]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Tipo_Inmueble]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Ambientes]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Hechos_Anuncio]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Hechos_Venta]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_BI_Hechos_Alquiler]

-- VISTAS --

DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_DuracionPromedioAnuncios]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_PrecioPromedioAnuncios]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_BarriosMasElegidosAlquilar]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_PorcentajeIncumplimientoPagosAlquileres]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_PorcentajePromedioIncrementoAlquileres]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_PrecioPromedioM2Ventas]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_ValorPromedioComision]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_PorcentajeOperacionesConcretadas]
DROP VIEW IF EXISTS [KERNELSINFLOW].[vw_MontoTotalCierreContratos]

/* TABLAS */

-- DIMENSIONES

CREATE TABLE [KERNELSINFLOW].[BI_Tiempo]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    anio NUMERIC(4,0) NOT NULL,
    mes NUMERIC(2,0) NOT NULL,
    cuatrimestre NUMERIC(1,0) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Ubicacion]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    provincia NVARCHAR(100) NOT NULL,
    localidad NVARCHAR(100) NOT NULL,
    barrio NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Sucursal]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Rango_Etario]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    minimo NUMERIC(3,0),
    maximo NUMERIC(3,0),
    descripcion NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Rango_m2]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    minimo NUMERIC(18,2),
    maximo NUMERIC(18,2),
    descripcion NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Tipo_Operacion]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Moneda]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Tipo_Inmueble]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [KERNELSINFLOW].[BI_Ambientes]
(
    codigo NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
)
GO

-- ANUNCIOS

CREATE TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio]
(
    tiempo_codigo NUMERIC(18,0) NOT NULL, -- FK
    tipo_operacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    moneda_codigo NUMERIC(18,0) NOT NULL, -- FK
    tipo_inmueble_codigo NUMERIC(18,0) NOT NULL, -- FK
    ambientes_codigo NUMERIC(18,0) NOT NULL, -- FK
    ubicacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    rango_etario_codigo NUMERIC(18,0) NOT NULL, -- FK
    rango_m2_codigo NUMERIC(18,0) NOT NULL, -- FK
    sucursal_codigo NUMERIC(18,0) NOT NULL, -- FK
    promedio_dias_publicados NUMERIC(18,2),
    promedio_precio NUMERIC(18,2),
    cantidad_anuncios NUMERIC(18,0),
    cantidad_operacion_concretada NUMERIC(18,0)
)
GO

-- ALQUILERES

CREATE TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler]
(
    tiempo_codigo NUMERIC(18,0) NOT NULL, -- FK
    ubicacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    moneda_codigo NUMERIC(18,0) NOT NULL, -- FK
    rango_etario_inquilino_codigo NUMERIC(18,0) NOT NULL, -- FK
    sucursal_codigo NUMERIC(18,0) NOT NULL, -- FK
    promedio_comision NUMERIC(18,2),
    monto_total_alquileres NUMERIC(18,2),
    cantidad_alquileres NUMERIC(18,0),
    cantidad_pagos_incumplidos NUMERIC(18,0),
    promedio_aumento NUMERIC(18,2)
)
GO

-- VENTAS

CREATE TABLE [KERNELSINFLOW].[BI_Hechos_Venta]
(
    tiempo_codigo NUMERIC(18,0) NOT NULL, -- FK
    ubicacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    moneda_codigo NUMERIC(18,0) NOT NULL, -- FK
    tipo_inmueble_codigo NUMERIC(18,0) NOT NULL, -- FK
    sucursal_codigo NUMERIC(18,0) NOT NULL, -- FK
    promedio_precio_m2 NUMERIC(18,2),
    promedio_comision NUMERIC(18,2),
    monto_total_venta NUMERIC(18,2),
    cantidad_ventas NUMERIC(18,0)
)
GO 

/* PRIMARY KEY */

-- ANUNCIOS

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT PK_BI_Hechos_Anuncio PRIMARY KEY (tiempo_codigo, tipo_operacion_codigo, moneda_codigo, tipo_inmueble_codigo, ambientes_codigo, ubicacion_codigo, rango_etario_codigo, rango_m2_codigo, sucursal_codigo)
GO

-- ALQUILERES

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT PK_BI_Hechos_Alquiler PRIMARY KEY (tiempo_codigo, ubicacion_codigo, moneda_codigo, rango_etario_inquilino_codigo, sucursal_codigo)
GO

-- VENTAS

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT PK_BI_Hechos_Venta PRIMARY KEY (tiempo_codigo, ubicacion_codigo, moneda_codigo, tipo_inmueble_codigo, sucursal_codigo)
GO

/* FOREING KEY */

-- ANUNCIOS

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Tiempo FOREIGN KEY (tiempo_codigo) REFERENCES [KERNELSINFLOW].[BI_Tiempo](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Tipo_Operacion FOREIGN KEY (tipo_operacion_codigo) REFERENCES [KERNELSINFLOW].[BI_Tipo_Operacion](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Moneda FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[BI_Moneda](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Tipo_Inmueble FOREIGN KEY (tipo_inmueble_codigo) REFERENCES [KERNELSINFLOW].[BI_Tipo_Inmueble](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Ambientes FOREIGN KEY (ambientes_codigo) REFERENCES [KERNELSINFLOW].[BI_Ambientes](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Ubicacion FOREIGN KEY (ubicacion_codigo) REFERENCES [KERNELSINFLOW].[BI_Ubicacion](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Rango_Etario FOREIGN KEY (rango_etario_codigo) REFERENCES [KERNELSINFLOW].[BI_Rango_Etario](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Rango_m2 FOREIGN KEY (rango_m2_codigo) REFERENCES [KERNELSINFLOW].[BI_Rango_m2](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Anuncio] ADD CONSTRAINT FK_BI_Hechos_Anuncio_BI_Sucursal FOREIGN KEY (sucursal_codigo) REFERENCES [KERNELSINFLOW].[BI_Sucursal](codigo)
GO

-- ALQUILERES

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT FK_BI_Hechos_Alquiler_BI_Tiempo FOREIGN KEY (tiempo_codigo) REFERENCES [KERNELSINFLOW].[BI_Tiempo](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT FK_BI_Hechos_Alquiler_BI_Ubicacion FOREIGN KEY (ubicacion_codigo) REFERENCES [KERNELSINFLOW].[BI_Ubicacion](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT FK_BI_Hechos_Alquiler_BI_Moneda FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[BI_Moneda](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT FK_BI_Hechos_Alquiler_BI_Rango_Etario FOREIGN KEY (rango_etario_inquilino_codigo) REFERENCES [KERNELSINFLOW].[BI_Rango_Etario](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Alquiler] ADD CONSTRAINT FK_BI_Hechos_Alquiler_BI_Sucursal FOREIGN KEY (sucursal_codigo) REFERENCES [KERNELSINFLOW].[BI_Sucursal](codigo)
GO

-- VENTAS

ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT FK_BI_Hechos_Venta_BI_Tiempo FOREIGN KEY (tiempo_codigo) REFERENCES [KERNELSINFLOW].[BI_Tiempo](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT FK_BI_Hechos_Venta_BI_Ubicacion FOREIGN KEY (ubicacion_codigo) REFERENCES [KERNELSINFLOW].[BI_Ubicacion](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT FK_BI_Hechos_Venta_BI_Moneda FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[BI_Moneda](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT FK_BI_Hechos_Venta_BI_Tipo_Inmueble FOREIGN KEY (tipo_inmueble_codigo) REFERENCES [KERNELSINFLOW].[BI_Tipo_Inmueble](codigo)
ALTER TABLE [KERNELSINFLOW].[BI_Hechos_Venta] ADD CONSTRAINT FK_BI_Hechos_Venta_BI_Sucursal FOREIGN KEY (sucursal_codigo) REFERENCES [KERNELSINFLOW].[BI_Sucursal](codigo)
GO

/* FUNCIONES */

CREATE FUNCTION [KERNELSINFLOW].[fn_getBITiempoCodigo] (@fecha DATETIME)
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Tiempo] WHERE [anio] = YEAR(@fecha) AND [mes] = MONTH(@fecha)
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBIUbicacionCodigo] (@provincia NVARCHAR(100), @localidad NVARCHAR(100), @barrio NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Ubicacion] WHERE [provincia] = @provincia AND [localidad] = @localidad AND [barrio] = @barrio
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBISucursalCodigo] (@nombre NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Sucursal] WHERE [nombre] = @nombre
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBIRangoEtarioCodigo] (@edad NUMERIC(3,0))
RETURNS NUMERIC(18,0)
AS
BEGIN
    RETURN (SELECT codigo FROM [KERNELSINFLOW].[BI_Rango_Etario] WHERE @edad < ISNULL(maximo, @edad+1) AND @edad >= ISNULL(minimo, @edad))
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBIRangoM2Codigo] (@metros NUMERIC(18,2))
RETURNS NUMERIC(18,0)
AS
BEGIN
    RETURN (SELECT codigo FROM [KERNELSINFLOW].[BI_Rango_m2] WHERE FLOOR(@metros) < ISNULL(maximo, FLOOR(@metros)+1) AND FLOOR(@metros) >= ISNULL(minimo, FLOOR(@metros)))
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBITipoOperacionCodigo] (@descripcion NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Tipo_Operacion] WHERE [descripcion] = @descripcion
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBIMonedaCodigo] (@descripcion NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Moneda] WHERE [descripcion] = @descripcion
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBITipoInmuebleCodigo] (@descripcion NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Tipo_Inmueble] WHERE [descripcion] = @descripcion
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getBIAmbientesCodigo] (@descripcion NVARCHAR(100))
RETURNS NUMERIC(18,0)
AS
BEGIN
    DECLARE @codigo NUMERIC(18,0)
    SELECT @codigo = [codigo] FROM [KERNELSINFLOW].[BI_Ambientes] WHERE [descripcion] = @descripcion
    RETURN @codigo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fn_getEdadPersona] (@fecha_nacimiento DATETIME)
RETURNS NUMERIC(3,0)
AS
BEGIN
    DECLARE @edad NUMERIC(18,0)
    DECLARE @anio_nacimiento NUMERIC(4,0)
    DECLARE @mes_nacimiento NUMERIC(2,0)
    DECLARE @dia_nacimiento NUMERIC(2,0)
    DECLARE @anio_actual NUMERIC(4,0)
    DECLARE @mes_actual NUMERIC(2,0)
    DECLARE @dia_actual NUMERIC(2,0)

    SET @anio_nacimiento = YEAR(@fecha_nacimiento)
    SET @mes_nacimiento = MONTH(@fecha_nacimiento)
    SET @dia_nacimiento = DAY(@fecha_nacimiento)

    SET @anio_actual = YEAR(GETDATE())
    SET @mes_actual = MONTH(GETDATE())
    SET @dia_actual = DAY(GETDATE())

    SET @edad = @anio_actual - @anio_nacimiento

    IF @mes_actual < @mes_nacimiento
        SET @edad = @edad - 1
    ELSE IF @mes_actual = @mes_nacimiento AND @dia_actual < @dia_nacimiento
        SET @edad = @edad - 1

    RETURN @edad
END
GO

/* STORE PROCEDURES */

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Tiempo]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Tiempo] (anio, mes, cuatrimestre)
    SELECT 
        DISTINCT
        YEAR([KERNELSINFLOW].[Anuncio].[fecha_publicacion]),
        MONTH([KERNELSINFLOW].[Anuncio].[fecha_publicacion]),
        DATEPART(QUARTER, [KERNELSINFLOW].[Anuncio].[fecha_publicacion])
        FROM [KERNELSINFLOW].[Anuncio]
    UNION
    SELECT
        DISTINCT
        YEAR([KERNELSINFLOW].[Alquiler].[inicio_alquiler]),
        MONTH([KERNELSINFLOW].[Alquiler].[inicio_alquiler]),
        DATEPART(QUARTER, [KERNELSINFLOW].[Alquiler].[inicio_alquiler])
        FROM [KERNELSINFLOW].[Alquiler]
    UNION
    SELECT
        DISTINCT
        YEAR([KERNELSINFLOW].[Pago_Alquiler].[inicio_periodo]),
        MONTH([KERNELSINFLOW].[Pago_Alquiler].[inicio_periodo]),
        DATEPART(QUARTER, [KERNELSINFLOW].[Pago_Alquiler].[inicio_periodo])
        FROM [KERNELSINFLOW].[Pago_Alquiler]
    UNION
    SELECT
        DISTINCT
        YEAR([KERNELSINFLOW].[Venta].[fecha]),
        MONTH([KERNELSINFLOW].[Venta].[fecha]),
        DATEPART(QUARTER, [KERNELSINFLOW].[Venta].[fecha])
        FROM [KERNELSINFLOW].[Venta]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Ubicacion]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Ubicacion] (provincia, localidad, barrio)
    SELECT 
        DISTINCT
        [KERNELSINFLOW].[Provincia].[descripcion],
        [KERNELSINFLOW].[Localidad].[descripcion],
        [KERNELSINFLOW].[Barrio].[descripcion]
        FROM [KERNELSINFLOW].[Barrio]
            JOIN [KERNELSINFLOW].[Localidad] ON [KERNELSINFLOW].[Barrio].[localidad_codigo] = [KERNELSINFLOW].[Localidad].[codigo]
            JOIN [KERNELSINFLOW].[Provincia] ON [KERNELSINFLOW].[Localidad].[provincia_codigo] = [KERNELSINFLOW].[Provincia].[codigo]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Sucursal]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Sucursal] (nombre)
    SELECT 
        DISTINCT
        [KERNELSINFLOW].[Sucursal].[nombre]
        FROM [KERNELSINFLOW].[Sucursal]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Rango_Etario]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Rango_Etario] (minimo, maximo, descripcion)
    VALUES (NULL, 25, '<25'), (25, 35, '25 - 35'), (35, 50, '35 - 50'), (50, NULL, '>50')
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Rango_m2]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Rango_m2] (minimo, maximo, descripcion)
    VALUES (NULL, 35.00, '<35'), (35.00, 55.00, '35 - 55'), (55.00, 75.00, '55 - 75'), (75.00, 100.00, '75 - 100'), (100.00, NULL, '>100')
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Tipo_Operacion]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Tipo_Operacion] (descripcion)
    SELECT
        DISTINCT
        [KERNELSINFLOW].[Tipo_Operacion].[descripcion]
        FROM [KERNELSINFLOW].[Tipo_Operacion]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Moneda]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Moneda] (descripcion)
    SELECT
        DISTINCT
        [KERNELSINFLOW].[Moneda].[descripcion]
        FROM [KERNELSINFLOW].[Moneda]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Tipo_Inmueble]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Tipo_Inmueble] (descripcion)
    SELECT
        DISTINCT
        [KERNELSINFLOW].[Tipo_Inmueble].[descripcion]
        FROM [KERNELSINFLOW].[Tipo_Inmueble]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Ambientes]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Ambientes] (descripcion)
    SELECT
        DISTINCT
        [KERNELSINFLOW].[Cantidad_Ambientes].[descripcion]
        FROM [KERNELSINFLOW].[Cantidad_Ambientes]
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Hechos_Anuncio]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Hechos_Anuncio] (
        tiempo_codigo,
        tipo_operacion_codigo,
        moneda_codigo,
        tipo_inmueble_codigo,
        ambientes_codigo,
        ubicacion_codigo,
        rango_etario_codigo,
        rango_m2_codigo,
        sucursal_codigo,
        promedio_dias_publicados,
        promedio_precio,
        cantidad_anuncios,
        cantidad_operacion_concretada
    )
    SELECT
        [KERNELSINFLOW].[BI_Tiempo].[codigo] AS [tiempo_codigo],
        [KERNELSINFLOW].[BI_Tipo_Operacion].[codigo] AS [tipo_operacion_codigo],
        [KERNELSINFLOW].[BI_Moneda].[codigo] AS [moneda_codigo],
        [KERNELSINFLOW].[BI_Tipo_Inmueble].[codigo] AS [tipo_inmueble_codigo],
        [KERNELSINFLOW].[BI_Ambientes].[codigo] AS [ambientes_codigo],
        [KERNELSINFLOW].[BI_Ubicacion].[codigo] AS [ubicacion_codigo],
        [KERNELSINFLOW].[BI_Rango_Etario].[codigo] AS [rango_etario_codigo],
        [KERNELSINFLOW].[BI_Rango_M2].[codigo] AS [rango_m2_codigo],
        [KERNELSINFLOW].[BI_Sucursal].[codigo] AS [sucursal_codigo],
        AVG(DATEDIFF(DAY, [KERNELSINFLOW].[Anuncio].[fecha_publicacion], [KERNELSINFLOW].[Anuncio].[fecha_finalizacion])) AS [promedio_dias_publicados],
        AVG([KERNELSINFLOW].[Anuncio].[precio_publicado]) AS [promedio_precio],
        COUNT([KERNELSINFLOW].[Anuncio].[codigo]) AS [cantidad_anuncios],
        SUM(CASE WHEN [KERNELSINFLOW].[Estado_Anuncio].[descripcion] = 'Vendido' OR [KERNELSINFLOW].[Estado_Anuncio].[descripcion] = 'Alquilado' THEN 1 ELSE 0 END) AS [cantidad_operacion_concretada]
        FROM [KERNELSINFLOW].[Anuncio]
            JOIN [KERNELSINFLOW].[Inmueble] ON [KERNELSINFLOW].[Anuncio].[inmueble_codigo] = [KERNELSINFLOW].[Inmueble].[codigo]
            JOIN [KERNELSINFLOW].[Barrio] ON [KERNELSINFLOW].[Inmueble].[barrio_codigo] = [KERNELSINFLOW].[Barrio].[codigo]
            JOIN [KERNELSINFLOW].[Localidad] ON [KERNELSINFLOW].[Barrio].[localidad_codigo] = [KERNELSINFLOW].[Localidad].[codigo]
            JOIN [KERNELSINFLOW].[Provincia] ON [KERNELSINFLOW].[Localidad].[provincia_codigo] = [KERNELSINFLOW].[Provincia].[codigo]
            JOIN [KERNELSINFLOW].[Agente] ON [KERNELSINFLOW].[Anuncio].[agente_codigo] = [KERNELSINFLOW].[Agente].[codigo]
            JOIN [KERNELSINFLOW].[Persona] ON [KERNELSINFLOW].[Agente].[persona_codigo] = [KERNELSINFLOW].[Persona].[codigo]
            JOIN [KERNELSINFLOW].[Sucursal] ON [KERNELSINFLOW].[Agente].[sucursal_codigo] = [KERNELSINFLOW].[Sucursal].[codigo]
            JOIN [KERNELSINFLOW].[Tipo_Operacion] ON [KERNELSINFLOW].[Anuncio].[tipo_operacion_codigo] = [KERNELSINFLOW].[Tipo_Operacion].[codigo]
            JOIN [KERNELSINFLOW].[Moneda] ON [KERNELSINFLOW].[Anuncio].[moneda_codigo] = [KERNELSINFLOW].[Moneda].[codigo]
            JOIN [KERNELSINFLOW].[Estado_Anuncio] ON [KERNELSINFLOW].[Anuncio].[estado_anuncio_codigo] = [KERNELSINFLOW].[Estado_Anuncio].[codigo]
            JOIN [KERNELSINFLOW].[Tipo_Inmueble] ON [KERNELSINFLOW].[Inmueble].[tipo_inmueble_codigo] = [KERNELSINFLOW].[Tipo_Inmueble].[codigo]
            JOIN [KERNELSINFLOW].[Cantidad_Ambientes] ON [KERNELSINFLOW].[Inmueble].[cantidad_ambientes_codigo] = [KERNELSINFLOW].[Cantidad_Ambientes].[codigo]
            JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Tiempo].[codigo] = [KERNELSINFLOW].[fn_getBITiempoCodigo]([KERNELSINFLOW].[Anuncio].[fecha_publicacion])
            JOIN [KERNELSINFLOW].[BI_Moneda] ON [KERNELSINFLOW].[BI_Moneda].[codigo] = [KERNELSINFLOW].[fn_getBIMonedaCodigo]([KERNELSINFLOW].[Moneda].[descripcion])
            JOIN [KERNELSINFLOW].[BI_Tipo_Inmueble] ON [KERNELSINFLOW].[BI_Tipo_Inmueble].[codigo] = [KERNELSINFLOW].[fn_getBITipoInmuebleCodigo]([KERNELSINFLOW].[Tipo_Inmueble].[descripcion])
            JOIN [KERNELSINFLOW].[BI_Ambientes] ON [KERNELSINFLOW].[BI_Ambientes].[codigo] = [KERNELSINFLOW].[fn_getBIAmbientesCodigo]([KERNELSINFLOW].[Cantidad_Ambientes].[descripcion])
            JOIN [KERNELSINFLOW].[BI_Ubicacion] ON [KERNELSINFLOW].[BI_Ubicacion].[codigo] = [KERNELSINFLOW].[fn_getBIUbicacionCodigo]([KERNELSINFLOW].[Provincia].[descripcion], [KERNELSINFLOW].[Localidad].[descripcion], [KERNELSINFLOW].[Barrio].[descripcion])
            JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Sucursal].[codigo] = [KERNELSINFLOW].[fn_getBISucursalCodigo]([KERNELSINFLOW].[Sucursal].[nombre]) 
            JOIN [KERNELSINFLOW].[BI_Rango_Etario] ON [KERNELSINFLOW].[BI_Rango_Etario].[codigo] = [KERNELSINFLOW].[fn_getBIRangoEtarioCodigo]([KERNELSINFLOW].[fn_getEdadPersona]([KERNELSINFLOW].[Persona].[fecha_nacimiento]))
            JOIN [KERNELSINFLOW].[BI_Rango_M2] ON [KERNELSINFLOW].[BI_Rango_M2].[codigo] = [KERNELSINFLOW].[fn_getBIRangoM2Codigo]([KERNELSINFLOW].[Inmueble].[superficieTotal])
            JOIN [KERNELSINFLOW].[BI_Tipo_Operacion] ON [KERNELSINFLOW].[BI_Tipo_Operacion].[codigo] = [KERNELSINFLOW].[fn_getBITipoOperacionCodigo]([KERNELSINFLOW].[Tipo_Operacion].[descripcion])
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[codigo],
        [KERNELSINFLOW].[BI_Tipo_Operacion].[codigo],
        [KERNELSINFLOW].[BI_Moneda].[codigo],
        [KERNELSINFLOW].[BI_Tipo_Inmueble].[codigo],
        [KERNELSINFLOW].[BI_Ambientes].[codigo],
        [KERNELSINFLOW].[BI_Ubicacion].[codigo],
        [KERNELSINFLOW].[BI_Rango_Etario].[codigo],
        [KERNELSINFLOW].[BI_Rango_M2].[codigo],
        [KERNELSINFLOW].[BI_Sucursal].[codigo]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Hechos_Alquiler]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Hechos_Alquiler] (
        tiempo_codigo,
        ubicacion_codigo,
        moneda_codigo,
        rango_etario_inquilino_codigo,
        sucursal_codigo,
        promedio_comision,
        monto_total_alquileres,
        cantidad_alquileres,
        cantidad_pagos_incumplidos,
        promedio_aumento
    )
    SELECT
        [bti].[codigo] AS [tiempo_codigo],
        [bub].[codigo] AS [ubicacion_codigo],
        [bmo].[codigo] AS [moneda_codigo],
        [bra].[codigo] AS [rango_etario_inquilino_codigo],
        [bsu].[codigo] AS [sucursal_codigo],
        AVG([al].[comision]) AS [promedio_comision],
        SUM([pa].[importe]) AS [monto_total_alquileres],
        COUNT([al].[codigo]) AS [cantidad_alquileres],
        SUM(CASE WHEN [pa].[fecha_pago] > [pa].[fecha_vencimiento] THEN 1 ELSE 0 END) AS [cantidad_pagos_incumplidos],
        ISNULL(AVG((100 * ([pa].[importe] - [pa].[importe_anterior]) / [pa].[importe_anterior])), 0) AS [porcentaje_aumento]
        FROM [KERNELSINFLOW].[Alquiler] AS [al]
                JOIN [KERNELSINFLOW].[Anuncio] AS [an] ON [al].[anuncio_codigo] = [an].[codigo]
                JOIN [KERNELSINFLOW].[Inmueble] AS [in] ON [an].[inmueble_codigo] = [in].[codigo]
                JOIN [KERNELSINFLOW].[Barrio] AS [ba] ON [in].[barrio_codigo] = [ba].[codigo]
                JOIN [KERNELSINFLOW].[Localidad] AS [lo] ON [ba].[localidad_codigo] = [lo].[codigo]
                JOIN [KERNELSINFLOW].[Provincia] AS [pr] ON [lo].[provincia_codigo] = [pr].[codigo]
                JOIN [KERNELSINFLOW].[Agente] AS [ag] ON [an].[agente_codigo] = [ag].[codigo]
                JOIN [KERNELSINFLOW].[Persona] AS [pe] ON [ag].[persona_codigo] = [pe].[codigo]
                JOIN [KERNELSINFLOW].[Sucursal] AS [su] ON [ag].[sucursal_codigo] = [su].[codigo]
                JOIN [KERNELSINFLOW].[Moneda] AS [mo] ON [an].[moneda_codigo] = [mo].[codigo]
                JOIN (
                    SELECT
                    *,
                    (
                        SELECT TOP 1
                            pa1.[importe]
                            FROM [KERNELSINFLOW].[Pago_Alquiler] pa1
                            WHERE pa1.[alquiler_codigo] = [pa].[alquiler_codigo]
                                AND pa1.[nro_periodo] = [pa].[nro_periodo]-1
                    ) AS [importe_anterior]
                    FROM [KERNELSINFLOW].[Pago_Alquiler] AS [pa]
                ) AS [pa] ON [al].[codigo] = [pa].[alquiler_codigo]
                JOIN [KERNELSINFLOW].[BI_Tiempo] AS [bti] ON [bti].[codigo] = [KERNELSINFLOW].[fn_getBITiempoCodigo]([pa].[inicio_periodo])
                JOIN [KERNELSINFLOW].[BI_Moneda] AS [bmo] ON [bmo].[codigo] = [KERNELSINFLOW].[fn_getBIMonedaCodigo]([mo].[descripcion])
                JOIN [KERNELSINFLOW].[BI_Ubicacion] AS [bub] ON [bub].[codigo] = [KERNELSINFLOW].[fn_getBIUbicacionCodigo]([pr].[descripcion], [lo].[descripcion], [ba].[descripcion])
                JOIN [KERNELSINFLOW].[BI_Sucursal] AS [bsu] ON [bsu].[codigo] = [KERNELSINFLOW].[fn_getBISucursalCodigo]([su].[nombre]) 
                JOIN [KERNELSINFLOW].[BI_Rango_Etario] AS [bra] ON [bra].[codigo] = [KERNELSINFLOW].[fn_getBIRangoEtarioCodigo]([KERNELSINFLOW].[fn_getEdadPersona]([pe].[fecha_nacimiento]))
        GROUP BY
            [bti].[codigo],
            [bub].[codigo],
            [bmo].[codigo],
            [bra].[codigo],
            [bsu].[codigo]
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_BI_Hechos_Venta]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[BI_Hechos_Venta] (
        tiempo_codigo,
        ubicacion_codigo,
        moneda_codigo,
        tipo_inmueble_codigo,
        sucursal_codigo,
        promedio_precio_m2,
        promedio_comision,
        monto_total_venta,
        cantidad_ventas
    )
    SELECT
        [bti].[codigo] AS [tiempo_codigo],
        [bub].[codigo] AS [ubicacion_codigo],
        [bmo].[codigo] AS [moneda_codigo],
        [btin].[codigo] AS [tipo_inmueble_codigo],
        [bsu].[codigo] AS [sucursal_codigo],
        AVG([ve].[precio_venta] / [in].[superficieTotal]) AS [promedio_precio_m2],
        AVG([ve].[comision_inmobiliaria]) AS [promedio_comision],
        SUM([ve].[precio_venta]) AS [monto_total_venta],
        COUNT([ve].[codigo]) AS [cantidad_ventas]
        FROM [KERNELSINFLOW].[Venta] AS [ve]
                JOIN [KERNELSINFLOW].[Anuncio] AS [an] ON [ve].[anuncio_codigo] = [an].[codigo]
                JOIN [KERNELSINFLOW].[Inmueble] AS [in] ON [an].[inmueble_codigo] = [in].[codigo]
                JOIN [KERNELSINFLOW].[Barrio] AS [ba] ON [in].[barrio_codigo] = [ba].[codigo]
                JOIN [KERNELSINFLOW].[Localidad] AS [lo] ON [ba].[localidad_codigo] = [lo].[codigo]
                JOIN [KERNELSINFLOW].[Provincia] AS [pr] ON [lo].[provincia_codigo] = [pr].[codigo]
                JOIN [KERNELSINFLOW].[Agente] AS [ag] ON [an].[agente_codigo] = [ag].[codigo]
                JOIN [KERNELSINFLOW].[Persona] AS [pe] ON [ag].[persona_codigo] = [pe].[codigo]
                JOIN [KERNELSINFLOW].[Sucursal] AS [su] ON [ag].[sucursal_codigo] = [su].[codigo]
                JOIN [KERNELSINFLOW].[Moneda] AS [mo] ON [an].[moneda_codigo] = [mo].[codigo]
                JOIN [KERNELSINFLOW].[Tipo_Inmueble] AS [ti] ON [in].[tipo_inmueble_codigo] = [ti].[codigo]
                JOIN [KERNELSINFLOW].[BI_Tiempo] AS [bti] ON [bti].[codigo] = [KERNELSINFLOW].[fn_getBITiempoCodigo]([ve].[fecha])
                JOIN [KERNELSINFLOW].[BI_Ubicacion] AS [bub] ON [bub].[codigo] = [KERNELSINFLOW].[fn_getBIUbicacionCodigo]([pr].[descripcion], [lo].[descripcion], [ba].[descripcion])
                JOIN [KERNELSINFLOW].[BI_Moneda] AS [bmo] ON [bmo].[codigo] = [KERNELSINFLOW].[fn_getBIMonedaCodigo]([mo].[descripcion])
                JOIN [KERNELSINFLOW].[BI_Tipo_Inmueble] AS [btin] ON [btin].[codigo] = [KERNELSINFLOW].[fn_getBITipoInmuebleCodigo]([ti].[descripcion])
                JOIN [KERNELSINFLOW].[BI_Sucursal] AS [bsu] ON [bsu].[codigo] = [KERNELSINFLOW].[fn_getBISucursalCodigo]([su].[nombre])
        GROUP BY
            [bti].[codigo],
            [bub].[codigo],
            [bmo].[codigo],
            [btin].[codigo],
            [bsu].[codigo]
END
GO

/* MIGRACION PRINCIPAL */

BEGIN TRANSACTION
BEGIN TRY
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Tiempo]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Ubicacion]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Sucursal]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Rango_Etario]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Rango_m2]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Tipo_Operacion]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Moneda]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Tipo_Inmueble]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Ambientes]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Hechos_Anuncio]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Hechos_Venta]
    EXEC [KERNELSINFLOW].[sp_migrar_BI_Hechos_Alquiler]
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW 50001, 'Error al migrar los datos - Verifique que los datos de las tablas creadas se encuentren vacias', 1;
END CATCH
IF (
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Tiempo]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Ubicacion]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Sucursal]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Rango_Etario]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Rango_m2]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Tipo_Operacion]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Moneda]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Tipo_Inmueble]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Ambientes]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Hechos_Venta]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[BI_Hechos_Anuncio])
)
BEGIN
    PRINT 'Migración finalizada correctamente'
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    THROW 50002, 'Error al migrar los datos - Las tablas se encuentran vacias', 1;
END
GO

/* VIEWS */

/*

1.
Duración promedio (en días) que se encuentran publicados los anuncios
según el tipo de operación (alquiler, venta, etc), barrio y ambientes para cada
cuatrimestre de cada año. Se consideran todos los anuncios que se dieron de alta
en ese cuatrimestre. La duración se calcula teniendo en cuenta la fecha de alta y
la fecha de finalización.

*/

CREATE VIEW [KERNELSINFLOW].[vw_DuracionPromedioAnuncios]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
    [KERNELSINFLOW].[BI_Tipo_Operacion].[descripcion] AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Ubicacion].[provincia] AS [provincia],
    [KERNELSINFLOW].[BI_Ubicacion].[localidad] AS [localidad],
    [KERNELSINFLOW].[BI_Ubicacion].[barrio] AS [barrio],
    [KERNELSINFLOW].[BI_Ambientes].[descripcion] AS [ambientes],
    AVG([KERNELSINFLOW].[BI_Hechos_Anuncio].[promedio_dias_publicados]) AS [duracion_promedio]
    FROM [KERNELSINFLOW].[BI_Hechos_Anuncio]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Tipo_Operacion] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tipo_operacion_codigo] = [KERNELSINFLOW].[BI_Tipo_Operacion].[codigo]
        JOIN [KERNELSINFLOW].[BI_Ubicacion] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[ubicacion_codigo] = [KERNELSINFLOW].[BI_Ubicacion].[codigo]
        JOIN [KERNELSINFLOW].[BI_Ambientes] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[ambientes_codigo] = [KERNELSINFLOW].[BI_Ambientes].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Tipo_Operacion].[descripcion],
        [KERNELSINFLOW].[BI_Ubicacion].[provincia],
        [KERNELSINFLOW].[BI_Ubicacion].[localidad],
        [KERNELSINFLOW].[BI_Ubicacion].[barrio],
        [KERNELSINFLOW].[BI_Ambientes].[descripcion]
GO

/*

2.
Precio promedio de los anuncios de inmuebles según el tipo de operación
(alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/año.
Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
precio se debe expresar en el tipo de moneda que corresponda, identificando de
cuál se trata.

*/

CREATE VIEW [KERNELSINFLOW].[vw_PrecioPromedioAnuncios]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
    [KERNELSINFLOW].[BI_Tipo_Operacion].[descripcion] AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Tipo_Inmueble].[descripcion] AS [tipo_inmueble],
    [KERNELSINFLOW].[BI_Moneda].[descripcion] AS [moneda],
    [KERNELSINFLOW].[BI_Rango_m2].[descripcion] AS [rango_m2],
    AVG([KERNELSINFLOW].[BI_Hechos_Anuncio].[promedio_precio]) AS [precio_promedio]
    FROM [KERNELSINFLOW].[BI_Hechos_Anuncio]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Tipo_Operacion] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tipo_operacion_codigo] = [KERNELSINFLOW].[BI_Tipo_Operacion].[codigo]
        JOIN [KERNELSINFLOW].[BI_Tipo_Inmueble] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tipo_inmueble_codigo] = [KERNELSINFLOW].[BI_Tipo_Inmueble].[codigo]
        JOIN [KERNELSINFLOW].[BI_Moneda] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[moneda_codigo] = [KERNELSINFLOW].[BI_Moneda].[codigo]
        JOIN [KERNELSINFLOW].[BI_Rango_m2] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[rango_m2_codigo] = [KERNELSINFLOW].[BI_Rango_m2].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Tipo_Operacion].[descripcion],
        [KERNELSINFLOW].[BI_Tipo_Inmueble].[descripcion],
        [KERNELSINFLOW].[BI_Moneda].[descripcion],
        [KERNELSINFLOW].[BI_Rango_m2].[descripcion]
GO

/*

3.
Los 5 barrios más elegidos para alquilar en función del rango etario de los
inquilinos para cada cuatrimestre/año. Se calcula en función de los alquileres
dados de alta en dicho periodo.

*/

CREATE VIEW [KERNELSINFLOW].[vw_BarriosMasElegidosAlquilar]
AS
SELECT
    [anio],
    [cuatrimestre],
    [rango_etario],
    [provincia],
    [localidad],
    [barrio],
    [cantidad_alquileres]
    FROM (
        SELECT
            [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
            [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
            [KERNELSINFLOW].[BI_Rango_Etario].[descripcion] AS [rango_etario],
            [KERNELSINFLOW].[BI_Ubicacion].[provincia] AS [provincia],
            [KERNELSINFLOW].[BI_Ubicacion].[localidad] AS [localidad],
            [KERNELSINFLOW].[BI_Ubicacion].[barrio] AS [barrio],
            COUNT(1) AS [cantidad_alquileres],
            ROW_NUMBER() OVER (PARTITION BY [KERNELSINFLOW].[BI_Tiempo].[anio], [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre], [KERNELSINFLOW].[BI_Rango_Etario].[descripcion] ORDER BY COUNT(1) DESC) AS [row_number]
        FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]
            JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
            JOIN [KERNELSINFLOW].[BI_Rango_Etario] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[rango_etario_inquilino_codigo] = [KERNELSINFLOW].[BI_Rango_Etario].[codigo]
            JOIN [KERNELSINFLOW].[BI_Ubicacion] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[ubicacion_codigo] = [KERNELSINFLOW].[BI_Ubicacion].[codigo]
        GROUP BY
            [KERNELSINFLOW].[BI_Tiempo].[anio],
            [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
            [KERNELSINFLOW].[BI_Rango_Etario].[descripcion],
            [KERNELSINFLOW].[BI_Ubicacion].[provincia],
            [KERNELSINFLOW].[BI_Ubicacion].[localidad],
            [KERNELSINFLOW].[BI_Ubicacion].[barrio]
    )  AS [t]
    WHERE [t].[row_number] <= 5
GO

/*

4.
Porcentaje de incumplimiento de pagos de alquileres en término por cada
mes/año. Se calcula en función de las fechas de pago y fecha de vencimiento del
mismo. El porcentaje es en función del total de pagos en dicho periodo.

*/

CREATE VIEW [KERNELSINFLOW].[vw_PorcentajeIncumplimientoPagosAlquileres]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[mes] AS [mes],
    SUM([KERNELSINFLOW].[BI_Hechos_Alquiler].[cantidad_pagos_incumplidos]) * 100 / SUM([KERNELSINFLOW].[BI_Hechos_Alquiler].[cantidad_alquileres]) AS [porcentaje_incumplimiento]
    FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[mes]
GO

/*

5.
Porcentaje promedio de incremento del valor de los alquileres para los
contratos en curso por mes/año. Se calcula tomando en cuenta el último pago
con respecto al del mes en curso, únicamente de aquellos alquileres que hayan
tenido aumento y están activos.

*/

CREATE VIEW [KERNELSINFLOW].[vw_PorcentajePromedioIncrementoAlquileres]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[mes] AS [mes],
    AVG([KERNELSINFLOW].[BI_Hechos_Alquiler].[promedio_aumento]) AS [porcentaje_promedio_incremento]
    FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[mes]
GO

/*

6.
Precio promedio de m2 de la venta de inmuebles según el tipo de inmueble y
la localidad para cada cuatrimestre/año. Se calcula en función de las ventas
concretadas.

*/

CREATE VIEW [KERNELSINFLOW].[vw_PrecioPromedioM2Ventas]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
    [KERNELSINFLOW].[BI_Tipo_Inmueble].[descripcion] AS [tipo_inmueble],
    [KERNELSINFLOW].[BI_Ubicacion].[provincia] AS [provincia],
    [KERNELSINFLOW].[BI_Ubicacion].[localidad] AS [localidad],
    AVG([KERNELSINFLOW].[BI_Hechos_Venta].[promedio_precio_m2]) AS [precio_promedio_m2]
    FROM [KERNELSINFLOW].[BI_Hechos_Venta]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Venta].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Tipo_Inmueble] ON [KERNELSINFLOW].[BI_Hechos_Venta].[tipo_inmueble_codigo] = [KERNELSINFLOW].[BI_Tipo_Inmueble].[codigo]
        JOIN [KERNELSINFLOW].[BI_Ubicacion] ON [KERNELSINFLOW].[BI_Hechos_Venta].[ubicacion_codigo] = [KERNELSINFLOW].[BI_Ubicacion].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Tipo_Inmueble].[descripcion],
        [KERNELSINFLOW].[BI_Ubicacion].[provincia],
        [KERNELSINFLOW].[BI_Ubicacion].[localidad]
GO

/*

7.
Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc)
y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
ventas concretadas dentro del periodo.

*/

CREATE VIEW [KERNELSINFLOW].[vw_ValorPromedioComision]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
    'Alquiler' AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Sucursal].[nombre] AS [sucursal],
    AVG([KERNELSINFLOW].[BI_Hechos_Alquiler].[promedio_comision]) AS [valor_promedio_comision]
    FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[sucursal_codigo] = [KERNELSINFLOW].[BI_Sucursal].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Sucursal].[nombre]
UNION
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
    'Venta' AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Sucursal].[nombre] AS [sucursal],
    AVG([KERNELSINFLOW].[BI_Hechos_Venta].[promedio_comision]) AS [valor_promedio_comision]
    FROM [KERNELSINFLOW].[BI_Hechos_Venta]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Venta].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Hechos_Venta].[sucursal_codigo] = [KERNELSINFLOW].[BI_Sucursal].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Sucursal].[nombre]
GO

/*

8.
Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por
cada sucursal, según el rango etario de los empleados por año en función de la
cantidad de anuncios publicados en ese mismo año.

*/

CREATE VIEW [KERNELSINFLOW].[vw_PorcentajeOperacionesConcretadas]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Sucursal].[nombre] AS [sucursal],
    [KERNELSINFLOW].[BI_Rango_Etario].[descripcion] AS [rango_etario],
    SUM([KERNELSINFLOW].[BI_Hechos_Anuncio].[cantidad_operacion_concretada]) * 100 / SUM([KERNELSINFLOW].[BI_Hechos_Anuncio].[cantidad_anuncios]) AS [porcentaje_operaciones_concretadas]
    FROM [KERNELSINFLOW].[BI_Hechos_Anuncio]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[sucursal_codigo] = [KERNELSINFLOW].[BI_Sucursal].[codigo]
        JOIN [KERNELSINFLOW].[BI_Rango_Etario] ON [KERNELSINFLOW].[BI_Hechos_Anuncio].[rango_etario_codigo] = [KERNELSINFLOW].[BI_Rango_Etario].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Sucursal].[nombre],
        [KERNELSINFLOW].[BI_Rango_Etario].[descripcion]
GO

/*

9.
Monto total de cierre de contratos por tipo de operación (tanto de alquileres
como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.

*/

CREATE VIEW [KERNELSINFLOW].[vw_MontoTotalCierreContratos]
AS
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
    'Alquiler' AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Sucursal].[nombre] AS [sucursal],
    [KERNELSINFLOW].[BI_Moneda].[descripcion] AS [moneda],
    SUM([KERNELSINFLOW].[BI_Hechos_Alquiler].[monto_total_alquileres]) AS [monto_total_cierre_contratos]
    FROM [KERNELSINFLOW].[BI_Hechos_Alquiler]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[sucursal_codigo] = [KERNELSINFLOW].[BI_Sucursal].[codigo]
        JOIN [KERNELSINFLOW].[BI_Moneda] ON [KERNELSINFLOW].[BI_Hechos_Alquiler].[moneda_codigo] = [KERNELSINFLOW].[BI_Moneda].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Sucursal].[nombre],
        [KERNELSINFLOW].[BI_Moneda].[descripcion]
UNION
SELECT
    [KERNELSINFLOW].[BI_Tiempo].[anio] AS [anio],
    [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre] AS [cuatrimestre],
    'Venta' AS [tipo_operacion],
    [KERNELSINFLOW].[BI_Sucursal].[nombre] AS [sucursal],
    [KERNELSINFLOW].[BI_Moneda].[descripcion] AS [moneda],
    SUM([KERNELSINFLOW].[BI_Hechos_Venta].[monto_total_venta]) AS [monto_total_cierre_contratos]
    FROM [KERNELSINFLOW].[BI_Hechos_Venta]
        JOIN [KERNELSINFLOW].[BI_Tiempo] ON [KERNELSINFLOW].[BI_Hechos_Venta].[tiempo_codigo] = [KERNELSINFLOW].[BI_Tiempo].[codigo]
        JOIN [KERNELSINFLOW].[BI_Sucursal] ON [KERNELSINFLOW].[BI_Hechos_Venta].[sucursal_codigo] = [KERNELSINFLOW].[BI_Sucursal].[codigo]
        JOIN [KERNELSINFLOW].[BI_Moneda] ON [KERNELSINFLOW].[BI_Hechos_Venta].[moneda_codigo] = [KERNELSINFLOW].[BI_Moneda].[codigo]
    GROUP BY
        [KERNELSINFLOW].[BI_Tiempo].[anio],
        [KERNELSINFLOW].[BI_Tiempo].[cuatrimestre],
        [KERNELSINFLOW].[BI_Sucursal].[nombre],
        [KERNELSINFLOW].[BI_Moneda].[descripcion]
GO
