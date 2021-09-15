-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2021 a las 15:12:01
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdhotellibertador`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_CLIENTE` (`DNICLI` VARCHAR(8))  SELECT persona.dni, persona.nombre, persona.apellido, cliente.idpersona,cliente.id
FROM persona INNER JOIN cliente ON persona.id=cliente.idpersona
WHERE persona.dni LIKE DNICLI$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ESTADO_RESERVADO` (`NUM_HAB` INT)  UPDATE habitacion SET habitacion.disponibilidad='Reservado' WHERE habitacion.numhab=NUM_HAB$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HABITACIONES_DISPONIBLES` ()  SELECT habitacion.img, HABITACION.NUMHAB, habitacion.piso, HABITACION.DISPONIBILIDAD, TIPO.NOM, TIPO.camas, TIPO.area, TIPO.exterior, CATEGORIA.NOM, categoria.detalle, HABITACION.PRECIO
FROM HABITACION INNER JOIN TIPO ON HABITACION.CODTIP=TIPO.COD
				INNER JOIN CATEGORIA ON HABITACION.CODCAT=CATEGORIA.COD
WHERE HABITACION.DISPONIBILIDAD LIKE 'Disponible'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HAB_DIS_PERSONALIZADO` (`NOM_TIPO` VARCHAR(40), `NOM_CATEGORIA` VARCHAR(40))  SELECT habitacion.img, HABITACION.NUMHAB, habitacion.piso, HABITACION.DISPONIBILIDAD, TIPO.NOM, TIPO.camas, TIPO.area, TIPO.exterior, CATEGORIA.NOM, categoria.detalle, HABITACION.PRECIO
FROM HABITACION INNER JOIN TIPO ON HABITACION.CODTIP=TIPO.COD
				INNER JOIN CATEGORIA ON HABITACION.CODCAT=CATEGORIA.COD
WHERE (HABITACION.DISPONIBILIDAD LIKE 'Disponible') AND (TIPO.NOM LIKE NOM_TIPO) AND (CATEGORIA.NOM LIKE NOM_CATEGORIA)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MUESTRA_PERFIL` ()  SELECT * FROM perfil$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod` char(4) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `precio` double NOT NULL,
  `detalle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cod`, `nom`, `precio`, `detalle`) VALUES
('C01', 'Simple', 20, 'Televisor, DVD y aire acondicionado '),
('C02', 'Semi', 30, 'Televisor, DVD, aire acondicionado y frio bar '),
('C03', 'Completa', 50, 'Televisor, DVD, aire acondicionado, frio bar y jacuzzi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `idpersona`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idperfil` varchar(4) NOT NULL,
  `user` varchar(16) NOT NULL,
  `pas` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `idpersona`, `idperfil`, `user`, `pas`) VALUES
(1, 1, '3', 'juanto', 'juanto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `numhab` int(11) NOT NULL,
  `codtip` char(4) NOT NULL,
  `codcat` char(4) NOT NULL,
  `disponibilidad` varchar(40) NOT NULL,
  `precio` double NOT NULL,
  `piso` int(11) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`numhab`, `codtip`, `codcat`, `disponibilidad`, `precio`, `piso`, `img`) VALUES
(1, 'T01', 'C01', 'Reservado', 80, 2, 'img/01.jpg'),
(2, 'T02', 'C02', 'Disponible', 100, 2, 'img/02.jpg'),
(3, 'T03', 'C03', 'Reservado', 150, 2, 'img/03.jpg'),
(4, 'T01', 'C02', 'Disponible', 90, 2, 'img/01.jpg'),
(5, 'T03', 'C02', 'Disponible', 130, 3, 'img/03.jpg'),
(6, 'T02', 'C01', 'Ocupado', 90, 3, 'img/02.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` varchar(4) NOT NULL,
  `cargo` varchar(40) NOT NULL,
  `fechacreacion` date NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `cargo`, `fechacreacion`, `url`) VALUES
('1', 'Recepcionista', '2021-06-08', ''),
('2', 'Administrador', '2021-06-08', ''),
('3', 'Cajero', '2021-06-08', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `dni` varchar(8) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `fechanacimiento`, `dni`, `telefono`, `correo`, `direccion`) VALUES
(1, 'Juanito', 'Alcachofa', '2002-02-11', '11111', '11111', '1@', '1111'),
(2, 'Rodrigo', 'Lo', '2003-02-07', '747574', '9867523', 'rod@gmail.com', 'Peru'),
(3, 'frnak', 'mos', '1996-02-09', '8756342', '2312311', 'dsada@gmail.com', 'dasdada'),
(4, 'Aa', 'aaa', '2021-06-10', '2311', '3213131', 'dsadsad', 'dasdad'),
(5, 'nuevo', 'nuevo', '2021-06-10', '123', '123', 'dasda', 'dasda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `num_habitacion` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `fecha_inicial`, `fecha_final`, `id_cliente`, `num_habitacion`, `id_empleado`) VALUES
(1, '2021-07-01', '2021-06-09', 4, 1, 1),
(2, '2021-07-01', '2021-06-20', 1, 4, 1),
(3, '2021-06-11', '2021-07-04', 2, 5, 1),
(4, '2021-06-30', '2021-06-16', 4, 3, 1),
(5, '2021-07-01', '2021-06-25', 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `cod` char(4) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `camas` int(11) NOT NULL,
  `exterior` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`cod`, `nom`, `camas`, `exterior`, `area`, `precio`) VALUES
('T01', 'Individual', 1, 'Vista al mar', '40 m2', 60),
('T02', 'Dobles', 2, 'Vista al mar', '50 m2', 70),
('T03', 'Triples', 3, 'Vista al mar', '80 m2', 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`numhab`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
