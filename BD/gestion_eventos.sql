-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-02-2016 a las 23:07:27
-- Versión del servidor: 5.7.10-log
-- Versión de PHP: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_eventos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `identificacion` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(35) NOT NULL,
  `telefono` varchar(6) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ciudad` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='								';

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`identificacion`, `nombre`, `apellidos`, `telefono`, `direccion`, `email`, `ciudad`, `celular`, `user`, `pass`) VALUES
(1234, 'Armando', 'Casas', '667543', 'Barrio la ceja', 'raspandocucayo@gmail', 'Cartagena', '3214565434', 'carlos', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `codigo` int(6) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`codigo`, `nombre`) VALUES
(0, 'NINGUNO'),
(123, 'Mesero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `identificacion` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(35) NOT NULL,
  `telefono` varchar(6) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ciudad` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`identificacion`, `nombre`, `apellidos`, `telefono`, `direccion`, `email`, `ciudad`, `celular`) VALUES
(345, 'Juan', 'Perez', '2333', 'la ceja', 'jobepibe@hotmail.com', 'Bogota', '3124533456'),
(73204401, 'Yair', 'Cardona', '661234', 'Barrio las palmeras', 'ycardona@gmail.com', 'Cartagena', '3123454323');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `identificacion` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(35) NOT NULL,
  `telefono` varchar(7) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ciudad` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `cargo_codigo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`identificacion`, `nombre`, `apellidos`, `telefono`, `direccion`, `email`, `ciudad`, `celular`, `cargo_codigo`) VALUES
(123, 'Jose', 'Pinto', '6654123', 'barrio la ceja', 'jb@gmail.com', 'cartagena', '3123456678', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `codigo` int(60) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `hora_inicio` time(5) NOT NULL,
  `hora_fin` time(5) NOT NULL,
  `no_AproxParticipantes` int(11) NOT NULL,
  `Recinto_codigo` int(60) NOT NULL,
  `Recurso_codigo` int(6) NOT NULL,
  `cantidadRecurso` int(7) NOT NULL,
  `Administrador_identificacion` int(10) NOT NULL,
  `Cliente_identificacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`codigo`, `descripcion`, `nombre`, `estado`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `no_AproxParticipantes`, `Recinto_codigo`, `Recurso_codigo`, `cantidadRecurso`, `Administrador_identificacion`, `Cliente_identificacion`) VALUES
(123, 'Matrimono', 'Juana\'s Wedding', 'Activo', '2015-11-01 00:00:00', '2015-11-01 00:00:00', '14:00:00.00000', '22:00:00.00000', 100, 123, 123, 5, 1234, 345),
(234, 'Quinceañeros', 'QUINCEAÑERO', 'Activo', '2015-10-01 00:00:00', '2015-10-01 00:00:00', '14:00:00.00000', '19:40:00.00000', 50, 123, 123, 10, 1234, 345),
(345, 'Fiesta Infantil', 'FIESTA', 'Activo', '2015-10-01 00:00:00', '2015-10-01 00:00:00', '15:40:00.00000', '19:50:00.00000', 50, 123, 456, 30, 1234, 73204401);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `no_factura` int(6) NOT NULL,
  `cant_recurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `direccion`, `telefono`, `celular`) VALUES
(0, 'NINGUNO', 'NINGUNO', 'NINGUNO', 'NINGUNO'),
(1, 'CHIQUITA BRANS', 'Barrio el patillal', '6654467', '3134567545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recinto`
--

CREATE TABLE `recinto` (
  `codigo` int(60) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `precio_uso` int(7) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `tipo_propiedad` varchar(10) NOT NULL,
  `Proveedor_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recinto`
--

INSERT INTO `recinto` (`codigo`, `nombre`, `precio_uso`, `direccion`, `estado`, `tipo_propiedad`, `Proveedor_id`) VALUES
(123, 'Fabrik', 100000, 'Bomba el amparo', 'Excelente', 'Alquilado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `codigo` int(6) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `precio_uso` int(7) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `tipo_propiedad` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `Proveedor_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`codigo`, `nombre`, `precio_uso`, `estado`, `tipo_propiedad`, `cantidad`, `descripcion`, `Proveedor_id`) VALUES
(123, 'Silla Rimax', 70000, 'Excelente', 'Propio', 3, 'Silla roja 30kg', 1),
(456, 'Mesa', 25000, 'Excelente', 'Propio', 10, 'mesa color blanco para estantes tipo bar', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `idSolicitud` int(6) NOT NULL,
  `fecha` datetime NOT NULL,
  `factura_no_factura` int(6) NOT NULL,
  `Cliente_identificacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `fk_Empleado_cargo1_idx` (`cargo_codigo`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_Evento_Recinto1_idx` (`Recinto_codigo`),
  ADD KEY `fk_Evento_Recurso1_idx` (`Recurso_codigo`),
  ADD KEY `fk_Evento_Administrador1_idx` (`Administrador_identificacion`),
  ADD KEY `fk_Evento_Cliente1_idx` (`Cliente_identificacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`no_factura`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recinto`
--
ALTER TABLE `recinto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_Recinto_Proveedor1_idx` (`Proveedor_id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_Recurso_Proveedor1_idx` (`Proveedor_id`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `fk_Solicitud_factura1_idx` (`factura_no_factura`),
  ADD KEY `fk_Solicitud_Cliente1_idx` (`Cliente_identificacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_cargo1` FOREIGN KEY (`cargo_codigo`) REFERENCES `cargo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_Evento_Administrador1` FOREIGN KEY (`Administrador_identificacion`) REFERENCES `administrador` (`identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Cliente1` FOREIGN KEY (`Cliente_identificacion`) REFERENCES `cliente` (`identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Recinto1` FOREIGN KEY (`Recinto_codigo`) REFERENCES `recinto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Recurso1` FOREIGN KEY (`Recurso_codigo`) REFERENCES `recurso` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recinto`
--
ALTER TABLE `recinto`
  ADD CONSTRAINT `fk_Recinto_Proveedor1` FOREIGN KEY (`Proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `fk_Recurso_Proveedor1` FOREIGN KEY (`Proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `fk_Solicitud_Cliente1` FOREIGN KEY (`Cliente_identificacion`) REFERENCES `cliente` (`identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Solicitud_factura1` FOREIGN KEY (`factura_no_factura`) REFERENCES `factura` (`no_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
