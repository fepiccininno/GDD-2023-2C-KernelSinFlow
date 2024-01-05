USE [GD2C2023]
GO

/* DROP INICIAL */

-- TABLAS --

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Pago')
DROP TABLE [KERNELSINFLOW].[Pago]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Comprador')
DROP TABLE [KERNELSINFLOW].[Comprador]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Venta')
DROP TABLE [KERNELSINFLOW].[Venta]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Pago_Alquiler')
DROP TABLE [KERNELSINFLOW].[Pago_Alquiler]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Importe_Alquiler')
DROP TABLE [KERNELSINFLOW].[Importe_Alquiler]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Inquilino')
DROP TABLE [KERNELSINFLOW].[Inquilino]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Alquiler')
DROP TABLE [KERNELSINFLOW].[Alquiler]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Anuncio')
DROP TABLE [KERNELSINFLOW].[Anuncio]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Caracteristica_Inmueble')
DROP TABLE [KERNELSINFLOW].[Caracteristica_Inmueble]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Propietario')
DROP TABLE [KERNELSINFLOW].[Propietario]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Inmueble')
DROP TABLE [KERNELSINFLOW].[Inmueble]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Agente')
DROP TABLE [KERNELSINFLOW].[Agente]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Sucursal')
DROP TABLE [KERNELSINFLOW].[Sucursal]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Barrio')
DROP TABLE [KERNELSINFLOW].[Barrio]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Localidad')
DROP TABLE [KERNELSINFLOW].[Localidad]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Provincia')
DROP TABLE [KERNELSINFLOW].[Provincia]

-- SIN FK

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Tipo_Inmueble')
DROP TABLE [KERNELSINFLOW].[Tipo_Inmueble]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Disposicion')
DROP TABLE [KERNELSINFLOW].[Disposicion]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Cantidad_Ambientes')
DROP TABLE [KERNELSINFLOW].[Cantidad_Ambientes]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Orientacion')
DROP TABLE [KERNELSINFLOW].[Orientacion]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Estado_Inmueble')
DROP TABLE [KERNELSINFLOW].[Estado_Inmueble]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Caracteristica')
DROP TABLE [KERNELSINFLOW].[Caracteristica]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Periodo')
DROP TABLE [KERNELSINFLOW].[Periodo]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Estado_Anuncio')
DROP TABLE [KERNELSINFLOW].[Estado_Anuncio]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Tipo_Operacion')
DROP TABLE [KERNELSINFLOW].[Tipo_Operacion]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Moneda')
DROP TABLE [KERNELSINFLOW].[Moneda]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Persona')
DROP TABLE [KERNELSINFLOW].[Persona]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Medio_Pago')
DROP TABLE [KERNELSINFLOW].[Medio_Pago]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'KERNELSINFLOW' AND TABLE_NAME = 'Estado_Alquiler')
DROP TABLE [KERNELSINFLOW].[Estado_Alquiler]

-- FUNCIONES --

DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_barrio]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_localidad]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_provincia]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_persona]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_caracteristica]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_tipo_inmueble]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_disposicion]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_cantidad_ambientes]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_orientacion]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_estado_inmueble]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_estado_anuncio]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_tipo_operacion]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_moneda]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_periodo]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_agente]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_medio_pago]
DROP FUNCTION IF EXISTS [KERNELSINFLOW].[fx_buscar_estado_alquiler]

-- STORE PROCEDURES --

DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Tipo_Inmueble]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Disposicion]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Cantidad_Ambientes]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Orientacion]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Estado_Inmueble]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Provincia]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Caracteristica]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Periodo]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Estado_Anuncio]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Tipo_Operacion]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Moneda]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Persona]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Inmueble]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Agente]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Sucursal]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Barrio]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Localidad]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Caracteristica_Inmueble]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Propietario]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Anuncio]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Pago]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Comprador]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Venta]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Pago_Alquiler]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Importe_Alquiler]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Inquilino]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Alquiler]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Medio_Pago]
DROP PROCEDURE IF EXISTS [KERNELSINFLOW].[sp_migrar_Estado_Alquiler]

-- ESQUEMA --
DROP SCHEMA IF EXISTS [KERNELSINFLOW]
GO

/* ESQUEMA */

CREATE SCHEMA [KERNELSINFLOW]
GO

/* TABLAS */

-- GESTION DE ANUNCIOS

CREATE TABLE [KERNELSINFLOW].[Tipo_Inmueble] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Disposicion] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Cantidad_Ambientes] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Orientacion] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Estado_Inmueble] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Inmueble] (
    codigo NUMERIC(18,0) PRIMARY KEY,
    tipo_inmueble_codigo NUMERIC(18,0) NOT NULL, -- FK
    descripcion NVARCHAR(100) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    disposicion_codigo NUMERIC(18,0) NOT NULL, -- FK
    cantidad_ambientes_codigo NUMERIC(18,0) NOT NULL, -- FK
    orientacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    direccion NVARCHAR(100) NOT NULL,
    barrio_codigo NUMERIC(18,0) NOT NULL, -- FK
    superficieTotal NUMERIC(18,2) NOT NULL,
    estado_inmueble_codigo NUMERIC(18,0) NOT NULL, -- FK
    antiguedad NUMERIC(18,0) NOT NULL,
    expensas NUMERIC(18,2) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Propietario] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    persona_codigo NUMERIC(18,0) NOT NULL, -- FK
    inmueble_codigo NUMERIC(18,0) NOT NULL -- FK
);
GO
CREATE TABLE [KERNELSINFLOW].[Caracteristica_Inmueble] (
    inmueble_codigo NUMERIC(18,0) NOT NULL, -- FK
    caracteristica_codigo NUMERIC(18,0) NOT NULL, -- FK
    PRIMARY KEY (inmueble_codigo, caracteristica_codigo)
);
GO
CREATE TABLE [KERNELSINFLOW].[Provincia] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Localidad] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    provincia_codigo NUMERIC(18,0) NOT NULL, -- FK
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Barrio] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    localidad_codigo NUMERIC(18,0) NOT NULL, -- FK
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Caracteristica] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Sucursal] (
    codigo NUMERIC(18,0) PRIMARY KEY,
    direccion NVARCHAR(100) NOT NULL,
    localidad_codigo NUMERIC(18,0) NOT NULL, -- FK
    telefono NUMERIC(18,0) NOT NULL,
    nombre NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Agente] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    persona_codigo NUMERIC(18,0) NOT NULL, -- FK
    sucursal_codigo NUMERIC(18,0) NOT NULL -- FK
);
GO
CREATE TABLE [KERNELSINFLOW].[Periodo] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Estado_Anuncio] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Anuncio] (
    codigo NUMERIC(19,0) PRIMARY KEY,
    fecha_publicacion DATETIME NOT NULL,
    agente_codigo NUMERIC(18,0) NOT NULL, -- FK
    tipo_operacion_codigo NUMERIC(18,0) NOT NULL, -- FK
    precio_publicado NUMERIC(18,2) NOT NULL,
    moneda_codigo NUMERIC(18,0) NOT NULL, -- FK
    periodo_codigo NUMERIC(18,0) NOT NULL, -- FK
    estado_anuncio_codigo NUMERIC(18,0) NOT NULL, -- FK
    fecha_finalizacion DATETIME NOT NULL,
    costo_anuncio NUMERIC(18,2) NOT NULL,
    inmueble_codigo NUMERIC(18,0) NOT NULL -- FK
);
GO
CREATE TABLE [KERNELSINFLOW].[Tipo_Operacion] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [KERNELSINFLOW].[Moneda] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);
GO

-- GESTION DE USUARIOS

CREATE TABLE [KERNELSINFLOW].[Persona] (
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    dni NUMERIC(18,0) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    telefono NUMERIC(18,0) NOT NULL,
    mail NVARCHAR(255) NOT NULL,
    fecha_nacimiento DATETIME NOT NULL
);
GO

-- GESTION DE ALQUILERES

CREATE TABLE [KERNELSINFLOW].[Alquiler](
    codigo NUMERIC(18,0) PRIMARY KEY,
    anuncio_codigo NUMERIC(19,0), -- FK
    inicio_alquiler DATETIME,
    fin_alquiler DATETIME,
    duracion_alquiler NUMERIC(18,0),
    deposito NUMERIC(18,2),
    comision NUMERIC(18,2),
    gastos_averiguacion NUMERIC(18,2),
    estado_alquiler_codigo NUMERIC(18,0) -- FK
);
GO

CREATE TABLE [KERNELSINFLOW].[Estado_Alquiler](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100),
);
GO

CREATE TABLE [KERNELSINFLOW].[Importe_Alquiler](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    alquiler_codigo NUMERIC(18,0), -- FK
    nro_periodo_inicio NUMERIC(18,0),
    nro_periodo_fin NUMERIC(18,0),
    precio NUMERIC(18,2)
);
GO

CREATE TABLE [KERNELSINFLOW].[Inquilino](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    persona_codigo NUMERIC(18,0), -- FK
    alquiler_codigo NUMERIC(18,0) -- FK
);
GO

-- GESTION DE PAGO DE ALQUILERES

CREATE TABLE [KERNELSINFLOW].[Medio_Pago](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100)
);
GO

CREATE TABLE [KERNELSINFLOW].[Pago_Alquiler](
    codigo NUMERIC(18,0) PRIMARY KEY,
    alquiler_codigo NUMERIC(18,0), -- FK
    fecha_pago DATETIME,
    nro_periodo NVARCHAR(100),
    descripcion NVARCHAR(100),
    inicio_periodo DATETIME,
    fin_periodo DATETIME,
    importe NUMERIC(18,2),
    medio_pago_codigo NUMERIC(18,0), -- FK
    fecha_vencimiento DATETIME
);
GO

-- GESTION DE VENTA DE INMUEBLES

CREATE TABLE [KERNELSINFLOW].[Venta](
    codigo NUMERIC(18,0) PRIMARY KEY,
    anuncio_codigo NUMERIC(19,0), -- FK
    moneda_codigo NUMERIC(18,0), -- FK
    fecha DATETIME,
    precio_venta NUMERIC(18,2),
    comision_inmobiliaria NUMERIC(18,2)
);
GO


CREATE TABLE [KERNELSINFLOW].[Pago](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    venta_codigo NUMERIC(18,0), -- FK
    importe NUMERIC(18,2),
    cotizacion_moneda NUMERIC(18,2),
    medio_pago_codigo NUMERIC(18,0), -- FK
    moneda_codigo NUMERIC(18,0) -- FK
);
GO

CREATE TABLE [KERNELSINFLOW].[Comprador](
    codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
    persona_codigo NUMERIC(18,0), -- FK
    venta_codigo NUMERIC(18,0) -- FK
);
GO

/* FUNCIONES */

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_localidad]
(
  @provincia NVARCHAR(100),
  @localidad NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_localidad NUMERIC(18,0)
  SELECT @id_localidad = [KERNELSINFLOW].[Localidad].[codigo]
    FROM [KERNELSINFLOW].[Localidad]
    INNER JOIN [KERNELSINFLOW].[Provincia]
      ON [KERNELSINFLOW].[Localidad].[provincia_codigo] = [KERNELSINFLOW].[Provincia].[codigo]
      WHERE [KERNELSINFLOW].[Localidad].[descripcion] = @localidad
        AND [KERNELSINFLOW].[Provincia].[descripcion] = @provincia
  RETURN @id_localidad
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_provincia]
(
  @provincia NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_provincia NUMERIC(18,0)
  SELECT @id_provincia = codigo
    FROM [KERNELSINFLOW].[Provincia]
      WHERE [KERNELSINFLOW].[Provincia].[descripcion] = @provincia
  RETURN @id_provincia
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_barrio]
(
  @provincia NVARCHAR(100),
  @localidad NVARCHAR(100),
  @barrio NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_barrio NUMERIC(18,0)
  SELECT @id_barrio = [KERNELSINFLOW].[Barrio].[codigo]
    FROM [KERNELSINFLOW].[Barrio]
    INNER JOIN [KERNELSINFLOW].[Localidad]
      ON [KERNELSINFLOW].[Barrio].[localidad_codigo] = [KERNELSINFLOW].[Localidad].[codigo]
    INNER JOIN [KERNELSINFLOW].[Provincia]
      ON [KERNELSINFLOW].[Localidad].[provincia_codigo] = [KERNELSINFLOW].[Provincia].[codigo]
      WHERE [KERNELSINFLOW].[Barrio].[descripcion] = @barrio
        AND [KERNELSINFLOW].[Localidad].[descripcion] = @localidad
        AND [KERNELSINFLOW].[Provincia].[descripcion] = @provincia
  RETURN @id_barrio
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_persona]
(
  @nombre NVARCHAR(100),
  @apellido NVARCHAR(100),
  @dni NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_persona NUMERIC(18,0)
  SELECT @id_persona = codigo
    FROM [KERNELSINFLOW].[Persona]
      WHERE [KERNELSINFLOW].[Persona].[nombre] = @nombre
        AND [KERNELSINFLOW].[Persona].[apellido] = @apellido
        AND [KERNELSINFLOW].[Persona].[dni] = @dni
  RETURN @id_persona
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_caracteristica]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_caracteristica NUMERIC(18,0)
  SELECT @id_caracteristica = codigo
    FROM [KERNELSINFLOW].[Caracteristica]
      WHERE [KERNELSINFLOW].[Caracteristica].[descripcion] = @descripcion
  RETURN @id_caracteristica
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_tipo_inmueble]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_tipo_inmueble NUMERIC(18,0)
  SELECT @id_tipo_inmueble = codigo
    FROM [KERNELSINFLOW].[Tipo_Inmueble]
      WHERE [KERNELSINFLOW].[Tipo_Inmueble].[descripcion] = @descripcion
  RETURN @id_tipo_inmueble
END
GO


CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_disposicion]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_disposicion NUMERIC(18,0)
  SELECT @id_disposicion = codigo
    FROM [KERNELSINFLOW].[Disposicion]
      WHERE [KERNELSINFLOW].[Disposicion].[descripcion] = @descripcion
  RETURN @id_disposicion
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_cantidad_ambientes]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_cantidad_ambientes NUMERIC(18,0)
  SELECT @id_cantidad_ambientes = codigo
    FROM [KERNELSINFLOW].[Cantidad_Ambientes]
      WHERE [KERNELSINFLOW].[Cantidad_Ambientes].[descripcion] = @descripcion
  RETURN @id_cantidad_ambientes
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_orientacion]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_orientacion NUMERIC(18,0)
  SELECT @id_orientacion = codigo
    FROM [KERNELSINFLOW].[Orientacion]
      WHERE [KERNELSINFLOW].[Orientacion].[descripcion] = @descripcion
  RETURN @id_orientacion
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_estado_inmueble]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_estado_inmueble NUMERIC(18,0)
  SELECT @id_estado_inmueble = codigo
    FROM [KERNELSINFLOW].[Estado_Inmueble]
      WHERE [KERNELSINFLOW].[Estado_Inmueble].[descripcion] = @descripcion
  RETURN @id_estado_inmueble
END
GO


CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_estado_anuncio]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_estado_anuncio NUMERIC(18,0)
  SELECT @id_estado_anuncio = codigo
    FROM [KERNELSINFLOW].[Estado_Anuncio]
      WHERE [KERNELSINFLOW].[Estado_Anuncio].[descripcion] = @descripcion
  RETURN @id_estado_anuncio
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_tipo_operacion]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_tipo_operacion NUMERIC(18,0)
  SELECT @id_tipo_operacion = codigo
    FROM [KERNELSINFLOW].[Tipo_Operacion]
      WHERE [KERNELSINFLOW].[Tipo_Operacion].[descripcion] = @descripcion
  RETURN @id_tipo_operacion
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_moneda]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_tipo_moneda NUMERIC(18,0)
  SELECT @id_tipo_moneda = [KERNELSINFLOW].[Moneda].[codigo]
    FROM [KERNELSINFLOW].[Moneda]
      WHERE [KERNELSINFLOW].[Moneda].[descripcion] = @descripcion
  RETURN @id_tipo_moneda
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_periodo]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_periodo NUMERIC(18,0)
  SELECT @id_periodo = codigo
    FROM [KERNELSINFLOW].[Periodo]
      WHERE [KERNELSINFLOW].[Periodo].[descripcion] = @descripcion
  RETURN @id_periodo
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_agente]
(
  @nombre NVARCHAR(100),
  @apellido NVARCHAR(100),
  @dni NVARCHAR(100),
  @codigo_sucursal NUMERIC(18,0)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_agente NUMERIC(18,0)
  SELECT @id_agente = [KERNELSINFLOW].[Agente].[codigo]
    FROM [KERNELSINFLOW].[Agente]
    INNER JOIN [KERNELSINFLOW].[Persona] ON [KERNELSINFLOW].[Agente].[persona_codigo] = [KERNELSINFLOW].[Persona].[codigo]
      WHERE [KERNELSINFLOW].[Persona].[nombre] = @nombre
        AND [KERNELSINFLOW].[Persona].[apellido] = @apellido
        AND [KERNELSINFLOW].[Persona].[dni] = @dni
        AND [KERNELSINFLOW].[Agente].[sucursal_codigo] = @codigo_sucursal
  RETURN @id_agente
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_medio_pago]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_medio_pago NUMERIC(18,0)
  SELECT @id_medio_pago = codigo
    FROM [KERNELSINFLOW].[Medio_Pago]
      WHERE [KERNELSINFLOW].[Medio_Pago].[descripcion] = @descripcion
  RETURN @id_medio_pago
END
GO

CREATE FUNCTION [KERNELSINFLOW].[fx_buscar_estado_alquiler]
(
  @descripcion NVARCHAR(100)
)
RETURNS NUMERIC(18,0)
AS
BEGIN
  DECLARE @id_estado_alquiler NUMERIC(18,0)
  SELECT @id_estado_alquiler = codigo
    FROM [KERNELSINFLOW].[Estado_Alquiler]
      WHERE [KERNELSINFLOW].[Estado_Alquiler].[descripcion] = @descripcion
  RETURN @id_estado_alquiler
END
GO

/* STORE PROCEDURES */

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Tipo_Inmueble]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Tipo_Inmueble] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_TIPO_INMUEBLE]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_TIPO_INMUEBLE] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Disposicion]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Disposicion] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_DISPOSICION]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_DISPOSICION] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Cantidad_Ambientes]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Cantidad_Ambientes] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_CANT_AMBIENTES]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CANT_AMBIENTES] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Orientacion]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Orientacion] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_ORIENTACION]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_ORIENTACION] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Estado_Inmueble]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Estado_Inmueble] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_ESTADO]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_ESTADO] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Provincia]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Provincia] (
        [descripcion]
    ) SELECT
        DISTINCT [INMUEBLE_PROVINCIA]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_PROVINCIA] IS NOT NULL
      UNION
      SELECT
        DISTINCT [SUCURSAL_PROVINCIA]
        FROM [gd_esquema].[Maestra]
        WHERE [SUCURSAL_PROVINCIA] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Caracteristica]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Caracteristica] (
        [descripcion]
    ) VALUES ('WIFI'), ('CABLE'), ('CALEFACCION'), ('GAS')
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Periodo]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Periodo] (
        [descripcion]
    ) SELECT DISTINCT
        [ANUNCIO_TIPO_PERIODO]
        FROM [gd_esquema].[Maestra]
        WHERE [ANUNCIO_TIPO_PERIODO] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Estado_Anuncio]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Estado_Anuncio] (
        [descripcion]
    ) SELECT DISTINCT
        [ANUNCIO_ESTADO]
        FROM [gd_esquema].[Maestra]
        WHERE [ANUNCIO_ESTADO] IS NOT NULL
END
GO



CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Tipo_Operacion]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Tipo_Operacion] (
        [descripcion]
    ) SELECT DISTINCT
        [ANUNCIO_TIPO_OPERACION]
        FROM [gd_esquema].[Maestra]
        WHERE [ANUNCIO_TIPO_OPERACION] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Moneda]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Moneda] (
        [descripcion]
    ) SELECT DISTINCT
        [ANUNCIO_MONEDA]
        FROM [gd_esquema].[Maestra]
        WHERE [ANUNCIO_MONEDA] IS NOT NULL
      UNION
      SELECT DISTINCT
        [VENTA_MONEDA]
        FROM [gd_esquema].[Maestra]
        WHERE [VENTA_MONEDA] IS NOT NULL
      UNION
      SELECT DISTINCT
        [PAGO_VENTA_MONEDA]
        FROM [gd_esquema].[Maestra]
        WHERE [PAGO_VENTA_MONEDA] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Persona]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Persona] (
        [nombre],
        [apellido],
        [dni],
        [fecha_registro],
        [telefono],
        [mail],
        [fecha_nacimiento]
    ) SELECT DISTINCT
        [COMPRADOR_NOMBRE],
        [COMPRADOR_APELLIDO],
        [COMPRADOR_DNI],
        [COMPRADOR_FECHA_REGISTRO],
        [COMPRADOR_TELEFONO],
        [COMPRADOR_MAIL],
        [COMPRADOR_FECHA_NAC]
        FROM [gd_esquema].[Maestra]
        WHERE [COMPRADOR_NOMBRE] IS NOT NULL
      UNION
      SELECT DISTINCT
        [INQUILINO_NOMBRE],
        [INQUILINO_APELLIDO],
        [INQUILINO_DNI],
        [INQUILINO_FECHA_REGISTRO],
        [INQUILINO_TELEFONO],
        [INQUILINO_MAIL],
        [INQUILINO_FECHA_NAC]
        FROM [gd_esquema].[Maestra]
        WHERE [INQUILINO_NOMBRE] IS NOT NULL
      UNION
      SELECT DISTINCT
        [PROPIETARIO_NOMBRE],
        [PROPIETARIO_APELLIDO],
        [PROPIETARIO_DNI],
        [PROPIETARIO_FECHA_REGISTRO],
        [PROPIETARIO_TELEFONO],
        [PROPIETARIO_MAIL],
        [PROPIETARIO_FECHA_NAC]
        FROM [gd_esquema].[Maestra]
        WHERE [PROPIETARIO_NOMBRE] IS NOT NULL
      UNION
      SELECT DISTINCT
        [AGENTE_NOMBRE],
        [AGENTE_APELLIDO],
        [AGENTE_DNI],
        [AGENTE_FECHA_REGISTRO],
        [AGENTE_TELEFONO],
        [AGENTE_MAIL],
        [AGENTE_FECHA_NAC]
        FROM [gd_esquema].[Maestra]
        WHERE [AGENTE_NOMBRE] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Inmueble]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Inmueble] (
        [codigo],
        [tipo_inmueble_codigo],
        [descripcion],
        [nombre],
        [disposicion_codigo],
        [cantidad_ambientes_codigo],
        [orientacion_codigo],
        [direccion],
        [barrio_codigo],
        [superficieTotal],
        [estado_inmueble_codigo],
        [antiguedad],
        [expensas]
    ) SELECT DISTINCT
        [INMUEBLE_CODIGO],
        [KERNELSINFLOW].fx_buscar_tipo_inmueble([INMUEBLE_TIPO_INMUEBLE]),
        [INMUEBLE_DESCRIPCION],
        [INMUEBLE_NOMBRE],
        [KERNELSINFLOW].fx_buscar_disposicion([INMUEBLE_DISPOSICION]),
        [KERNELSINFLOW].fx_buscar_cantidad_ambientes([INMUEBLE_CANT_AMBIENTES]),
        [KERNELSINFLOW].fx_buscar_orientacion([INMUEBLE_ORIENTACION]),
        [INMUEBLE_DIRECCION],
        [KERNELSINFLOW].fx_buscar_barrio([INMUEBLE_PROVINCIA], [INMUEBLE_LOCALIDAD], [INMUEBLE_BARRIO]),
        [INMUEBLE_SUPERFICIETOTAL],
        [KERNELSINFLOW].fx_buscar_estado_inmueble([INMUEBLE_ESTADO]),
        [INMUEBLE_ANTIGUEDAD],
        [INMUEBLE_EXPESAS]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CODIGO] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Propietario]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Propietario] (
        [persona_codigo],
        [inmueble_codigo]
    ) SELECT DISTINCT
        [KERNELSINFLOW].fx_buscar_persona([PROPIETARIO_NOMBRE], [PROPIETARIO_APELLIDO], [PROPIETARIO_DNI]),
        [INMUEBLE_CODIGO]
        FROM [gd_esquema].[Maestra]
        WHERE [PROPIETARIO_NOMBRE] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Caracteristica_Inmueble]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Caracteristica_Inmueble] (
        [inmueble_codigo],
        [caracteristica_codigo]
    ) SELECT DISTINCT
        [INMUEBLE_CODIGO],
        [KERNELSINFLOW].fx_buscar_caracteristica('WIFI')
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CODIGO] IS NOT NULL
            AND [INMUEBLE_CARACTERISTICA_WIFI] = 1
      UNION
      SELECT DISTINCT
        [INMUEBLE_CODIGO],
        [KERNELSINFLOW].fx_buscar_caracteristica('CABLE')
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CODIGO] IS NOT NULL
            AND [INMUEBLE_CARACTERISTICA_CABLE] = 1
      UNION
      SELECT DISTINCT
        [INMUEBLE_CODIGO],
        [KERNELSINFLOW].fx_buscar_caracteristica('CALEFACCION')
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CODIGO] IS NOT NULL
            AND [INMUEBLE_CARACTERISTICA_CALEFACCION] = 1
      UNION
      SELECT DISTINCT
        [INMUEBLE_CODIGO],
        [KERNELSINFLOW].fx_buscar_caracteristica('GAS')
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_CODIGO] IS NOT NULL
            AND [INMUEBLE_CARACTERISTICA_GAS] = 1
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Anuncio]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Anuncio] (
        [codigo],
        [fecha_publicacion],
        [agente_codigo],
        [tipo_operacion_codigo],
        [precio_publicado],
        [moneda_codigo],
        [periodo_codigo],
        [estado_anuncio_codigo],
        [fecha_finalizacion],
        [costo_anuncio],
        [inmueble_codigo]
    ) SELECT DISTINCT
        [ANUNCIO_CODIGO],
        [ANUNCIO_FECHA_PUBLICACION],
        [KERNELSINFLOW].fx_buscar_agente([AGENTE_NOMBRE], [AGENTE_APELLIDO], [AGENTE_DNI], [SUCURSAL_CODIGO]),
        [KERNELSINFLOW].fx_buscar_tipo_operacion([ANUNCIO_TIPO_OPERACION]),
        [ANUNCIO_PRECIO_PUBLICADO],
        [KERNELSINFLOW].fx_buscar_moneda([ANUNCIO_MONEDA]),
        [KERNELSINFLOW].fx_buscar_periodo([ANUNCIO_TIPO_PERIODO]),
        [KERNELSINFLOW].fx_buscar_estado_anuncio([ANUNCIO_ESTADO]),
        [ANUNCIO_FECHA_FINALIZACION],
        [ANUNCIO_COSTO_ANUNCIO],
        [INMUEBLE_CODIGO]
        FROM [gd_esquema].[Maestra]
        WHERE [ANUNCIO_CODIGO] IS NOT NULL
            AND [INMUEBLE_CODIGO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Localidad]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Localidad] (
        [provincia_codigo],
        [descripcion]
    ) SELECT DISTINCT
        [KERNELSINFLOW].fx_buscar_provincia([INMUEBLE_PROVINCIA]),
        [INMUEBLE_LOCALIDAD]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_LOCALIDAD] IS NOT NULL
      UNION
      SELECT DISTINCT
        [KERNELSINFLOW].fx_buscar_provincia([SUCURSAL_PROVINCIA]),
        [SUCURSAL_LOCALIDAD]
        FROM [gd_esquema].[Maestra]
        WHERE [SUCURSAL_LOCALIDAD] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Barrio]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Barrio] (
        [localidad_codigo],
        [descripcion]
    ) SELECT DISTINCT
        [KERNELSINFLOW].fx_buscar_localidad([INMUEBLE_PROVINCIA], [INMUEBLE_LOCALIDAD]),
        [INMUEBLE_BARRIO]
        FROM [gd_esquema].[Maestra]
        WHERE [INMUEBLE_BARRIO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Sucursal]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Sucursal] (
        [codigo],
        [direccion],
        [localidad_codigo],
        [telefono],
        [nombre]
    )
    SELECT DISTINCT
        [SUCURSAL_CODIGO],
        [SUCURSAL_DIRECCION],
        [KERNELSINFLOW].fx_buscar_localidad([SUCURSAL_PROVINCIA], [SUCURSAL_LOCALIDAD]),
        [SUCURSAL_TELEFONO],
        [SUCURSAL_NOMBRE]
        FROM [gd_esquema].[Maestra]
        WHERE [SUCURSAL_CODIGO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Agente]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Agente] (
        [persona_codigo],
        [sucursal_codigo]
    ) SELECT DISTINCT
        [KERNELSINFLOW].fx_buscar_persona([AGENTE_NOMBRE], [AGENTE_APELLIDO], [AGENTE_DNI]),
        [SUCURSAL_CODIGO]
        FROM [gd_esquema].[Maestra]
        WHERE [AGENTE_NOMBRE] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Pago]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Pago](
    [venta_codigo],
    [importe],
    [cotizacion_moneda],
    [medio_pago_codigo],
    [moneda_codigo]
  ) SELECT DISTINCT
    [VENTA_CODIGO],
    [PAGO_VENTA_IMPORTE],
    [PAGO_VENTA_COTIZACION],
    [KERNELSINFLOW].fx_buscar_medio_pago([PAGO_VENTA_MEDIO_PAGO]),
    [KERNELSINFLOW].fx_buscar_moneda([PAGO_VENTA_MONEDA])
    FROM [gd_esquema].[Maestra]
    WHERE [VENTA_CODIGO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Comprador]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Comprador](
    [persona_codigo],
    [venta_codigo]
  ) SELECT DISTINCT
    [KERNELSINFLOW].fx_buscar_persona([COMPRADOR_NOMBRE], [COMPRADOR_APELLIDO], [COMPRADOR_DNI]),
    [VENTA_CODIGO]
    FROM [gd_esquema].[Maestra]
    WHERE [COMPRADOR_NOMBRE] IS NOT NULL
    
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Venta]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Venta](
    [codigo],
    [anuncio_codigo],
    [moneda_codigo],
    [fecha],
    [precio_venta],
    [comision_inmobiliaria]
  ) SELECT DISTINCT
    [VENTA_CODIGO],
    [ANUNCIO_CODIGO],
    [KERNELSINFLOW].fx_buscar_moneda([VENTA_MONEDA]),
    [VENTA_FECHA],
    [VENTA_PRECIO_VENTA],
    [VENTA_COMISION]
    FROM [gd_esquema].[Maestra]
    WHERE [VENTA_CODIGO] IS NOT NULL
      AND [ANUNCIO_CODIGO] IS NOT NULL
    
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Alquiler]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Alquiler](
    [codigo],
    [anuncio_codigo],
    [inicio_alquiler],
    [fin_alquiler],
    [duracion_alquiler],
    [deposito],
    [comision],
    [gastos_averiguacion],
    [estado_alquiler_codigo]
  ) SELECT DISTINCT
    [ALQUILER_CODIGO],
    [ANUNCIO_CODIGO],
    [ALQUILER_FECHA_INICIO],
    [ALQUILER_FECHA_FIN],
    [ALQUILER_CANT_PERIODOS],
    [ALQUILER_DEPOSITO],
    [ALQUILER_COMISION],
    [ALQUILER_GASTOS_AVERIGUA],
    [KERNELSINFLOW].fx_buscar_estado_alquiler([ALQUILER_ESTADO])
    FROM [gd_esquema].[Maestra]
    WHERE [ALQUILER_CODIGO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Pago_Alquiler]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Pago_Alquiler](
    [codigo],
    [alquiler_codigo], 
    [fecha_pago],
    [nro_periodo],
    [descripcion],
    [inicio_periodo],
    [fin_periodo],
    [importe],
    [medio_pago_codigo],
    [fecha_vencimiento]
  ) SELECT DISTINCT
    [PAGO_ALQUILER_CODIGO],
    [ALQUILER_CODIGO],
    [PAGO_ALQUILER_FECHA],
    [PAGO_ALQUILER_NRO_PERIODO],
    [PAGO_ALQUILER_DESC],
    [PAGO_ALQUILER_FEC_INI],
    [PAGO_ALQUILER_FEC_FIN],
    [PAGO_ALQUILER_IMPORTE],
    [KERNELSINFLOW].fx_buscar_medio_pago([PAGO_ALQUILER_MEDIO_PAGO]),
    [PAGO_ALQUILER_FECHA_VENCIMIENTO]
    FROM [gd_esquema].[Maestra]
    WHERE [PAGO_ALQUILER_CODIGO] IS NOT NULL
      AND [ALQUILER_CODIGO] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Importe_Alquiler]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Importe_Alquiler] (
      [alquiler_codigo],
      [nro_periodo_inicio],
      [nro_periodo_fin],
      [precio]
    ) SELECT DISTINCT 
      [ALQUILER_CODIGO],
      [DETALLE_ALQ_NRO_PERIODO_INI],
      [DETALLE_ALQ_NRO_PERIODO_FIN],
      [DETALLE_ALQ_PRECIO]
      FROM [gd_esquema].[Maestra]
      WHERE [ALQUILER_CODIGO] IS NOT NULL
        AND [DETALLE_ALQ_NRO_PERIODO_INI] IS NOT NULL
        AND [DETALLE_ALQ_NRO_PERIODO_FIN] IS NOT NULL
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Inquilino]
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO [KERNELSINFLOW].[Inquilino](
    [persona_codigo],
    [alquiler_codigo]
  ) SELECT DISTINCT
    [KERNELSINFLOW].fx_buscar_persona([INQUILINO_NOMBRE], [INQUILINO_APELLIDO], [INQUILINO_DNI]), --Inseguro
    [ALQUILER_CODIGO]
    FROM [gd_esquema].[Maestra]
    WHERE [INQUILINO_NOMBRE] IS NOT NULL
    
END
GO

CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Medio_Pago]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Medio_Pago] (
        [descripcion]
    ) SELECT DISTINCT 
    [PAGO_VENTA_MEDIO_PAGO]
        FROM [gd_esquema].[Maestra]
        WHERE [PAGO_VENTA_MEDIO_PAGO] IS NOT NULL
    UNION
    SELECT DISTINCT 
    [PAGO_ALQUILER_MEDIO_PAGO]
        FROM [gd_esquema].[Maestra]
        WHERE [PAGO_ALQUILER_MEDIO_PAGO] IS NOT NULL
END
GO


CREATE PROCEDURE [KERNELSINFLOW].[sp_migrar_Estado_Alquiler]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [KERNELSINFLOW].[Estado_Alquiler] (
        [descripcion]
    ) SELECT DISTINCT 
    [ALQUILER_ESTADO]
        FROM [gd_esquema].[Maestra]
        WHERE [ALQUILER_ESTADO] IS NOT NULL
END
GO

/* MIGRACION DE DATOS */

BEGIN TRANSACTION
BEGIN TRY
    EXECUTE [KERNELSINFLOW].[sp_migrar_Tipo_Inmueble]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Disposicion]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Cantidad_Ambientes]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Orientacion]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Estado_Inmueble]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Provincia]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Caracteristica]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Periodo]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Estado_Anuncio]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Tipo_Operacion]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Moneda]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Persona]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Localidad]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Barrio]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Sucursal]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Agente]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Inmueble]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Caracteristica_Inmueble]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Propietario]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Anuncio]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Medio_Pago]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Estado_Alquiler]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Pago]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Comprador]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Venta]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Pago_Alquiler]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Importe_Alquiler]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Inquilino]
    EXECUTE [KERNELSINFLOW].[sp_migrar_Alquiler]
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW 50001, 'Error al migrar los datos - Verifique que los datos de las tablas creadas se encuentren vacias', 1;
END CATCH
IF (
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Tipo_Inmueble]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Disposicion]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Cantidad_Ambientes]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Orientacion]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Estado_Inmueble]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Provincia]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Caracteristica]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Periodo]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Estado_Anuncio]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Tipo_Operacion]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Moneda]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Persona]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Localidad]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Barrio]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Sucursal]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Agente]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Inmueble]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Caracteristica_Inmueble]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Propietario]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Anuncio]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Pago]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Comprador]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Venta]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Pago_Alquiler]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Importe_Alquiler]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Inquilino]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Alquiler]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Medio_Pago]) AND
    EXISTS (SELECT 1 FROM [KERNELSINFLOW].[Estado_Alquiler])
)
BEGIN
    PRINT 'Migracion de datos finalizada correctamente'
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    THROW 50002, 'Error al migrar los datos - Las tablas se encuentran vacias', 1;
END
GO

/* FOREING KEY */

-- GESTION DE ANUNCIOS

ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (tipo_inmueble_codigo) REFERENCES [KERNELSINFLOW].[Tipo_Inmueble](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (disposicion_codigo) REFERENCES [KERNELSINFLOW].[Disposicion](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (cantidad_ambientes_codigo) REFERENCES [KERNELSINFLOW].[Cantidad_Ambientes](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (orientacion_codigo) REFERENCES [KERNELSINFLOW].[Orientacion](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (barrio_codigo) REFERENCES [KERNELSINFLOW].[Barrio](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inmueble]
ADD FOREIGN KEY (estado_inmueble_codigo) REFERENCES [KERNELSINFLOW].[Estado_Inmueble](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Propietario]
ADD FOREIGN KEY (persona_codigo) REFERENCES [KERNELSINFLOW].[Persona](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Propietario]
ADD FOREIGN KEY (inmueble_codigo) REFERENCES [KERNELSINFLOW].[Inmueble](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Caracteristica_Inmueble]
ADD FOREIGN KEY (inmueble_codigo) REFERENCES [KERNELSINFLOW].[Inmueble](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Caracteristica_Inmueble]
ADD FOREIGN KEY (caracteristica_codigo) REFERENCES [KERNELSINFLOW].[Caracteristica](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Localidad]
ADD FOREIGN KEY (provincia_codigo) REFERENCES [KERNELSINFLOW].[Provincia](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Barrio]
ADD FOREIGN KEY (localidad_codigo) REFERENCES [KERNELSINFLOW].[Localidad](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Agente]
ADD FOREIGN KEY (persona_codigo) REFERENCES [KERNELSINFLOW].[Persona](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Agente]
ADD FOREIGN KEY (sucursal_codigo) REFERENCES [KERNELSINFLOW].[Sucursal](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (agente_codigo) REFERENCES [KERNELSINFLOW].[Agente](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (tipo_operacion_codigo) REFERENCES [KERNELSINFLOW].[Tipo_Operacion](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[Moneda](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (periodo_codigo) REFERENCES [KERNELSINFLOW].[Periodo](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (estado_anuncio_codigo) REFERENCES [KERNELSINFLOW].[Estado_Anuncio](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Anuncio]
ADD FOREIGN KEY (inmueble_codigo) REFERENCES [KERNELSINFLOW].[Inmueble](codigo);
GO

-- GESTION DE VENTA DE INMUEBLES

ALTER TABLE [KERNELSINFLOW].[Venta]
ADD FOREIGN KEY (anuncio_codigo) REFERENCES [KERNELSINFLOW].[Anuncio](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Venta]
ADD FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[Moneda](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Pago]
ADD FOREIGN KEY (venta_codigo) REFERENCES [KERNELSINFLOW].[Venta](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Pago]
ADD FOREIGN KEY (medio_pago_codigo) REFERENCES [KERNELSINFLOW].[Medio_Pago](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Pago]
ADD FOREIGN KEY (moneda_codigo) REFERENCES [KERNELSINFLOW].[Moneda](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Comprador]
ADD FOREIGN KEY (persona_codigo) REFERENCES [KERNELSINFLOW].[Persona](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Comprador]
ADD FOREIGN KEY (venta_codigo) REFERENCES [KERNELSINFLOW].[Venta](codigo);
GO

-- GESTION DE PAGO DE ALQUILERES

ALTER TABLE [KERNELSINFLOW].[Pago_Alquiler]
ADD FOREIGN KEY (alquiler_codigo) REFERENCES [KERNELSINFLOW].[Alquiler](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Pago_Alquiler]
ADD FOREIGN KEY (medio_pago_codigo) REFERENCES [KERNELSINFLOW].[Medio_Pago](codigo);
GO

-- GESTION DE ALQUILERES

ALTER TABLE [KERNELSINFLOW].[Alquiler]
ADD FOREIGN KEY (anuncio_codigo) REFERENCES [KERNELSINFLOW].[Anuncio](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Alquiler]
ADD FOREIGN KEY (estado_alquiler_codigo) REFERENCES [KERNELSINFLOW].[Estado_Alquiler](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Importe_Alquiler]
ADD FOREIGN KEY (alquiler_codigo) REFERENCES [KERNELSINFLOW].[Alquiler](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inquilino]
ADD FOREIGN KEY (Persona_codigo) REFERENCES [KERNELSINFLOW].[Persona](codigo);
GO
ALTER TABLE [KERNELSINFLOW].[Inquilino]
ADD FOREIGN KEY (alquiler_codigo) REFERENCES [KERNELSINFLOW].[Alquiler](codigo);
GO

-- INDICES

CREATE INDEX idx_tipo_inmueble_codigo ON [KERNELSINFLOW].[Inmueble] (tipo_inmueble_codigo);
CREATE INDEX idx_disposicion_codigo ON [KERNELSINFLOW].[Inmueble] (disposicion_codigo);
CREATE INDEX idx_cantidad_ambientes_codigo ON [KERNELSINFLOW].[Inmueble] (cantidad_ambientes_codigo);
CREATE INDEX idx_orientacion_codigo ON [KERNELSINFLOW].[Inmueble] (orientacion_codigo);
CREATE INDEX idx_estado_inmueble_codigo ON [KERNELSINFLOW].[Inmueble] (estado_inmueble_codigo);
CREATE INDEX idx_barrio_codigo ON [KERNELSINFLOW].[Inmueble] (barrio_codigo);

CREATE INDEX idx_localidad_codigo ON [KERNELSINFLOW].[Barrio] (localidad_codigo);

CREATE INDEX idx_provincia_codigo ON [KERNELSINFLOW].[Localidad] (provincia_codigo);

CREATE INDEX idx_persona_codigo ON [KERNELSINFLOW].[Propietario] (persona_codigo);
CREATE INDEX idx_inmueble_codigo ON [KERNELSINFLOW].[Propietario] (inmueble_codigo);

CREATE INDEX idx_inmueble_codigo ON [KERNELSINFLOW].[Caracteristica_Inmueble] (inmueble_codigo);
CREATE INDEX idx_caracteristica_codigo ON [KERNELSINFLOW].[Caracteristica_Inmueble] (caracteristica_codigo);

CREATE INDEX idx_persona_codigo ON [KERNELSINFLOW].[Agente] (persona_codigo);
CREATE INDEX idx_sucursal_codigo ON [KERNELSINFLOW].[Agente] (sucursal_codigo);

CREATE INDEX idx_agente_codigo ON [KERNELSINFLOW].[Anuncio] (agente_codigo);
CREATE INDEX idx_tipo_operacion_codigo ON [KERNELSINFLOW].[Anuncio] (tipo_operacion_codigo);
CREATE INDEX idx_moneda_codigo ON [KERNELSINFLOW].[Anuncio] (moneda_codigo);
CREATE INDEX idx_periodo_codigo ON [KERNELSINFLOW].[Anuncio] (periodo_codigo);
CREATE INDEX idx_estado_anuncio_codigo ON [KERNELSINFLOW].[Anuncio] (estado_anuncio_codigo);
CREATE INDEX idx_inmueble_codigo ON [KERNELSINFLOW].[Anuncio] (inmueble_codigo);

CREATE INDEX idx_anuncio_codigo ON [KERNELSINFLOW].[Alquiler] (anuncio_codigo);
CREATE INDEX idx_estado_alquiler_codigo ON [KERNELSINFLOW].[Alquiler] (estado_alquiler_codigo);

CREATE INDEX idx_venta_codigo ON [KERNELSINFLOW].[Pago] (venta_codigo);
CREATE INDEX idx_medio_pago_codigo ON [KERNELSINFLOW].[Pago] (medio_pago_codigo);
CREATE INDEX idx_moneda_codigo ON [KERNELSINFLOW].[Pago] (moneda_codigo);

CREATE INDEX idx_persona_nac ON [KERNELSINFLOW].[Persona] (fecha_nacimiento DESC);
CREATE INDEX idx_anuncio_fecha_publicacion ON [KERNELSINFLOW].[Anuncio] (fecha_publicacion DESC);
CREATE INDEX idx_anuncio_fecha_finalizacion ON [KERNELSINFLOW].[Anuncio] (fecha_finalizacion DESC);

CREATE INDEX idx_inmueble_superficieTotal ON [KERNELSINFLOW].[Inmueble] (superficieTotal DESC);

CREATE INDEX idx_pago_alquiler_fecha_pago ON [KERNELSINFLOW].[Pago_Alquiler] (fecha_pago DESC);
