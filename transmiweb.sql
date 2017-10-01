-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2017 a las 19:00:51
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transmiweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `ID_Movimiento` int(30) NOT NULL,
  `Tipo_Movimiento` int(30) NOT NULL,
  `Monto` int(30) NOT NULL,
  `ID_Tarjeta` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`ID_Movimiento`, `Tipo_Movimiento`, `Monto`, `ID_Tarjeta`) VALUES
(100, 100, 2200, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `ID_perfil` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`ID_perfil`, `Nombre`, `Descripcion`) VALUES
(1, 'Usuario', 'Usuaro general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repo_perdida`
--

CREATE TABLE `repo_perdida` (
  `ID_repo_perdida` int(30) NOT NULL,
  `fecha` date NOT NULL,
  `ID_Tarjeta` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repo_perdida`
--

INSERT INTO `repo_perdida` (`ID_repo_perdida`, `fecha`, `ID_Tarjeta`) VALUES
(100, '2017-09-01', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `ID_Tarjeta` int(30) NOT NULL,
  `Saldo` int(30) NOT NULL,
  `ID_Usuario` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`ID_Tarjeta`, `Saldo`, `ID_Usuario`) VALUES
(100, 0, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `ID_Tipo_Documento` int(30) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`ID_Tipo_Documento`, `Descripcion`) VALUES
(100, 'Cedula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `ID_Tipo_Movimiento` int(30) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`ID_Tipo_Movimiento`, `Descripcion`) VALUES
(100, 'Recarga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Clave` varchar(30) NOT NULL,
  `Fecha:Nacimiento` date NOT NULL,
  `ID_Tipo_Documento` int(30) NOT NULL,
  `Documento` varchar(12) NOT NULL,
  `ID_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `Nombre`, `Apellido`, `Clave`, `Fecha:Nacimiento`, `ID_Tipo_Documento`, `Documento`, `ID_perfil`) VALUES
(100, 'Lorena', 'Gonzalez', 'logonzales', '1991-09-01', 100, '103056666', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`ID_Movimiento`),
  ADD KEY `Tipo_Movimiento` (`Tipo_Movimiento`),
  ADD KEY `ID_Tarjeta` (`ID_Tarjeta`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`ID_perfil`);

--
-- Indices de la tabla `repo_perdida`
--
ALTER TABLE `repo_perdida`
  ADD PRIMARY KEY (`ID_repo_perdida`),
  ADD KEY `ID_Tarjeta` (`ID_Tarjeta`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`ID_Tarjeta`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`ID_Tipo_Documento`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`ID_Tipo_Movimiento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `fkpersonas` (`ID_Tipo_Documento`),
  ADD KEY `ID_perfil` (`ID_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `ID_Movimiento` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `ID_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `repo_perdida`
--
ALTER TABLE `repo_perdida`
  MODIFY `ID_repo_perdida` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `ID_Tarjeta` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `ID_Tipo_Documento` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  MODIFY `ID_Tipo_Movimiento` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`Tipo_Movimiento`) REFERENCES `tipo_movimiento` (`ID_Tipo_Movimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`ID_Tarjeta`) REFERENCES `tarjeta` (`ID_Tarjeta`);

--
-- Filtros para la tabla `repo_perdida`
--
ALTER TABLE `repo_perdida`
  ADD CONSTRAINT `repo_perdida_ibfk_1` FOREIGN KEY (`ID_Tarjeta`) REFERENCES `tarjeta` (`ID_Tarjeta`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_Tipo_Documento`) REFERENCES `tipo_documento` (`ID_Tipo_Documento`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`ID_Tipo_Documento`) REFERENCES `tipo_documento` (`ID_Tipo_Documento`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`ID_perfil`) REFERENCES `perfil` (`ID_perfil`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
