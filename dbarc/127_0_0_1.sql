-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-08-2015 a las 22:30:20
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `itracker_agentes_tkt`
--
DROP DATABASE `itracker_agentes_tkt`;
CREATE DATABASE IF NOT EXISTS `itracker_agentes_tkt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `itracker_agentes_tkt`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL,
  `usr` varchar(15) NOT NULL,
  `idmaster` int(11) DEFAULT NULL,
  `origen` varchar(255) DEFAULT NULL,
  `idequipo` int(11) DEFAULT NULL,
  `u_tom` varchar(20) DEFAULT NULL,
  `u_asig` int(11) DEFAULT NULL,
  `prioridad` smallint(6) DEFAULT NULL,
  `variables` text,
  `FA` datetime NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FB` datetime DEFAULT NULL,
  `UB` varchar(15) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `usr`, `idmaster`, `origen`, `idequipo`, `u_tom`, `u_asig`, `prioridad`, `variables`, `FA`, `UA`, `FB`, `UB`) VALUES
(1, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 1, NULL, NULL, NULL, NULL, '2014-11-23 21:11:04', 'U1AG1', NULL, NULL),
(2, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, NULL, '2014-11-23 21:11:55', 'U1AG1', '2014-11-24 14:02:37', 'COM1'),
(3, 'U1AG1', NULL, 'D1-S1-O5-O9-O15-', 2, 'COM1', NULL, NULL, NULL, '2014-11-23 21:13:17', 'U1AG1', '2014-11-24 14:13:47', 'COM1'),
(4, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, NULL, '2014-11-27 13:18:31', 'U1AG1', '2015-05-07 16:05:41', 'COM1'),
(5, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 1, NULL, NULL, NULL, NULL, '2014-12-10 10:02:23', 'U1AG1', NULL, NULL),
(6, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, NULL, '2014-12-10 10:18:29', 'U1AG1', '2015-02-18 14:58:31', 'COM1'),
(7, 'U1AG1', 10, 'D1-S1-O4-O9-O14-', 2, NULL, 0, NULL, NULL, '2014-12-10 10:19:24', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(8, 'U1AG1', 1, 'D1-S1-O3-O7-O13-', 1, NULL, NULL, NULL, NULL, '2014-12-12 09:25:49', 'U1AG1', NULL, NULL),
(10, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-04 11:55:15', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(9, 'U1AG1', 10, 'D1-S1-O3-O7-O12-', 2, 'COM1', NULL, NULL, NULL, '2015-01-15 11:14:31', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(11, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, NULL, '2015-02-04 16:53:07', 'U1AG1', '2015-02-19 15:00:26', 'COM1'),
(12, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 2, 'COM1', NULL, NULL, NULL, '2015-02-05 14:53:21', 'U1AG1', '2015-02-09 14:35:57', 'COM1'),
(13, 'U1AG2', 4, 'D1-S1-O5-O8-', 2, 'COM1', NULL, NULL, NULL, '2015-02-06 16:41:37', 'U1AG2', '2015-05-07 16:05:41', 'COM1'),
(14, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 15:34:17', 'U1AG1', '2015-02-27 09:03:25', 'COM1'),
(15, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 15:34:54', 'U1AG1', '2015-02-18 15:11:55', 'COM1'),
(16, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 1, NULL, NULL, NULL, NULL, '2015-02-09 16:20:16', 'U1AG1', NULL, NULL),
(17, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 16:21:33', 'U1AG1', '2015-02-27 10:03:44', 'COM1'),
(18, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 16:22:19', 'U1AG1', '2015-02-18 15:07:36', 'COM1'),
(19, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 16:25:00', 'U1AG1', '2015-02-19 15:01:33', 'COM1'),
(20, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-09 16:28:24', 'U1AG1', '2015-04-27 16:04:11', 'COM1'),
(21, 'U1AG1', 18, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, NULL, '2015-02-09 16:41:46', 'U1AG1', '2015-02-18 15:07:36', 'COM1'),
(22, 'U1AG1', 16, 'D1-S1-O5-O9-O14-', 1, NULL, NULL, NULL, NULL, '2015-02-09 16:42:12', 'U1AG1', NULL, NULL),
(23, 'U1AG1', 4, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-10 09:53:18', 'U1AG1', '2015-05-07 16:05:41', 'COM1'),
(24, 'U1AG1', 15, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, NULL, '2015-02-10 10:19:12', 'U1AG1', '2015-02-18 15:11:55', 'COM1'),
(25, 'U1AG1', 1, 'D1-S1-O4-O9-O14-', 1, NULL, NULL, NULL, NULL, '2015-02-10 10:21:15', 'U1AG1', NULL, NULL),
(26, 'U1AG1', 37, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-10 16:56:54', 'U1AG1', '2015-06-30 15:12:05', 'COM1'),
(27, 'U1AG2', NULL, 'D1-S1-O5-O9-O14-', 1, NULL, NULL, NULL, NULL, '2015-02-18 14:49:15', 'U1AG2', NULL, NULL),
(28, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-02-26 12:10:16', 'U1AG1', '2015-06-04 10:49:08', 'COM1'),
(29, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, '<?xml version="1.0"?>\n<tkt><VariablePrueba2>11</VariablePrueba2><VariablePrueba1>Hoal</VariablePrueba1><status>Usuario Analist Comisiones</status><abierto>1</abierto><seteado>0</seteado></tkt>\n', '2015-02-26 12:19:18', 'U1AG1', NULL, NULL),
(30, 'U1AG1', 28, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, NULL, '2015-02-27 15:00:10', 'U1AG1', '2015-06-04 10:49:08', 'COM1'),
(31, 'U1AG1', 37, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-03-03 11:27:35', 'U1AG1', '2015-06-30 15:12:05', 'COM1'),
(32, 'U1AG1', 37, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-03-03 11:29:18', 'U1AG1', '2015-06-30 15:12:05', 'COM1'),
(33, 'U1AG1', NULL, 'D1-S1-O5-O8-', 2, NULL, NULL, NULL, '<?xml version="1.0"?>\n<tkt><status>No es TKT 29</status><seteado>0</seteado></tkt>\n', '2015-03-05 09:49:47', 'U1AG1', NULL, NULL),
(34, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 2, NULL, NULL, NULL, NULL, '2015-03-12 12:52:41', 'U1AG1', NULL, NULL),
(35, 'U1AG1', NULL, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-03-12 14:37:11', 'U1AG1', '2015-06-04 11:20:21', 'COM1'),
(36, 'U1AG1', NULL, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-03-12 14:38:00', 'U1AG1', NULL, NULL),
(37, 'U1AG1', NULL, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-03-12 14:38:31', 'U1AG1', '2015-06-30 15:12:05', 'COM1'),
(38, 'U1AG1', 37, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-03-12 14:39:15', 'U1AG1', '2015-06-30 15:12:05', 'COM1'),
(39, 'U1AG1', 43, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-03-12 14:41:29', 'U1AG1', NULL, NULL),
(40, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-03-12 14:44:29', 'U1AG1', '2015-03-12 14:44:29', 'U1AG1'),
(41, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-03-12 14:46:49', 'U1AG1', '2015-03-12 14:46:49', 'U1AG1'),
(42, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-03-12 14:48:11', 'U1AG1', '2015-03-12 14:48:11', 'U1AG1'),
(43, 'U1AG2', NULL, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, NULL, '2015-04-23 15:00:59', 'U1AG2', NULL, NULL),
(44, 'U1AG2', 45, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-04-23 15:23:46', 'U1AG2', NULL, NULL),
(45, 'U1AG2', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, NULL, '2015-04-23 15:25:40', 'U1AG2', NULL, NULL),
(46, 'U1AG2', NULL, 'D1-S1-O3-O7-O12-', 2, NULL, NULL, NULL, NULL, '2015-04-23 15:26:07', 'U1AG2', NULL, NULL),
(47, 'U1AG2', NULL, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, NULL, '2015-04-23 15:26:54', 'U1AG2', NULL, NULL),
(48, 'U1AG2', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, NULL, '2015-04-29 14:10:19', 'U1AG2', '2015-06-25 14:27:55', 'COM1'),
(49, 'U1AG2', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', 0, NULL, NULL, '2015-04-29 14:10:41', 'U1AG2', NULL, NULL),
(50, 'U1AG2', 49, 'D1-S1-O3-O7-O13-', 2, NULL, 0, NULL, NULL, '2015-04-29 14:11:50', 'U1AG2', NULL, NULL),
(51, 'U1AG2', NULL, 'D1-S1-O3-O7-O13-', 2, NULL, NULL, NULL, NULL, '2015-04-29 14:12:31', 'U1AG2', NULL, NULL),
(52, 'U1AG2', 53, 'D1-S1-O3-O7-O13-', 2, 'COM1', 0, NULL, NULL, '2015-04-29 14:13:25', 'U1AG2', NULL, NULL),
(53, 'U1AG2', NULL, 'D1-S1-O3-O6-O10-', 2, 'COM1', NULL, NULL, NULL, '2015-04-29 14:16:00', 'U1AG2', NULL, NULL),
(54, 'U1AG2', NULL, 'D1-S1-O4-O8-', 2, NULL, NULL, NULL, NULL, '2015-04-29 14:16:17', 'U1AG2', NULL, NULL),
(55, 'U1AG2', NULL, 'D1-S1-O4-O8-', 2, 'COM1', NULL, NULL, NULL, '2015-04-29 14:16:29', 'U1AG2', '2015-06-25 14:10:03', 'COM1'),
(56, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-04 11:59:04', 'U1AG1', '2015-06-04 11:59:04', 'U1AG1'),
(57, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-22 14:12:55', 'U1AG1', '2015-06-22 14:12:55', 'U1AG1'),
(58, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-22 14:19:04', 'U1AG1', '2015-06-22 14:19:04', 'U1AG1'),
(59, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-22 14:20:12', 'U1AG1', '2015-06-22 14:20:12', 'U1AG1'),
(60, 'U1AG1', NULL, 'D1-S1-O1-', 2, 'COM1', NULL, NULL, NULL, '2015-06-22 14:22:57', 'U1AG1', NULL, NULL),
(61, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-22 14:23:45', 'U1AG1', '2015-06-22 14:23:45', 'U1AG1'),
(62, 'U1AG1', NULL, 'D1-S1-O3-O6-O10-', 2, 'COM1', NULL, NULL, NULL, '2015-06-22 14:25:50', 'U1AG1', '2015-06-25 14:09:55', 'COM1'),
(63, 'U1AG1', NULL, 'D1-S1-O5-O8-', 2, 'COM1', NULL, NULL, NULL, '2015-06-22 14:27:13', 'U1AG1', '2015-06-25 14:33:41', 'COM1'),
(64, 'U1AG1', 62, 'D1-S1-O3-O6-O10-', 2, 'COM1', NULL, NULL, NULL, '2015-06-22 14:39:10', 'U1AG1', '2015-06-25 14:09:55', 'COM1'),
(65, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 6, NULL, NULL, NULL, NULL, '2015-06-22 14:50:19', 'U1AG1', NULL, NULL),
(66, 'U1AG1', NULL, 'D1-S1-O3-O6-O11-', 2, NULL, NULL, NULL, NULL, '2015-06-26 11:41:30', 'U1AG1', NULL, NULL),
(67, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, NULL, '2015-06-26 11:49:42', 'U1AG1', '2015-06-26 11:49:42', 'U1AG1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m`
--

DROP TABLE IF EXISTS `tickets_m`;
CREATE TABLE IF NOT EXISTS `tickets_m` (
  `id` int(11) NOT NULL,
  `idtkt` int(11) NOT NULL,
  `idaccion` int(11) NOT NULL,
  `valoraccion` varchar(50) NOT NULL,
  `FA` datetime NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FB` datetime DEFAULT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=381 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets_m`
--

INSERT INTO `tickets_m` (`id`, `idtkt`, `idaccion`, `valoraccion`, `FA`, `UA`, `FB`, `UB`, `estado`) VALUES
(1, 1, 1, '2', '2014-11-23 21:11:04', 'U1AG1', NULL, NULL, 0),
(2, 2, 1, '2', '2014-11-23 21:11:55', 'U1AG1', NULL, NULL, 0),
(3, 3, 1, '2', '2014-11-23 21:13:17', 'U1AG1', NULL, NULL, 0),
(4, 1, 16, '', '2014-11-23 21:14:49', 'U1AG1', NULL, NULL, 0),
(5, 1, 5, '', '2014-11-23 21:15:57', 'COM1', NULL, NULL, 0),
(6, 1, 4, '1', '2014-11-23 21:16:06', 'COM1', NULL, NULL, 0),
(7, 2, 5, '', '2014-11-24 13:59:25', 'COM1', NULL, NULL, 0),
(8, 2, 12, '', '2014-11-24 14:02:37', 'COM1', NULL, NULL, 0),
(9, 3, 5, '', '2014-11-24 14:05:15', 'COM1', NULL, NULL, 0),
(10, 3, 13, '', '2014-11-24 14:09:18', 'COM1', NULL, NULL, 0),
(11, 3, 6, '', '2014-11-24 14:10:39', 'COM1', NULL, NULL, 0),
(12, 3, 12, '', '2014-11-24 14:11:01', 'COM1', NULL, NULL, 0),
(13, 3, 6, '', '2014-11-24 14:11:58', 'COM1', NULL, NULL, 0),
(14, 3, 13, '', '2014-11-24 14:12:11', 'COM1', NULL, NULL, 0),
(15, 3, 6, '', '2014-11-24 14:13:38', 'COM1', NULL, NULL, 0),
(16, 3, 13, '', '2014-11-24 14:13:47', 'COM1', NULL, NULL, 0),
(17, 4, 1, '2', '2014-11-27 13:18:31', 'U1AG1', NULL, NULL, 0),
(18, 4, 5, '', '2014-11-28 14:47:26', 'COM1', NULL, NULL, 0),
(19, 1, 16, '', '2014-12-10 09:40:14', 'U1AG1', NULL, NULL, 0),
(20, 5, 1, '2', '2014-12-10 10:02:23', 'U1AG1', NULL, NULL, 0),
(21, 6, 1, '2', '2014-12-10 10:18:29', 'U1AG1', NULL, NULL, 0),
(22, 7, 1, '2', '2014-12-10 10:19:24', 'U1AG1', NULL, NULL, 0),
(23, 8, 1, '2', '2014-12-12 09:25:49', 'U1AG1', NULL, NULL, 0),
(24, 5, 8, 'COM1', '2014-12-31 11:23:39', 'COMRES', NULL, NULL, 0),
(25, 5, 15, '', '2014-12-31 11:23:43', 'COMRES', NULL, NULL, 0),
(26, 5, 8, 'COM1', '2014-12-31 11:24:46', 'COMRES', NULL, NULL, 0),
(27, 5, 15, '', '2014-12-31 11:24:58', 'COMRES', NULL, NULL, 0),
(28, 5, 8, 'COM1', '2014-12-31 11:25:28', 'COMRES', NULL, NULL, 0),
(29, 7, 8, 'COM1', '2014-12-31 12:50:34', 'COMRES', NULL, NULL, 0),
(30, 7, 15, '', '2014-12-31 13:05:58', 'COMRES', NULL, NULL, 0),
(31, 7, 8, 'COM1', '2014-12-31 13:06:02', 'COMRES', NULL, NULL, 0),
(32, 1, 16, '', '2015-01-15 11:12:10', 'U1AG1', NULL, NULL, 0),
(33, 9, 1, '2', '2015-01-15 11:14:31', 'U1AG1', NULL, NULL, 0),
(34, 9, 16, '', '2015-01-15 11:16:05', 'U1AG1', NULL, NULL, 0),
(35, 4, 12, '', '2015-01-15 11:17:17', 'COM1', NULL, NULL, 0),
(36, 5, 4, '1', '2015-01-15 11:36:46', 'COM1', NULL, NULL, 0),
(37, 9, 5, '', '2015-01-15 11:40:12', 'COM1', NULL, NULL, 0),
(38, 9, 17, '', '2015-01-15 11:41:06', 'COM1', NULL, NULL, 0),
(39, 9, 10, '8', '2015-01-15 11:41:56', 'COM1', NULL, NULL, 0),
(40, 7, 17, '', '2015-01-15 14:28:47', 'COM1', NULL, NULL, 0),
(41, 7, 3, '', '2015-01-15 14:28:49', 'COM1', NULL, NULL, 0),
(42, 7, 17, '', '2015-01-15 14:53:29', 'COM1', NULL, NULL, 0),
(43, 4, 6, '', '2015-01-15 14:54:03', 'COM1', NULL, NULL, 0),
(44, 10, 1, '2', '2015-02-04 11:55:15', 'U1AG1', NULL, NULL, 0),
(45, 11, 1, '2', '2015-02-04 16:53:07', 'U1AG1', NULL, NULL, 0),
(46, 12, 1, '2', '2015-02-05 14:53:21', 'U1AG1', NULL, NULL, 0),
(47, 4, 17, '', '2015-02-06 10:03:14', 'COM1', NULL, NULL, 0),
(48, 6, 5, '', '2015-02-06 10:12:48', 'COM1', NULL, NULL, 0),
(49, 8, 5, '', '2015-02-06 10:14:40', 'COM1', NULL, NULL, 0),
(50, 8, 4, '1', '2015-02-06 10:14:49', 'COM1', NULL, NULL, 0),
(51, 8, 10, '1', '2015-02-06 10:14:49', 'COM1', NULL, NULL, 0),
(52, 11, 5, '', '2015-02-06 10:38:36', 'COM1', NULL, NULL, 0),
(53, 10, 5, '', '2015-02-06 10:45:35', 'COM1', NULL, NULL, 0),
(54, 10, 10, '7', '2015-02-06 10:45:39', 'COM1', NULL, NULL, 0),
(55, 7, 10, '10', '2015-02-06 11:10:16', 'COM1', NULL, NULL, 0),
(56, 10, 7, '', '2015-02-06 11:10:16', 'COM1', NULL, NULL, 0),
(57, 13, 1, '2', '2015-02-06 16:41:37', 'U1AG2', NULL, NULL, 0),
(58, 5, 16, '', '2015-02-06 16:56:24', 'U1AG1', NULL, NULL, 0),
(59, 13, 5, '', '2015-02-09 09:47:38', 'COM1', NULL, NULL, 0),
(60, 13, 10, '4', '2015-02-09 09:47:43', 'COM1', NULL, NULL, 0),
(61, 10, 10, '7', '2015-02-09 12:40:48', 'COM1', NULL, NULL, 0),
(62, 7, 7, '', '2015-02-09 12:40:48', 'COM1', NULL, NULL, 0),
(63, 7, 10, '10', '2015-02-09 12:47:35', 'COM1', NULL, NULL, 0),
(64, 10, 7, '', '2015-02-09 12:47:35', 'COM1', NULL, NULL, 0),
(65, 9, 10, '10', '2015-02-09 12:50:22', 'COM1', NULL, NULL, 0),
(66, 12, 5, '', '2015-02-09 14:35:42', 'COM1', NULL, NULL, 0),
(67, 12, 12, '', '2015-02-09 14:35:57', 'COM1', NULL, NULL, 0),
(68, 14, 1, '2', '2015-02-09 15:34:17', 'U1AG1', NULL, NULL, 0),
(69, 15, 1, '2', '2015-02-09 15:34:54', 'U1AG1', NULL, NULL, 0),
(70, 16, 1, '2', '2015-02-09 16:20:16', 'U1AG1', NULL, NULL, 0),
(71, 17, 1, '2', '2015-02-09 16:21:33', 'U1AG1', NULL, NULL, 0),
(72, 18, 1, '2', '2015-02-09 16:22:19', 'U1AG1', NULL, NULL, 0),
(73, 19, 1, '2', '2015-02-09 16:25:00', 'U1AG1', NULL, NULL, 0),
(74, 20, 1, '2', '2015-02-09 16:28:24', 'U1AG1', NULL, NULL, 0),
(75, 21, 1, '2', '2015-02-09 16:41:46', 'U1AG1', NULL, NULL, 0),
(76, 21, 10, '18', '2015-02-09 16:41:46', 'U1AG1', NULL, NULL, 0),
(77, 22, 1, '2', '2015-02-09 16:42:12', 'U1AG1', NULL, NULL, 0),
(78, 22, 10, '16', '2015-02-09 16:42:12', 'U1AG1', NULL, NULL, 0),
(79, 23, 1, '2', '2015-02-10 09:53:18', 'U1AG1', NULL, NULL, 0),
(80, 24, 1, '2', '2015-02-10 10:19:12', 'U1AG1', NULL, NULL, 0),
(81, 24, 10, '15', '2015-02-10 10:19:12', 'U1AG1', NULL, NULL, 0),
(82, 25, 1, '2', '2015-02-10 10:21:15', 'U1AG1', NULL, NULL, 0),
(83, 25, 4, '1', '2015-02-10 10:21:15', 'U1AG1', NULL, NULL, 0),
(84, 25, 10, '1', '2015-02-10 10:21:15', 'U1AG1', NULL, NULL, 0),
(85, 26, 1, '2', '2015-02-10 16:56:54', 'U1AG1', NULL, NULL, 0),
(86, 20, 5, '', '2015-02-11 14:35:49', 'COM1', NULL, NULL, 0),
(87, 20, 17, '', '2015-02-11 14:35:55', 'COM1', NULL, NULL, 0),
(88, 4, 16, '', '2015-02-12 14:37:27', 'U1AG1', NULL, NULL, 0),
(89, 4, 16, '', '2015-02-12 14:37:34', 'U1AG1', NULL, NULL, 0),
(90, 8, 16, '', '2015-02-12 14:41:28', 'U1AG1', NULL, NULL, 0),
(91, 10, 16, '', '2015-02-12 14:42:42', 'U1AG1', NULL, NULL, 0),
(92, 6, 17, '', '2015-02-12 14:46:25', 'COM1', NULL, NULL, 0),
(93, 27, 1, '2', '2015-02-18 14:49:15', 'U1AG2', NULL, NULL, 0),
(94, 6, 13, '', '2015-02-18 14:52:08', 'COM1', NULL, NULL, 0),
(95, 6, 6, '', '2015-02-18 14:56:11', 'COM1', NULL, NULL, 0),
(96, 6, 13, '', '2015-02-18 14:56:18', 'COM1', NULL, NULL, 0),
(97, 6, 6, '', '2015-02-18 14:58:27', 'COM1', NULL, NULL, 0),
(98, 6, 13, '', '2015-02-18 14:58:31', 'COM1', NULL, NULL, 0),
(99, 10, 5, '', '2015-02-18 14:59:51', 'COM1', NULL, NULL, 0),
(100, 7, 2, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(101, 9, 2, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(102, 10, 13, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(103, 18, 5, '', '2015-02-18 15:01:25', 'COM1', NULL, NULL, 0),
(104, 21, 2, '', '2015-02-18 15:01:29', 'COM1', NULL, NULL, 0),
(105, 18, 13, '', '2015-02-18 15:01:29', 'COM1', NULL, NULL, 0),
(106, 21, 6, '', '2015-02-18 15:01:57', 'COM1', NULL, NULL, 0),
(107, 18, 6, '', '2015-02-18 15:01:57', 'COM1', NULL, NULL, 0),
(108, 21, 2, '', '2015-02-18 15:02:11', 'COM1', NULL, NULL, 0),
(109, 18, 13, '', '2015-02-18 15:02:11', 'COM1', NULL, NULL, 0),
(110, 21, 6, '', '2015-02-18 15:02:49', 'COM1', NULL, NULL, 0),
(111, 18, 6, '', '2015-02-18 15:02:49', 'COM1', NULL, NULL, 0),
(112, 21, 2, '', '2015-02-18 15:02:52', 'COM1', NULL, NULL, 0),
(113, 18, 13, '', '2015-02-18 15:02:52', 'COM1', NULL, NULL, 0),
(114, 21, 6, '', '2015-02-18 15:07:32', 'COM1', NULL, NULL, 0),
(115, 18, 6, '', '2015-02-18 15:07:32', 'COM1', NULL, NULL, 0),
(116, 21, 2, '', '2015-02-18 15:07:36', 'COM1', NULL, NULL, 0),
(117, 18, 13, '', '2015-02-18 15:07:36', 'COM1', NULL, NULL, 0),
(118, 15, 5, '', '2015-02-18 15:10:06', 'COM1', NULL, NULL, 0),
(119, 24, 2, '', '2015-02-18 15:10:09', 'COM1', NULL, NULL, 0),
(120, 15, 13, '', '2015-02-18 15:10:09', 'COM1', NULL, NULL, 0),
(121, 24, 6, '', '2015-02-18 15:10:59', 'COM1', NULL, NULL, 0),
(122, 15, 6, '', '2015-02-18 15:10:59', 'COM1', NULL, NULL, 0),
(123, 24, 2, '', '2015-02-18 15:11:02', 'COM1', NULL, NULL, 0),
(124, 15, 13, '', '2015-02-18 15:11:02', 'COM1', NULL, NULL, 0),
(125, 24, 6, '', '2015-02-18 15:11:45', 'COM1', NULL, NULL, 0),
(126, 15, 6, '', '2015-02-18 15:11:45', 'COM1', NULL, NULL, 0),
(127, 24, 2, '', '2015-02-18 15:11:55', 'COM1', NULL, NULL, 0),
(128, 15, 13, '', '2015-02-18 15:11:55', 'COM1', NULL, NULL, 0),
(129, 11, 13, '', '2015-02-19 15:00:26', 'COM1', NULL, NULL, 0),
(130, 19, 5, '', '2015-02-19 15:01:29', 'COM1', NULL, NULL, 0),
(131, 19, 13, '', '2015-02-19 15:01:33', 'COM1', NULL, NULL, 0),
(132, 14, 17, '', '2015-02-24 12:12:48', 'COM1', NULL, NULL, 0),
(133, 28, 1, '2', '2015-02-26 12:10:17', 'U1AG1', NULL, NULL, 0),
(134, 29, 1, '2', '2015-02-26 12:19:18', 'U1AG1', NULL, NULL, 0),
(135, 29, 16, '', '2015-02-26 12:22:48', 'U1AG1', NULL, NULL, 0),
(136, 29, 16, '', '2015-02-26 12:23:07', 'U1AG1', NULL, NULL, 0),
(137, 28, 16, '', '2015-02-26 12:46:27', 'U1AG1', NULL, NULL, 0),
(138, 28, 16, '', '2015-02-26 12:49:56', 'U1AG1', NULL, NULL, 0),
(139, 28, 16, '', '2015-02-26 12:50:49', 'U1AG1', NULL, NULL, 0),
(140, 28, 16, '', '2015-02-26 12:55:20', 'U1AG1', NULL, NULL, 0),
(141, 28, 16, '', '2015-02-26 13:00:27', 'U1AG1', NULL, NULL, 0),
(142, 28, 16, '', '2015-02-26 14:05:04', 'U1AG1', NULL, NULL, 0),
(143, 28, 16, '', '2015-02-26 14:06:43', 'U1AG1', NULL, NULL, 0),
(144, 28, 16, '', '2015-02-26 14:31:52', 'U1AG1', NULL, NULL, 0),
(145, 28, 16, '', '2015-02-26 14:32:08', 'U1AG1', NULL, NULL, 0),
(146, 28, 16, '', '2015-02-26 14:32:20', 'U1AG1', NULL, NULL, 0),
(147, 29, 16, '', '2015-02-26 14:36:53', 'U1AG1', NULL, NULL, 0),
(148, 29, 16, '', '2015-02-26 14:37:14', 'U1AG1', NULL, NULL, 0),
(149, 29, 16, '', '2015-02-26 14:43:30', 'U1AG1', NULL, NULL, 0),
(150, 29, 16, '', '2015-02-26 14:43:54', 'U1AG1', NULL, NULL, 0),
(151, 29, 16, '', '2015-02-26 14:44:07', 'U1AG1', NULL, NULL, 0),
(152, 29, 16, '', '2015-02-26 14:44:14', 'U1AG1', NULL, NULL, 0),
(153, 1, 16, '', '2015-02-26 14:48:46', 'U1AG1', NULL, NULL, 0),
(154, 22, 17, '', '2015-02-26 15:12:44', 'COM1', NULL, NULL, 0),
(155, 14, 5, '', '2015-02-27 09:02:51', 'COM1', NULL, NULL, 0),
(156, 14, 12, '', '2015-02-27 09:03:25', 'COM1', NULL, NULL, 0),
(157, 17, 5, '', '2015-02-27 10:03:32', 'COM1', NULL, NULL, 0),
(158, 17, 13, '', '2015-02-27 10:03:44', 'COM1', NULL, NULL, 0),
(159, 8, 16, '', '2015-02-27 14:26:53', 'U1AG1', NULL, NULL, 0),
(160, 30, 1, '2', '2015-02-27 15:00:10', 'U1AG1', NULL, NULL, 0),
(161, 30, 10, '28', '2015-02-27 15:00:10', 'U1AG1', NULL, NULL, 0),
(162, 16, 10, '22', '2015-02-27 15:01:53', 'COM1', NULL, NULL, 0),
(163, 22, 7, '', '2015-02-27 15:01:53', 'COM1', NULL, NULL, 0),
(164, 26, 17, '', '2015-02-27 15:02:17', 'COM1', NULL, NULL, 0),
(165, 26, 5, '', '2015-02-27 15:03:40', 'COM1', NULL, NULL, 0),
(166, 23, 5, '', '2015-02-27 15:08:21', 'COM1', NULL, NULL, 0),
(167, 31, 1, '2', '2015-03-03 11:27:35', 'U1AG1', NULL, NULL, 0),
(168, 31, 16, '', '2015-03-03 11:28:03', 'U1AG1', NULL, NULL, 0),
(169, 32, 1, '2', '2015-03-03 11:29:18', 'U1AG1', NULL, NULL, 0),
(170, 32, 16, '', '2015-03-03 11:29:23', 'U1AG1', NULL, NULL, 0),
(171, 29, 5, '', '2015-03-03 11:38:44', 'COM1', NULL, NULL, 0),
(172, 33, 1, '2', '2015-03-05 09:49:47', 'U1AG1', NULL, NULL, 0),
(173, 34, 1, '2', '2015-03-12 12:52:41', 'U1AG1', NULL, NULL, 0),
(174, 35, 1, '2', '2015-03-12 14:37:11', 'U1AG1', NULL, NULL, 0),
(175, 36, 1, '2', '2015-03-12 14:38:00', 'U1AG1', NULL, NULL, 0),
(176, 37, 1, '2', '2015-03-12 14:38:31', 'U1AG1', NULL, NULL, 0),
(177, 38, 1, '2', '2015-03-12 14:39:15', 'U1AG1', NULL, NULL, 0),
(178, 39, 1, '2', '2015-03-12 14:41:29', 'U1AG1', NULL, NULL, 0),
(179, 40, 1, '2', '2015-03-12 14:44:29', 'U1AG1', NULL, NULL, 0),
(180, 40, 18, '', '2015-03-12 14:44:29', 'U1AG1', NULL, NULL, 0),
(181, 41, 1, '2', '2015-03-12 14:46:49', 'U1AG1', NULL, NULL, 0),
(182, 41, 18, '', '2015-03-12 14:46:49', 'U1AG1', NULL, NULL, 0),
(183, 42, 1, '2', '2015-03-12 14:48:11', 'U1AG1', NULL, NULL, 0),
(184, 42, 18, '', '2015-03-12 14:48:11', 'U1AG1', NULL, NULL, 0),
(185, 9, 17, '', '2015-04-23 09:50:57', 'COM1', NULL, NULL, 0),
(186, 43, 1, '2', '2015-04-23 15:00:59', 'U1AG2', NULL, NULL, 0),
(187, 13, 16, '', '2015-04-23 15:08:40', 'U1AG2', NULL, NULL, 0),
(188, 44, 1, '2', '2015-04-23 15:23:46', 'U1AG2', NULL, NULL, 0),
(189, 45, 1, '2', '2015-04-23 15:25:40', 'U1AG2', NULL, NULL, 0),
(190, 46, 1, '2', '2015-04-23 15:26:07', 'U1AG2', NULL, NULL, 0),
(191, 47, 1, '2', '2015-04-23 15:26:54', 'U1AG2', NULL, NULL, 0),
(192, 20, 12, '', '2015-04-27 16:04:11', 'COM1', NULL, NULL, 0),
(193, 27, 5, '', '2015-04-27 16:23:19', 'COM1', NULL, NULL, 0),
(194, 27, 4, '1', '2015-04-27 16:23:23', 'COM1', NULL, NULL, 0),
(195, 16, 16, '', '2015-04-28 15:26:10', 'U1AG1', NULL, NULL, 0),
(196, 48, 1, '2', '2015-04-29 14:10:19', 'U1AG2', NULL, NULL, 0),
(197, 49, 1, '2', '2015-04-29 14:10:41', 'U1AG2', NULL, NULL, 0),
(198, 50, 1, '2', '2015-04-29 14:11:50', 'U1AG2', NULL, NULL, 0),
(199, 51, 1, '2', '2015-04-29 14:12:31', 'U1AG2', NULL, NULL, 0),
(200, 52, 1, '2', '2015-04-29 14:13:25', 'U1AG2', NULL, NULL, 0),
(201, 53, 1, '2', '2015-04-29 14:16:00', 'U1AG2', NULL, NULL, 0),
(202, 54, 1, '2', '2015-04-29 14:16:17', 'U1AG2', NULL, NULL, 0),
(203, 55, 1, '2', '2015-04-29 14:16:29', 'U1AG2', NULL, NULL, 0),
(204, 23, 10, '4', '2015-05-07 15:19:51', 'COM1', NULL, NULL, 0),
(205, 13, 2, '', '2015-05-07 15:20:11', 'COM1', NULL, NULL, 0),
(206, 4, 12, '', '2015-05-07 15:20:11', 'COM1', NULL, NULL, 0),
(207, 13, 6, '', '2015-05-07 15:21:44', 'COM1', NULL, NULL, 0),
(208, 4, 6, '', '2015-05-07 15:21:44', 'COM1', NULL, NULL, 0),
(209, 13, 2, '', '2015-05-07 15:22:42', 'COM1', NULL, NULL, 0),
(210, 4, 12, '', '2015-05-07 15:22:42', 'COM1', NULL, NULL, 0),
(211, 13, 6, '', '2015-05-07 15:24:35', 'COM1', NULL, NULL, 0),
(212, 4, 6, '', '2015-05-07 15:24:35', 'COM1', NULL, NULL, 0),
(213, 13, 2, '', '2015-05-07 15:25:26', 'COM1', NULL, NULL, 0),
(214, 4, 13, '', '2015-05-07 15:25:26', 'COM1', NULL, NULL, 0),
(215, 13, 6, '', '2015-05-07 15:26:09', 'COM1', NULL, NULL, 0),
(216, 4, 6, '', '2015-05-07 15:26:09', 'COM1', NULL, NULL, 0),
(217, 13, 2, '', '2015-05-07 15:27:12', 'COM1', NULL, NULL, 0),
(218, 4, 13, '', '2015-05-07 15:27:12', 'COM1', NULL, NULL, 0),
(219, 13, 2, '', '2015-05-07 15:29:32', 'COM1', NULL, NULL, 0),
(220, 4, 13, '', '2015-05-07 15:29:32', 'COM1', NULL, NULL, 0),
(221, 13, 2, '', '2015-05-07 15:31:58', 'COM1', NULL, NULL, 0),
(222, 4, 13, '', '2015-05-07 15:31:58', 'COM1', NULL, NULL, 0),
(223, 13, 2, '', '2015-05-07 15:58:20', 'COM1', NULL, NULL, 0),
(224, 4, 13, '', '2015-05-07 15:58:20', 'COM1', NULL, NULL, 0),
(225, 13, 6, '', '2015-05-07 15:58:26', 'COM1', NULL, NULL, 0),
(226, 4, 6, '', '2015-05-07 15:58:26', 'COM1', NULL, NULL, 0),
(227, 13, 2, '', '2015-05-07 16:00:39', 'COM1', NULL, NULL, 0),
(228, 4, 13, '', '2015-05-07 16:00:39', 'COM1', NULL, NULL, 0),
(229, 13, 6, '', '2015-05-07 16:02:35', 'COM1', NULL, NULL, 0),
(230, 23, 6, '', '2015-05-07 16:02:35', 'COM1', NULL, NULL, 0),
(231, 4, 6, '', '2015-05-07 16:02:35', 'COM1', NULL, NULL, 0),
(232, 13, 2, '', '2015-05-07 16:05:41', 'COM1', NULL, NULL, 0),
(233, 23, 2, '', '2015-05-07 16:05:41', 'COM1', NULL, NULL, 0),
(234, 4, 12, '', '2015-05-07 16:05:41', 'COM1', NULL, NULL, 0),
(235, 22, 5, '', '2015-05-14 14:33:24', 'COM1', NULL, NULL, 0),
(236, 22, 12, '', '2015-05-14 14:34:49', 'COM1', NULL, NULL, 0),
(237, 16, 19, '236', '2015-05-14 14:34:49', 'COM1', NULL, NULL, 0),
(238, 22, 10, '16', '2015-05-14 14:43:15', 'COM1', NULL, NULL, 0),
(239, 16, 7, '', '2015-05-14 14:43:15', 'COM1', NULL, NULL, 0),
(240, 16, 6, '', '2015-05-14 14:43:15', 'COM1', NULL, NULL, 0),
(241, 22, 19, '240', '2015-05-14 14:43:15', 'COM1', NULL, NULL, 0),
(242, 16, 4, '1', '2015-05-14 14:49:10', 'COM1', NULL, NULL, 0),
(243, 22, 19, '242', '2015-05-14 14:49:10', 'COM1', NULL, NULL, 0),
(244, 28, 5, '', '2015-05-14 15:04:52', 'COM1', NULL, NULL, 0),
(245, 29, 8, 'COM1', '2015-05-15 15:35:01', 'COM1', NULL, NULL, 0),
(246, 29, 10, '26', '2015-05-15 15:35:01', 'COM1', NULL, NULL, 0),
(247, 26, 10, '31', '2015-05-15 15:35:27', 'COM1', NULL, NULL, 0),
(248, 29, 11, '', '2015-05-15 15:36:18', 'COM1', NULL, NULL, 0),
(249, 31, 5, '', '2015-05-15 15:42:02', 'COM1', NULL, NULL, 0),
(250, 26, 19, '249', '2015-05-15 15:42:02', 'COM1', NULL, NULL, 0),
(251, 31, 10, '32', '2015-05-15 15:42:22', 'COM1', NULL, NULL, 0),
(252, 37, 5, '', '2015-05-15 16:09:05', 'COM1', NULL, NULL, 0),
(253, 37, 10, '38', '2015-05-15 16:09:10', 'COM1', NULL, NULL, 0),
(254, 38, 8, 'COM1', '2015-05-15 16:12:29', 'COM1', NULL, NULL, 0),
(255, 37, 7, '', '2015-05-15 16:12:29', 'COM1', NULL, NULL, 0),
(256, 38, 19, '255', '2015-05-15 16:12:29', 'COM1', NULL, NULL, 0),
(257, 39, 5, '', '2015-05-15 16:13:08', 'COM1', NULL, NULL, 0),
(258, 39, 10, '43', '2015-05-15 16:13:17', 'COM1', NULL, NULL, 0),
(259, 44, 5, '', '2015-05-15 16:15:36', 'COM1', NULL, NULL, 0),
(260, 44, 10, '45', '2015-05-15 16:15:40', 'COM1', NULL, NULL, 0),
(261, 49, 5, '', '2015-05-15 16:17:29', 'COM1', NULL, NULL, 0),
(262, 49, 3, '', '2015-05-15 16:17:34', 'COM1', NULL, NULL, 0),
(263, 49, 10, '50', '2015-05-15 16:17:34', 'COM1', NULL, NULL, 0),
(264, 50, 5, '', '2015-05-15 16:18:09', 'COM1', NULL, NULL, 0),
(265, 49, 19, '264', '2015-05-15 16:18:09', 'COM1', NULL, NULL, 0),
(266, 50, 3, '', '2015-05-15 16:18:24', 'COM1', NULL, NULL, 0),
(267, 49, 7, '', '2015-05-15 16:18:24', 'COM1', NULL, NULL, 0),
(268, 50, 19, '267', '2015-05-15 16:18:24', 'COM1', NULL, NULL, 0),
(269, 53, 5, '', '2015-05-15 16:30:13', 'COM1', NULL, NULL, 0),
(270, 52, 8, 'COM1', '2015-05-15 16:30:24', 'COM1', NULL, NULL, 0),
(271, 52, 10, '53', '2015-05-15 16:30:24', 'COM1', NULL, NULL, 0),
(272, 28, 13, '', '2015-06-04 10:49:08', 'COM1', NULL, NULL, 0),
(273, 30, 19, '272', '2015-06-04 10:49:08', 'COM1', NULL, NULL, 0),
(274, 35, 17, '', '2015-06-04 11:20:09', 'COM1', NULL, NULL, 0),
(275, 35, 5, '', '2015-06-04 11:20:16', 'COM1', NULL, NULL, 0),
(276, 35, 13, '', '2015-06-04 11:20:21', 'COM1', NULL, NULL, 0),
(277, 37, 5, '', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(278, 32, 19, '277', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(279, 38, 19, '277', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(280, 32, 10, '37', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(281, 26, 19, '280', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(282, 31, 19, '280', '2015-06-04 11:57:48', 'COM1', NULL, NULL, 0),
(283, 56, 1, '2', '2015-06-04 11:59:04', 'U1AG1', NULL, NULL, 0),
(284, 56, 18, '', '2015-06-04 11:59:04', 'U1AG1', NULL, NULL, 0),
(285, 46, 17, '', '2015-06-11 09:03:53', 'COM1', NULL, NULL, 0),
(286, 48, 17, '', '2015-06-11 09:04:31', 'COM1', NULL, NULL, 0),
(287, 43, 17, '', '2015-06-11 15:38:05', 'COM1', NULL, NULL, 0),
(288, 57, 1, '2', '2015-06-22 14:12:55', 'U1AG1', NULL, NULL, 0),
(289, 57, 20, '', '2015-06-22 14:12:55', 'U1AG1', NULL, NULL, 0),
(290, 57, 18, '', '2015-06-22 14:12:55', 'U1AG1', NULL, NULL, 0),
(291, 58, 1, '2', '2015-06-22 14:19:04', 'U1AG1', NULL, NULL, 0),
(292, 58, 20, '', '2015-06-22 14:19:04', 'U1AG1', NULL, NULL, 0),
(293, 58, 18, '', '2015-06-22 14:19:04', 'U1AG1', NULL, NULL, 0),
(294, 59, 1, '2', '2015-06-22 14:20:12', 'U1AG1', NULL, NULL, 0),
(295, 59, 20, '', '2015-06-22 14:20:12', 'U1AG1', NULL, NULL, 0),
(296, 59, 18, '', '2015-06-22 14:20:12', 'U1AG1', NULL, NULL, 0),
(297, 60, 1, '2', '2015-06-22 14:22:57', 'U1AG1', NULL, NULL, 0),
(298, 61, 1, '2', '2015-06-22 14:23:45', 'U1AG1', NULL, NULL, 0),
(299, 61, 20, '', '2015-06-22 14:23:45', 'U1AG1', NULL, NULL, 0),
(300, 61, 18, '', '2015-06-22 14:23:45', 'U1AG1', NULL, NULL, 0),
(301, 62, 1, '2', '2015-06-22 14:25:50', 'U1AG1', NULL, NULL, 0),
(302, 62, 20, '', '2015-06-22 14:25:50', 'U1AG1', NULL, NULL, 0),
(303, 63, 1, '2', '2015-06-22 14:27:13', 'U1AG1', NULL, NULL, 0),
(304, 63, 20, '', '2015-06-22 14:27:13', 'U1AG1', NULL, NULL, 0),
(305, 64, 1, '2', '2015-06-22 14:39:10', 'U1AG1', NULL, NULL, 0),
(306, 64, 20, '', '2015-06-22 14:39:10', 'U1AG1', NULL, NULL, 0),
(307, 64, 10, '62', '2015-06-22 14:39:10', 'U1AG1', NULL, NULL, 0),
(308, 62, 5, '', '2015-06-22 14:40:49', 'COM1', NULL, NULL, 0),
(309, 64, 19, '308', '2015-06-22 14:40:49', 'COM1', NULL, NULL, 0),
(310, 62, 20, '', '2015-06-22 14:41:47', 'COM1', NULL, NULL, 0),
(311, 64, 19, '310', '2015-06-22 14:41:47', 'COM1', NULL, NULL, 0),
(312, 65, 1, '6', '2015-06-22 14:50:19', 'U1AG1', NULL, NULL, 0),
(313, 65, 20, '', '2015-06-22 14:50:19', 'U1AG1', NULL, NULL, 0),
(314, 45, 5, '', '2015-06-24 15:28:42', 'COM1', NULL, NULL, 0),
(315, 44, 19, '314', '2015-06-24 15:28:42', 'COM1', NULL, NULL, 0),
(316, 36, 5, '', '2015-06-24 15:29:19', 'COM1', NULL, NULL, 0),
(317, 36, 17, '', '2015-06-24 15:29:24', 'COM1', NULL, NULL, 0),
(318, 34, 17, '', '2015-06-24 15:29:33', 'COM1', NULL, NULL, 0),
(319, 63, 5, '', '2015-06-25 10:51:59', 'COM1', NULL, NULL, 0),
(320, 63, 2, '', '2015-06-25 11:18:35', 'COM1', NULL, NULL, 0),
(321, 60, 5, '', '2015-06-25 11:19:31', 'COM1', NULL, NULL, 0),
(322, 60, 2, '', '2015-06-25 11:26:22', 'COM1', NULL, NULL, 0),
(323, 60, 6, '', '2015-06-25 11:49:14', 'COM1', NULL, NULL, 0),
(324, 60, 2, '', '2015-06-25 12:14:11', 'COM1', NULL, NULL, 0),
(325, 60, 6, '', '2015-06-25 12:25:45', 'COM1', NULL, NULL, 0),
(326, 60, 2, '', '2015-06-25 12:25:47', 'COM1', NULL, NULL, 0),
(327, 60, 6, '', '2015-06-25 12:26:05', 'COM1', NULL, NULL, 0),
(328, 60, 2, '', '2015-06-25 12:39:06', 'COM1', NULL, NULL, 0),
(329, 62, 2, '', '2015-06-25 14:07:08', 'COM1', NULL, NULL, 0),
(330, 64, 19, '329', '2015-06-25 14:07:08', 'COM1', NULL, NULL, 0),
(331, 62, 6, '', '2015-06-25 14:07:21', 'COM1', NULL, NULL, 0),
(332, 64, 19, '331', '2015-06-25 14:07:21', 'COM1', NULL, NULL, 0),
(333, 62, 2, '', '2015-06-25 14:08:08', 'COM1', NULL, NULL, 0),
(334, 64, 19, '333', '2015-06-25 14:08:08', 'COM1', NULL, NULL, 0),
(335, 62, 6, '', '2015-06-25 14:08:17', 'COM1', NULL, NULL, 0),
(336, 64, 19, '335', '2015-06-25 14:08:17', 'COM1', NULL, NULL, 0),
(337, 62, 2, '', '2015-06-25 14:09:55', 'COM1', NULL, NULL, 0),
(338, 64, 19, '337', '2015-06-25 14:09:55', 'COM1', NULL, NULL, 0),
(339, 55, 5, '', '2015-06-25 14:10:01', 'COM1', NULL, NULL, 0),
(340, 55, 2, '', '2015-06-25 14:10:03', 'COM1', NULL, NULL, 0),
(341, 48, 5, '', '2015-06-25 14:27:53', 'COM1', NULL, NULL, 0),
(342, 48, 2, '', '2015-06-25 14:27:55', 'COM1', NULL, NULL, 0),
(343, 60, 6, '', '2015-06-25 14:28:06', 'COM1', NULL, NULL, 0),
(344, 60, 20, '', '2015-06-25 14:28:15', 'COM1', NULL, NULL, 0),
(345, 60, 2, '', '2015-06-25 14:28:18', 'COM1', NULL, NULL, 0),
(346, 60, 6, '', '2015-06-25 14:29:16', 'COM1', NULL, NULL, 0),
(347, 63, 6, '', '2015-06-25 14:29:54', 'COM1', NULL, NULL, 0),
(348, 63, 2, '', '2015-06-25 14:33:41', 'COM1', NULL, NULL, 0),
(349, 66, 1, '2', '2015-06-26 11:41:30', 'U1AG1', NULL, NULL, 0),
(350, 66, 20, '', '2015-06-26 11:41:30', 'U1AG1', NULL, NULL, 0),
(351, 66, 16, '', '2015-06-26 11:44:01', 'U1AG1', NULL, NULL, 0),
(352, 67, 1, '2', '2015-06-26 11:49:42', 'U1AG1', NULL, NULL, 0),
(353, 67, 20, '', '2015-06-26 11:49:42', 'U1AG1', NULL, NULL, 0),
(354, 67, 18, '', '2015-06-26 11:49:42', 'U1AG1', NULL, NULL, 0),
(355, 29, 3, '', '2015-06-30 12:49:51', 'COM1', NULL, NULL, 0),
(356, 29, 5, '', '2015-06-30 12:49:59', 'COM1', NULL, NULL, 0),
(357, 37, 3, '', '2015-06-30 13:09:48', 'COM1', NULL, NULL, 0),
(358, 26, 19, '357', '2015-06-30 13:09:48', 'COM1', NULL, NULL, 0),
(359, 31, 19, '357', '2015-06-30 13:09:48', 'COM1', NULL, NULL, 0),
(360, 32, 19, '357', '2015-06-30 13:09:48', 'COM1', NULL, NULL, 0),
(361, 38, 19, '357', '2015-06-30 13:09:48', 'COM1', NULL, NULL, 0),
(362, 37, 5, '', '2015-06-30 13:09:52', 'COM1', NULL, NULL, 0),
(363, 26, 19, '362', '2015-06-30 13:09:52', 'COM1', NULL, NULL, 0),
(364, 31, 19, '362', '2015-06-30 13:09:52', 'COM1', NULL, NULL, 0),
(365, 32, 19, '362', '2015-06-30 13:09:52', 'COM1', NULL, NULL, 0),
(366, 38, 19, '362', '2015-06-30 13:09:52', 'COM1', NULL, NULL, 0),
(367, 37, 17, '', '2015-06-30 15:10:53', 'COM1', NULL, NULL, 0),
(368, 37, 12, '', '2015-06-30 15:12:05', 'COM1', NULL, NULL, 0),
(369, 26, 19, '368', '2015-06-30 15:12:05', 'COM1', NULL, NULL, 0),
(370, 31, 19, '368', '2015-06-30 15:12:05', 'COM1', NULL, NULL, 0),
(371, 32, 19, '368', '2015-06-30 15:12:05', 'COM1', NULL, NULL, 0),
(372, 38, 19, '368', '2015-06-30 15:12:05', 'COM1', NULL, NULL, 0),
(373, 29, 20, '', '2015-06-30 15:13:22', 'COM1', NULL, NULL, 0),
(374, 29, 2, '', '2015-07-01 10:24:49', 'COM1', NULL, NULL, 0),
(375, 29, 6, '', '2015-07-01 10:24:57', 'COM1', NULL, NULL, 0),
(376, 36, 3, '', '2015-08-11 15:21:47', 'COM1', NULL, NULL, 0),
(377, 33, 17, '', '2015-08-11 15:31:07', 'COM1', NULL, NULL, 0),
(378, 33, 17, '', '2015-08-11 15:32:01', 'COM1', NULL, NULL, 0),
(379, 36, 5, '', '2015-08-11 15:32:39', 'COM1', NULL, NULL, 0),
(380, 33, 17, '', '2015-08-11 15:54:22', 'COM1', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m_detalles`
--

DROP TABLE IF EXISTS `tickets_m_detalles`;
CREATE TABLE IF NOT EXISTS `tickets_m_detalles` (
  `idtktm` int(11) NOT NULL,
  `detalle` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets_m_detalles`
--

INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(1, '<?xml version="1.0"?><itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>241234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>asdjassdas</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>19-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>07-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>2</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(2, '<?xml version="1.0"?><itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>235432</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>asdad</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(3, '<?xml version="1.0"?>\n<itform>\n <element><type>input</type><label>legajo</label><id>Hola</id><value>123213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U456789</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(4, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>novedades?</value></element> </itform>\n'),
(6, '<?xml version="1.0"?>\n<itform> 	 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	<value>ver con celeridad</value></element> </itform>\n'),
(8, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>12.29</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>123</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>11-2014</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>ok</value></element>\n</itform>\n'),
(10, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>3</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>formato ingresado invalido</value></element>\n</itform>\n'),
(11, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>no ok</value></element> </itform>\n'),
(12, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>100.3</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>22</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>12-2014</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>corregido</value></element>\n</itform>\n'),
(13, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>no ok</value></element> </itform>\n'),
(14, '<?xml version="1.0"?><itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>2</value>      <text>No corresponde</text>    </option>    <option>      <value>3</value>      <text>Error de formato</text>    </option>      <value>2</value></element>    <element>    <label> 			Comentario 		</label>    <type> 			inputlong 		</type>    <id> 			comment 		</id>      <value>caso finalizado</value></element></itform>'),
(15, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>.</value></element> </itform>\n'),
(16, '<?xml version="1.0"?><itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>2</value>      <text>No corresponde</text>    </option>    <option>      <value>3</value>      <text>Error de formato</text>    </option>      <value>3</value></element>    <element>    <label> 			Comentario 		</label>    <type> 			inputlong 		</type>    <id> 			comment 		</id>      <value>. reingresar</value></element></itform>'),
(17, '<?xml version="1.0"?>\n<itform>\n <element><type>input</type><label>legajo</label><id>Hola</id><value>234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>asd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>11-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>06-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(19, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asdsa</value></element> </itform>\n'),
(20, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>111</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>adsas</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>03-12-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(21, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>1234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(22, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>121</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(23, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U122345</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>safd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>04-12-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(24, '<?xml version="1.0"?>\n<itform>\n  \n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  <value>ver caso</value></element>\n</itform>\n'),
(26, '<?xml version="1.0"?>\n<itform>\n  \n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  <value/></element>\n</itform>\n'),
(28, '<?xml version="1.0"?>\n<itform>\n  \n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  <value/></element>\n</itform>\n'),
(29, '<?xml version="1.0"?>\n<itform>\n  \n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  <value/></element>\n</itform>\n'),
(31, '<?xml version="1.0"?>\n<itform>\n  \n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  <value/></element>\n</itform>\n'),
(32, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>adas</value></element> </itform>\n'),
(33, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>adsfds</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>08-01-2015 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>20-01-2015</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(34, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>prueba</value></element> </itform>\n'),
(35, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>345</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>34</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>01-2015</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>prueba</value></element>\n</itform>\n'),
(36, '<?xml version="1.0"?>\n<itform> 	 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	<value>prueba</value></element> </itform>\n'),
(38, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>prueba</value></element> </itform>\n'),
(40, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>adf</value></element> </itform>\n'),
(42, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>dsf</value></element> </itform>\n'),
(43, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>re apertura</value></element> </itform>\n'),
(44, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>aadf</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>17-02-2015 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>04-02-2015</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(45, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>345</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(46, '<?xml version="1.0"?><itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>23432</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>14-02-2015 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value>02-2015</value></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(47, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>ok</value></element> </itform>\n'),
(50, '<?xml version="1.0"?>\n<itform> 	 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	<value>Derivado para unir a master</value></element> </itform>\n'),
(57, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>1232</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>usuario ag2</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(58, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asdasd</value></element> </itform>\n'),
(67, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>1000</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>10</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>02-2015</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>1010</value></element>\n</itform>\n'),
(68, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>34563</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U145789</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>asdasdasd\n\nasd\nasdasdasd\n\nasd\nasdasdasd\n\nasd\nasdasdasd\n\nasd\nv\nvvv\nasdasdasd\n\nasd</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value>09-02-2015 15:34</value></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(69, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>54645</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>asd</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value>19-02-2015 00:00</value></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value>02-2015</value></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(70, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>3453</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(71, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>54645</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(72, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>564</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(73, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>324</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(74, '<?xml version="1.0"?><itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>324</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(93, '<?xml version="1.0"?>\n<itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>234324</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(75, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>324</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(77, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>324</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(79, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>45654645</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd fdgsfgdfg      asdfafdaf 4556asd</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value>26-02-2015 00:00</value></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value>02-2015</value></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(80, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>12312</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U124534</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>ok</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value>05-02-2015 00:00</value></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>2</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(82, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>43</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>ad</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(83, '<?xml version="1.0"?>\n<itform> 	 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	<value>Derivado para unir a master</value></element> </itform>\n'),
(85, '<?xml version="1.0"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>legajo</label>\n      <id>Hola</id>\n  <view>1</view>\n      \n   <value>23423</value></element>\n   <element>\n      <type>text</type>\n      <id>juan</id>\n      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>21</id>\n      <comment>3 usuarios de ejemplo</comment>\n      <label>usuarios</label>\n      \n   <value>U123123</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>comentario</label>\n      <id>2</id>\n   <value>asdasd</value></element>\n   <element>\n      <type>datetime</type>\n      <id>date</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>32</id>\n      <label>Fecha</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>321</id>\n      <label>seleccion</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>322</id>\n      <label>wAnexo</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(87, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asd</value></element> </itform>'),
(88, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>comentario 1</value></element> </itform>\n'),
(89, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Comentario 2</value></element> </itform>\n'),
(90, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>comentario en otro ticket</value></element> </itform>\n'),
(91, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>comentario de otro ticket</value></element> </itform>\n'),
(92, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>SD0001234</value></element> </itform>\n'),
(94, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>NC</value></element>\n</itform>\n'),
(95, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>rehab</value></element> </itform>\n'),
(96, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>nc</value></element>\n</itform>\n'),
(97, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>ghj</value></element> </itform>\n');
INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(98, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>\n'),
(100, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(10) cerrado</value></element>\n</itform>\n'),
(101, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(10) cerrado</value></element>\n</itform>\n'),
(102, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asdfasd</value></element>\n</itform>\n'),
(104, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(18) cerrado</value></element>\n</itform>\n'),
(105, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>\n'),
(106, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(18) reabierto</value></element> </itform>\n'),
(107, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asd</value></element> </itform>\n'),
(108, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(18) cerrado</value></element>\n</itform>\n'),
(109, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>ads</value></element>\n</itform>\n'),
(110, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(18) reabierto</value></element> </itform>\n'),
(111, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>hgj</value></element> </itform>\n'),
(112, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(18) cerrado</value></element>\n</itform>\n'),
(113, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>ads</value></element>\n</itform>\n'),
(114, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(18) reabierto</value></element> </itform>\n'),
(115, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asd</value></element> </itform>\n'),
(116, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(18) cerrado</value></element>\n</itform>\n'),
(117, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>\n'),
(119, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(15) cerrado</value></element>\n</itform>\n'),
(120, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asdad</value></element>\n</itform>\n'),
(121, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(15) reabierto</value></element> </itform>\n'),
(122, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asd</value></element> </itform>\n'),
(123, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(15) cerrado</value></element>\n</itform>\n'),
(124, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>\n'),
(125, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(15) reabierto</value></element> </itform>\n'),
(126, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asd</value></element> </itform>\n'),
(127, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(15) cerrado</value></element>\n</itform>\n'),
(128, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>sdf</value></element>\n</itform>\n'),
(129, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>listo</value></element>\n</itform>\n'),
(131, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>ert</value></element>\n</itform>\n'),
(132, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>hola!!</value></element> </itform>\n'),
(133, '<?xml version="1.0"?><itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>12342</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd &amp;dfs</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>10-02-2015 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(134, '<?xml version="1.0"?><itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>23432</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd &amp;</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>17-02-2015 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(135, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>\n'),
(136, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>\n'),
(137, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value></value></element> </itform>'),
(138, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>\n'),
(139, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>\n'),
(140, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>'),
(141, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>\n'),
(142, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value/></element> </itform>'),
(143, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>&amp;&amp;asdas &amp;amp;</value></element> </itform>'),
(144, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>hola &amp;&amp;&amp; &amp;amp;</value></element> </itform>\n'),
(145, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>&amp;&amp; &gt;&gt;&gt;</value></element> </itform>\n'),
(146, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>sad &amp;&amp;</value></element> </itform>\n'),
(147, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>&amp;lt;script&amp;gt;alert("hola");&amp;lt;/script&amp;gt;</value></element> </itform>'),
(148, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>&amp;lt;script</value></element> </itform>'),
(149, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>hola</value></element> </itform>\n'),
(150, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>alert("hola");</value></element> </itform>\n'),
(151, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>&amp;lt;script&amp;gt;alert("hola");&amp;lt;/script&amp;gt;</value></element> </itform>\n'),
(152, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>https://t0002591816/itracker_front/?L=mytkts&amp;id=29</value></element> </itform>\n'),
(153, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asdasd</value></element> </itform>\n'),
(154, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>565 &#xA8;&#xA8; {{ ]] []{} %&amp;&amp;hola&amp;amp;</value></element> </itform>\n'),
(156, '<?xml version="1.0"?><itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>1</value>      <text>Procedente</text>    </option>      <value>1</value></element>  <element>    <label>Monto a ajustar</label>    <type>input</type>    <id>monto</id>    <comment>(Punto separador decimal)</comment>      <value>1234</value></element>  <element>    <label>Cantidad de operaciones</label>    <type>input</type>    <id>qoper</id>      <value>123</value></element>  <element>   <label>Se ajustara en el mes</label>    <type>month</type>    <id>majust</id>      <value>02-2015</value></element>   <element>    <label> 			Comentario 		</label>    <type> 			inputlong 		</type>    <id> 			comment 		</id>      <value>&#xD1;&#xD1;&#xE1;&#xE1;&amp;&amp;\\\\\\n</value></element></itform>'),
(158, '<?xml version="1.0"?><itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>2</value>      <text>No corresponde</text>    </option>    <option>      <value>3</value>      <text>Error de formato</text>    </option>      <value>2</value></element>    <element>    <label> 			Comentario 		</label>    <type> 			inputlong 		</type>    <id> 			comment 		</id>      <value>&#xF1;&#xD1;a&#xE1; &amp; &amp; &amp;&amp;</value></element></itform>'),
(159, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>ve &amp;</value></element> </itform>\n'),
(160, '<?xml version="1.0"?>\n<itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>346</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>03-02-2015 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(164, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>98giy</value></element> </itform>\n'),
(167, '<?xml version="1.0"?>\n<itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>4353</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>sadfdsf</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(168, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>hgjghjghj</value></element> </itform>\n'),
(169, '<?xml version="1.0"?>\n<itform>      <element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>45435</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(170, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>fthyfghfgh</value></element> </itform>\n'),
(172, '<?xml version="1.0"?>\n<itform>  <element>  <id>text1</id>  <label>comentario</label>  <type>text</type>  <text>No se requiere informaci&#xF3;n adicional para el caso.Puede generar el reclamo.</text>  <value/></element>  </itform>\n'),
(173, '<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>http://juan.com/hola.xls</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>123</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(180, '<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n	  \n   <value>TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx</value></element>\n</itform>'),
(182, '<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n	  \n   <value>http://www.freeformatter.com/xml-formatter.html#ad-output</value></element>\n</itform>'),
(184, '<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n	  \n   <value>http://www.freeformatter.com/xml-formatter.html#ad-output</value></element>\n</itform>'),
(185, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id>  <value>comentario 2</value></element> </itform>\n'),
(186, '<?xml version="1.0"?><itform>      <element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>234324</value></element><element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>123123</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>asdasd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value>04-2015</value></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>'),
(187, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id>  <value>asdasd</value></element> </itform>\n'),
(188, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>12312</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>123123</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>19-05-2201 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value>04-2015</value></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(189, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>1123</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>12312</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(190, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>23432</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>34543</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value>05-04-2015 00:00</value></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(191, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>         <value>123213</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>         <value>234423</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>         <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value>04-2015</value></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(192, '<?xml version="1.0"?>\n<itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>1</value>      <text>Procedente</text>    </option>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>1</value></element>  <element>    <label>Monto a ajustar</label>    <type>input</type>    <id>monto</id>    <comment>(Punto separador decimal)</comment>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>234234</value></element>  <element>    <label>Cantidad de operaciones</label>    <type>input</type>    <id>qoper</id>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>345435</value></element>  <element>   <label>Se ajustara en el mes</label>    <type>month</type>    <id>majust</id>    <validations>      <required>true</required>    </validations>  <value>04-2015</value></element>   <element>    <label> Comentario </label>    <type> inputlong </type>    <id> comment </id>    <validations>      <required>true</required>    </validations>  <value>sdfsdf</value></element></itform>\n'),
(195, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>dfgdfg</value></element> </itform>\n'),
(196, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>123123</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>123</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>sdfsdf</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value>04-2015</value></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(197, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>sdfs</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>45435</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(198, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>234</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>2344</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>adsa</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(199, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>sdfgd</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>23423</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value/></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(200, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value/></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>43534</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>safdssd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(201, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>12321</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>12321</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>sdas</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(202, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>243</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>23</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123123</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>sdd</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(203, '<?xml version="1.0"?>\n<itform>      \n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>  <view>1</view>      <validations>                    </validations>   <value>123</value></element>\n\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   <value>32432</value></element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   <value/></element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   <value>U123456</value></element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   <value>df</value></element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   <value/></element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   <value/></element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   <value>1</value></element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   <value/></element></itform>\n'),
(205, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(206, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>123</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>123</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>05-2015</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>123</value></element>\n</itform>'),
(207, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>');
INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(208, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>sdf</value></element> </itform>'),
(209, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(210, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>234</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>234</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>05-2015</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>sdf</value></element>\n</itform>'),
(211, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>'),
(212, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>yh</value></element> </itform>'),
(213, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(214, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>sdfsd</value></element>\n</itform>'),
(215, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>'),
(216, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>sdf</value></element> </itform>'),
(217, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(218, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>'),
(219, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(220, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asdasd</value></element>\n</itform>'),
(221, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(222, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>sdfsd</value></element>\n</itform>'),
(223, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(224, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>ad</value></element>\n</itform>'),
(225, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>'),
(226, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>jk</value></element> </itform>'),
(227, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(228, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    \n  <value>2</value></element>\n  \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>asd</value></element>\n</itform>'),
(229, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>'),
(230, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Master(4) reabierto</value></element> </itform>'),
(231, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>ghj</value></element> </itform>'),
(232, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(233, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    \n  <value>Master(4) cerrado</value></element>\n</itform>'),
(234, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    \n  <value>1</value></element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    \n  <value>234</value></element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    \n  <value>234</value></element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    \n  <value>05-2015</value></element>\n \n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    \n  <value>dfsf</value></element>\n</itform>'),
(236, '<?xml version="1.0"?>\n<itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>1</value>      <text>Procedente</text>    </option>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>1</value></element>  <element>    <label>Monto a ajustar</label>    <type>input</type>    <id>monto</id>    <comment>(Punto separador decimal)</comment>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>100</value></element>  <element>    <label>Cantidad de operaciones</label>    <type>input</type>    <id>qoper</id>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>1001</value></element>  <element>   <label>Se ajustara en el mes</label>    <type>month</type>    <id>majust</id>    <validations>      <required>true</required>    </validations>  <value>05-2015</value></element>   <element>    <label> Comentario </label>    <type> inputlong </type>    <id> comment </id>    <validations>      <required>true</required>    </validations>  <value>ok 1</value></element></itform>\n'),
(240, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>no se solucion&#xF3;</value></element> </itform>\n'),
(242, '<?xml version="1.0"?>\n<itform>  <element> <type> inputlong </type> <label>Comentario</label><id> comment </id> <comment> Commentario </comment> <value>derivado</value></element> </itform>\n'),
(245, '<?xml version="1.0"?>\n<itform>    <element>    <type> inputlong </type>    <label>Comentario</label>    <id> comment </id>    <comment> Commentario </comment>  <value/></element></itform>\n'),
(254, '<?xml version="1.0"?>\n<itform>    <element>    <type> inputlong </type>    <label>Comentario</label>    <id> comment </id>    <comment> Commentario </comment>  <value/></element></itform>\n'),
(270, '<?xml version="1.0"?>\n<itform>    <element>    <type> inputlong </type>    <label>Comentario</label>    <id> comment </id>    <comment> Commentario </comment>  <value/></element></itform>\n'),
(272, '<?xml version="1.0"?>\n<itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>2</value>      <text>No corresponde</text>    </option>    <option>      <value>3</value>      <text>Error de formato</text>    </option>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>2</value></element>    <element>    <label> Comentario </label>    <type> inputlong </type>    <id> comment </id>    <validations>      <required>true</required>    </validations>  <value>testing</value></element></itform>\n'),
(274, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>prueba</value></element> </itform>\n'),
(276, '<?xml version="1.0"?>\n<itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>2</value>      <text>No corresponde</text>    </option>    <option>      <value>3</value>      <text>Error de formato</text>    </option>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>2</value></element>    <element>    <label> Comentario </label>    <type> inputlong </type>    <id> comment </id>    <validations>      <required>true</required>    </validations>  <value>asdas</value></element></itform>\n'),
(284, '<?xml version="1.0"?>\n<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n  <validations>\n<required>true</required>\n  </validations>\n   <value>http://www.freeformatter.com/xml-formatter.html#ad-output</value></element>\n</itform>\n'),
(285, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>sdfsdf</value></element> </itform>\n'),
(286, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>dfg</value></element> </itform>\n'),
(287, '<?xml version="1.0"?><itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>asd {color=FF0000} rojo! &amp;%&amp; {{/color}}</value></element> </itform>'),
(289, '<?xml version="1.0" encoding="UTF-8"?><itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   </element></itform>'),
(290, '<?xml version="1.0"?><itform>   <element>      <id>text1</id>      <type>text</type>      <text>Descargue el archivo del siguiente link</text>   <value/></element>   <element>      <type>link</type>      <id>link_archivo</id>      <label>LINK</label>      <text>DESCARGAR</text>  <validations><required>true</required>  </validations>   <value>SIEBEL_PRUEBA.xlsx</value></element></itform>'),
(292, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   </element></itform>\n'),
(293, '<?xml version="1.0"?>\n<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n  <validations>\n<required>true</required>\n  </validations>\n   <value>SIEBEL_PRUEBA.xlsx</value></element>\n</itform>\n'),
(295, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   </element></itform>\n'),
(296, '<?xml version="1.0"?>\n<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n  <validations>\n<required>true</required>\n  </validations>\n   <value>SIEBEL_PRUEBA.xlsx</value></element>\n</itform>\n'),
(299, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PFILE</value></element></itform>\n'),
(300, '<?xml version="1.0"?>\n<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n  <validations>\n<required>true</required>\n  </validations>\n   <value>SIEBEL_PRUEBA.xlsx</value></element>\n</itform>\n'),
(301, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>VALOR</label>\n      <id>valor</id>\n      <view>1</view>\n  <comment>view 1 - numerico requerido</comment>\n      <validations>\n         <numeric>true</numeric>\n         <required>true</required>\n      </validations>\n   <value>111</value></element>\n   <element>\n      <type>text</type>\n      <id>TEXTO</id>\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>regex</id>\n      <comment>/U[0-9]{6}/</comment>\n      <label>REGEX</label>\n      <validations>\n         <regex>/U[0-9]{6}/</regex>\n      </validations>\n   <value>U123123</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>COMENTARIO</label>\n      <id>comentario</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>datetime</id>\n      <label>DATETIME</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>month</id>\n      <label>MONTH</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>seleccion</id>\n      <label>SELECCION</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>link</id>\n      <label>LINK</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(302, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO2</value></element></itform>\n'),
(303, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>VALOR</label>\n      <id>valor</id>\n      <view>1</view>\n  <comment>view 1 - numerico requerido</comment>\n      <validations>\n         <numeric>true</numeric>\n         <required>true</required>\n      </validations>\n   <value>65456</value></element>\n   <element>\n      <type>text</type>\n      <id>TEXTO</id>\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>regex</id>\n      <comment>/U[0-9]{6}/</comment>\n      <label>REGEX</label>\n      <validations>\n         <regex>/U[0-9]{6}/</regex>\n      </validations>\n   <value>U123123</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>COMENTARIO</label>\n      <id>comentario</id>\n   <value>PRO2</value></element>\n   <element>\n      <type>datetime</type>\n      <id>datetime</id>\n      <label>DATETIME</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>month</id>\n      <label>MONTH</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>seleccion</id>\n      <label>SELECCION</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>link</id>\n      <label>LINK</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(304, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO1</value></element></itform>\n'),
(305, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>VALOR</label>\n      <id>valor</id>\n      <view>1</view>\n  <comment>view 1 - numerico requerido</comment>\n      <validations>\n         <numeric>true</numeric>\n         <required>true</required>\n      </validations>\n   <value>454456</value></element>\n   <element>\n      <type>text</type>\n      <id>TEXTO</id>\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>regex</id>\n      <comment>/U[0-9]{6}/</comment>\n      <label>REGEX</label>\n      <validations>\n         <regex>/U[0-9]{6}/</regex>\n      </validations>\n   <value>U789456</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>COMENTARIO</label>\n      <id>comentario</id>\n   <value>unido</value></element>\n   <element>\n      <type>datetime</type>\n      <id>datetime</id>\n      <label>DATETIME</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>month</id>\n      <label>MONTH</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>seleccion</id>\n      <label>SELECCION</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>link</id>\n      <label>LINK</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(306, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO2</value></element></itform>\n'),
(310, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO5</value></element></itform>\n'),
(312, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>VALOR</label>\n      <id>valor</id>\n      <view>1</view>\n  <comment>view 1 - numerico requerido</comment>\n      <validations>\n         <numeric>true</numeric>\n         <required>true</required>\n      </validations>\n   <value>787</value></element>\n   <element>\n      <type>text</type>\n      <id>TEXTO</id>\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>regex</id>\n      <comment>/U[0-9]{6}/</comment>\n      <label>REGEX</label>\n      <validations>\n         <regex>/U[0-9]{6}/</regex>\n      </validations>\n   <value>U147258</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>COMENTARIO</label>\n      <id>comentario</id>\n   <value/></element>\n   <element>\n      <type>datetime</type>\n      <id>datetime</id>\n      <label>DATETIME</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>month</id>\n      <label>MONTH</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>seleccion</id>\n      <label>SELECCION</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>link</id>\n      <label>LINK</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(313, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO2_M100</value></element></itform>\n'),
(317, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>fgdfg</value></element> </itform>\n'),
(318, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>345</value></element> </itform>\n'),
(320, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n</defaults>\n  <value>comentario default para 1</value></element>\n  <element>\n    <show>true</show>\n    <label>Comentario2</label>\n    <type>inputlong</type>\n    <id>comment2</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  <value>dfdsf</value></element>\n</itform>\n'),
(322, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n  <element>\n    <show>true</show>\n    <label>Comentario2</label>\n    <type>inputlong</type>\n    <id>comment2</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  <value>dfsdf</value></element>\n</itform>\n'),
(323, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>th</value></element> </itform>\n'),
(324, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n</itform>\n'),
(325, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>fghgf</value></element> </itform>\n'),
(327, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>dfhgfg</value></element> </itform>\n'),
(328, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n</itform>\n'),
(329, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n</itform>\n'),
(330, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(331, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>fdsgfd</value></element> </itform>\n'),
(332, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(333, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO1</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>comentario default 5</value></element>\n</itform>\n'),
(334, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(335, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>sdf</value></element> </itform>\n'),
(336, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(337, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>comentario default 5</value></element>\n</itform>\n'),
(338, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(340, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <show>false</show>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n</itform>\n'),
(342, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>sin default</value></element>\n</itform>\n'),
(343, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>asd</value></element> </itform>\n'),
(344, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO8</value></element></itform>\n'),
(345, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>comentario default para 1</value></element>\n</itform>\n'),
(346, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>fdg</value></element> </itform>\n'),
(347, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>asd</value></element> </itform>\n'),
(348, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>comentario default para 1</value></element>\n<element>\n    <label>Comentario2</label>\n    <type>inputlong</type>\n    <id>comment2</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  <value>asdasda</value></element>\n</itform>\n'),
(349, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>\n   \n   <element>\n      <type>input</type>\n      <label>VALOR</label>\n      <id>valor</id>\n      <view>1</view>\n  <comment>view 1 - numerico requerido</comment>\n      <validations>\n         <numeric>true</numeric>\n         <required>true</required>\n      </validations>\n   <value>456</value></element>\n   <element>\n      <type>text</type>\n      <id>TEXTO</id>\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\n   <value/></element>\n   <element>\n      <type>input</type>\n      <id>regex</id>\n      <comment>/U[0-9]{6}/</comment>\n      <label>REGEX</label>\n      <validations>\n         <regex>/U[0-9]{6}/</regex>\n      </validations>\n   <value>U123123</value></element>\n   <element>\n      <type>inputlong</type>\n      <label>COMENTARIO</label>\n      <id>comentario</id>\n   <value>asd</value></element>\n   <element>\n      <type>datetime</type>\n      <id>datetime</id>\n      <label>DATETIME</label>\n   <value/></element>\n   <element>\n      <type>month</type>\n      <id>month</id>\n      <label>MONTH</label>\n   <value/></element>\n   <element>\n      <type>select</type>\n      <id>seleccion</id>\n      <label>SELECCION</label>\n      <option>\n         <value>1</value>\n         <text>opcion1</text>\n      </option>\n      <option>\n         <value>2</value>\n         <text>opcion2</text>\n      </option>\n   <value>1</value></element>\n   <element>\n      <type>link</type>\n      <id>link</id>\n      <label>LINK</label>\n      <path>siebel/aa/dd.ppt</path>\n      <text>Link</text>\n      <comment>Descargue el archivo para luego anexarlo</comment>\n   <value/></element>\n</itform>\n'),
(350, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO1_2</value></element></itform>\n'),
(351, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>lkj</value></element> </itform>\n'),
(353, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PFILE</value></element></itform>\n'),
(354, '<?xml version="1.0"?>\n<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n  <validations>\n<required>true</required>\n  </validations>\n   <value>SIEBEL_PRUEBA.xlsx</value></element>\n</itform>\n'),
(358, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(359, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(360, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(361, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(363, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(364, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(365, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(366, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(367, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>dfgfdg</value></element> </itform>\n'),
(368, '<?xml version="1.0"?>\n<itform>  <element>    <label>Tipo cierre</label>    <id>tipocierre</id>    <type>select</type>    <option>      <value>1</value>      <text>Procedente</text>    </option>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>1</value></element>  <element>    <label>Monto a ajustar</label>    <type>input</type>    <id>monto</id>    <comment>(Punto separador decimal)</comment>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>435</value></element>  <element>    <label>Cantidad de operaciones</label>    <type>input</type>    <id>qoper</id>    <validations>      <required>true</required>      <numeric>true</numeric>    </validations>  <value>345</value></element>  <element>   <label>Se ajustara en el mes</label>    <type>month</type>    <id>majust</id>    <validations>      <required>true</required>    </validations>  <value>06-2015</value></element>   <element>    <label> Comentario </label>    <type> inputlong </type>    <id> comment </id>    <validations>      <required>true</required>    </validations>  <value>sdf</value></element></itform>\n'),
(369, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(370, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(371, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(372, '<?xml version="1.0"?>\n<itform>\n  \n</itform>\n'),
(373, '<?xml version="1.0" encoding="UTF-8"?>\n<itform>   <element>      <label>Proceso</label>      <type>input</type>      <id>proceso</id>      <validations>         <required>true</required>      </validations>   <value>PRO8</value></element></itform>\n'),
(374, '<?xml version="1.0"?>\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  <value>comentario default para 1</value></element>\n<element>\n    <label>Comentario2</label>\n    <type>inputlong</type>\n    <id>comment2</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  <value>fghgf</value></element>\n</itform>\n'),
(375, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>fgh</value></element> </itform>\n'),
(377, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value/></element> </itform>\n'),
(378, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>asdas</value></element> </itform>\n'),
(380, '<?xml version="1.0"?>\n<itform> <element> <label> Comentario </label> <type> inputlong </type> <id> comment </id> <validations> <required>true</required> </validations> <value>dfds</value></element> </itform>\n');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_m`
--
ALTER TABLE `tickets_m`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_m_detalles`
--
ALTER TABLE `tickets_m_detalles`
  ADD UNIQUE KEY `idtktm` (`idtktm`),
  ADD KEY `idtktm_2` (`idtktm`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT de la tabla `tickets_m`
--
ALTER TABLE `tickets_m`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=381;--
-- Base de datos: `itracker_agentes_uta`
--
DROP DATABASE `itracker_agentes_uta`;
CREATE DATABASE IF NOT EXISTS `itracker_agentes_uta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `itracker_agentes_uta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

DROP TABLE IF EXISTS `acciones`;
CREATE TABLE IF NOT EXISTS `acciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `estadotkt` varchar(50) DEFAULT NULL,
  `ejecuta` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  `formulario` tinyint(1) NOT NULL,
  `form` text,
  `habilita_procesos` varchar(255) NOT NULL,
  `habilita_estados` varchar(100) NOT NULL,
  `habilita_t_propio` int(11) NOT NULL,
  `habilita_tomado` int(11) NOT NULL,
  `habilita_equipos` varchar(100) NOT NULL DEFAULT '*',
  `habilita_perfiles` varchar(100) NOT NULL,
  `habilita_a_propio` int(11) NOT NULL,
  `habilita_abierto` int(11) NOT NULL,
  `habilita_equipo` int(11) NOT NULL,
  `habilita_master` int(11) NOT NULL,
  `notificacion_param` varchar(255) NOT NULL,
  `notificacion_texto` text NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `nombre`, `alias`, `estadotkt`, `ejecuta`, `tipo`, `formulario`, `form`, `habilita_procesos`, `habilita_estados`, `habilita_t_propio`, `habilita_tomado`, `habilita_equipos`, `habilita_perfiles`, `habilita_a_propio`, `habilita_abierto`, `habilita_equipo`, `habilita_master`, `notificacion_param`, `notificacion_texto`, `descripcion`, `estado`) VALUES
(1, 'ABRIR', 'ABRIR', 'Pendiente', 'open', 1, 1, NULL, '.*', '.*', 0, 2, '*', '5,', 2, 2, 0, 0, '(is_master)(to:{team})', 'Se ha generado un nuevo itracker derivado al area.<br />\nID: {id}<br />\nPuedes verlo en ITRACKER', 'Genera un nuevo ticket', 0),
(2, 'CERRAR', 'CERRAR', 'Cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n    <defaults>\n<default>\n<process>PRO4</process>\n<value>comentario default</value>\n</default>\n<default>\n<process>PRO5</process>\n<value>comentario default 5</value>\n</default>\n<default>\n<process>PRO[0-9]</process>\n<value>comentario default para 1</value>\n</default>\n<default>\n<value>sin default</value>\n</default>\n</defaults>\n  </element>\n<element>\n    <label>Comentario2</label>\n    <type>inputlong</type>\n    <id>comment2</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', 'PRO[1-9]', 'tomado,en.*', 1, 1, '*', '3,4,', 0, 1, 1, 1, '', '', 'Indicar que el ticket esta solucionado', 0),
(3, 'LIBERAR', 'LIBERAR', NULL, 'free', 2, 0, NULL, '.*', '.*', 1, 1, '*', '3,4,', 0, 1, 1, 1, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(4, 'DERIVAR', 'DERIVAR', 'derivado', 'derive', 2, 1, '\n<itform> 	<element> 		<label> 			Equipo a derivar 		</label> 		<notsave>true</notsave> 		<type> 			idsel 		</type> 		<id> 			idequipo 		</id> 		<idselparams> 			<class>tkt</class> 			<method>idsel_teamderive</method> 		</idselparams> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element> 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	</element> </itform>', '.*', '.*', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{team}::cc:{prev_team})', 'Se ha derivado un itracker al area.<br />\nID: {id}<br />\nApertura: {FA}<br />\nPuedes verlo en ITRACKER', 'Asignar el ticket a otro equipo', 0),
(5, 'TOMAR', 'TOMAR', 'en analisis', 'take', 2, 0, NULL, '.*', '.*', 0, 2, '*', '3,4,', 0, 1, 1, 1, '', '', 'Reservar el ticket para su tratamiento', 0),
(6, 'REABRIR', 'RE ABRIR', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', '.*', '.*', 1, 0, '*', '3,4,', 0, 2, 1, 0, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(7, 'SET_MASTER', 'Set master', NULL, 'setmaster', 1, 0, NULL, '.*', '.*', 1, 0, '*', '3,4,', 0, 1, 1, 2, '', '', NULL, 0),
(8, 'ASIGNAR', 'Asignar', NULL, 'asign', 2, 1, '<itform>\n  <element>\n    <label>Asignar a:</label>\n    <notsave>true</notsave>\n    <type>idsel</type>\n    <id>idusr</id>\n    <idselparams>\n      <class>tkt</class>\n      <method>idsel_userasign</method>\n    </idselparams>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  </element>\n</itform>', '.*', '.*', 0, 2, '*', '4,', 0, 1, 1, 1, '(always)(to:{u_tom})', 'Se te ha asignado el tkt {id} del sistema {system->name}.<br />\nPuedes verlo en ITRACKER.\n', 'Asignar el ticket a un miembro del equipo', 0),
(9, 'PRIORIZAR', 'Priorizar', NULL, 'priorice', 3, 1, '<itform> 	<element> 		<label> 			Prioridad: 		</label> 		<notsave>true</notsave> 		<type> 			select 		</type> 		<id> 			prioridad 		</id> 		<option><value>3</value><text>ALTA</text></option> 		<option><value>6</value><text>MEDIA</text></option> 		<option><value>9</value><text>BAJA</text></option> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', '.*', '.*', 0, 0, '*', '4,', 0, 1, 1, 1, '', '', 'Establece una nueva prioridad al ticket', 0),
(10, 'UNIR', 'Unir', NULL, 'join', 1, 1, '<itform> 	<element> 		<label> 			Unir a id: 		</label> 		<notsave>true</notsave> 		<type> 			input 		</type> 		<id> 			idmaster 		</id> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', '.*', '.*', 0, 0, '*', '3,4,', 0, 1, 1, 1, '', '', 'Relaciona el ticket a otro', 0),
(11, 'SEPARAR', 'Separar', NULL, 'unjoin', 1, 0, NULL, '.*', '.*', 1, 1, '*', '3,4,', 0, 1, 1, 2, '', '', 'Elimina la relacion al ticket padre', 0),
(12, 'CERRAR_COMISIONES_PROCEDENTE', 'Cerrar Procedente', 'cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n <element>\n    <label>Adjunto</label>\n    <type>fileupl</type>\n    <id>adjunto</id>\n    <notsave>true</notsave>\n  </element>\n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', '.*', '.*', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{clients}::cc:{clients->teams})', 'Se ha cerrado un itracker que generaste.<br/>\nID: {id}<br/>\nPuedes verlo en ITRACKER', 'cerrar comisiones procedente', 0),
(13, 'CERRAR_COMISIONES_NOPROCE', 'Cerrar No Procedente', 'cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Adjunto</label>\n    <type>fileupl</type>\n    <id>adjunto</id>\n    <notsave>true</notsave>\n  </element>\n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', '.*', '.*', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{clients},{event_user=>tomar}::cc:{clients->teams})', 'Se ha cerrado un itracker que generaste.<br/>\nID: {id}<br/>\nPuedes verlo en ITRACKER', 'cerrar comisiones no procedente', 0),
(14, 'REABRIR_COOR', 'Reabrir', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', '.*', '.*', 2, 0, '*', '4,', 0, 2, 1, 1, '', '', 'reabrir coordinador', 0),
(15, 'LIBERAR_COOR', 'Liberar', '', 'free', 2, 0, NULL, '.*', '.*', 2, 1, '*', '4,', 0, 1, 1, 1, '', '', 'librerar coordinador', 0),
(16, 'COMENTARIO_GENERADOR', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 'PRO1_[1-9],PRO2', '.*', 0, 0, '*', '5,', 1, 0, 0, 0, '', '', 'comentario cliente', 0),
(17, 'COMENTARIO_EQUIPO', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', '.*', '.*', 0, 0, '*', '3,4,', 2, 0, 1, 0, '', '', 'comentario equipo', 0),
(18, 'CERRAR_RUTA', 'CERRAR', 'cerrado', 'close', 1, 1, '<itform>\r\n   <element>\r\n      <id>text1</id>\r\n      <type>text</type>\r\n      <text>Descargue el archivo del siguiente link</text>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link_archivo</id>\r\n      <label>LINK</label>\r\n      <text>DESCARGAR</text>\r\n	  <validations>\r\n		<required>true</required>\r\n	  </validations>\r\n   </element>\r\n</itform>', '.*', '.*', 2, 0, '-1', '-1', 1, 1, 0, 1, '', '', 'Cierra ticket a link', 0),
(19, 'LINK', 'link', NULL, 'link', 0, 1, '<itform>\r\n  <element>\r\n    <type>input</type>\r\n    <id>idth</id>\r\n    <validations>\r\n      <required>true</required>\r\n	<numeric>true</numeric>\r\n    </validations>\r\n    <notsave>true</notsave>\r\n  </element>\r\n</itform>', '.*', '.*', 0, 0, '*', '0', 0, 0, 0, 0, '', '', 'Link a otro evento', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `linkwi` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `nombre`, `linkwi`, `estado`) VALUES
(1, 'Agentes', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `t_conformidad` varchar(5) NOT NULL,
  `idlistin` int(11) NOT NULL,
  `iddireccion` int(11) NOT NULL,
  `idsequipos_deriva` varchar(50) DEFAULT NULL,
  `idsequipos_visible` varchar(50) NOT NULL,
  `mytkts_vista` text,
  `staffhome_vista` text,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `t_conformidad`, `idlistin`, `iddireccion`, `idsequipos_deriva`, `idsequipos_visible`, `mytkts_vista`, `staffhome_vista`, `estado`) VALUES
(1, 'GO_Comisiones', '48:00', 2, 1, '', '', '', '', 0),
(2, 'Comisiones', '48:00', 1, 1, '1', '1,3,4', '', 'id,js:show_childs:id:childsc=>ADJ,FA=>Fecha cracion,usr_o.nombre=>Agente,nextans:S1=>S1,nextans:O33:P2=>S2,nextans:O24=>S3', 0),
(3, 'Agente1', '03:00', 3, 1, '2', '2', 'id,equipo.nombre=>area,status', '', 0),
(4, 'Agente2', '03:00', 4, 1, '2', '2', '', '', 0),
(5, 'Adms', '02:00', 5, 1, '', '', '', '', 0),
(6, 'COM2', '82:00', 1, 1, '2', '1,2,3,4', '', 'id,js:show_childs:id:childsc=>ADJ,FA=>Fecha cracion,usr_o.nombre=>Agente,nextans:S1=>S1,nextans:O33:P2=>S2,nextans:O24=>S3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listines`
--

DROP TABLE IF EXISTS `listines`;
CREATE TABLE IF NOT EXISTS `listines` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `too` text,
  `cc` text,
  `estado` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `listines`
--

INSERT INTO `listines` (`id`, `nombre`, `too`, `cc`, `estado`) VALUES
(1, 'Comisiones', 'comisiones@equipo.teco.com,otrocomisiones@ta.teco', 'encopiacomisiones@ta.telecom.com', '0'),
(2, 'Go_comisiones', 'gocomisiones@ta.teco', '', '0'),
(3, 'Agente1', 'toA1@a1.com', 'encopiaA1@a1.com', '0'),
(4, 'Agente2', '', '', '0'),
(5, 'Adms', '', '', '0'),
(6, 'Test', 'aa@bb.com', '', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `texto_critico` varchar(50) DEFAULT NULL,
  `habilita_perfiles` varchar(30) NOT NULL,
  `destino` text NOT NULL,
  `pretext` longtext,
  `idpregunta_destino` int(11) DEFAULT NULL,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `habilita_perfiles`, `destino`, `pretext`, `idpregunta_destino`, `UA`, `FA`, `UB`, `FB`) VALUES
(1, 1, 'Cierre a archivo para team AG1', NULL, '676,678,5,9', '<rules>	<rule>		<condition>			<team>3</team>		</condition>		<destiny>			<team>2</team>			<file>SIEBEL_PRUEBA.xlsx</file><process>PFILE</process>	</destiny>	</rule></rules>', NULL, NULL, 'U548391', '2014-01-24', NULL, NULL),
(2, 1, 'Cierre a archivo para team AG2', NULL, '*', '<rules>	<rule>		<condition>			<team>4</team>		</condition>		<destiny>			<team>2</team>			<file>SIEBEL_PRUEBA.xlsx</file>		</destiny>	</rule></rules>', NULL, NULL, 'U548391', '2014-01-24', NULL, NULL),
(3, 1, 'error al realizar gestiones', NULL, '*', '', NULL, 2, 'U548391', '2014-01-24', NULL, NULL),
(4, 1, 'lentitud en la web', 'lentitud/error', '*', '', NULL, 3, 'U548391', '2014-01-24', NULL, NULL),
(5, 1, 'pagina web no responde', 'lentitud/error', '*', '', NULL, 3, 'U548391', '2014-01-24', NULL, NULL),
(6, 2, 'si', 'masivo', '*', '', NULL, 4, 'U548391', '2014-01-24', NULL, NULL),
(7, 2, 'no', NULL, '*', '', NULL, 5, 'U548391', '2014-01-24', NULL, NULL),
(8, 3, 'todos JOIN PRO1', 'masivo', '*', '<rules>        <join>true</join>	<rule>		<destiny>			<team>2</team>                        <process>PRO1</process>		</destiny>	</rule></rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', 0, 'U548391', '2014-01-24', NULL, NULL),
(9, 3, 'no', NULL, '*', '', NULL, 6, 'U548391', '2014-01-24', NULL, NULL),
(10, 4, 'TODOS JOIN PRO2', 'masivo', '*', '<rules>        <join>true</join>	<rule>		<destiny>			<team>2</team>                        <process>PRO2</process>		</destiny>	</rule></rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(11, 4, 'AG1-C1 AG2-C2', NULL, '*', '<rules>	<rule>		<condition>			<team>3</team>		</condition>		<destiny>			<team>2</team>            <process>PRO1_2</process>		</destiny>	</rule>	<rule>		<condition>			<team>4</team>		</condition>		<destiny>			<team>6</team>            <process>PRO1_3</process>		</destiny>	</rule></rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(12, 5, 'AG2-C1 AG1-C2', NULL, '*', '<rules>	<rule>		<condition>			<team>4</team>		</condition>		<destiny>			<team>2</team>            <process>PRO2_3</process>		</destiny>	</rule>	<rule>		<condition>			<team>3</team>		</condition>		<destiny>			<team>6</team>            <process>PRO2_2</process>		</destiny>	</rule></rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(13, 5, 'AG1 CAMPO VALOR m100', 'algo', '*', '<rules>	<rule>		<condition>			<team>3</team>			<itfvalue>				<id>valor</id>				<morethan>100</morethan>			</itfvalue>		</condition>		<destiny>			<team>6</team>            <process>PRO2_M100</process>		</destiny>	</rule></rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(14, 6, 'si', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(15, 6, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(16, 7, 'alta de usuario', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(17, 7, 'usuario bloqueado', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(18, 7, 'cambio de contraseña', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(19, 7, 'lentitud en la web', 'lentitud/error', '*', '', NULL, 8, 'U548391', '2014-01-24', NULL, NULL),
(20, 7, 'pagina web no responde', 'lentitud/error', '*', '', NULL, 8, 'U548391', '2014-01-24', NULL, NULL),
(21, 8, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(22, 8, 'no', NULL, '*', '', NULL, 9, 'U548391', '2014-01-24', NULL, NULL),
(23, 9, 'si', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(24, 9, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(25, 10, 'sin dominio telecom', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(26, 10, 'sin conectividad', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(27, 10, 'periferico faltante/falla (mouse, teclado,monitor)', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(28, 10, 'otro inconveniente', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(29, 11, 'problemas de usuario en el puesto', NULL, '*', '', NULL, 12, 'U548391', '2014-01-24', NULL, NULL),
(30, 11, 'problemas discador', NULL, '*', '', NULL, 13, 'U548391', '2014-01-24', NULL, NULL),
(31, 11, 'CMS supervisor', NULL, '*', '', NULL, 14, 'U548391', '2014-01-24', NULL, NULL),
(32, 11, 'nice', NULL, '*', '', NULL, 17, 'U548391', '2014-01-24', NULL, NULL),
(33, 11, 'telefonia / llamadas', NULL, '*', '', NULL, 20, 'U548391', '2014-01-24', NULL, NULL),
(34, 12, 'ips', NULL, '*', '', NULL, 16, 'U548391', '2014-01-24', NULL, NULL),
(35, 12, 'aic', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', 16, 'U548391', '2014-01-24', NULL, NULL),
(36, 12, 'apc', NULL, '*', '', NULL, 16, 'U548391', '2014-01-24', NULL, NULL),
(37, 16, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(38, 16, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(39, 13, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(40, 13, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(41, 14, 'error / incidente', NULL, '*', '', NULL, 15, 'U548391', '2014-01-24', NULL, NULL);
INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `habilita_perfiles`, `destino`, `pretext`, `idpregunta_destino`, `UA`, `FA`, `UB`, `FB`) VALUES
(42, 14, 'blanqueo de clave', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(43, 15, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(44, 15, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(45, 17, 'error / incidente', NULL, '*', '', NULL, 19, 'U548391', '2014-01-24', NULL, NULL),
(46, 17, 'blanqueo de clave', NULL, '*', '', NULL, 18, 'U548391', '2014-01-24', NULL, NULL),
(47, 19, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(48, 19, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(49, 18, 'no la recuerdo', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(50, 18, 'usuario bloqueado', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(51, 20, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(52, 20, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(53, 21, 'usuarios', NULL, '*', '', NULL, 22, 'U548391', '2014-01-24', NULL, NULL),
(54, 21, 'aplicacion', NULL, '*', '', NULL, 23, 'U548391', '2014-01-24', NULL, NULL),
(55, 22, 'alta', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(56, 22, 'baja', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(57, 22, 'modificacion', NULL, '*', '', NULL, 24, 'U548391', '2014-01-24', NULL, NULL),
(58, 24, 'contraseña', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(59, 24, 'perfil', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(60, 24, 'jerarquia', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(61, 24, 'login', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(62, 22, 'usuario bloqueado', NULL, '*', '<rules>    <rule>        <destiny>            <team>1</team>            <file>SIEBEL_PRUEBA.xlsx</file>            <autoclose>true</autoclose>            <canjoin>false</canjoin>        </destiny>    </rule></rules>', NULL, NULL, 'U548391', '2014-01-24', NULL, NULL),
(63, 23, 'boton envio a siebel desactivado', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(64, 23, 'lentitud', 'error/lentitud', '*', '', NULL, 25, 'U548391', '2014-01-24', NULL, NULL),
(65, 23, 'error', 'error/lentitud', '*', '', NULL, 25, 'U548391', '2014-01-24', NULL, NULL),
(66, 25, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(67, 25, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(68, 26, 'si', 'masivo', '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL),
(69, 26, 'no', NULL, '*', '<rules>\r\n    <rule>\r\n        <destiny>\r\n            <team>1</team>\r\n            <nojoin>false</nojoin>\r\n        </destiny>\r\n    </rule>\r\n</rules>', '<?xml version="1.0" encoding="UTF-8"?>\r\n<itform>\r\n   <element>\r\n      <type>fileupl</type>\r\n      <id>archivos</id>\r\n      <label>archivos</label>\r\n      <notsave>true</notsave>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <label>VALOR</label>\r\n      <id>valor</id>\r\n      <view>1</view>\r\n	  <comment>view 1 - numerico requerido</comment>\r\n      <validations>\r\n         <numeric>true</numeric>\r\n         <required>true</required>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>text</type>\r\n      <id>TEXTO</id>\r\n      <text>[TEXTO]holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>\r\n   </element>\r\n   <element>\r\n      <type>input</type>\r\n      <id>regex</id>\r\n      <comment>/U[0-9]{6}/</comment>\r\n      <label>REGEX</label>\r\n      <validations>\r\n         <regex>/U[0-9]{6}/</regex>\r\n      </validations>\r\n   </element>\r\n   <element>\r\n      <type>inputlong</type>\r\n      <label>COMENTARIO</label>\r\n      <id>comentario</id>\r\n   </element>\r\n   <element>\r\n      <type>datetime</type>\r\n      <id>datetime</id>\r\n      <label>DATETIME</label>\r\n   </element>\r\n   <element>\r\n      <type>month</type>\r\n      <id>month</id>\r\n      <label>MONTH</label>\r\n   </element>\r\n   <element>\r\n      <type>select</type>\r\n      <id>seleccion</id>\r\n      <label>SELECCION</label>\r\n      <option>\r\n         <value>1</value>\r\n         <text>opcion1</text>\r\n      </option>\r\n      <option>\r\n         <value>2</value>\r\n         <text>opcion2</text>\r\n      </option>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link</id>\r\n      <label>LINK</label>\r\n      <path>siebel/aa/dd.ppt</path>\r\n      <text>Link</text>\r\n      <comment>Descargue el archivo para luego anexarlo</comment>\r\n   </element>\r\n</itform>', NULL, 'U548391', '2014-01-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `accesos` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre`, `accesos`) VALUES
(1, 'admin_full', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,'),
(2, 'admin_teams', '0,19,20,21,22,23,24,30,31,47,49,50,51,52,53,56'),
(3, 'comisiones_analista', '0,24,30,31,32,33,34,35,36,37,38,47,53,54,55,56,58'),
(4, 'comisiones_responsable', '0,24,30,31,32,33,34,35,36,37,38,41,47,53,54,55,56,58'),
(5, 'agente', '0,24,30,31,32,34,36,37,39,40,43,46,47,53,56,57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefiles_vistas`
--

DROP TABLE IF EXISTS `prefiles_vistas`;
CREATE TABLE IF NOT EXISTS `prefiles_vistas` (
  `id` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL,
  `perfil` int(50) NOT NULL,
  `relacion` varchar(255) NOT NULL,
  `vista` int(11) NOT NULL,
  `tipos_eventos` varchar(50) NOT NULL,
  `archivo_descarga` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prefiles_vistas`
--

INSERT INTO `prefiles_vistas` (`id`, `prioridad`, `perfil`, `relacion`, `vista`, `tipos_eventos`, `archivo_descarga`) VALUES
(1, 0, 1, '*', 1, '*', 1),
(2, 0, 3, '3,7', 1, '*', 1),
(3, 0, 2, '6', 1, '*', 1),
(4, 0, 4, '3,7', 1, '*', 1),
(5, 0, 5, '4,5', 1, '1', 1),
(6, 3, 5, '6', 2, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `detalle` longtext,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `texto`, `detalle`, `UA`, `FA`, `UB`, `FB`) VALUES
(1, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(2, 'afecta a todos los usuarios?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(3, 'afecta a todos los usuarios?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(4, 'en todas las lineas?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(5, 'en todas las lineas?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(6, 'en diferentes computadoras?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(7, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(8, 'afecta a todos los usuarios?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(9, 'en diferentes computadoras?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(10, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(11, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(12, 'en que sistema?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(13, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(14, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(15, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(16, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(17, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(18, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(19, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(20, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(21, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(22, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(23, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(24, 'seleccione una opcion', NULL, 'U548391', '2014-01-24', NULL, NULL),
(25, 'es masivo?', NULL, 'U548391', '2014-01-24', NULL, NULL),
(26, 'Es masivo?', 'prueba de detalle <b>negrita</b>', 'U548391', '2014-01-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisdir`
--

DROP TABLE IF EXISTS `sisdir`;
CREATE TABLE IF NOT EXISTS `sisdir` (
  `id` int(11) NOT NULL,
  `idsistema` int(11) NOT NULL,
  `iddireccion` int(11) NOT NULL,
  `p_pregunta` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisdir`
--

INSERT INTO `sisdir` (`id`, `idsistema`, `iddireccion`, `p_pregunta`, `estado`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemas`
--

DROP TABLE IF EXISTS `sistemas`;
CREATE TABLE IF NOT EXISTS `sistemas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistemas`
--

INSERT INTO `sistemas` (`id`, `nombre`, `estado`) VALUES
(1, 'Siebely', 0),
(2, 'Octomind', 0),
(3, 'Microinformatica', 0),
(4, 'Avaya', 0),
(5, 'AC', 0),
(6, 'CMS', 0),
(7, 'test', 1),
(8, 'test2', 1),
(9, 'test', 1),
(10, 'hjkhg', 1),
(11, 'drf', 1),
(12, 'fghf', 1),
(13, 'dfgfdg', 1),
(14, 'asdfasf', 1),
(15, 'fghf', 1),
(16, 'lkk', 1),
(17, 'jhkhk', 1),
(18, 'dfgdfg', 1),
(19, 'fgh', 1),
(20, 'fcgbh', 1),
(21, 'ghjg', 1),
(22, 'hyrf', 1),
(23, 'sdfsdf', 1),
(24, 'asdasd', 1),
(25, 'Jghjg3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usr` varchar(15) NOT NULL,
  `idsequipos` varchar(50) DEFAULT NULL,
  `idsequiposadm` varchar(100) DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usr`, `idsequipos`, `idsequiposadm`, `perfil`, `estado`) VALUES
('fulladm', '2,5', '1,2,4,5,3,6', 1, 0),
('FEDE', ',5', '3,4', 2, 0),
('U1AG1', ',3', NULL, 5, 0),
('U2AG1', ',3', NULL, 5, 0),
('U1AG2', ',4', NULL, 5, 0),
('COM1', ',2', NULL, 3, 0),
('COMRES', ',2', NULL, 4, 0),
('COMGO', ',1', NULL, 3, 0),
('SP1', ',3', NULL, 5, 1),
('COM2', ',6', NULL, 3, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `listines`
--
ALTER TABLE `listines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `prefiles_vistas`
--
ALTER TABLE `prefiles_vistas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil` (`perfil`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sisdir`
--
ALTER TABLE `sisdir`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistemas`
--
ALTER TABLE `sistemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usr`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `listines`
--
ALTER TABLE `listines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `prefiles_vistas`
--
ALTER TABLE `prefiles_vistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `sisdir`
--
ALTER TABLE `sisdir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sistemas`
--
ALTER TABLE `sistemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;--
-- Base de datos: `itracker_root`
--
DROP DATABASE `itracker_root`;
CREATE DATABASE IF NOT EXISTS `itracker_root` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `itracker_root`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fronts`
--

DROP TABLE IF EXISTS `fronts`;
CREATE TABLE IF NOT EXISTS `fronts` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `confianza` tinyint(4) DEFAULT NULL,
  `instancias` varchar(100) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fronts`
--

INSERT INTO `fronts` (`id`, `nombre`, `ip`, `confianza`, `instancias`, `estado`) VALUES
(1, 'DMZ', '127.0.0.1', 0, 'AGENTES', 0),
(2, 'SHAREPOINT', '::1', 1, 'AGENTES', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancias`
--

DROP TABLE IF EXISTS `instancias`;
CREATE TABLE IF NOT EXISTS `instancias` (
  `nombre` varchar(45) NOT NULL,
  `dbhost` varchar(45) NOT NULL,
  `dbuser` varchar(45) NOT NULL,
  `dbpass` varchar(45) NOT NULL,
  `archivos_externos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `instancias`
--

INSERT INTO `instancias` (`nombre`, `dbhost`, `dbuser`, `dbpass`, `archivos_externos`) VALUES
('AGENTES', 'localhost', '', '', 'd:/itracker_add');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
CREATE TABLE IF NOT EXISTS `sesiones` (
  `usr` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `front` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`usr`, `ip`, `front`, `hash`, `fecha`) VALUES
('COM1', '127.0.0.1', 1, '815cab6bf8ce5546fda4f88bc740dc7a8437d5af', '2015-08-14 09:37:52'),
('COMGO', '190.175.110.1', 1, 'bdbb102b38ec6e6ceeb0a81c4bb062ab20912fb2', '2014-11-22 20:11:39'),
('COMRES', '10.112.0.4', 1, '3e434e01511e4c4fe34f1389468794017a77808a', '2014-12-31 10:27:28'),
('FEDE', '10.66.93.46', 1, '5b5ff479ca227827238a3734d4a21770faf2e512', '2014-12-12 12:50:53'),
('FULLADM', '10.66.93.46', 1, 'f0a91bbbc51661f3dbfc3e8c2b6bf71ba1779271', '2015-06-22 11:30:07'),
('U1AG1', '10.66.93.46', 1, 'bedd5845c330c0cbdc9ded45d41b2bcff47b7c1b', '2015-06-30 12:26:33'),
('U1AG2', '10.66.93.46', 1, 'f4f42277139f18857eb4a5ef6cb353364cd8d4ac', '2015-06-17 14:27:46'),
('U2AG1', '190.175.110.1', 1, '5775975f47bf6c399180e57f7cac0f282f1add12', '2014-11-22 19:23:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ucontac`
--

DROP TABLE IF EXISTS `ucontac`;
CREATE TABLE IF NOT EXISTS `ucontac` (
  `usr` varchar(15) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ucontac`
--

INSERT INTO `ucontac` (`usr`, `mail`, `tel`, `nombre`, `puesto`, `ubicacion`) VALUES
('FEDE', 'fede@valentin.com', '', 'Federico valentin', '', ''),
('U1AG1', 'U1AG1@aa.com', '11U1AG1', 'U1AG1Nombre', 'en U1AG1', 'ubicado U1AG1'),
('U2AG1', 'U2AG1@age1.com', '', 'U2AG1', '', ''),
('U1AG2', 'U1AG2@gmail.com', '', 'U1AG2 nombre', '', ''),
('COM1', 'analistcom@com1.com', '', 'Analist Comisiones', '', ''),
('COMRES', 'COMRES@aa.com', '', 'COMRES', '', ''),
('COMGO', 'COMGO@ta.telecom.com.ar', '', 'COMGO', '', ''),
('SP1', 'sp1@aa.copm', '', 'sp11', '', ''),
('FULLADM', 'aa@bb.com', '', 'fulladm', '', ''),
('COM2', 'aa@bb.ccom', '', 'com2', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usr` varchar(50) NOT NULL,
  `dominio` varchar(15) NOT NULL,
  `pass` varchar(15) DEFAULT NULL,
  `fronts` varchar(20) NOT NULL,
  `instancias` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usr`, `dominio`, `pass`, `fronts`, `instancias`) VALUES
('fulladm', 'ITRACKER', 'juan', '1', 'AGENTES'),
('FEDE', 'ITRACKER', 'pass', '1', 'AGENTES'),
('U1AG1', 'ITRACKER', 'pass', '1', 'AGENTES'),
('U2AG1', 'ITRACKER', 'pass', '1', 'AGENTES'),
('U1AG2', 'ITRACKER', 'pass', '1', 'AGENTES'),
('COM1', 'ITRACKER', 'pass', '1', 'AGENTES'),
('COMRES', 'ITRACKER', 'pass', '1', 'AGENTES'),
('COMGO', 'ITRACKER', 'pass', '1', 'AGENTES'),
('SP1', 'SHAREPOINT', NULL, '1,2', 'AGENTES'),
('COM2', 'ITRACKER', 'pass', '1', 'AGENTES');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fronts`
--
ALTER TABLE `fronts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `instancias`
--
ALTER TABLE `instancias`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`usr`),
  ADD UNIQUE KEY `hash_UNIQUE` (`hash`);

--
-- Indices de la tabla `ucontac`
--
ALTER TABLE `ucontac`
  ADD PRIMARY KEY (`usr`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
