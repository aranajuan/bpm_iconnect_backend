-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2015 a las 20:47:14
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`id` int(11) NOT NULL,
  `usr` varchar(15) NOT NULL,
  `idmaster` int(11) DEFAULT NULL,
  `origen` varchar(255) DEFAULT NULL,
  `idequipo` int(11) DEFAULT NULL,
  `u_tom` varchar(20) DEFAULT NULL,
  `u_asig` int(11) DEFAULT NULL,
  `prioridad` smallint(6) DEFAULT NULL,
  `FA` datetime NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FB` datetime DEFAULT NULL,
  `UB` varchar(15) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `usr`, `idmaster`, `origen`, `idequipo`, `u_tom`, `u_asig`, `prioridad`, `FA`, `UA`, `FB`, `UB`) VALUES
(1, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 1, NULL, NULL, NULL, '2014-11-23 21:11:04', 'U1AG1', NULL, NULL),
(2, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2014-11-23 21:11:55', 'U1AG1', '2014-11-24 14:02:37', 'COM1'),
(3, 'U1AG1', NULL, 'D1-S1-O5-O9-O15-', 2, 'COM1', NULL, NULL, '2014-11-23 21:13:17', 'U1AG1', '2014-11-24 14:13:47', 'COM1'),
(4, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2014-11-27 13:18:31', 'U1AG1', NULL, NULL),
(5, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 1, NULL, NULL, NULL, '2014-12-10 10:02:23', 'U1AG1', NULL, NULL),
(6, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2014-12-10 10:18:29', 'U1AG1', '2015-02-18 14:58:31', 'COM1'),
(7, 'U1AG1', 10, 'D1-S1-O4-O9-O14-', 2, NULL, 0, NULL, '2014-12-10 10:19:24', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(8, 'U1AG1', 1, 'D1-S1-O3-O7-O13-', 1, NULL, NULL, NULL, '2014-12-12 09:25:49', 'U1AG1', NULL, NULL),
(10, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-04 11:55:15', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(9, 'U1AG1', 10, 'D1-S1-O3-O7-O12-', 2, 'COM1', NULL, NULL, '2015-01-15 11:14:31', 'U1AG1', '2015-02-18 14:59:58', 'COM1'),
(11, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2015-02-04 16:53:07', 'U1AG1', '2015-02-19 15:00:26', 'COM1'),
(12, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 2, 'COM1', NULL, NULL, '2015-02-05 14:53:21', 'U1AG1', '2015-02-09 14:35:57', 'COM1'),
(13, 'U1AG2', 4, 'D1-S1-O5-O8-', 2, 'COM1', NULL, NULL, '2015-02-06 16:41:37', 'U1AG2', NULL, NULL),
(14, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 15:34:17', 'U1AG1', '2015-02-27 09:03:25', 'COM1'),
(15, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 15:34:54', 'U1AG1', '2015-02-18 15:11:55', 'COM1'),
(16, 'U1AG1', 22, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-02-09 16:20:16', 'U1AG1', NULL, NULL),
(17, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 16:21:33', 'U1AG1', '2015-02-27 10:03:44', 'COM1'),
(18, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 16:22:19', 'U1AG1', '2015-02-18 15:07:36', 'COM1'),
(19, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 16:25:00', 'U1AG1', '2015-02-19 15:01:33', 'COM1'),
(20, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-09 16:28:24', 'U1AG1', NULL, NULL),
(21, 'U1AG1', 18, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-02-09 16:41:46', 'U1AG1', '2015-02-18 15:07:36', 'COM1'),
(22, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-02-09 16:42:12', 'U1AG1', NULL, NULL),
(23, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-10 09:53:18', 'U1AG1', NULL, NULL),
(24, 'U1AG1', 15, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-02-10 10:19:12', 'U1AG1', '2015-02-18 15:11:55', 'COM1'),
(25, 'U1AG1', 1, 'D1-S1-O4-O9-O14-', 1, NULL, NULL, NULL, '2015-02-10 10:21:15', 'U1AG1', NULL, NULL),
(26, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-10 16:56:54', 'U1AG1', NULL, NULL),
(27, 'U1AG2', NULL, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-02-18 14:49:15', 'U1AG2', NULL, NULL),
(28, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, '2015-02-26 12:10:16', 'U1AG1', NULL, NULL),
(29, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, 'COM1', NULL, NULL, '2015-02-26 12:19:18', 'U1AG1', NULL, NULL),
(30, 'U1AG1', 28, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, '2015-02-27 15:00:10', 'U1AG1', NULL, NULL),
(31, 'U1AG1', NULL, 'D1-S1-O4-O9-O14-', 2, NULL, NULL, NULL, '2015-03-03 11:27:35', 'U1AG1', NULL, NULL),
(32, 'U1AG1', NULL, 'D1-S1-O5-O9-O14-', 2, NULL, NULL, NULL, '2015-03-03 11:29:18', 'U1AG1', NULL, NULL),
(33, 'U1AG1', NULL, 'D1-S1-O5-O8-', 2, NULL, NULL, NULL, '2015-03-05 09:49:47', 'U1AG1', NULL, NULL),
(34, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 2, NULL, NULL, NULL, '2015-03-12 12:52:41', 'U1AG1', NULL, NULL),
(35, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:37:11', 'U1AG1', NULL, NULL),
(36, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:38:00', 'U1AG1', NULL, NULL),
(37, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:38:31', 'U1AG1', NULL, NULL),
(38, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:39:15', 'U1AG1', NULL, NULL),
(39, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:41:29', 'U1AG1', NULL, NULL),
(40, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:44:29', 'U1AG1', '2015-03-12 14:44:29', 'U1AG1'),
(41, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:46:49', 'U1AG1', '2015-03-12 14:46:49', 'U1AG1'),
(42, 'U1AG1', NULL, 'D1-S1-O1-', 2, NULL, NULL, NULL, '2015-03-12 14:48:11', 'U1AG1', '2015-03-12 14:48:11', 'U1AG1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=185 ;

--
-- Volcado de datos para la tabla `tickets_m`
--

INSERT INTO `tickets_m` (`id`, `idtkt`, `idaccion`, `valoraccion`, `FA`, `UA`, `FB`, `UB`, `estado`) VALUES
(1, 1, 1, '2', '2014-11-23 21:11:04', 'U1AG1', '2014-11-23 21:14:49', 'U1AG1', 0),
(2, 2, 1, '2', '2014-11-23 21:11:55', 'U1AG1', '2014-11-24 13:59:25', 'COM1', 0),
(3, 3, 1, '2', '2014-11-23 21:13:17', 'U1AG1', '2014-11-24 14:05:15', 'COM1', 0),
(4, 1, 16, '', '2014-11-23 21:14:49', 'U1AG1', '2014-11-23 21:15:57', 'COM1', 0),
(5, 1, 5, '', '2014-11-23 21:15:57', 'COM1', '2014-11-23 21:16:06', 'COM1', 0),
(6, 1, 4, '1', '2014-11-23 21:16:06', 'COM1', '2014-12-10 09:40:14', 'U1AG1', 0),
(7, 2, 5, '', '2014-11-24 13:59:25', 'COM1', '2014-11-24 14:02:37', 'COM1', 0),
(8, 2, 12, '', '2014-11-24 14:02:37', 'COM1', NULL, NULL, 0),
(9, 3, 5, '', '2014-11-24 14:05:15', 'COM1', '2014-11-24 14:09:18', 'COM1', 0),
(10, 3, 13, '', '2014-11-24 14:09:18', 'COM1', '2014-11-24 14:10:39', 'COM1', 0),
(11, 3, 6, '', '2014-11-24 14:10:39', 'COM1', '2014-11-24 14:11:01', 'COM1', 0),
(12, 3, 12, '', '2014-11-24 14:11:01', 'COM1', '2014-11-24 14:11:58', 'COM1', 0),
(13, 3, 6, '', '2014-11-24 14:11:58', 'COM1', '2014-11-24 14:12:11', 'COM1', 0),
(14, 3, 13, '', '2014-11-24 14:12:11', 'COM1', '2014-11-24 14:13:38', 'COM1', 0),
(15, 3, 6, '', '2014-11-24 14:13:38', 'COM1', '2014-11-24 14:13:47', 'COM1', 0),
(16, 3, 13, '', '2014-11-24 14:13:47', 'COM1', NULL, NULL, 0),
(17, 4, 1, '2', '2014-11-27 13:18:31', 'U1AG1', '2014-11-28 14:47:26', 'COM1', 0),
(18, 4, 5, '', '2014-11-28 14:47:26', 'COM1', '2015-01-15 11:17:17', 'COM1', 0),
(19, 1, 16, '', '2014-12-10 09:40:14', 'U1AG1', '2015-01-15 11:12:10', 'U1AG1', 0),
(20, 5, 1, '2', '2014-12-10 10:02:23', 'U1AG1', '2014-12-31 11:23:39', 'COMRES', 0),
(21, 6, 1, '2', '2014-12-10 10:18:29', 'U1AG1', '2015-02-06 10:12:48', 'COM1', 0),
(22, 7, 1, '2', '2014-12-10 10:19:24', 'U1AG1', '2014-12-31 12:50:34', 'COMRES', 0),
(23, 8, 1, '2', '2014-12-12 09:25:49', 'U1AG1', '2015-02-06 10:14:40', 'COM1', 0),
(24, 5, 8, 'COM1', '2014-12-31 11:23:39', 'COMRES', '2014-12-31 11:23:43', 'COMRES', 0),
(25, 5, 15, '', '2014-12-31 11:23:43', 'COMRES', '2014-12-31 11:24:46', 'COMRES', 0),
(26, 5, 8, 'COM1', '2014-12-31 11:24:46', 'COMRES', '2014-12-31 11:24:58', 'COMRES', 0),
(27, 5, 15, '', '2014-12-31 11:24:58', 'COMRES', '2014-12-31 11:25:28', 'COMRES', 0),
(28, 5, 8, 'COM1', '2014-12-31 11:25:28', 'COMRES', '2015-01-15 11:36:46', 'COM1', 0),
(29, 7, 8, 'COM1', '2014-12-31 12:50:34', 'COMRES', '2014-12-31 13:05:58', 'COMRES', 0),
(30, 7, 15, '', '2014-12-31 13:05:58', 'COMRES', '2014-12-31 13:06:02', 'COMRES', 0),
(31, 7, 8, 'COM1', '2014-12-31 13:06:02', 'COMRES', '2015-01-15 14:28:47', 'COM1', 0),
(32, 1, 16, '', '2015-01-15 11:12:10', 'U1AG1', '2015-02-26 14:48:46', 'U1AG1', 0),
(33, 9, 1, '2', '2015-01-15 11:14:31', 'U1AG1', '2015-01-15 11:16:05', 'U1AG1', 0),
(34, 9, 16, '', '2015-01-15 11:16:05', 'U1AG1', '2015-01-15 11:40:12', 'COM1', 0),
(35, 4, 12, '', '2015-01-15 11:17:17', 'COM1', '2015-01-15 14:54:03', 'COM1', 0),
(36, 5, 4, '1', '2015-01-15 11:36:46', 'COM1', '2015-02-06 16:56:24', 'U1AG1', 0),
(37, 9, 5, '', '2015-01-15 11:40:12', 'COM1', '2015-01-15 11:41:06', 'COM1', 0),
(38, 9, 17, '', '2015-01-15 11:41:06', 'COM1', '2015-01-15 11:41:56', 'COM1', 0),
(39, 9, 10, '8', '2015-01-15 11:41:56', 'COM1', '2015-02-09 12:50:22', 'COM1', 0),
(40, 7, 17, '', '2015-01-15 14:28:47', 'COM1', '2015-01-15 14:28:49', 'COM1', 0),
(41, 7, 3, '', '2015-01-15 14:28:49', 'COM1', '2015-01-15 14:53:29', 'COM1', 0),
(42, 7, 17, '', '2015-01-15 14:53:29', 'COM1', '2015-02-06 11:10:16', 'COM1', 0),
(43, 4, 6, '', '2015-01-15 14:54:03', 'COM1', '2015-02-06 10:03:14', 'COM1', 0),
(44, 10, 1, '2', '2015-02-04 11:55:15', 'U1AG1', '2015-02-06 10:45:35', 'COM1', 0),
(45, 11, 1, '2', '2015-02-04 16:53:07', 'U1AG1', '2015-02-06 10:38:36', 'COM1', 0),
(46, 12, 1, '2', '2015-02-05 14:53:21', 'U1AG1', '2015-02-09 14:35:42', 'COM1', 0),
(47, 4, 17, '', '2015-02-06 10:03:14', 'COM1', '2015-02-12 14:37:27', 'U1AG1', 0),
(48, 6, 5, '', '2015-02-06 10:12:48', 'COM1', '2015-02-12 14:46:25', 'COM1', 0),
(49, 8, 5, '', '2015-02-06 10:14:40', 'COM1', '2015-02-06 10:14:49', 'COM1', 0),
(50, 8, 4, '1', '2015-02-06 10:14:49', 'COM1', '2015-02-06 10:14:49', 'COM1', 0),
(51, 8, 10, '1', '2015-02-06 10:14:49', 'COM1', '2015-02-12 14:41:28', 'U1AG1', 0),
(52, 11, 5, '', '2015-02-06 10:38:36', 'COM1', '2015-02-19 15:00:26', 'COM1', 0),
(53, 10, 5, '', '2015-02-06 10:45:35', 'COM1', '2015-02-06 10:45:39', 'COM1', 0),
(54, 10, 10, '7', '2015-02-06 10:45:39', 'COM1', '2015-02-06 11:10:16', 'COM1', 0),
(55, 7, 10, '10', '2015-02-06 11:10:16', 'COM1', '2015-02-09 12:40:48', 'COM1', 0),
(56, 10, 7, '', '2015-02-06 11:10:16', 'COM1', '2015-02-09 12:40:48', 'COM1', 0),
(57, 13, 1, '2', '2015-02-06 16:41:37', 'U1AG2', '2015-02-09 09:47:38', 'COM1', 0),
(58, 5, 16, '', '2015-02-06 16:56:24', 'U1AG1', NULL, NULL, 0),
(59, 13, 5, '', '2015-02-09 09:47:38', 'COM1', '2015-02-09 09:47:43', 'COM1', 0),
(60, 13, 10, '4', '2015-02-09 09:47:43', 'COM1', NULL, NULL, 0),
(61, 10, 10, '7', '2015-02-09 12:40:48', 'COM1', '2015-02-09 12:47:35', 'COM1', 0),
(62, 7, 7, '', '2015-02-09 12:40:48', 'COM1', '2015-02-09 12:47:35', 'COM1', 0),
(63, 7, 10, '10', '2015-02-09 12:47:35', 'COM1', '2015-02-18 14:59:58', 'COM1', 0),
(64, 10, 7, '', '2015-02-09 12:47:35', 'COM1', '2015-02-12 14:42:42', 'U1AG1', 0),
(65, 9, 10, '10', '2015-02-09 12:50:22', 'COM1', '2015-02-18 14:59:58', 'COM1', 0),
(66, 12, 5, '', '2015-02-09 14:35:42', 'COM1', '2015-02-09 14:35:57', 'COM1', 0),
(67, 12, 12, '', '2015-02-09 14:35:57', 'COM1', NULL, NULL, 0),
(68, 14, 1, '2', '2015-02-09 15:34:17', 'U1AG1', '2015-02-24 12:12:48', 'COM1', 0),
(69, 15, 1, '2', '2015-02-09 15:34:54', 'U1AG1', '2015-02-18 15:10:06', 'COM1', 0),
(70, 16, 1, '2', '2015-02-09 16:20:16', 'U1AG1', '2015-02-27 15:01:53', 'COM1', 0),
(71, 17, 1, '2', '2015-02-09 16:21:33', 'U1AG1', '2015-02-27 10:03:32', 'COM1', 0),
(72, 18, 1, '2', '2015-02-09 16:22:19', 'U1AG1', '2015-02-18 15:01:25', 'COM1', 0),
(73, 19, 1, '2', '2015-02-09 16:25:00', 'U1AG1', '2015-02-19 15:01:29', 'COM1', 0),
(74, 20, 1, '2', '2015-02-09 16:28:24', 'U1AG1', '2015-02-11 14:35:49', 'COM1', 0),
(75, 21, 1, '2', '2015-02-09 16:41:46', 'U1AG1', '2015-02-09 16:41:46', 'U1AG1', 0),
(76, 21, 10, '18', '2015-02-09 16:41:46', 'U1AG1', '2015-02-18 15:01:29', 'COM1', 0),
(77, 22, 1, '2', '2015-02-09 16:42:12', 'U1AG1', '2015-02-09 16:42:12', 'U1AG1', 0),
(78, 22, 10, '16', '2015-02-09 16:42:12', 'U1AG1', '2015-02-26 15:12:44', 'COM1', 0),
(79, 23, 1, '2', '2015-02-10 09:53:18', 'U1AG1', '2015-02-27 15:08:21', 'COM1', 0),
(80, 24, 1, '2', '2015-02-10 10:19:12', 'U1AG1', '2015-02-10 10:19:12', 'U1AG1', 0),
(81, 24, 10, '15', '2015-02-10 10:19:12', 'U1AG1', '2015-02-18 15:10:09', 'COM1', 0),
(82, 25, 1, '2', '2015-02-10 10:21:15', 'U1AG1', '2015-02-10 10:21:15', 'U1AG1', 0),
(83, 25, 4, '1', '2015-02-10 10:21:15', 'U1AG1', '2015-02-10 10:21:15', 'U1AG1', 0),
(84, 25, 10, '1', '2015-02-10 10:21:15', 'U1AG1', NULL, NULL, 0),
(85, 26, 1, '2', '2015-02-10 16:56:54', 'U1AG1', '2015-02-27 15:02:17', 'COM1', 0),
(86, 20, 5, '', '2015-02-11 14:35:49', 'COM1', '2015-02-11 14:35:55', 'COM1', 0),
(87, 20, 17, '', '2015-02-11 14:35:55', 'COM1', NULL, NULL, 0),
(88, 4, 16, '', '2015-02-12 14:37:27', 'U1AG1', '2015-02-12 14:37:34', 'U1AG1', 0),
(89, 4, 16, '', '2015-02-12 14:37:34', 'U1AG1', NULL, NULL, 0),
(90, 8, 16, '', '2015-02-12 14:41:28', 'U1AG1', '2015-02-27 14:26:53', 'U1AG1', 0),
(91, 10, 16, '', '2015-02-12 14:42:42', 'U1AG1', '2015-02-18 14:59:51', 'COM1', 0),
(92, 6, 17, '', '2015-02-12 14:46:25', 'COM1', '2015-02-18 14:52:08', 'COM1', 0),
(93, 27, 1, '2', '2015-02-18 14:49:15', 'U1AG2', NULL, NULL, 0),
(94, 6, 13, '', '2015-02-18 14:52:08', 'COM1', '2015-02-18 14:56:11', 'COM1', 0),
(95, 6, 6, '', '2015-02-18 14:56:11', 'COM1', '2015-02-18 14:56:18', 'COM1', 0),
(96, 6, 13, '', '2015-02-18 14:56:18', 'COM1', '2015-02-18 14:58:27', 'COM1', 0),
(97, 6, 6, '', '2015-02-18 14:58:27', 'COM1', '2015-02-18 14:58:31', 'COM1', 0),
(98, 6, 13, '', '2015-02-18 14:58:31', 'COM1', NULL, NULL, 0),
(99, 10, 5, '', '2015-02-18 14:59:51', 'COM1', '2015-02-18 14:59:58', 'COM1', 0),
(100, 7, 2, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(101, 9, 2, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(102, 10, 13, '', '2015-02-18 14:59:58', 'COM1', NULL, NULL, 0),
(103, 18, 5, '', '2015-02-18 15:01:25', 'COM1', '2015-02-18 15:01:29', 'COM1', 0),
(104, 21, 2, '', '2015-02-18 15:01:29', 'COM1', '2015-02-18 15:01:57', 'COM1', 0),
(105, 18, 13, '', '2015-02-18 15:01:29', 'COM1', '2015-02-18 15:01:57', 'COM1', 0),
(106, 21, 6, '', '2015-02-18 15:01:57', 'COM1', '2015-02-18 15:02:11', 'COM1', 0),
(107, 18, 6, '', '2015-02-18 15:01:57', 'COM1', '2015-02-18 15:02:11', 'COM1', 0),
(108, 21, 2, '', '2015-02-18 15:02:11', 'COM1', '2015-02-18 15:02:49', 'COM1', 0),
(109, 18, 13, '', '2015-02-18 15:02:11', 'COM1', '2015-02-18 15:02:49', 'COM1', 0),
(110, 21, 6, '', '2015-02-18 15:02:49', 'COM1', '2015-02-18 15:02:52', 'COM1', 0),
(111, 18, 6, '', '2015-02-18 15:02:49', 'COM1', '2015-02-18 15:02:52', 'COM1', 0),
(112, 21, 2, '', '2015-02-18 15:02:52', 'COM1', '2015-02-18 15:07:32', 'COM1', 0),
(113, 18, 13, '', '2015-02-18 15:02:52', 'COM1', '2015-02-18 15:07:32', 'COM1', 0),
(114, 21, 6, '', '2015-02-18 15:07:32', 'COM1', '2015-02-18 15:07:36', 'COM1', 0),
(115, 18, 6, '', '2015-02-18 15:07:32', 'COM1', '2015-02-18 15:07:36', 'COM1', 0),
(116, 21, 2, '', '2015-02-18 15:07:36', 'COM1', NULL, NULL, 0),
(117, 18, 13, '', '2015-02-18 15:07:36', 'COM1', NULL, NULL, 0),
(118, 15, 5, '', '2015-02-18 15:10:06', 'COM1', '2015-02-18 15:10:09', 'COM1', 0),
(119, 24, 2, '', '2015-02-18 15:10:09', 'COM1', '2015-02-18 15:10:59', 'COM1', 0),
(120, 15, 13, '', '2015-02-18 15:10:09', 'COM1', '2015-02-18 15:10:59', 'COM1', 0),
(121, 24, 6, '', '2015-02-18 15:10:59', 'COM1', '2015-02-18 15:11:02', 'COM1', 0),
(122, 15, 6, '', '2015-02-18 15:10:59', 'COM1', '2015-02-18 15:11:02', 'COM1', 0),
(123, 24, 2, '', '2015-02-18 15:11:02', 'COM1', '2015-02-18 15:11:45', 'COM1', 0),
(124, 15, 13, '', '2015-02-18 15:11:02', 'COM1', '2015-02-18 15:11:45', 'COM1', 0),
(125, 24, 6, '', '2015-02-18 15:11:45', 'COM1', '2015-02-18 15:11:55', 'COM1', 0),
(126, 15, 6, '', '2015-02-18 15:11:45', 'COM1', '2015-02-18 15:11:55', 'COM1', 0),
(127, 24, 2, '', '2015-02-18 15:11:55', 'COM1', NULL, NULL, 0),
(128, 15, 13, '', '2015-02-18 15:11:55', 'COM1', NULL, NULL, 0),
(129, 11, 13, '', '2015-02-19 15:00:26', 'COM1', NULL, NULL, 0),
(130, 19, 5, '', '2015-02-19 15:01:29', 'COM1', '2015-02-19 15:01:33', 'COM1', 0),
(131, 19, 13, '', '2015-02-19 15:01:33', 'COM1', NULL, NULL, 0),
(132, 14, 17, '', '2015-02-24 12:12:48', 'COM1', '2015-02-27 09:02:51', 'COM1', 0),
(133, 28, 1, '2', '2015-02-26 12:10:17', 'U1AG1', '2015-02-26 12:46:27', 'U1AG1', 0),
(134, 29, 1, '2', '2015-02-26 12:19:18', 'U1AG1', '2015-02-26 12:22:48', 'U1AG1', 0),
(135, 29, 16, '', '2015-02-26 12:22:48', 'U1AG1', '2015-02-26 12:23:07', 'U1AG1', 0),
(136, 29, 16, '', '2015-02-26 12:23:07', 'U1AG1', '2015-02-26 14:36:53', 'U1AG1', 0),
(137, 28, 16, '', '2015-02-26 12:46:27', 'U1AG1', '2015-02-26 12:49:56', 'U1AG1', 0),
(138, 28, 16, '', '2015-02-26 12:49:56', 'U1AG1', '2015-02-26 12:50:49', 'U1AG1', 0),
(139, 28, 16, '', '2015-02-26 12:50:49', 'U1AG1', '2015-02-26 12:55:20', 'U1AG1', 0),
(140, 28, 16, '', '2015-02-26 12:55:20', 'U1AG1', '2015-02-26 13:00:27', 'U1AG1', 0),
(141, 28, 16, '', '2015-02-26 13:00:27', 'U1AG1', '2015-02-26 14:05:04', 'U1AG1', 0),
(142, 28, 16, '', '2015-02-26 14:05:04', 'U1AG1', '2015-02-26 14:06:43', 'U1AG1', 0),
(143, 28, 16, '', '2015-02-26 14:06:43', 'U1AG1', '2015-02-26 14:31:52', 'U1AG1', 0),
(144, 28, 16, '', '2015-02-26 14:31:52', 'U1AG1', '2015-02-26 14:32:08', 'U1AG1', 0),
(145, 28, 16, '', '2015-02-26 14:32:08', 'U1AG1', '2015-02-26 14:32:20', 'U1AG1', 0),
(146, 28, 16, '', '2015-02-26 14:32:20', 'U1AG1', NULL, NULL, 0),
(147, 29, 16, '', '2015-02-26 14:36:53', 'U1AG1', '2015-02-26 14:37:14', 'U1AG1', 0),
(148, 29, 16, '', '2015-02-26 14:37:14', 'U1AG1', '2015-02-26 14:43:30', 'U1AG1', 0),
(149, 29, 16, '', '2015-02-26 14:43:30', 'U1AG1', '2015-02-26 14:43:54', 'U1AG1', 0),
(150, 29, 16, '', '2015-02-26 14:43:54', 'U1AG1', '2015-02-26 14:44:07', 'U1AG1', 0),
(151, 29, 16, '', '2015-02-26 14:44:07', 'U1AG1', '2015-02-26 14:44:14', 'U1AG1', 0),
(152, 29, 16, '', '2015-02-26 14:44:14', 'U1AG1', '2015-03-03 11:38:44', 'COM1', 0),
(153, 1, 16, '', '2015-02-26 14:48:46', 'U1AG1', NULL, NULL, 0),
(154, 22, 17, '', '2015-02-26 15:12:44', 'COM1', '2015-02-27 15:01:53', 'COM1', 0),
(155, 14, 5, '', '2015-02-27 09:02:51', 'COM1', '2015-02-27 09:03:25', 'COM1', 0),
(156, 14, 12, '', '2015-02-27 09:03:25', 'COM1', NULL, NULL, 0),
(157, 17, 5, '', '2015-02-27 10:03:32', 'COM1', '2015-02-27 10:03:44', 'COM1', 0),
(158, 17, 13, '', '2015-02-27 10:03:44', 'COM1', NULL, NULL, 0),
(159, 8, 16, '', '2015-02-27 14:26:53', 'U1AG1', NULL, NULL, 0),
(160, 30, 1, '2', '2015-02-27 15:00:10', 'U1AG1', '2015-02-27 15:00:10', 'U1AG1', 0),
(161, 30, 10, '28', '2015-02-27 15:00:10', 'U1AG1', NULL, NULL, 0),
(162, 16, 10, '22', '2015-02-27 15:01:53', 'COM1', NULL, NULL, 0),
(163, 22, 7, '', '2015-02-27 15:01:53', 'COM1', NULL, NULL, 0),
(164, 26, 17, '', '2015-02-27 15:02:17', 'COM1', '2015-02-27 15:03:40', 'COM1', 0),
(165, 26, 5, '', '2015-02-27 15:03:40', 'COM1', NULL, NULL, 0),
(166, 23, 5, '', '2015-02-27 15:08:21', 'COM1', NULL, NULL, 0),
(167, 31, 1, '2', '2015-03-03 11:27:35', 'U1AG1', '2015-03-03 11:28:03', 'U1AG1', 0),
(168, 31, 16, '', '2015-03-03 11:28:03', 'U1AG1', NULL, NULL, 0),
(169, 32, 1, '2', '2015-03-03 11:29:18', 'U1AG1', '2015-03-03 11:29:23', 'U1AG1', 0),
(170, 32, 16, '', '2015-03-03 11:29:23', 'U1AG1', NULL, NULL, 0),
(171, 29, 5, '', '2015-03-03 11:38:44', 'COM1', NULL, NULL, 0),
(172, 33, 1, '2', '2015-03-05 09:49:47', 'U1AG1', NULL, NULL, 0),
(173, 34, 1, '2', '2015-03-12 12:52:41', 'U1AG1', NULL, NULL, 0),
(174, 35, 1, '2', '2015-03-12 14:37:11', 'U1AG1', NULL, NULL, 0),
(175, 36, 1, '2', '2015-03-12 14:38:00', 'U1AG1', NULL, NULL, 0),
(176, 37, 1, '2', '2015-03-12 14:38:31', 'U1AG1', NULL, NULL, 0),
(177, 38, 1, '2', '2015-03-12 14:39:15', 'U1AG1', NULL, NULL, 0),
(178, 39, 1, '2', '2015-03-12 14:41:29', 'U1AG1', NULL, NULL, 0),
(179, 40, 1, '2', '2015-03-12 14:44:29', 'U1AG1', '2015-03-12 14:44:29', 'U1AG1', 0),
(180, 40, 18, '', '2015-03-12 14:44:29', 'U1AG1', NULL, NULL, 0),
(181, 41, 1, '2', '2015-03-12 14:46:49', 'U1AG1', '2015-03-12 14:46:49', 'U1AG1', 0),
(182, 41, 18, '', '2015-03-12 14:46:49', 'U1AG1', NULL, NULL, 0),
(183, 42, 1, '2', '2015-03-12 14:48:11', 'U1AG1', '2015-03-12 14:48:11', 'U1AG1', 0),
(184, 42, 18, '', '2015-03-12 14:48:11', 'U1AG1', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m_detalles`
--

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
(184, '<itform>\n   <element>\n      <id>text1</id>\n      <type>text</type>\n      <text>Descargue el archivo del siguiente link</text>\n   <value/></element>\n   <element>\n      <type>link</type>\n      <id>link_archivo</id>\n      <label>LINK</label>\n      <text>DESCARGAR</text>\n	  \n   <value>http://www.freeformatter.com/xml-formatter.html#ad-output</value></element>\n</itform>');

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
 ADD UNIQUE KEY `idtktm` (`idtktm`), ADD KEY `idtktm_2` (`idtktm`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `tickets_m`
--
ALTER TABLE `tickets_m`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=185;--
-- Base de datos: `itracker_agentes_uta`
--
DROP DATABASE `itracker_agentes_uta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE IF NOT EXISTS `acciones` (
`id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `estadotkt` varchar(50) DEFAULT NULL,
  `ejecuta` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  `formulario` tinyint(1) NOT NULL,
  `form` text,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=232 ;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `nombre`, `alias`, `estadotkt`, `ejecuta`, `tipo`, `formulario`, `form`, `habilita_t_propio`, `habilita_tomado`, `habilita_equipos`, `habilita_perfiles`, `habilita_a_propio`, `habilita_abierto`, `habilita_equipo`, `habilita_master`, `notificacion_param`, `notificacion_texto`, `descripcion`, `estado`) VALUES
(1, 'ABRIR', 'ABRIR', 'Pendiente', 'open', 1, 1, NULL, 0, 2, '*', '5,', 2, 2, 0, 0, '(is_master)(to:{team})', 'Se ha generado un nuevo itracker derivado al area.<br />\nID: {id}<br />\nPuedes verlo en ITRACKER', 'Genera un nuevo ticket', 0),
(2, 'CERRAR', 'CERRAR', 'Cerrado', 'close', 1, 1, '\n<itform>\n  <element>\n    <label>Comentario</label>\n    <type>inputlong</type>\n    <id>comment</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', 1, 1, '*', '', 0, 1, 1, 1, '', '', 'Indicar que el ticket esta solucionado', 0),
(3, 'LIBERAR', 'LIBERAR', NULL, 'free', 2, 0, NULL, 1, 1, '*', '3,4,', 0, 1, 1, 1, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(4, 'DERIVAR', 'DERIVAR', 'derivado', 'derive', 2, 1, '\n<itform> 	<element> 		<label> 			Equipo a derivar 		</label> 		<notsave>true</notsave> 		<type> 			idsel 		</type> 		<id> 			idequipo 		</id> 		<idselparams> 			<class>tkt</class> 			<method>idsel_teamderive</method> 		</idselparams> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element> 	<element> 		<type> 			inputlong 		</type> 	<label>Comentario</label>	<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	</element> </itform>', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{team}::cc:{prev_team})', 'Se ha derivado un itracker al area.<br />\nID: {id}<br />\nApertura: {FA}<br />\nPuedes verlo en ITRACKER', 'Asignar el ticket a otro equipo', 0),
(5, 'TOMAR', 'TOMAR', 'en analisis', 'take', 2, 0, NULL, 0, 2, '*', '3,4,', 0, 1, 1, 1, '', '', 'Reservar el ticket para su tratamiento', 0),
(6, 'REABRIR', 'RE ABRIR', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 1, 0, '*', '3,4,', 0, 2, 1, 1, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(7, 'SET_MASTER', 'Set master', NULL, 'setmaster', 1, 0, NULL, 1, 0, '*', '3,4,', 0, 1, 1, 2, '', '', NULL, 0),
(8, 'ASIGNAR', 'Asignar', NULL, 'asign', 2, 1, '<itform>\n  <element>\n    <label>Asignar a:</label>\n    <notsave>true</notsave>\n    <type>idsel</type>\n    <id>idusr</id>\n    <idselparams>\n      <class>tkt</class>\n      <method>idsel_userasign</method>\n    </idselparams>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n  <element>\n    <type> 			inputlong 		</type>\n    <label>Comentario</label>\n    <id> 			comment 		</id>\n    <comment> 			Commentario 		</comment>\n  </element>\n</itform>', 0, 2, '*', '4,', 0, 1, 1, 1, '(always)(to:{u_tom})', 'Se te ha asignado el tkt {id} del sistema {system->name}.<br />\nPuedes verlo en ITRACKER.\n', 'Asignar el ticket a un miembro del equipo', 0),
(9, 'PRIORIZAR', 'Priorizar', NULL, 'priorice', 3, 1, '<itform> 	<element> 		<label> 			Prioridad: 		</label> 		<notsave>true</notsave> 		<type> 			select 		</type> 		<id> 			prioridad 		</id> 		<option><value>3</value><text>ALTA</text></option> 		<option><value>6</value><text>MEDIA</text></option> 		<option><value>9</value><text>BAJA</text></option> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', 0, 0, '*', '4,', 0, 1, 1, 1, '', '', 'Establece una nueva prioridad al ticket', 0),
(10, 'UNIR', 'Unir', NULL, 'join', 1, 1, '<itform> 	<element> 		<label> 			Unir a id: 		</label> 		<notsave>true</notsave> 		<type> 			input 		</type> 		<id> 			idmaster 		</id> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', 1, 1, '*', '3,4,', 0, 1, 1, 1, '', '', 'Relaciona el ticket a otro', 0),
(11, 'SEPARAR', 'Separar', NULL, 'unjoin', 1, 0, NULL, 1, 1, '*', '3,4,', 0, 1, 1, 2, '', '', 'Elimina la relacion al ticket padre', 0),
(12, 'CERRAR_COMISIONES_PROCEDENTE', 'Cerrar Procedente', 'cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>1</value>\n      <text>Procedente</text>\n    </option>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Monto a ajustar</label>\n    <type>input</type>\n    <id>monto</id>\n    <comment>(Punto separador decimal)</comment>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Cantidad de operaciones</label>\n    <type>input</type>\n    <id>qoper</id>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n   <label>Se ajustara en el mes</label>\n    <type>month</type>\n    <id>majust</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n <element>\n    <label>Adjunto</label>\n    <type>fileupl</type>\n    <id>adjunto</id>\n    <notsave>true</notsave>\n  </element>\n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{clients}::cc:{clients->teams})', 'Se ha cerrado un itracker que generaste.<br/>\nID: {id}<br/>\nPuedes verlo en ITRACKER', 'cerrar comisiones procedente', 0),
(13, 'CERRAR_COMISIONES_NOPROCE', 'Cerrar No Procedente', 'cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Adjunto</label>\n    <type>fileupl</type>\n    <id>adjunto</id>\n    <notsave>true</notsave>\n  </element>\n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{clients},{event_user=>tomar}::cc:{clients->teams})', 'Se ha cerrado un itracker que generaste.<br/>\nID: {id}<br/>\nPuedes verlo en ITRACKER', 'cerrar comisiones no procedente', 0),
(14, 'REABRIR_COOR', 'Reabrir', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 2, 0, '*', '4,', 0, 2, 1, 1, '', '', 'reabrir coordinador', 0),
(15, 'LIBERAR_COOR', 'Liberar', '', 'free', 2, 0, NULL, 2, 1, '*', '4,', 0, 1, 1, 1, '', '', 'librerar coordinador', 0),
(16, 'COMENTARIO_GENERADOR', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 0, 0, '*', '5,', 1, 0, 0, 0, '', '', 'comentario cliente', 0),
(17, 'COMENTARIO_EQUIPO', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 0, 0, '*', '3,4,', 2, 0, 1, 0, '', '', 'comentario equipo', 0),
(18, 'CERRAR_RUTA', 'CERRAR', 'cerrado', 'close', 1, 1, '<itform>\r\n   <element>\r\n      <id>text1</id>\r\n      <type>text</type>\r\n      <text>Descargue el archivo del siguiente link</text>\r\n   </element>\r\n   <element>\r\n      <type>link</type>\r\n      <id>link_archivo</id>\r\n      <label>LINK</label>\r\n      <text>DESCARGAR</text>\r\n	  <validations>\r\n		<required>true</required>\r\n	  </validations>\r\n   </element>\r\n</itform>', 2, 0, '-1', '-1', 1, 1, 0, 1, '', '', 'Cierra ticket a link', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `linkwi` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `nombre`, `linkwi`, `estado`) VALUES
(1, 'Agentes', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `t_conformidad`, `idlistin`, `iddireccion`, `idsequipos_deriva`, `idsequipos_visible`, `mytkts_vista`, `staffhome_vista`, `estado`) VALUES
(1, 'GO_Comisiones', '48:00', 2, 1, '', '', '', '', 0),
(2, 'Comisiones', '48:00', 1, 1, '1', '1,3,4', '', 'id,js:show_childs:id:childsc=>ADJ,FA=>Fecha cracion,usr_o.nombre=>Agente,nextans:S1=>S1,nextans:O33:P2=>S2,nextans:O24=>S3', 0),
(3, 'Agente1', '03:00', 3, 1, '2', '2', 'id,equipo.nombre=>area,status', '', 0),
(4, 'Agente2', '03:00', 4, 1, '2', '2', '', '', 0),
(5, 'Adms', '02:00', 5, 1, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listines`
--

CREATE TABLE IF NOT EXISTS `listines` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `too` text,
  `cc` text,
  `estado` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `listines`
--

INSERT INTO `listines` (`id`, `nombre`, `too`, `cc`, `estado`) VALUES
(1, 'Comisiones', 'comisiones@equipo.teco.com,otrocomisiones@ta.teco', 'encopiacomisiones@ta.telecom.com', '0'),
(2, 'Go_comisiones', 'gocomisiones@ta.teco', '', '0'),
(3, 'Agente1', 'toA1@a1.com', 'encopiaA1@a1.com', '0'),
(4, 'Agente2', '', '', '0'),
(5, 'Adms', '', '', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE IF NOT EXISTS `opciones` (
`id` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `texto_critico` varchar(50) DEFAULT NULL,
  `ruta_destino` varchar(255) DEFAULT NULL,
  `idequipo_destino` varchar(255) DEFAULT NULL,
  `pretext` longtext,
  `idpregunta_destino` int(11) DEFAULT NULL,
  `no_anexar` tinyint(1) NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `ruta_destino`, `idequipo_destino`, `pretext`, `idpregunta_destino`, `no_anexar`, `UA`, `FA`, `UB`, `FB`) VALUES
(1, 1, 'alta de usuario', NULL, 'http://www.freeformatter.com/xml-formatter.html#ad-output', 'default=>2', NULL, NULL, 1, 'U548391', '2014-01-24', NULL, NULL),
(2, 1, 'usuario de baja', NULL, 'TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx', 'default=>2', NULL, NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(3, 1, 'error al realizar gestiones', NULL, NULL, 'default=>2', NULL, 2, 0, 'U548391', '2014-01-24', NULL, NULL),
(4, 1, 'lentitud en la web', 'lentitud/error', NULL, 'default=>2', NULL, 3, 0, 'U548391', '2014-01-24', NULL, NULL),
(5, 1, 'pagina web no responde', 'lentitud/error', NULL, 'default=>2', NULL, 3, 0, 'U548391', '2014-01-24', NULL, NULL),
(6, 2, 'si', 'masivo', NULL, 'default=>2', NULL, 4, 0, 'U548391', '2014-01-24', NULL, NULL),
(7, 2, 'no', NULL, NULL, 'default=>2', NULL, 5, 0, 'U548391', '2014-01-24', NULL, NULL),
(8, 3, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', 0, 1, 'U548391', '2014-01-24', NULL, NULL),
(9, 3, 'no', NULL, NULL, 'default=>2', NULL, 6, 0, 'U548391', '2014-01-24', NULL, NULL),
(10, 4, 'si', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(11, 4, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(12, 5, 'si', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(13, 5, 'no', 'algo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(14, 6, 'si', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(15, 6, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(16, 7, 'alta de usuario', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(17, 7, 'usuario bloqueado', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 1, 'U548391', '2014-01-24', NULL, NULL),
(18, 7, 'cambio de contraseña', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(19, 7, 'lentitud en la web', 'lentitud/error', NULL, 'default=>2', NULL, 8, 0, 'U548391', '2014-01-24', NULL, NULL),
(20, 7, 'pagina web no responde', 'lentitud/error', NULL, 'default=>2', NULL, 8, 0, 'U548391', '2014-01-24', NULL, NULL),
(21, 8, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(22, 8, 'no', NULL, NULL, 'default=>2', NULL, 9, 0, 'U548391', '2014-01-24', NULL, NULL),
(23, 9, 'si', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(24, 9, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(25, 10, 'sin dominio telecom', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(26, 10, 'sin conectividad', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(27, 10, 'periferico faltante/falla (mouse, teclado,monitor)', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(28, 10, 'otro inconveniente', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(29, 11, 'problemas de usuario en el puesto', NULL, NULL, 'default=>2', NULL, 12, 0, 'U548391', '2014-01-24', NULL, NULL),
(30, 11, 'problemas discador', NULL, NULL, 'default=>2', NULL, 13, 0, 'U548391', '2014-01-24', NULL, NULL),
(31, 11, 'CMS supervisor', NULL, NULL, 'default=>2', NULL, 14, 0, 'U548391', '2014-01-24', NULL, NULL),
(32, 11, 'nice', NULL, NULL, 'default=>2', NULL, 17, 0, 'U548391', '2014-01-24', NULL, NULL),
(33, 11, 'telefonia / llamadas', NULL, NULL, 'default=>2', NULL, 20, 0, 'U548391', '2014-01-24', NULL, NULL),
(34, 12, 'ips', NULL, NULL, 'default=>2', NULL, 16, 0, 'U548391', '2014-01-24', NULL, NULL),
(35, 12, 'aic', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', 16, 0, 'U548391', '2014-01-24', NULL, NULL),
(36, 12, 'apc', NULL, NULL, 'default=>2', NULL, 16, 0, 'U548391', '2014-01-24', NULL, NULL),
(37, 16, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(38, 16, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(39, 13, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(40, 13, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(41, 14, 'error / incidente', NULL, NULL, 'default=>2', NULL, 15, 0, 'U548391', '2014-01-24', NULL, NULL),
(42, 14, 'blanqueo de clave', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(43, 15, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(44, 15, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(45, 17, 'error / incidente', NULL, NULL, 'default=>2', NULL, 19, 0, 'U548391', '2014-01-24', NULL, NULL),
(46, 17, 'blanqueo de clave', NULL, NULL, 'default=>2', NULL, 18, 0, 'U548391', '2014-01-24', NULL, NULL),
(47, 19, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL);
INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `ruta_destino`, `idequipo_destino`, `pretext`, `idpregunta_destino`, `no_anexar`, `UA`, `FA`, `UB`, `FB`) VALUES
(48, 19, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(49, 18, 'no la recuerdo', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(50, 18, 'usuario bloqueado', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(51, 20, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(52, 20, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(53, 21, 'usuarios', NULL, NULL, 'default=>2', NULL, 22, 0, 'U548391', '2014-01-24', NULL, NULL),
(54, 21, 'aplicacion', NULL, NULL, 'default=>2', NULL, 23, 0, 'U548391', '2014-01-24', NULL, NULL),
(55, 22, 'alta', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(56, 22, 'baja', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(57, 22, 'modificacion', NULL, NULL, 'default=>2', NULL, 24, 0, 'U548391', '2014-01-24', NULL, NULL),
(58, 24, 'contraseña', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(59, 24, 'perfil', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(60, 24, 'jerarquia', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(61, 24, 'login', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(62, 22, 'usuario bloqueado', NULL, 'TKTS/files_sol/VENTAS/AC/Instructivo_Desbloqueo_de_Usuarios_de_Ac_en_Base_de_Datos_Oracle.doc', 'default=>2', NULL, NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(63, 23, 'boton envio a siebel desactivado', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(64, 23, 'lentitud', 'error/lentitud', NULL, 'default=>2', NULL, 25, 0, 'U548391', '2014-01-24', NULL, NULL),
(65, 23, 'error', 'error/lentitud', NULL, 'default=>2', NULL, 25, 0, 'U548391', '2014-01-24', NULL, NULL),
(66, 25, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(67, 25, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(68, 26, 'si', 'masivo', NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL),
(69, 26, 'no', NULL, NULL, 'default=>2', '<itform>   <element>      <type>fileupl</type>      <id>archivos</id>      <label>archivos</label>      <notsave>true</notsave>   </element>   \r\n<element>      <type>input</type>      <label>texto</label>      <id>linktest</id>	  <view>1</view>      <validations>                    </validations>   </element>\r\n\r\n<element>      <type>input</type>      <label>legajo</label>      <id>Hola</id>	  <view>1</view>      <validations>         <numeric>true</numeric>         <required>true</required>      </validations>   </element>   <element>      <type>text</type>      <id>juan</id>      <text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text>   </element>   <element>      <type>input</type>      <id>21</id>      <comment>3 usuarios de ejemplo</comment>      <label>usuarios</label>      <validations>         <regex>/U[0-9]{6}/</regex>      </validations>   </element>   <element>      <type>inputlong</type>      <label>comentario</label>      <id>2</id>   </element>   <element>      <type>datetime</type>      <id>date</id>      <label>Fecha</label>   </element>   <element>      <type>month</type>      <id>32</id>      <label>Fecha</label>   </element>   <element>      <type>select</type>      <id>321</id>      <label>seleccion</label>      <option>         <value>1</value>         <text>opcion1</text>      </option>      <option>         <value>2</value>         <text>opcion2</text>      </option>   </element>   <element>      <type>link</type>      <id>322</id>      <label>wAnexo</label>      <path>siebel/aa/dd.ppt</path>      <text>Link</text>      <comment>Descargue el archivo para luego anexarlo</comment>   </element></itform>', NULL, 0, 'U548391', '2014-01-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

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

CREATE TABLE IF NOT EXISTS `prefiles_vistas` (
`id` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL,
  `perfil` int(50) NOT NULL,
  `relacion` varchar(255) NOT NULL,
  `vista` int(11) NOT NULL,
  `tipos_eventos` varchar(50) NOT NULL,
  `archivo_descarga` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `preguntas` (
`id` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `detalle` longtext,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

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

CREATE TABLE IF NOT EXISTS `sisdir` (
`id` int(11) NOT NULL,
  `idsistema` int(11) NOT NULL,
  `iddireccion` int(11) NOT NULL,
  `p_pregunta` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sisdir`
--

INSERT INTO `sisdir` (`id`, `idsistema`, `iddireccion`, `p_pregunta`, `estado`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemas`
--

CREATE TABLE IF NOT EXISTS `sistemas` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

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
('fulladm', '2,5', '1,2,4,5,3', 1, 0),
('FEDE', ',5', '3,4', 2, 0),
('U1AG1', ',3', NULL, 5, 0),
('U2AG1', ',3', NULL, 5, 0),
('U1AG2', ',4', NULL, 5, 0),
('COM1', ',2', NULL, 3, 0),
('COMRES', ',2', NULL, 4, 0),
('COMGO', ',1', NULL, 3, 0),
('SP1', ',3', NULL, 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `listines`
--
ALTER TABLE `listines`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `prefiles_vistas`
--
ALTER TABLE `prefiles_vistas`
 ADD PRIMARY KEY (`id`), ADD KEY `perfil` (`perfil`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `listines`
--
ALTER TABLE `listines`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fronts`
--

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
(1, 'DMZ', '::1', 0, 'AGENTES', 0),
(2, 'SHAREPOINT', '::1', 1, 'AGENTES', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancias`
--

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
('COM1', '10.66.93.46', 1, 'a48e94ce15fe500b6d249dd81ab0746d04dbf6c6', '2015-03-05 15:14:45'),
('COMGO', '190.175.110.1', 1, 'bdbb102b38ec6e6ceeb0a81c4bb062ab20912fb2', '2014-11-22 20:11:39'),
('COMRES', '10.112.0.4', 1, '3e434e01511e4c4fe34f1389468794017a77808a', '2014-12-31 10:27:28'),
('FEDE', '10.66.93.46', 1, '5b5ff479ca227827238a3734d4a21770faf2e512', '2014-12-12 12:50:53'),
('FULLADM', '10.66.93.46', 1, '21f66a1d003ce22f75c1dfbcf35d3bd9b50e8c7d', '2015-03-12 16:06:15'),
('U1AG1', '10.66.93.46', 1, '1aa16a9f95cb65d457023df07c72bf88d31b10ee', '2015-03-12 12:48:05'),
('U1AG2', '10.66.93.46', 1, '729fe3be66c2150dce9333a483a0a84ed7be8619', '2015-02-18 14:48:57'),
('U2AG1', '190.175.110.1', 1, '5775975f47bf6c399180e57f7cac0f282f1add12', '2014-11-22 19:23:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ucontac`
--

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
('COM1', 'analistcom@com1.com', '', 'Analist comisiones', '', ''),
('COMRES', 'COMRES@aa.com', '', 'COMRES', '', ''),
('COMGO', 'COMGO@ta.telecom.com.ar', '', 'COMGO', '', ''),
('SP1', 'sp1@aa.copm', '', 'sp11', '', ''),
('FULLADM', 'aa@bb.com', '', 'fulladm', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

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
('SP1', 'SHAREPOINT', NULL, '1,2', 'AGENTES');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fronts`
--
ALTER TABLE `fronts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `instancias`
--
ALTER TABLE `instancias`
 ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
 ADD PRIMARY KEY (`usr`), ADD UNIQUE KEY `hash_UNIQUE` (`hash`);

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
--
-- Base de datos: `itracker_telecomcct_tkt`
--
DROP DATABASE `itracker_telecomcct_tkt`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`id` int(11) NOT NULL,
  `usr` varchar(15) NOT NULL,
  `idmaster` int(11) DEFAULT NULL,
  `origen` varchar(255) DEFAULT NULL,
  `idequipo` int(11) DEFAULT NULL,
  `u_tom` varchar(15) DEFAULT NULL,
  `u_asig` varchar(15) DEFAULT NULL,
  `prioridad` smallint(6) DEFAULT NULL,
  `FA` datetime NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FB` datetime DEFAULT NULL,
  `UB` varchar(15) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=376 ;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `usr`, `idmaster`, `origen`, `idequipo`, `u_tom`, `u_asig`, `prioridad`, `FA`, `UA`, `FB`, `UB`) VALUES
(1, 'U196799', NULL, 'D1-S2-O10-O14-O16-', 1, NULL, '548391', NULL, '2013-09-25 15:48:49', 'U196799', '2013-09-25 15:53:42', 'U199629'),
(2, 'U196799', NULL, 'D1-S2-O11-', 0, NULL, NULL, NULL, '2013-09-25 15:58:11', 'U196799', '2013-09-25 15:58:11', 'U196799'),
(3, 'U199629', 11, 'D1-S2-O8-O12-', 1, '199629', NULL, NULL, '2013-09-25 16:28:27', 'U199629', '2013-10-10 16:08:29', 'U548391'),
(4, 'U196799', NULL, 'D1-S1-O1-O5-O7-', 1, '548391', NULL, NULL, '2013-09-25 17:23:55', 'U196799', '2013-10-03 11:27:46', 'U548391'),
(5, 'U196799', 11, 'D1-S2-O8-O12-', 1, NULL, NULL, NULL, '2013-09-26 11:16:22', 'U196799', '2013-10-10 16:08:29', 'U548391'),
(6, 'U548391', NULL, 'D1-S2-O8-O12-', 2, NULL, NULL, NULL, '2013-09-27 17:36:59', 'U548391', '2014-04-07 16:18:54', 'U1'),
(7, 'U548391', NULL, 'D1-S1-O3-', 2, '548391', NULL, NULL, '2013-09-27 17:37:15', 'U548391', '2014-04-07 16:18:55', 'U1'),
(8, 'U548391', NULL, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:24:35', 'U548391', '2013-10-10 16:44:45', 'U548391'),
(9, 'U548391', 11, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:26:12', 'U548391', '2013-10-10 16:08:29', 'U548391'),
(10, 'U548391', NULL, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:26:23', 'U548391', '2013-10-10 16:21:18', 'U548391'),
(11, 'U548391', NULL, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:26:49', 'U548391', '2013-10-10 16:08:29', 'U548391'),
(12, 'U548391', 10, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:27:00', 'U548391', '2013-10-10 16:21:18', 'U548391'),
(13, 'U548391', 10, 'D1-S2-O8-O12-', 1, NULL, NULL, NULL, '2013-10-01 10:27:17', 'U548391', '2013-10-10 16:21:18', 'U548391'),
(14, 'U548391', NULL, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-01 10:27:28', 'U548391', '2013-10-10 16:47:17', 'U548391'),
(15, 'U548391', 10, 'D1-S2-O8-O12-', 1, NULL, NULL, NULL, '2013-10-01 10:27:37', 'U548391', '2013-10-10 16:21:18', 'U548391'),
(16, 'U548391', 10, 'D1-S2-O8-O12-', 1, NULL, NULL, NULL, '2013-10-01 10:27:47', 'U548391', '2013-10-10 16:21:18', 'U548391'),
(17, 'U548391', NULL, 'D1-S2-O9-O12-', 1, '548391', NULL, 2, '2013-10-02 17:39:41', 'U548391', '2013-11-01 11:57:47', 'U548391'),
(18, 'U548391', 6, 'D1-S2-O8-O12-', 2, NULL, NULL, NULL, '2013-10-03 14:59:03', 'U548391', '2014-04-07 16:18:54', 'U1'),
(19, 'U548391', 6, 'D1-S2-O8-O12-', 2, NULL, NULL, NULL, '2013-10-03 15:10:00', 'U548391', '2014-04-07 16:18:54', 'U1'),
(20, 'U548391', NULL, 'D1-S2-O11-', 0, NULL, NULL, NULL, '2013-10-10 10:50:13', 'U548391', '2013-10-10 10:50:13', 'U548391'),
(21, 'U196798', 17, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-10 17:06:34', 'U196798', '2013-11-01 11:57:47', 'U548391'),
(22, 'U196798', 17, 'D1-S2-O9-O12-', 1, '548391', NULL, NULL, '2013-10-10 17:06:49', 'U196798', '2013-11-01 11:57:47', 'U548391'),
(23, 'U196799', 17, 'D1-S2-O8-O12-', 1, '548391', NULL, NULL, '2013-10-10 17:08:16', 'U196799', '2013-11-01 11:57:47', 'U548391'),
(24, 'U196798', 36, 'D1-S2-O8-O13-O20-', 1, '548391', NULL, NULL, '2013-10-16 10:58:18', 'U196798', '2014-07-11 12:41:42', 'U548391'),
(25, 'U196798', NULL, 'D1-S2-O10-O15-O18-O16-', 1, '548391', NULL, NULL, '2013-10-16 10:58:44', 'U196798', '2013-10-30 12:09:49', 'U548391'),
(26, 'U196798', 127, 'D1-S1-O3-', 1, '548391', NULL, NULL, '2013-10-16 10:58:53', 'U196798', '2013-11-04 11:12:52', 'U548391'),
(27, 'U196798', NULL, 'D1-S1-O2-O5-O6-', 1, '548391', NULL, NULL, '2013-10-16 10:59:31', 'U196798', '2013-10-30 12:08:17', 'U548391'),
(28, 'U196798', NULL, 'D1-S2-O9-O13-O21-', 1, '548391', NULL, NULL, '2013-10-16 10:59:47', 'U196798', '2013-10-30 12:07:41', 'U548391'),
(29, 'U196798', NULL, 'D1-S1-O2-O4-', 1, '196798', NULL, NULL, '2013-10-16 11:00:05', 'U196798', '2013-10-16 12:19:36', 'U196798'),
(30, 'U196798', NULL, 'D1-S2-O9-O13-O20-', 1, '196798', NULL, NULL, '2013-10-16 11:00:23', 'U196798', '2013-10-16 12:37:26', 'U196798'),
(31, 'U196798', NULL, 'D1-S2-O10-O14-O17-', 2, NULL, NULL, NULL, '2013-10-16 11:00:51', 'U196798', '2014-07-11 12:41:42', 'U548391'),
(32, 'U196798', NULL, 'D1-S1-O3-', 1, '548391', NULL, NULL, '2013-10-16 11:01:05', 'U196798', '2013-11-01 15:33:34', 'U548391'),
(33, 'U548391', NULL, 'D1-S2-O8-O13-O20-', 1, NULL, '548391', NULL, '2013-10-18 17:15:42', 'U548391', '2014-04-07 15:46:51', 'U1'),
(34, 'U548391', NULL, 'D1-S1-O3-', 2, '548391', NULL, NULL, '2013-10-18 17:31:05', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(35, 'U548391', 33, 'D1-S2-O9-O12-', 1, NULL, NULL, NULL, '2013-10-21 11:43:33', 'U548391', '2014-04-07 15:46:51', 'U1'),
(36, 'U548391', NULL, 'D1-S2-O8-O12-', 1, NULL, '548391', NULL, '2013-10-21 11:45:59', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(37, 'U548391', NULL, 'D1-S2-O11-', 0, NULL, NULL, NULL, '2013-10-24 12:49:08', 'U548391', '2013-10-24 12:49:08', 'U548391'),
(38, 'U548391', 27, 'D1-S1-O2-O4-', 1, NULL, NULL, NULL, '2013-10-25 14:51:16', 'U548391', '2013-10-30 12:08:17', 'U548391'),
(39, 'U548391', NULL, 'D1-S2-O11-', 1, NULL, NULL, NULL, '2013-10-25 15:14:47', 'U548391', '2013-10-25 15:14:47', 'U548391'),
(40, 'U548391', NULL, 'D1-S2-O11-', 1, NULL, NULL, NULL, '2013-10-25 15:41:01', 'U548391', '2013-10-25 15:41:01', 'U548391'),
(41, 'U548391', NULL, 'D1-S2-O11-', 1, NULL, '548391', NULL, '2013-10-25 15:42:49', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(42, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, '548391', NULL, '2013-10-28 15:15:59', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(43, 'U548391', 42, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-28 16:12:56', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(44, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-28 16:14:30', 'U548391', '2013-10-28 16:14:30', 'U548391'),
(45, 'U548391', NULL, 'D1-S1-O5-O8-', 1, '548391', NULL, NULL, '2013-10-28 16:26:16', 'U548391', '2014-05-26 16:14:20', 'U548391'),
(46, 'U548391', NULL, 'D1-S1-O5-O8-', 5, NULL, NULL, NULL, '2013-10-28 16:29:02', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(47, 'U548391', 46, 'D1-S1-O5-O8-', 5, NULL, NULL, NULL, '2013-10-28 16:33:09', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(48, 'U548391', NULL, 'D1-S2-O18-', 1, NULL, '548391', 3, '2013-10-28 17:30:13', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(49, 'U548391', NULL, 'D1-S3-O4-O8-', 1, NULL, NULL, NULL, '2013-10-29 10:37:31', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(50, 'U548391', NULL, 'D1-S4-O31-O42-', 1, NULL, NULL, NULL, '2013-10-29 15:05:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(51, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, '548391', NULL, '2013-10-29 16:06:37', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(52, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:44:25', 'U548391', '2013-10-29 16:44:25', 'U548391'),
(53, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:45:25', 'U548391', '2013-10-29 16:45:25', 'U548391'),
(54, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:45:37', 'U548391', '2013-10-29 16:45:37', 'U548391'),
(55, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:45:56', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(56, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:47:08', 'U548391', '2013-10-29 16:47:08', 'U548391'),
(57, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2013-10-29 16:47:23', 'U548391', '2013-10-29 16:47:23', 'U548391'),
(58, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-29 16:52:39', 'U548391', '2013-10-29 16:52:39', 'U548391'),
(59, 'U548391', NULL, 'D1-S3-O26-', 1, NULL, NULL, NULL, '2013-10-29 16:56:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(60, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, '548391', NULL, '2013-10-29 16:57:11', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(61, 'U548391', NULL, 'D1-S4-O31-O42-', 1, NULL, NULL, NULL, '2013-10-29 16:57:46', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(62, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-29 17:27:48', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(63, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-30 15:08:47', 'U548391', '2013-10-30 15:08:47', 'U548391'),
(64, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2013-10-30 15:09:11', 'U548391', '2013-10-30 15:09:11', 'U548391'),
(65, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:09:38', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(66, 'U548391', 45, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:13:35', 'U548391', '2014-05-26 16:14:20', 'U548391'),
(67, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:14:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(68, 'U548391', 45, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:16:39', 'U548391', '2014-05-26 16:14:20', 'U548391'),
(69, 'U548391', 45, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:16:41', 'U548391', '2014-05-26 16:14:20', 'U548391'),
(70, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:16:44', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(71, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:16:46', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(72, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:18:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(73, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:20:55', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(74, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:22:13', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(75, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:22:58', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(76, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:23:28', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(77, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:24:24', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(78, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:24:50', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(79, 'U548391', 45, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:26:16', 'U548391', '2014-05-26 16:14:20', 'U548391'),
(80, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:26:23', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(81, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:27:15', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(82, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:27:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(83, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:28:33', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(84, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:29:54', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(85, 'U548391', 80, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:29:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(86, 'U548391', 80, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 15:30:19', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(87, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:31:05', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(88, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:31:19', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(89, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:31:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(90, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:32:54', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(91, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:33:15', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(92, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-30 15:33:33', 'U548391', '2013-10-30 15:33:33', 'U548391'),
(93, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:33:51', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(94, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:35:44', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(95, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:36:08', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(96, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:37:25', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(97, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:37:59', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(98, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:39:01', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(99, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:45:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(100, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:46:28', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(101, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:46:30', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(102, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:47:04', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(103, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:48:07', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(104, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:48:28', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(105, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:53:54', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(106, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:57:09', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(107, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:58:01', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(108, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:58:22', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(109, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 15:59:26', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(110, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 16:02:14', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(111, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 16:03:46', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(112, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-10-30 16:04:42', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(113, 'U548391', 71, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:04:59', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(114, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:07:37', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(115, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:09:33', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(116, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:10:55', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(117, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:11:33', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(118, 'U548391', 71, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:11:58', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(119, 'U548391', 71, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:13:51', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(120, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-10-30 16:16:12', 'U548391', '2013-10-30 16:16:12', 'U548391'),
(121, 'U548391', 17, 'D1-S2-O17-', 1, '548391', NULL, NULL, '2013-10-30 16:16:27', 'U548391', '2013-11-01 11:57:47', 'U548391'),
(122, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:16:52', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(123, 'U548391', 42, 'D1-S1-O3-O6-O11-', 1, NULL, NULL, NULL, '2013-10-30 16:19:00', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(124, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2013-10-30 16:23:02', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(125, 'U548391', NULL, 'D1-S2-O16-', 1, '548391', NULL, NULL, '2013-11-01 10:04:57', 'U548391', '2013-11-01 10:09:31', 'U548391'),
(126, 'U548391', NULL, 'D1-S2-O19-O22-O23-', 1, '548391', NULL, NULL, '2013-11-01 10:27:36', 'U548391', '2013-11-05 17:01:48', 'U548391'),
(204, 'U548391', 199, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-05-26 16:33:47', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(127, 'U548391', NULL, 'D1-S1-O3-O7-O13-', 1, '548391', NULL, NULL, '2013-11-01 17:09:48', 'U548391', '2013-11-04 11:12:52', 'U548391'),
(128, 'U548391', 46, 'D1-S1-O3-O6-O10-', 5, NULL, NULL, NULL, '2013-11-01 17:17:46', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(129, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 09:52:33', 'U548391', '2013-11-04 09:52:33', 'U548391'),
(130, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 09:54:55', 'U548391', '2013-11-04 09:54:55', 'U548391'),
(131, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2013-11-04 09:55:21', 'U548391', '2013-11-04 09:55:21', 'U548391'),
(132, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2013-11-04 10:03:28', 'U548391', '2013-11-04 10:03:28', 'U548391'),
(133, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:05:29', 'U548391', '2013-11-04 10:05:29', 'U548391'),
(134, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:06:06', 'U548391', '2013-11-04 10:06:06', 'U548391'),
(135, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:07:35', 'U548391', '2013-11-04 10:07:35', 'U548391'),
(136, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:08:15', 'U548391', '2013-11-04 10:08:15', 'U548391'),
(137, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:08:27', 'U548391', '2013-11-04 10:08:27', 'U548391'),
(138, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:09:03', 'U548391', '2013-11-04 10:09:03', 'U548391'),
(139, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:09:19', 'U548391', '2013-11-04 10:09:19', 'U548391'),
(140, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:11:23', 'U548391', '2013-11-04 10:11:23', 'U548391'),
(141, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:11:51', 'U548391', '2013-11-04 10:11:51', 'U548391'),
(142, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:11:56', 'U548391', '2013-11-04 10:11:56', 'U548391'),
(143, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:12:19', 'U548391', '2013-11-04 10:12:19', 'U548391'),
(144, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:13:14', 'U548391', '2013-11-04 10:13:14', 'U548391'),
(145, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:13:34', 'U548391', '2013-11-04 10:13:34', 'U548391'),
(146, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:13:45', 'U548391', '2013-11-04 10:13:45', 'U548391'),
(147, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:14:18', 'U548391', '2013-11-04 10:14:18', 'U548391'),
(148, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:15:04', 'U548391', '2013-11-04 10:15:04', 'U548391'),
(149, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:15:33', 'U548391', '2013-11-04 10:15:33', 'U548391'),
(150, 'U548391', NULL, 'D1-S2-O16-', 1, '548391', NULL, NULL, '2013-11-04 10:17:45', 'U548391', '2014-04-07 15:46:53', 'U1'),
(151, 'U548391', NULL, 'D1-S2-O17-', 1, '548391', NULL, NULL, '2013-11-04 10:18:30', 'U548391', '2014-04-30 17:13:14', 'U548391'),
(152, 'U548391', NULL, 'D1-S2-O17-', 1, '548391', NULL, NULL, '2013-11-04 10:19:41', 'U548391', '2014-04-07 15:46:58', 'U1'),
(153, 'U548391', NULL, 'D1-S2-O16-', 1, '548391', NULL, NULL, '2013-11-04 10:20:09', 'U548391', '2013-11-21 09:41:19', 'U548391'),
(154, 'U548391', NULL, 'D1-S2-O16-', 1, '548391', NULL, NULL, '2013-11-04 10:22:54', 'U548391', '2013-11-21 09:39:06', 'U548391'),
(155, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:23:16', 'U548391', '2013-11-04 10:23:16', 'U548391'),
(156, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 10:24:14', 'U548391', '2013-11-04 10:24:14', 'U548391'),
(157, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, NULL, NULL, '2013-11-04 10:24:34', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(158, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, '548391', NULL, '2013-11-04 10:48:13', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(159, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, NULL, NULL, '2013-11-04 10:49:40', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(160, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, '548391', NULL, '2013-11-04 10:54:03', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(161, 'U548391', NULL, 'D1-S2-O17-', 1, '188353', NULL, NULL, '2013-11-04 10:55:00', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(162, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 10:55:39', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(163, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 10:58:32', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(164, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:00:24', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(165, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:01:01', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(166, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:02:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(167, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, NULL, NULL, '2013-11-04 11:03:29', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(168, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, '548391', NULL, '2013-11-04 11:03:57', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(169, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:04:51', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(170, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:05:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(171, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:06:27', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(172, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:07:08', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(173, 'U548391', NULL, 'D1-S2-O17-', 1, '188353', NULL, NULL, '2013-11-04 11:08:16', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(174, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:09:21', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(175, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:09:49', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(176, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:10:05', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(177, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 11:11:00', 'U548391', '2013-11-04 11:11:00', 'U548391'),
(178, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, '548391', NULL, '2013-11-04 11:11:10', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(179, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-04 11:44:00', 'U548391', '2013-11-04 11:44:00', 'U548391'),
(180, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2013-11-04 11:44:08', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(181, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-18 10:33:24', 'U548391', '2013-11-18 10:33:24', 'U548391'),
(182, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2013-11-18 10:33:34', 'U548391', '2013-11-18 10:33:34', 'U548391'),
(183, 'U548391', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2013-11-18 10:33:43', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(184, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2013-11-18 10:44:01', 'U548391', '2013-11-18 10:44:01', 'U548391'),
(185, 'U548391', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2013-11-18 10:44:14', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(186, 'U188353', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2013-11-22 11:43:50', 'U188353', '2014-07-11 12:41:42', 'U548391'),
(200, 'U548391', NULL, 'D1-S4-O32-O45-O47-', 2, NULL, NULL, NULL, '2014-05-15 16:21:27', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(187, 'U548391', 46, 'D1-S1-O4-O8-', 5, NULL, NULL, NULL, '2013-11-26 11:37:48', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(188, 'U548391', NULL, 'D1-S2-O20-O21-', 1, NULL, NULL, NULL, '2013-11-26 12:04:40', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(189, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, NULL, NULL, '2013-12-17 10:00:24', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(190, 'U548391', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-01-13 12:08:53', 'U548391', '2014-01-13 12:08:53', 'U548391'),
(191, 'U548391', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-01-24 11:45:04', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(192, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2014-01-28 14:51:07', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(193, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, NULL, NULL, '2014-01-28 14:52:43', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(194, 'U548391', NULL, 'D1-S2-O17-', 1, NULL, '548391', NULL, '2014-01-28 14:53:04', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(195, 'U548391', NULL, 'D1-S2-O16-', 1, NULL, NULL, NULL, '2014-01-28 14:55:50', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(196, 'U548391', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-01-31 09:48:43', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(197, 'U548391', NULL, 'D1-S1-O4-O8-', 1, NULL, '548391', NULL, '2014-02-04 10:22:27', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(198, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-02-04 10:41:47', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(199, 'U548391', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-02-04 10:43:41', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(201, 'U548391', NULL, 'D1-S1-O3-O7-O13-', 1, NULL, '548391', NULL, '2014-05-21 15:07:04', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(202, 'U548391', NULL, 'D1-S2-O18-', 1, NULL, NULL, NULL, '2014-05-21 15:24:13', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(203, 'U548391', NULL, 'D1-S2-O20-O21-', 1, NULL, NULL, NULL, '2014-05-21 15:27:18', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(205, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, NULL, NULL, '2014-06-04 12:34:23', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(206, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-06-04 12:37:04', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(207, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, NULL, NULL, '2014-06-04 12:38:58', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(208, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, NULL, NULL, '2014-06-04 12:39:56', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(209, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, '548391', NULL, '2014-06-04 12:44:19', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(210, 'U548391', NULL, 'D1-S3-O28-', 1, NULL, NULL, NULL, '2014-06-04 16:44:38', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(211, 'U548391', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-06-05 14:39:23', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(212, 'U548391', 197, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-06-05 14:56:48', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(213, 'U548391', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-06-05 15:06:00', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(214, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-06-17 17:28:19', 'U548391', '2014-06-17 17:28:20', 'U548391'),
(215, 'U548391', NULL, 'D1-S4-O32-O45-O47-', 1, NULL, NULL, NULL, '2014-06-17 17:29:52', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(216, 'U548391', NULL, 'D1-S3-O27-', 1, NULL, NULL, NULL, '2014-06-18 10:18:24', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(217, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-08 14:51:14', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(218, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-08 15:13:13', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(219, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-08 15:21:46', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(220, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-10 10:18:18', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(221, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:09:14', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(222, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:10:35', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(223, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:11:22', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(224, 'U548391', 186, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:12:47', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(225, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:14:58', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(226, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-07-11 11:26:05', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(227, 'U548391', 51, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 11:26:42', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(228, 'U548391', NULL, 'D1-S1-O3-O6-O11-', 2, NULL, NULL, NULL, '2014-07-11 11:34:27', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(229, 'U548391', NULL, 'D1-S1-O3-O6-O11-', 1, NULL, NULL, NULL, '2014-07-11 11:35:06', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(230, 'U548391', 206, 'D1-S1-O3-O6-O11-', 1, NULL, NULL, NULL, '2014-07-11 11:49:01', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(231, 'U548391', 71, 'D1-S1-O3-O6-O11-', 1, NULL, NULL, NULL, '2014-07-11 11:51:05', 'U548391', '2014-07-11 12:41:42', 'U548391'),
(232, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, '548391', NULL, NULL, '2014-07-11 12:52:09', 'U548391', NULL, 'U2147483647'),
(233, 'U548391', 232, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-07-11 12:55:23', 'U548391', NULL, 'U2147483647'),
(234, 'U199629', 232, 'D1-S1-O3-O6-O10-', 1, '548391', NULL, NULL, '2014-07-11 12:56:22', 'U199629', NULL, 'U2147483647'),
(235, 'U548391', 232, 'D1-S1-O3-O6-O11-', 1, '548391', NULL, NULL, '2014-07-11 13:24:57', 'U548391', NULL, 'U2147483647'),
(236, 'U199629', NULL, 'D1-S1-O3-O6-O11-', 2, '199629', NULL, NULL, '2014-07-11 13:25:41', 'U199629', '2014-09-11 14:55:13', 'U199629'),
(237, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 1, NULL, NULL, NULL, '2014-07-11 13:26:23', 'U548391', NULL, 'U2147483647'),
(238, 'U199629', NULL, 'D1-S1-O3-O7-O12-', 2, NULL, NULL, NULL, '2014-07-11 13:26:51', 'U199629', NULL, 'U2147483647'),
(239, 'U548391', NULL, 'D1-S1-O3-O6-O10-', 1, '548391', NULL, NULL, '2014-07-11 15:28:17', 'U548391', NULL, 'U2147483647'),
(240, 'U548391', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-07-11 15:49:52', 'U548391', '2014-07-11 15:49:52', 'U548391'),
(241, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 1, NULL, NULL, NULL, '2014-08-14 10:02:31', 'U548391', NULL, 'U2147483647'),
(242, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 2, '199629', NULL, NULL, '2014-08-14 10:03:24', 'U548391', NULL, 'U2147483647'),
(243, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 1, '548391', NULL, NULL, '2014-08-14 10:04:14', 'U548391', '2014-09-03 12:05:36', 'U548391'),
(244, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 2, '199629', NULL, NULL, '2014-08-14 10:04:48', 'U548391', '2014-09-11 14:51:23', 'U199629'),
(245, 'U548391', NULL, 'D1-S1-O3-O7-O13-', 1, NULL, NULL, NULL, '2014-09-03 12:04:58', 'U548391', NULL, 'U2147483647'),
(246, 'U548391', NULL, 'D1-S2-O18-', 1, NULL, NULL, NULL, '2014-09-05 13:20:17', 'U548391', NULL, 'U2147483647'),
(247, 'U548391', NULL, 'D1-S3-O25-', 1, '548391', NULL, NULL, '2014-09-05 13:22:43', 'U548391', '2014-09-11 15:13:48', 'U548391'),
(248, 'U199629', 247, 'D1-S3-O26-', 1, '548391', NULL, NULL, '2014-09-10 10:36:04', 'U199629', '2014-09-11 15:13:48', 'U548391'),
(249, 'U199629', NULL, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-09-11 11:15:01', 'U199629', NULL, 'U2147483647'),
(250, 'U548391', NULL, 'D1-S1-O4-O8-', 1, '548391', NULL, NULL, '2014-09-11 12:05:28', 'U548391', '2014-09-11 12:30:33', 'U548391'),
(251, 'U199629', 250, 'D1-S1-O4-O8-', 1, NULL, NULL, NULL, '2014-09-11 12:12:09', 'U199629', '2014-09-11 12:30:33', 'U548391'),
(252, 'U123456', NULL, 'D1-S1-O3-O7-O13-', 2, '196798', NULL, NULL, '2014-09-11 16:18:17', 'U123456', NULL, NULL),
(253, 'U186462', NULL, 'D1-S1-O3-O6-O10-', 1, '548391', NULL, NULL, '2014-09-11 16:21:39', 'U186462', '2014-09-11 16:40:39', 'U548391'),
(254, 'U123456', 253, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-09-11 16:24:39', 'U123456', '2014-09-11 16:40:39', 'U548391'),
(255, 'U123456', NULL, 'D1-S1-O3-O7-O12-', 2, NULL, NULL, NULL, '2014-09-11 16:26:17', 'U123456', NULL, NULL),
(256, 'U199629', NULL, 'D1-S4-O31-O42-', 2, NULL, NULL, NULL, '2014-09-12 15:10:38', 'U199629', NULL, NULL),
(258, 'U548391', NULL, 'D1-S1-O4-O9-O15-', 1, '548391', NULL, NULL, '2014-09-12 15:56:23', 'U548391', '2014-09-15 17:01:26', 'U548391'),
(257, 'U548391', NULL, 'D1-S1-O3-O7-O12-', 2, '196798', NULL, NULL, '2014-09-12 15:38:07', 'U548391', NULL, NULL),
(259, 'U196798', NULL, 'D1-S1-O5-O8-', 1, '548391', NULL, NULL, '2014-09-12 17:15:53', 'U196798', '2014-09-15 17:09:29', 'U548391'),
(260, 'U196798', NULL, 'D1-S1-O3-O7-O13-', 1, '548391', NULL, NULL, '2014-09-12 19:30:47', 'U196798', '2014-09-15 17:12:47', 'U548391'),
(261, 'U548391', NULL, 'D1-S3-O25-', 2, NULL, NULL, NULL, '2014-09-15 15:00:11', 'U548391', NULL, NULL),
(262, 'U548391', NULL, 'D1-S3-O27-', 1, '548391', NULL, NULL, '2014-09-15 17:16:55', 'U548391', '2014-09-15 17:17:43', 'U548391'),
(263, 'U548391', NULL, 'D1-S3-O28-', 1, '548391', NULL, NULL, '2014-09-15 17:34:33', 'U548391', NULL, NULL),
(264, 'U548391', NULL, 'D1-S2-O18-', 1, '548391', NULL, NULL, '2014-09-16 17:00:24', 'U548391', '2014-09-16 17:00:55', 'U548391'),
(265, 'U548391', NULL, 'D1-S3-O26-', 1, NULL, NULL, NULL, '2014-09-22 15:18:21', 'U548391', NULL, NULL),
(266, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 14:44:25', 'IT1', NULL, NULL),
(267, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 14:45:41', 'IT1', NULL, NULL),
(268, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 14:55:17', 'IT1', NULL, NULL),
(269, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:08:15', 'IT1', NULL, NULL),
(270, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:14:06', 'IT1', NULL, NULL),
(271, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:15:15', 'IT1', NULL, NULL),
(272, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:16:06', 'IT1', NULL, NULL),
(273, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:18:24', 'IT1', NULL, NULL),
(274, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:20:31', 'IT1', NULL, NULL),
(275, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:20:58', 'IT1', NULL, NULL),
(276, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:22:59', 'IT1', NULL, NULL),
(277, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:24:00', 'IT1', NULL, NULL),
(278, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:24:12', 'IT1', NULL, NULL),
(279, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:24:46', 'IT1', NULL, NULL),
(280, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:25:49', 'IT1', NULL, NULL),
(281, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:26:07', 'IT1', NULL, NULL),
(282, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:27:18', 'IT1', NULL, NULL),
(283, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:42:39', 'IT1', NULL, NULL),
(284, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 15:44:33', 'IT1', NULL, NULL),
(285, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 20:03:49', 'IT1', NULL, NULL),
(286, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 20:04:37', 'IT1', NULL, NULL),
(287, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 22:54:48', 'IT1', NULL, NULL),
(288, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 22:55:15', 'IT1', NULL, NULL),
(289, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-12 22:57:37', 'IT1', NULL, NULL),
(290, 'IT1', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-11-12 23:39:58', 'IT1', NULL, NULL),
(291, 'IT1', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-11-12 23:41:29', 'IT1', NULL, NULL),
(292, 'IT1', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-11-12 23:42:32', 'IT1', NULL, NULL),
(293, 'IT1', NULL, 'D1-S1-O1-', 1, NULL, NULL, NULL, '2014-11-13 07:24:12', 'IT1', NULL, NULL),
(294, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 07:42:24', 'IT1', NULL, NULL),
(295, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 07:42:44', 'IT1', NULL, NULL),
(296, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 07:44:50', 'IT1', NULL, NULL),
(297, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 11:41:02', 'IT1', NULL, NULL),
(298, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 11:41:52', 'IT1', NULL, NULL),
(299, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 11:47:17', 'IT1', NULL, NULL),
(300, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 11:48:26', 'IT1', NULL, NULL),
(301, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:03:50', 'IT1', NULL, NULL),
(302, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:05:22', 'IT1', NULL, NULL),
(303, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:06:02', 'IT1', NULL, NULL),
(304, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:07:09', 'IT1', NULL, NULL),
(305, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:08:40', 'IT1', NULL, NULL),
(306, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:09:17', 'IT1', NULL, NULL),
(307, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:09:57', 'IT1', NULL, NULL),
(308, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:11:42', 'IT1', NULL, NULL),
(309, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:12:26', 'IT1', NULL, NULL),
(310, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:13:12', 'IT1', NULL, NULL),
(311, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:15:10', 'IT1', NULL, NULL),
(312, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:16:15', 'IT1', NULL, NULL),
(313, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:19:15', 'IT1', NULL, NULL),
(314, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:19:57', 'IT1', NULL, NULL),
(315, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:22:08', 'IT1', NULL, NULL),
(316, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 12:23:46', 'IT1', NULL, NULL),
(317, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:09:32', 'IT1', NULL, NULL),
(318, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:11:33', 'IT1', NULL, NULL),
(319, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:12:14', 'IT1', NULL, NULL),
(320, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:14:13', 'IT1', NULL, NULL),
(321, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:16:13', 'IT1', NULL, NULL),
(322, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:17:30', 'IT1', NULL, NULL),
(323, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:19:01', 'IT1', NULL, NULL),
(324, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:20:41', 'IT1', NULL, NULL),
(325, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:21:56', 'IT1', NULL, NULL),
(326, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:25:36', 'IT1', NULL, NULL),
(327, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:28:44', 'IT1', NULL, NULL),
(328, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:29:53', 'IT1', NULL, NULL),
(329, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:30:43', 'IT1', NULL, NULL),
(330, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:46:44', 'IT1', NULL, NULL),
(331, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:47:20', 'IT1', NULL, NULL),
(332, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:47:44', 'IT1', NULL, NULL),
(333, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:48:05', 'IT1', NULL, NULL),
(334, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:49:52', 'IT1', NULL, NULL),
(335, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:50:59', 'IT1', NULL, NULL),
(336, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:52:12', 'IT1', NULL, NULL),
(337, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:58:45', 'IT1', NULL, NULL),
(338, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 13:59:52', 'IT1', NULL, NULL),
(339, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 14:00:08', 'IT1', NULL, NULL),
(340, 'IT1', NULL, 'D1-S5-O53-O55-', 1, NULL, NULL, NULL, '2014-11-13 14:19:29', 'IT1', NULL, NULL),
(341, 'IT1', NULL, 'D1-S6-O68-', 1, NULL, NULL, NULL, '2014-11-13 14:25:15', 'IT1', '2014-11-02 00:00:00', 'U548391'),
(342, 'IT1', NULL, 'D1-S4-O31-O41-O43-', 1, NULL, NULL, NULL, '2014-11-17 17:36:45', 'IT1', NULL, NULL),
(343, 'IT1', NULL, 'D1-S4-O31-O41-O43-', 1, NULL, NULL, NULL, '2014-11-17 17:37:12', 'IT1', NULL, NULL),
(344, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 09:20:33', 'IT1', NULL, NULL),
(345, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 09:43:44', 'IT1', '2014-11-18 09:43:44', 'IT1'),
(346, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 09:44:10', 'IT1', '2014-11-18 09:44:10', 'IT1'),
(347, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:12:35', 'IT1', '2014-11-18 10:12:35', 'IT1'),
(348, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:19:02', 'IT1', '2014-11-18 10:19:02', 'IT1'),
(349, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:20:41', 'IT1', '2014-11-18 10:20:41', 'IT1'),
(350, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:22:22', 'IT1', '2014-11-18 10:22:22', 'IT1'),
(351, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:25:02', 'IT1', '2014-11-18 10:25:02', 'IT1'),
(352, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:26:50', 'IT1', '2014-11-18 10:26:50', 'IT1'),
(353, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:28:05', 'IT1', '2014-11-18 10:28:05', 'IT1'),
(354, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:33:14', 'IT1', '2014-11-18 10:33:14', 'IT1'),
(355, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:35:25', 'IT1', '2014-11-18 10:35:25', 'IT1'),
(356, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:36:04', 'IT1', '2014-11-18 10:36:05', 'IT1'),
(357, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:38:16', 'IT1', '2014-11-18 10:38:17', 'IT1'),
(358, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 10:39:18', 'IT1', '2014-11-18 10:39:18', 'IT1'),
(359, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:40:20', 'IT1', NULL, NULL),
(360, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:43:54', 'IT1', NULL, NULL),
(361, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:46:42', 'IT1', NULL, NULL),
(362, 'IT1', NULL, 'D1-S1-O3-O7-O12-', 2, NULL, NULL, NULL, '2014-11-18 10:49:06', 'IT1', NULL, NULL),
(363, 'IT1', NULL, 'D1-S1-O3-O7-O13-', 1, NULL, NULL, NULL, '2014-11-18 10:51:02', 'IT1', NULL, NULL),
(364, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:53:40', 'IT1', NULL, NULL),
(365, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:56:55', 'IT1', NULL, NULL),
(366, 'IT1', NULL, 'D1-S1-O3-O7-O12-', 2, NULL, NULL, NULL, '2014-11-18 10:58:17', 'IT1', NULL, NULL),
(367, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 10:59:45', 'IT1', NULL, NULL),
(368, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 11:01:27', 'IT1', NULL, NULL),
(369, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 11:05:35', 'IT1', NULL, NULL),
(370, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 11:07:24', 'IT1', NULL, NULL),
(371, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, NULL, NULL, NULL, '2014-11-18 11:10:21', 'IT1', NULL, NULL),
(372, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 1, NULL, NULL, NULL, '2014-11-18 12:00:07', 'IT1', NULL, NULL),
(373, 'IT1', NULL, 'D1-S1-O2-', 1, NULL, NULL, NULL, '2014-11-18 12:41:51', 'IT1', '2014-11-18 12:41:51', 'IT1'),
(374, 'IT1', NULL, 'D1-S1-O3-O6-O10-', 2, 'IT1', NULL, NULL, '2014-11-18 14:32:09', 'IT1', NULL, NULL),
(375, 'IT1', NULL, 'D1-S1-O3-O7-O13-', 1, 'IT1', NULL, NULL, '2014-11-18 15:14:52', 'IT1', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1147 ;

--
-- Volcado de datos para la tabla `tickets_m`
--

INSERT INTO `tickets_m` (`id`, `idtkt`, `idaccion`, `valoraccion`, `FA`, `UA`, `FB`, `UB`, `estado`) VALUES
(1, 1, 1, '1', '2013-09-25 15:48:49', 'U196799', '2013-09-25 15:52:05', 'U199629', 0),
(2, 1, 5, '0', '2013-09-25 15:52:05', 'U199629', '2013-09-25 15:53:09', 'U199629', 0),
(3, 1, 10, '0', '2013-09-25 15:53:09', 'U199629', '2013-09-25 15:53:42', 'U199629', 0),
(4, 1, 3, '14', '2013-09-25 15:53:42', 'U199629', '2014-01-28 14:36:38', 'U548391', 0),
(5, 2, 1, '0', '2013-09-25 15:58:11', 'U196799', '2013-09-25 15:58:11', 'U196799', 0),
(6, 2, 2, '0', '2013-09-25 15:58:11', 'U196799', NULL, NULL, 0),
(7, 3, 1, '1', '2013-09-25 16:28:27', 'U199629', '2013-09-25 16:28:33', 'U199629', 0),
(8, 3, 5, '0', '2013-09-25 16:28:33', 'U199629', '2013-09-25 16:29:04', 'U199629', 0),
(9, 3, 17, '145', '2013-09-25 16:29:04', 'U199629', '2013-10-07 16:01:12', 'U548391', 0),
(10, 4, 1, '1', '2013-09-25 17:23:55', 'U196799', '2013-09-25 17:32:11', 'U196799', 0),
(11, 4, 13, '0', '2013-09-25 17:32:11', 'U196799', '2013-09-26 11:36:56', 'U548391', 0),
(12, 5, 1, '1', '2013-09-26 11:16:23', 'U196799', '2013-09-26 11:16:23', 'U196799', 0),
(13, 5, 14, '3', '2013-09-26 11:16:23', 'U196799', '2013-09-26 11:17:58', 'U548391', 0),
(14, 5, 19, '7777', '2013-09-26 11:17:58', 'U548391', '2013-09-26 11:18:09', 'U548391', 0),
(15, 5, 10, '0', '2013-09-26 11:18:09', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(16, 4, 21, '4565', '2013-09-26 11:36:56', 'U548391', '2013-09-26 11:36:58', 'U548391', 0),
(17, 4, 10, '0', '2013-09-26 11:36:58', 'U548391', '2013-09-26 11:52:53', 'U548391', 0),
(18, 4, 10, '0', '2013-09-26 11:52:53', 'U548391', '2013-09-26 11:53:21', 'U548391', 0),
(19, 4, 17, '45567', '2013-09-26 11:53:21', 'U548391', '2013-09-26 11:54:35', 'U548391', 0),
(20, 4, 17, '343254', '2013-09-26 11:54:35', 'U548391', '2013-09-26 11:55:18', 'U548391', 0),
(21, 4, 17, '34325455', '2013-09-26 11:55:18', 'U548391', '2013-09-26 11:55:22', 'U548391', 0),
(22, 4, 10, '0', '2013-09-26 11:55:22', 'U548391', '2013-09-26 11:56:19', 'U548391', 0),
(23, 4, 18, '546', '2013-09-26 11:56:19', 'U548391', '2013-09-26 11:56:19', 'U548391', 0),
(24, 4, 10, '0', '2013-09-26 11:56:19', 'U548391', '2013-09-26 12:14:50', 'U548391', 0),
(25, 4, 17, '56', '2013-09-26 12:14:50', 'U548391', '2013-09-26 12:15:03', 'U548391', 0),
(26, 4, 17, '56', '2013-09-26 12:15:03', 'U548391', '2013-09-26 12:15:09', 'U548391', 0),
(27, 4, 17, '56', '2013-09-26 12:15:09', 'U548391', '2013-09-26 12:17:29', 'U548391', 0),
(28, 4, 17, '57', '2013-09-26 12:17:29', 'U548391', '2013-09-26 12:17:42', 'U548391', 0),
(29, 4, 17, '5688', '2013-09-26 12:17:42', 'U548391', '2013-09-26 12:31:54', 'U548391', 0),
(30, 4, 17, '11111', '2013-09-26 12:31:54', 'U548391', '2013-09-26 12:32:01', 'U548391', 0),
(31, 4, 10, '0', '2013-09-26 12:32:01', 'U548391', '2013-09-27 10:59:32', 'U548391', 0),
(32, 4, 5, '0', '2013-09-27 10:59:33', 'U548391', '2013-10-01 11:34:41', 'U548391', 0),
(33, 6, 1, '1', '2013-09-27 17:36:59', 'U548391', '2013-09-30 11:05:38', 'U548391', 0),
(34, 7, 1, '1', '2013-09-27 17:37:15', 'U548391', '2013-09-30 15:57:08', 'U548391', 0),
(35, 6, 5, '0', '2013-09-30 11:05:38', 'U548391', '2013-10-01 15:17:03', 'U548391', 0),
(36, 7, 5, '0', '2013-09-30 15:57:08', 'U548391', '2013-09-30 15:57:42', 'U548391', 0),
(37, 7, 4, '2', '2013-09-30 15:57:42', 'U548391', '2013-09-30 15:58:00', 'U548391', 0),
(38, 7, 13, '0', '2013-09-30 15:58:00', 'U548391', '2013-10-22 17:10:09', 'U548391', 0),
(39, 8, 1, '1', '2013-10-01 10:24:35', 'U548391', '2013-10-01 10:24:35', 'U548391', 0),
(40, 8, 14, '3', '2013-10-01 10:24:35', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(41, 9, 1, '1', '2013-10-01 10:26:12', 'U548391', '2013-10-01 10:26:12', 'U548391', 0),
(42, 9, 14, '3', '2013-10-01 10:26:12', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(43, 10, 1, '1', '2013-10-01 10:26:23', 'U548391', '2013-10-01 10:26:23', 'U548391', 0),
(44, 10, 14, '3', '2013-10-01 10:26:23', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(45, 11, 1, '1', '2013-10-01 10:26:49', 'U548391', '2013-10-01 10:26:49', 'U548391', 0),
(46, 11, 14, '3', '2013-10-01 10:26:49', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(47, 12, 1, '1', '2013-10-01 10:27:00', 'U548391', '2013-10-01 10:27:00', 'U548391', 0),
(48, 12, 14, '3', '2013-10-01 10:27:00', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(49, 13, 1, '1', '2013-10-01 10:27:17', 'U548391', '2013-10-01 10:27:17', 'U548391', 0),
(50, 13, 14, '3', '2013-10-01 10:27:17', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(51, 14, 1, '1', '2013-10-01 10:27:28', 'U548391', '2013-10-01 10:27:28', 'U548391', 0),
(52, 14, 14, '3', '2013-10-01 10:27:28', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(53, 15, 1, '1', '2013-10-01 10:27:37', 'U548391', '2013-10-01 10:27:37', 'U548391', 0),
(54, 15, 14, '3', '2013-10-01 10:27:37', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(55, 16, 1, '1', '2013-10-01 10:27:47', 'U548391', '2013-10-01 10:27:47', 'U548391', 0),
(56, 16, 14, '3', '2013-10-01 10:27:47', 'U548391', '2013-10-07 16:01:12', 'U548391', 0),
(57, 4, 10, '0', '2013-10-01 11:34:41', 'U548391', '2013-10-01 11:45:56', 'U548391', 0),
(58, 4, 10, '0', '2013-10-01 11:45:56', 'U548391', '2013-10-01 11:47:30', 'U548391', 0),
(59, 4, 10, '0', '2013-10-01 11:47:30', 'U548391', '2013-10-01 11:48:05', 'U548391', 0),
(60, 4, 10, '0', '2013-10-01 11:48:05', 'U548391', '2013-10-01 11:49:25', 'U548391', 0),
(61, 4, 10, '0', '2013-10-01 11:49:25', 'U548391', '2013-10-01 11:49:42', 'U548391', 0),
(62, 4, 10, '0', '2013-10-01 11:49:42', 'U548391', '2013-10-01 14:46:25', 'U548391', 0),
(63, 4, 10, '0', '2013-10-01 14:46:25', 'U548391', '2013-10-01 15:12:55', 'U548391', 0),
(64, 4, 10, '0', '2013-10-01 15:12:55', 'U548391', '2013-10-01 15:13:18', 'U548391', 0),
(65, 4, 10, '0', '2013-10-01 15:13:18', 'U548391', '2013-10-01 15:14:17', 'U548391', 0),
(66, 4, 10, '0', '2013-10-01 15:14:17', 'U548391', '2013-10-01 15:50:56', 'U548391', 0),
(67, 6, 10, '0', '2013-10-01 15:17:03', 'U548391', '2013-10-01 15:49:55', 'U548391', 0),
(68, 6, 10, '0', '2013-10-01 15:49:55', 'U548391', '2013-10-01 16:27:48', 'U548391', 0),
(69, 4, 10, '0', '2013-10-01 15:50:56', 'U548391', '2013-10-01 16:27:13', 'U548391', 0),
(70, 4, 10, '0', '2013-10-01 16:27:13', 'U548391', '2013-10-01 16:42:12', 'U548391', 0),
(71, 6, 10, '0', '2013-10-01 16:27:48', 'U548391', '2013-10-01 16:28:03', 'U548391', 0),
(72, 6, 18, '4578', '2013-10-01 16:30:51', 'U548391', '2013-10-01 16:31:54', 'U548391', 0),
(73, 6, 19, '145', '2013-10-01 16:31:54', 'U548391', '2013-10-01 16:43:50', 'U548391', 0),
(74, 4, 11, '0', '2013-10-01 16:42:12', 'U548391', '2013-10-01 16:42:24', 'U548391', 0),
(75, 4, 19, '4568', '2013-10-01 16:42:24', 'U548391', '2013-10-03 11:06:49', 'U548391', 0),
(76, 6, 10, '0', '2013-10-01 16:43:50', 'U548391', '2013-10-01 16:44:02', 'U548391', 0),
(77, 6, 10, '0', '2013-10-01 16:44:02', 'U548391', '2013-10-01 16:44:07', 'U548391', 0),
(78, 6, 17, '4578', '2013-10-01 16:44:07', 'U548391', '2013-10-01 16:44:14', 'U548391', 0),
(79, 6, 17, '77', '2013-10-01 16:44:14', 'U548391', '2013-10-01 16:46:11', 'U548391', 0),
(80, 6, 16, '0', '2013-10-01 16:46:11', 'U548391', '2013-10-01 16:53:09', 'U548391', 0),
(81, 6, 10, '0', '2013-10-01 16:53:09', 'U548391', '2013-10-03 11:03:21', 'U548391', 0),
(82, 17, 1, '1', '2013-10-02 17:39:41', 'U548391', '2013-10-02 17:47:02', 'U548391', 0),
(83, 17, 5, '0', '2013-10-02 17:47:02', 'U548391', '2013-10-02 17:56:06', 'U548391', 0),
(84, 17, 3, '50', '2013-10-02 17:56:06', 'U548391', '2013-10-10 16:46:59', 'U548391', 0),
(85, 6, 4, '2', '2013-10-03 11:03:21', 'U548391', '2013-10-03 11:03:40', 'U548391', 0),
(86, 6, 17, '45', '2013-10-03 11:03:40', 'U548391', '2013-10-18 17:33:39', 'U548391', 0),
(87, 4, 9, '0', '2013-10-03 11:06:49', 'U548391', '2013-10-03 11:07:02', 'U548391', 0),
(88, 4, 10, '0', '2013-10-03 11:07:02', 'U548391', '2013-10-03 11:27:46', 'U548391', 0),
(89, 4, 2, '0', '2013-10-03 11:27:46', 'U548391', '2013-10-03 11:27:59', 'U548391', 0),
(90, 4, 16, '0', '2013-10-03 11:27:59', 'U548391', NULL, NULL, 0),
(91, 18, 1, '1', '2013-10-03 14:59:03', 'U548391', '2013-10-03 14:59:03', 'U548391', 0),
(92, 18, 4, '2', '2013-10-03 14:59:03', 'U548391', '2013-10-03 14:59:03', 'U548391', 0),
(93, 18, 14, '6', '2013-10-03 14:59:03', 'U548391', '2014-04-07 15:46:48', 'U1', 0),
(94, 19, 1, '1', '2013-10-03 15:10:00', 'U548391', '2013-10-03 15:10:00', 'U548391', 0),
(95, 19, 4, '2', '2013-10-03 15:10:00', 'U548391', '2013-10-03 15:10:00', 'U548391', 0),
(96, 19, 14, '6', '2013-10-03 15:10:00', 'U548391', '2014-04-07 15:46:48', 'U1', 0),
(97, 5, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(98, 8, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(99, 9, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(100, 10, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(101, 11, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(102, 13, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(103, 14, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(104, 15, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(105, 16, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(106, 3, 14, '12', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(107, 12, 23, '0', '2013-10-07 16:01:12', 'U548391', '2013-10-07 16:01:40', 'U548391', 0),
(108, 12, 5, '0', '2013-10-07 16:01:40', 'U548391', '2013-10-07 16:01:52', 'U548391', 0),
(109, 3, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(110, 5, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(111, 8, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(112, 10, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(113, 11, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(114, 13, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(115, 14, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(116, 15, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(117, 16, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(118, 12, 14, '9', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(119, 9, 23, '0', '2013-10-07 16:01:52', 'U548391', '2013-10-07 16:07:13', 'U548391', 0),
(120, 9, 5, '0', '2013-10-07 16:07:13', 'U548391', '2013-10-07 16:09:12', 'U548391', 0),
(121, 3, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(122, 5, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(123, 8, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 15:33:48', 'U548391', 0),
(124, 10, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(125, 12, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(126, 13, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(127, 14, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(128, 15, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(129, 16, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(130, 9, 14, '11', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(131, 11, 23, '0', '2013-10-07 16:09:12', 'U548391', '2013-10-10 16:08:29', 'U548391', 0),
(132, 20, 1, '0', '2013-10-10 10:50:13', 'U548391', '2013-10-10 10:50:13', 'U548391', 0),
(133, 20, 2, '0', '2013-10-10 10:50:13', 'U548391', NULL, NULL, 0),
(134, 8, 15, '0', '2013-10-10 15:33:48', 'U548391', '2013-10-10 15:33:50', 'U548391', 0),
(135, 8, 5, '0', '2013-10-10 15:33:50', 'U548391', '2013-10-10 15:33:56', 'U548391', 0),
(136, 8, 2, '0', '2013-10-10 15:33:56', 'U548391', '2013-10-10 15:41:19', 'U548391', 0),
(137, 8, 24, '0', '2013-10-10 15:41:19', 'U548391', '2013-10-10 15:43:32', 'U548391', 0),
(138, 8, 24, '0', '2013-10-10 15:43:32', 'U548391', '2013-10-10 15:58:46', 'U548391', 0),
(139, 8, 25, '0', '2013-10-10 15:58:46', 'U548391', '2013-10-10 16:06:46', 'U548391', 0),
(140, 8, 2, '0', '2013-10-10 16:06:46', 'U548391', '2013-10-10 16:07:33', 'U548391', 0),
(141, 8, 25, '0', '2013-10-10 16:07:33', 'U548391', '2013-10-10 16:44:45', 'U548391', 0),
(142, 3, 2, '0', '2013-10-10 16:08:29', 'U548391', NULL, NULL, 0),
(143, 5, 2, '0', '2013-10-10 16:08:29', 'U548391', NULL, NULL, 0),
(144, 9, 2, '0', '2013-10-10 16:08:29', 'U548391', NULL, NULL, 0),
(145, 10, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:09:14', 'U548391', 0),
(146, 12, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(147, 13, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(148, 14, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(149, 15, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(150, 16, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(151, 11, 2, '0', '2013-10-10 16:08:29', 'U548391', '2013-10-10 16:08:39', 'U548391', 0),
(152, 11, 24, '0', '2013-10-10 16:08:39', 'U548391', NULL, NULL, 0),
(153, 10, 23, '0', '2013-10-10 16:09:14', 'U548391', '2013-10-10 16:09:14', 'U548391', 0),
(154, 10, 25, '0', '2013-10-10 16:09:14', 'U548391', '2013-10-10 16:21:18', 'U548391', 0),
(155, 12, 2, '0', '2013-10-10 16:21:18', 'U548391', NULL, NULL, 0),
(156, 13, 2, '0', '2013-10-10 16:21:18', 'U548391', NULL, NULL, 0),
(157, 14, 2, '0', '2013-10-10 16:21:18', 'U548391', '2013-10-10 16:26:43', 'U548391', 0),
(158, 15, 2, '0', '2013-10-10 16:21:18', 'U548391', NULL, NULL, 0),
(159, 16, 2, '0', '2013-10-10 16:21:18', 'U548391', NULL, NULL, 0),
(160, 10, 2, '0', '2013-10-10 16:21:18', 'U548391', NULL, NULL, 0),
(161, 14, 23, '0', '2013-10-10 16:26:43', 'U548391', '2013-10-10 16:26:43', 'U548391', 0),
(162, 14, 25, '0', '2013-10-10 16:26:43', 'U548391', '2013-10-10 16:44:10', 'U548391', 0),
(163, 14, 14, '8', '2013-10-10 16:44:10', 'U548391', '2013-10-10 16:44:45', 'U548391', 0),
(164, 14, 2, '0', '2013-10-10 16:44:45', 'U548391', '2013-10-10 16:45:03', 'U548391', 0),
(165, 8, 2, '0', '2013-10-10 16:44:45', 'U548391', NULL, NULL, 0),
(166, 14, 23, '0', '2013-10-10 16:45:03', 'U548391', '2013-10-10 16:45:03', 'U548391', 0),
(167, 14, 25, '0', '2013-10-10 16:45:03', 'U548391', '2013-10-10 16:47:17', 'U548391', 0),
(168, 17, 14, '14', '2013-10-10 16:46:59', 'U548391', '2013-10-10 16:47:17', 'U548391', 0),
(169, 17, 2, '0', '2013-10-10 16:47:17', 'U548391', '2013-10-10 16:47:35', 'U548391', 0),
(170, 14, 2, '0', '2013-10-10 16:47:17', 'U548391', NULL, NULL, 0),
(171, 17, 23, '0', '2013-10-10 16:47:35', 'U548391', '2013-10-10 16:47:35', 'U548391', 0),
(172, 17, 25, '0', '2013-10-10 16:47:35', 'U548391', '2013-10-15 10:08:20', 'U548391', 0),
(173, 21, 1, '1', '2013-10-10 17:06:34', 'U196798', '2013-10-10 17:08:47', 'U548391', 0),
(174, 22, 1, '1', '2013-10-10 17:06:49', 'U196798', '2013-10-10 17:06:49', 'U196798', 0),
(175, 22, 14, '21', '2013-10-10 17:06:49', 'U196798', '2013-10-10 17:08:52', 'U548391', 0),
(176, 23, 1, '1', '2013-10-10 17:08:16', 'U196799', '2013-10-10 17:08:16', 'U196799', 0),
(177, 23, 14, '21', '2013-10-10 17:08:16', 'U196799', '2013-10-10 17:08:52', 'U548391', 0),
(178, 21, 5, '0', '2013-10-10 17:08:47', 'U548391', '2013-10-10 17:08:52', 'U548391', 0),
(179, 22, 2, '0', '2013-10-10 17:08:52', 'U548391', '2013-10-10 17:09:55', 'U196799', 0),
(180, 23, 2, '0', '2013-10-10 17:08:52', 'U548391', '2013-10-10 17:09:55', 'U196799', 0),
(181, 21, 2, '0', '2013-10-10 17:08:52', 'U548391', '2013-10-10 17:09:55', 'U196799', 0),
(182, 23, 25, '0', '2013-10-10 17:09:55', 'U196799', '2013-10-10 17:09:55', 'U196799', 0),
(183, 22, 14, '23', '2013-10-10 17:09:55', 'U196799', '2013-10-10 17:17:04', 'U548391', 0),
(184, 21, 14, '23', '2013-10-10 17:09:55', 'U196799', '2013-10-10 17:17:04', 'U548391', 0),
(185, 23, 23, '0', '2013-10-10 17:09:55', 'U196799', '2013-10-10 17:17:04', 'U548391', 0),
(186, 21, 2, '0', '2013-10-10 17:17:04', 'U548391', '2013-10-10 17:17:46', 'U196798', 0),
(187, 22, 2, '0', '2013-10-10 17:17:04', 'U548391', '2013-10-10 17:17:46', 'U196798', 0),
(188, 23, 2, '0', '2013-10-10 17:17:04', 'U548391', '2013-10-10 17:17:46', 'U196798', 0),
(189, 21, 14, '22', '2013-10-10 17:17:46', 'U196798', '2013-10-10 17:24:29', 'U548391', 0),
(190, 23, 14, '22', '2013-10-10 17:17:46', 'U196798', '2013-10-10 17:24:29', 'U548391', 0),
(191, 22, 23, '0', '2013-10-10 17:17:46', 'U196798', '2013-10-10 17:17:46', 'U196798', 0),
(192, 22, 25, '0', '2013-10-10 17:17:46', 'U196798', '2013-10-10 17:24:29', 'U548391', 0),
(193, 21, 2, '0', '2013-10-10 17:24:29', 'U548391', '2013-10-10 17:24:53', 'U196798', 0),
(194, 23, 2, '0', '2013-10-10 17:24:29', 'U548391', '2013-10-10 17:24:53', 'U196798', 0),
(195, 22, 2, '0', '2013-10-10 17:24:29', 'U548391', '2013-10-10 17:24:53', 'U196798', 0),
(196, 23, 14, '21', '2013-10-10 17:24:53', 'U196798', '2013-10-10 17:39:15', 'U548391', 0),
(197, 22, 14, '21', '2013-10-10 17:24:53', 'U196798', '2013-10-10 17:39:15', 'U548391', 0),
(198, 21, 23, '0', '2013-10-10 17:24:53', 'U196798', '2013-10-10 17:24:53', 'U196798', 0),
(199, 21, 25, '0', '2013-10-10 17:24:53', 'U196798', '2013-10-10 17:39:15', 'U548391', 0),
(200, 22, 2, '0', '2013-10-10 17:39:15', 'U548391', '2013-10-10 17:39:42', 'U196798', 0),
(201, 23, 2, '0', '2013-10-10 17:39:15', 'U548391', '2013-10-10 17:39:42', 'U196798', 0),
(202, 21, 2, '0', '2013-10-10 17:39:15', 'U548391', '2013-10-10 17:39:42', 'U196798', 0),
(203, 23, 14, '22', '2013-10-10 17:39:42', 'U196798', '2013-10-10 17:44:40', 'U548391', 0),
(204, 21, 14, '22', '2013-10-10 17:39:42', 'U196798', '2013-10-10 17:44:40', 'U548391', 0),
(205, 22, 23, '0', '2013-10-10 17:39:42', 'U196798', '2013-10-10 17:39:42', 'U196798', 0),
(206, 22, 25, '0', '2013-10-10 17:39:42', 'U196798', '2013-10-10 17:44:40', 'U548391', 0),
(207, 21, 2, '0', '2013-10-10 17:44:40', 'U548391', '2013-10-10 17:45:16', 'U196798', 0),
(208, 23, 2, '0', '2013-10-10 17:44:40', 'U548391', '2013-10-10 17:45:16', 'U196798', 0),
(209, 22, 2, '0', '2013-10-10 17:44:40', 'U548391', '2013-10-10 17:45:16', 'U196798', 0),
(210, 23, 14, '21', '2013-10-10 17:45:16', 'U196798', '2013-10-11 14:41:01', 'U196798', 0),
(211, 22, 14, '21', '2013-10-10 17:45:16', 'U196798', '2013-10-11 14:41:01', 'U196798', 0),
(212, 21, 23, '0', '2013-10-10 17:45:16', 'U196798', '2013-10-10 17:45:16', 'U196798', 0),
(213, 21, 25, '0', '2013-10-10 17:45:16', 'U196798', '2013-10-11 10:28:14', 'U196798', 0),
(214, 21, 10, '0', '2013-10-11 10:28:14', 'U196798', '2013-10-11 10:34:07', 'U196798', 0),
(215, 21, 10, '0', '2013-10-11 10:34:07', 'U196798', '2013-10-11 10:48:36', 'U196798', 0),
(216, 21, 10, '0', '2013-10-11 10:48:36', 'U196798', '2013-10-11 10:50:29', 'U196798', 0),
(217, 21, 10, '0', '2013-10-11 10:50:29', 'U196798', '2013-10-11 10:51:49', 'U196798', 0),
(218, 21, 10, '0', '2013-10-11 10:51:49', 'U196798', '2013-10-11 10:52:09', 'U196798', 0),
(219, 21, 10, '0', '2013-10-11 10:52:09', 'U196798', '2013-10-11 10:53:13', 'U196798', 0),
(220, 21, 10, '0', '2013-10-11 10:53:13', 'U196798', '2013-10-11 11:02:27', 'U196798', 0),
(221, 21, 10, '0', '2013-10-11 11:02:27', 'U196798', '2013-10-11 11:06:06', 'U196798', 0),
(222, 21, 10, '0', '2013-10-11 11:06:06', 'U196798', '2013-10-11 11:13:05', 'U196798', 0),
(223, 21, 10, '0', '2013-10-11 11:13:05', 'U196798', '2013-10-11 11:13:11', 'U196798', 0),
(224, 21, 10, '0', '2013-10-11 11:13:11', 'U196798', '2013-10-11 11:13:15', 'U196798', 0),
(225, 21, 17, '111', '2013-10-11 11:13:15', 'U196798', '2013-10-11 11:13:48', 'U196798', 0),
(226, 21, 10, '0', '2013-10-11 11:13:48', 'U196798', '2013-10-11 11:14:02', 'U196798', 0),
(227, 21, 10, '0', '2013-10-11 11:14:02', 'U196798', '2013-10-11 11:15:07', 'U196798', 0),
(228, 21, 10, '0', '2013-10-11 11:15:07', 'U196798', '2013-10-11 11:15:22', 'U196798', 0),
(229, 21, 17, '555', '2013-10-11 11:15:22', 'U196798', '2013-10-11 11:15:50', 'U196798', 0),
(230, 21, 10, '0', '2013-10-11 11:15:50', 'U196798', '2013-10-11 11:16:08', 'U196798', 0),
(231, 21, 10, '0', '2013-10-11 11:16:08', 'U196798', '2013-10-11 11:17:08', 'U196798', 0),
(232, 21, 10, '0', '2013-10-11 11:17:08', 'U196798', '2013-10-11 11:17:14', 'U196798', 0),
(233, 21, 18, '3433', '2013-10-11 11:17:14', 'U196798', '2013-10-11 11:17:32', 'U196798', 0),
(234, 21, 10, '0', '2013-10-11 11:17:32', 'U196798', '2013-10-11 14:40:35', 'U196798', 0),
(235, 22, 15, '0', '2013-10-11 14:41:01', 'U196798', '2013-10-11 14:43:38', 'U196798', 0),
(236, 23, 15, '0', '2013-10-11 14:41:01', 'U196798', '2013-10-11 14:43:38', 'U196798', 0),
(237, 21, 2, '0', '2013-10-11 14:43:38', 'U196798', '2013-10-11 14:44:16', 'U196798', 0),
(238, 22, 2, '237', '2013-10-11 14:43:38', 'U196798', '2013-10-11 14:44:16', 'U196798', 0),
(239, 23, 2, '237', '2013-10-11 14:43:38', 'U196798', '2013-10-11 14:44:16', 'U196798', 0),
(240, 23, 14, '22', '2013-10-11 14:44:16', 'U196798', '2013-10-11 14:56:04', 'U548391', 0),
(241, 21, 14, '22', '2013-10-11 14:44:16', 'U196798', '2013-10-11 14:56:04', 'U548391', 0),
(242, 22, 23, '0', '2013-10-11 14:44:16', 'U196798', '2013-10-11 14:44:16', 'U196798', 0),
(243, 22, 25, '0', '2013-10-11 14:44:16', 'U196798', '2013-10-11 14:56:04', 'U548391', 0),
(244, 21, 3, '113', '2013-10-11 14:56:04', 'U548391', '2013-10-11 15:01:07', 'U196799', 0),
(245, 23, 3, '113', '2013-10-11 14:56:04', 'U548391', '2013-10-11 15:00:37', 'U196799', 0),
(246, 22, 3, '113', '2013-10-11 14:56:04', 'U548391', '2013-10-11 15:01:07', 'U196799', 0),
(247, 23, 24, '0', '2013-10-11 15:00:37', 'U196799', '2013-10-11 15:01:07', 'U196799', 0),
(248, 21, 14, '23', '2013-10-11 15:01:07', 'U196799', '2013-10-30 16:58:31', 'U548391', 0),
(249, 22, 14, '23', '2013-10-11 15:01:07', 'U196799', '2013-10-30 16:58:31', 'U548391', 0),
(250, 23, 23, '0', '2013-10-11 15:01:07', 'U196799', '2013-10-11 15:01:07', 'U196799', 0),
(251, 23, 25, '0', '2013-10-11 15:01:07', 'U196799', '2013-10-25 11:49:57', 'U548391', 0),
(252, 17, 6, '0', '2013-10-15 10:08:20', 'U548391', '2013-10-15 10:08:23', 'U548391', 0),
(253, 17, 5, '0', '2013-10-15 10:08:23', 'U548391', '2013-10-30 10:20:52', 'U548391', 0),
(254, 24, 1, '1', '2013-10-16 10:58:19', 'U196798', '2013-10-30 10:09:53', 'U548391', 0),
(255, 25, 1, '1', '2013-10-16 10:58:44', 'U196798', '2013-10-30 10:28:56', 'U548391', 0),
(256, 26, 1, '1', '2013-10-16 10:58:53', 'U196798', '2013-10-30 10:26:30', 'U548391', 0),
(257, 27, 1, '1', '2013-10-16 10:59:31', 'U196798', '2013-10-29 17:45:26', 'U548391', 0),
(258, 28, 1, '1', '2013-10-16 10:59:47', 'U196798', '2013-10-30 11:37:21', 'U548391', 0),
(259, 29, 1, '1', '2013-10-16 11:00:05', 'U196798', '2013-10-16 12:16:49', 'U196798', 0),
(260, 30, 1, '1', '2013-10-16 11:00:23', 'U196798', '2013-10-16 12:37:20', 'U196798', 0),
(261, 31, 1, '2', '2013-10-16 11:00:51', 'U196798', NULL, NULL, 0),
(262, 32, 1, '1', '2013-10-16 11:01:05', 'U196798', '2013-10-30 10:08:40', 'U548391', 0),
(263, 29, 5, '0', '2013-10-16 12:16:49', 'U196798', '2013-10-16 12:16:54', 'U196798', 0),
(264, 29, 2, '0', '2013-10-16 12:16:54', 'U196798', '2013-10-16 12:19:09', 'U196798', 0),
(265, 29, 25, '0', '2013-10-16 12:19:09', 'U196798', '2013-10-16 12:19:36', 'U196798', 0),
(266, 29, 3, '17', '2013-10-16 12:19:36', 'U196798', NULL, NULL, 0),
(267, 30, 5, '0', '2013-10-16 12:37:20', 'U196798', '2013-10-16 12:37:26', 'U196798', 0),
(268, 30, 2, '0', '2013-10-16 12:37:26', 'U196798', NULL, NULL, 0),
(269, 33, 1, '1', '2013-10-18 17:15:42', 'U548391', '2013-10-30 10:30:07', 'U548391', 0),
(270, 34, 1, '1', '2013-10-18 17:31:05', 'U548391', '2013-10-18 17:31:26', 'U548391', 0),
(271, 34, 5, '0', '2013-10-18 17:31:26', 'U548391', '2013-10-18 17:31:51', 'U548391', 0),
(272, 34, 4, '2', '2013-10-18 17:31:51', 'U548391', '2013-10-18 17:32:12', 'U548391', 0),
(273, 34, 13, '0', '2013-10-18 17:32:12', 'U548391', '2013-11-01 14:34:09', 'U548391', 0),
(274, 6, 13, '0', '2013-10-18 17:33:39', 'U548391', '2013-10-22 17:08:20', 'U548391', 0),
(275, 35, 1, '1', '2013-10-21 11:43:33', 'U548391', '2013-10-21 11:43:33', 'U548391', 0),
(276, 35, 14, '33', '2013-10-21 11:43:33', 'U548391', '2014-04-07 15:46:51', 'U1', 0),
(277, 36, 1, '1', '2013-10-21 11:45:59', 'U548391', '2013-10-21 11:45:59', 'U548391', 0),
(278, 36, 14, '24', '2013-10-21 11:45:59', 'U548391', '2013-11-01 14:38:40', 'U548391', 0),
(279, 6, 13, '0', '2013-10-22 17:08:20', 'U548391', '2013-10-22 17:08:43', 'U548391', 0),
(280, 6, 13, '0', '2013-10-22 17:08:43', 'U548391', '2013-10-22 17:09:56', 'U548391', 0),
(281, 6, 13, '0', '2013-10-22 17:09:56', 'U548391', '2014-04-07 15:46:48', 'U1', 0),
(282, 7, 13, '0', '2013-10-22 17:10:09', 'U548391', '2013-10-22 17:10:28', 'U548391', 0),
(283, 7, 13, '0', '2013-10-22 17:10:28', 'U548391', '2013-10-22 17:10:51', 'U548391', 0),
(284, 7, 13, '0', '2013-10-22 17:10:51', 'U548391', '2013-10-22 17:11:27', 'U548391', 0),
(285, 7, 13, '0', '2013-10-22 17:11:27', 'U548391', '2013-10-22 17:12:13', 'U548391', 0),
(286, 7, 13, '0', '2013-10-22 17:12:13', 'U548391', '2014-04-07 16:18:27', 'U548391', 0),
(287, 37, 1, '0', '2013-10-24 12:49:08', 'U548391', '2013-10-24 12:49:08', 'U548391', 0),
(288, 37, 2, '0', '2013-10-24 12:49:08', 'U548391', NULL, NULL, 0),
(289, 23, 10, '0', '2013-10-25 11:49:57', 'U548391', '2013-10-25 12:40:45', 'U548391', 0),
(290, 23, 10, '0', '2013-10-25 12:40:45', 'U548391', '2013-10-25 12:41:19', 'U548391', 0),
(291, 23, 10, '0', '2013-10-25 12:41:19', 'U548391', '2013-10-25 12:41:49', 'U548391', 0),
(292, 23, 10, '0', '2013-10-25 12:41:49', 'U548391', '2013-10-25 12:43:07', 'U548391', 0),
(293, 23, 10, '0', '2013-10-25 12:43:07', 'U548391', '2013-10-25 12:43:21', 'U548391', 0),
(294, 23, 10, '0', '2013-10-25 12:43:21', 'U548391', '2013-10-25 12:44:34', 'U548391', 0),
(295, 23, 10, '0', '2013-10-25 12:44:34', 'U548391', '2013-10-25 12:49:38', 'U548391', 0),
(296, 23, 10, '0', '2013-10-25 12:49:38', 'U548391', '2013-10-25 12:50:31', 'U548391', 0),
(297, 23, 10, '0', '2013-10-25 12:50:31', 'U548391', '2013-10-30 16:58:31', 'U548391', 0),
(298, 38, 1, '1', '2013-10-25 14:51:16', 'U548391', '2013-10-25 14:51:17', 'U548391', 0),
(299, 38, 14, '27', '2013-10-25 14:51:17', 'U548391', '2013-10-30 12:08:17', 'U548391', 0),
(300, 39, 1, '1', '2013-10-25 15:14:47', 'U548391', '2013-10-25 15:14:47', 'U548391', 0),
(301, 39, 2, '0', '2013-10-25 15:14:47', 'U548391', NULL, NULL, 0),
(302, 40, 1, '1', '2013-10-25 15:41:01', 'U548391', '2013-10-25 15:41:01', 'U548391', 0),
(303, 40, 2, '0', '2013-10-25 15:41:01', 'U548391', NULL, NULL, 0),
(304, 41, 1, '1', '2013-10-25 15:42:49', 'U548391', '2013-10-25 15:42:49', 'U548391', 0),
(305, 41, 2, '0', '2013-10-25 15:42:49', 'U548391', '2013-10-25 15:47:21', 'U548391', 0),
(306, 41, 25, '0', '2013-10-25 15:47:21', 'U548391', '2013-10-30 12:06:18', 'U548391', 0),
(307, 42, 1, '1', '2013-10-28 15:15:59', 'U548391', '2013-11-26 16:38:39', 'U548391', 0),
(308, 43, 1, '1', '2013-10-28 16:12:56', 'U548391', '2013-10-28 16:12:56', 'U548391', 0),
(309, 43, 14, '42', '2013-10-28 16:12:56', 'U548391', NULL, NULL, 0),
(310, 44, 1, '1', '2013-10-28 16:14:30', 'U548391', '2013-10-28 16:14:30', 'U548391', 0),
(311, 44, 2, '0', '2013-10-28 16:14:30', 'U548391', NULL, NULL, 0),
(312, 45, 1, '1', '2013-10-28 16:26:16', 'U548391', '2013-11-01 09:49:51', 'U548391', 0),
(313, 46, 1, '1', '2013-10-28 16:29:02', 'U548391', '2013-11-01 15:55:34', 'U548391', 0),
(314, 47, 1, '1', '2013-10-28 16:33:09', 'U548391', '2013-10-28 16:33:09', 'U548391', 0),
(315, 47, 14, '46', '2013-10-28 16:33:09', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(316, 48, 1, '1', '2013-10-28 17:30:13', 'U548391', '2013-11-22 16:09:17', 'U188353', 0),
(317, 49, 1, '1', '2013-10-29 10:37:31', 'U548391', NULL, NULL, 0),
(318, 50, 1, '1', '2013-10-29 15:05:35', 'U548391', NULL, NULL, 0),
(319, 51, 1, '1', '2013-10-29 16:06:37', 'U548391', '2013-11-01 12:21:49', 'U548391', 0),
(320, 52, 1, '1', '2013-10-29 16:44:25', 'U548391', '2013-10-29 16:44:25', 'U548391', 0),
(321, 52, 2, '0', '2013-10-29 16:44:25', 'U548391', NULL, NULL, 0),
(322, 53, 1, '1', '2013-10-29 16:45:25', 'U548391', '2013-10-29 16:45:25', 'U548391', 0),
(323, 53, 2, '0', '2013-10-29 16:45:25', 'U548391', NULL, NULL, 0),
(324, 54, 1, '1', '2013-10-29 16:45:37', 'U548391', '2013-10-29 16:45:37', 'U548391', 0),
(325, 54, 2, '0', '2013-10-29 16:45:37', 'U548391', NULL, NULL, 0),
(326, 55, 1, '1', '2013-10-29 16:45:56', 'U548391', '2013-10-29 16:45:56', 'U548391', 0),
(327, 55, 2, '0', '2013-10-29 16:45:56', 'U548391', '2013-10-29 16:46:43', 'U548391', 0),
(328, 55, 25, '0', '2013-10-29 16:46:43', 'U548391', NULL, NULL, 0),
(329, 56, 1, '1', '2013-10-29 16:47:08', 'U548391', '2013-10-29 16:47:08', 'U548391', 0),
(330, 56, 2, '0', '2013-10-29 16:47:08', 'U548391', NULL, NULL, 0),
(331, 57, 1, '1', '2013-10-29 16:47:23', 'U548391', '2013-10-29 16:47:23', 'U548391', 0),
(332, 57, 2, '0', '2013-10-29 16:47:23', 'U548391', NULL, NULL, 0),
(333, 58, 1, '1', '2013-10-29 16:52:39', 'U548391', '2013-10-29 16:52:39', 'U548391', 0),
(334, 58, 2, '0', '2013-10-29 16:52:39', 'U548391', NULL, NULL, 0),
(335, 59, 1, '1', '2013-10-29 16:56:57', 'U548391', NULL, NULL, 0),
(336, 60, 1, '1', '2013-10-29 16:57:11', 'U548391', '2013-11-01 12:29:06', 'U548391', 0),
(337, 61, 1, '1', '2013-10-29 16:57:46', 'U548391', NULL, NULL, 0),
(338, 62, 1, '1', '2013-10-29 17:27:48', 'U548391', '2013-10-29 17:27:48', 'U548391', 0),
(339, 62, 14, '46', '2013-10-29 17:27:48', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(340, 27, 5, '0', '2013-10-29 17:45:26', 'U548391', '2013-10-30 11:40:13', 'U548391', 0),
(341, 32, 5, '0', '2013-10-30 10:08:40', 'U548391', '2013-10-30 11:38:32', 'U548391', 0),
(342, 24, 5, '0', '2013-10-30 10:09:53', 'U548391', '2013-10-30 10:24:58', 'U548391', 0),
(343, 17, 10, '0', '2013-10-30 10:20:52', 'U548391', '2013-10-30 10:21:48', 'U548391', 0),
(344, 17, 16, '0', '2013-10-30 10:21:48', 'U548391', '2013-10-30 10:23:39', 'U548391', 0),
(345, 17, 10, '0', '2013-10-30 10:23:39', 'U548391', '2013-10-30 10:27:56', 'U548391', 0),
(346, 24, 10, '0', '2013-10-30 10:24:58', 'U548391', '2013-11-01 14:41:22', 'U548391', 0),
(347, 26, 5, '0', '2013-10-30 10:26:30', 'U548391', '2013-10-30 11:37:43', 'U548391', 0),
(348, 17, 16, '0', '2013-10-30 10:27:56', 'U548391', '2013-10-30 16:24:39', 'U548391', 0),
(349, 25, 10, '0', '2013-10-30 10:28:56', 'U548391', '2013-10-30 11:38:22', 'U548391', 0),
(350, 33, 5, '0', '2013-10-30 10:30:07', 'U548391', '2013-10-30 12:02:36', 'U548391', 0),
(351, 28, 5, '0', '2013-10-30 11:37:21', 'U548391', '2013-10-30 12:01:09', 'U548391', 0),
(352, 26, 10, '0', '2013-10-30 11:37:43', 'U548391', '2013-10-30 11:38:13', 'U548391', 0),
(353, 26, 10, '0', '2013-10-30 11:38:13', 'U548391', '2013-11-01 17:19:25', 'U548391', 0),
(354, 25, 10, '0', '2013-10-30 11:38:22', 'U548391', '2013-10-30 12:09:42', 'U548391', 0),
(355, 32, 6, '0', '2013-10-30 11:38:32', 'U548391', '2013-10-30 11:39:15', 'U548391', 0),
(356, 32, 5, '0', '2013-10-30 11:39:15', 'U548391', '2013-10-30 12:01:51', 'U548391', 0),
(357, 27, 6, '0', '2013-10-30 11:40:13', 'U548391', '2013-10-30 11:40:21', 'U548391', 0),
(358, 27, 5, '0', '2013-10-30 11:40:21', 'U548391', '2013-10-30 11:40:59', 'U548391', 0),
(359, 27, 6, '0', '2013-10-30 11:40:59', 'U548391', '2013-10-30 11:42:08', 'U548391', 0),
(360, 27, 5, '0', '2013-10-30 11:42:08', 'U548391', '2013-10-30 11:42:25', 'U548391', 0),
(361, 27, 10, '0', '2013-10-30 11:42:25', 'U548391', '2013-10-30 11:42:52', 'U548391', 0),
(362, 27, 10, '0', '2013-10-30 11:42:52', 'U548391', '2013-10-30 11:43:39', 'U548391', 0),
(363, 27, 6, '0', '2013-10-30 11:43:39', 'U548391', '2013-10-30 11:45:44', 'U548391', 0),
(364, 27, 10, '0', '2013-10-30 11:45:44', 'U548391', '2013-10-30 11:45:54', 'U548391', 0),
(365, 27, 5, '0', '2013-10-30 11:45:54', 'U548391', '2013-10-30 11:46:02', 'U548391', 0),
(366, 27, 10, '0', '2013-10-30 11:46:02', 'U548391', '2013-10-30 11:46:36', 'U548391', 0),
(367, 27, 6, '0', '2013-10-30 11:46:36', 'U548391', '2013-10-30 11:47:44', 'U548391', 0),
(368, 27, 5, '0', '2013-10-30 11:47:44', 'U548391', '2013-10-30 11:48:23', 'U548391', 0),
(369, 27, 6, '0', '2013-10-30 11:48:23', 'U548391', '2013-10-30 11:50:23', 'U548391', 0),
(370, 27, 5, '0', '2013-10-30 11:50:23', 'U548391', '2013-10-30 11:52:45', 'U548391', 0),
(371, 27, 10, '0', '2013-10-30 11:52:45', 'U548391', '2013-10-30 11:52:58', 'U548391', 0),
(372, 27, 17, '4543', '2013-10-30 11:52:58', 'U548391', '2013-10-30 11:53:57', 'U548391', 0),
(373, 27, 6, '0', '2013-10-30 11:53:57', 'U548391', '2013-10-30 11:54:02', 'U548391', 0),
(374, 27, 5, '0', '2013-10-30 11:54:02', 'U548391', '2013-10-30 11:54:10', 'U548391', 0),
(375, 27, 6, '0', '2013-10-30 11:54:10', 'U548391', '2013-10-30 11:54:35', 'U548391', 0),
(376, 27, 5, '0', '2013-10-30 11:54:35', 'U548391', '2013-10-30 11:54:45', 'U548391', 0),
(377, 27, 17, '2222', '2013-10-30 11:54:45', 'U548391', '2013-10-30 12:08:17', 'U548391', 0),
(378, 28, 10, '0', '2013-10-30 12:01:09', 'U548391', '2013-10-30 12:01:15', 'U548391', 0),
(379, 28, 17, '23123', '2013-10-30 12:01:15', 'U548391', '2013-10-30 12:07:34', 'U548391', 0),
(380, 32, 17, '44', '2013-10-30 12:01:51', 'U548391', '2013-11-01 14:48:31', 'U548391', 0),
(381, 33, 10, '0', '2013-10-30 12:02:36', 'U548391', '2013-10-30 12:02:44', 'U548391', 0),
(382, 33, 17, '1234', '2013-10-30 12:02:44', 'U548391', '2013-12-03 10:38:20', 'U548391', 0),
(383, 41, 5, '0', '2013-10-30 12:06:18', 'U548391', '2013-10-30 12:06:23', 'U548391', 0),
(384, 41, 17, '3243', '2013-10-30 12:06:23', 'U548391', '2013-10-30 12:06:27', 'U548391', 0),
(385, 41, 6, '0', '2013-10-30 12:06:27', 'U548391', '2013-10-30 12:06:34', 'U548391', 0),
(386, 41, 5, '0', '2013-10-30 12:06:34', 'U548391', '2013-10-30 12:06:49', 'U548391', 0),
(387, 41, 6, '0', '2013-10-30 12:06:49', 'U548391', '2013-10-30 16:23:36', 'U548391', 0),
(388, 28, 10, '0', '2013-10-30 12:07:34', 'U548391', '2013-10-30 12:07:41', 'U548391', 0),
(389, 28, 2, '0', '2013-10-30 12:07:41', 'U548391', NULL, NULL, 0),
(390, 27, 2, '0', '2013-10-30 12:08:17', 'U548391', NULL, NULL, 0),
(391, 38, 2, '390', '2013-10-30 12:08:17', 'U548391', NULL, NULL, 0),
(392, 25, 5, '0', '2013-10-30 12:09:42', 'U548391', '2013-10-30 12:09:49', 'U548391', 0),
(393, 25, 2, '0', '2013-10-30 12:09:49', 'U548391', NULL, NULL, 0),
(394, 63, 1, '1', '2013-10-30 15:08:47', 'U548391', '2013-10-30 15:08:47', 'U548391', 0),
(395, 63, 2, '0', '2013-10-30 15:08:47', 'U548391', NULL, NULL, 0),
(396, 64, 1, '1', '2013-10-30 15:09:11', 'U548391', '2013-10-30 15:09:11', 'U548391', 0),
(397, 64, 2, '0', '2013-10-30 15:09:11', 'U548391', NULL, NULL, 0),
(398, 65, 1, '1', '2013-10-30 15:09:38', 'U548391', '2013-10-30 15:09:38', 'U548391', 0),
(399, 65, 14, '46', '2013-10-30 15:09:38', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(400, 66, 1, '1', '2013-10-30 15:13:35', 'U548391', '2013-10-30 15:13:35', 'U548391', 0),
(401, 66, 14, '45', '2013-10-30 15:13:35', 'U548391', '2014-05-26 16:14:20', 'U548391', 0),
(402, 67, 1, '1', '2013-10-30 15:14:57', 'U548391', '2013-10-30 15:14:57', 'U548391', 0),
(403, 67, 14, '46', '2013-10-30 15:14:57', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(404, 68, 1, '1', '2013-10-30 15:16:39', 'U548391', '2013-10-30 15:16:39', 'U548391', 0),
(405, 68, 14, '45', '2013-10-30 15:16:39', 'U548391', '2014-05-26 16:14:20', 'U548391', 0),
(406, 69, 1, '1', '2013-10-30 15:16:41', 'U548391', '2013-10-30 15:16:41', 'U548391', 0),
(407, 69, 14, '45', '2013-10-30 15:16:41', 'U548391', '2014-05-26 16:14:20', 'U548391', 0),
(408, 70, 1, '1', '2013-10-30 15:16:44', 'U548391', '2013-10-30 15:16:44', 'U548391', 0),
(409, 70, 14, '46', '2013-10-30 15:16:44', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(410, 71, 1, '1', '2013-10-30 15:16:46', 'U548391', NULL, NULL, 0),
(411, 72, 1, '1', '2013-10-30 15:18:35', 'U548391', '2013-10-30 15:18:35', 'U548391', 0),
(412, 72, 14, '46', '2013-10-30 15:18:35', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(413, 73, 1, '1', '2013-10-30 15:20:55', 'U548391', '2013-10-30 15:20:55', 'U548391', 0),
(414, 73, 14, '46', '2013-10-30 15:20:55', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(415, 74, 1, '1', '2013-10-30 15:22:13', 'U548391', '2013-10-30 15:22:13', 'U548391', 0),
(416, 74, 14, '46', '2013-10-30 15:22:13', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(417, 75, 1, '1', '2013-10-30 15:22:58', 'U548391', '2013-10-30 15:22:58', 'U548391', 0),
(418, 75, 14, '46', '2013-10-30 15:22:58', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(419, 76, 1, '1', '2013-10-30 15:23:28', 'U548391', '2013-10-30 15:23:28', 'U548391', 0),
(420, 76, 14, '46', '2013-10-30 15:23:28', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(421, 77, 1, '1', '2013-10-30 15:24:24', 'U548391', '2013-10-30 15:24:24', 'U548391', 0),
(422, 77, 14, '46', '2013-10-30 15:24:24', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(423, 78, 1, '1', '2013-10-30 15:24:50', 'U548391', '2013-10-30 15:24:50', 'U548391', 0),
(424, 78, 14, '46', '2013-10-30 15:24:50', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(425, 79, 1, '1', '2013-10-30 15:26:16', 'U548391', '2013-10-30 15:26:16', 'U548391', 0),
(426, 79, 14, '45', '2013-10-30 15:26:16', 'U548391', '2014-05-26 15:13:02', 'U548391', 0),
(427, 80, 1, '1', '2013-10-30 15:26:23', 'U548391', NULL, NULL, 0),
(428, 81, 1, '1', '2013-10-30 15:27:15', 'U548391', '2013-10-30 15:27:15', 'U548391', 0),
(429, 81, 14, '46', '2013-10-30 15:27:15', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(430, 82, 1, '1', '2013-10-30 15:27:35', 'U548391', '2013-10-30 15:27:35', 'U548391', 0),
(431, 82, 14, '46', '2013-10-30 15:27:35', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(432, 83, 1, '1', '2013-10-30 15:28:33', 'U548391', '2013-10-30 15:28:33', 'U548391', 0),
(433, 83, 14, '46', '2013-10-30 15:28:33', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(434, 84, 1, '1', '2013-10-30 15:29:54', 'U548391', '2013-10-30 15:29:54', 'U548391', 0),
(435, 84, 14, '46', '2013-10-30 15:29:54', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(436, 85, 1, '1', '2013-10-30 15:29:57', 'U548391', '2013-10-30 15:29:57', 'U548391', 0),
(437, 85, 14, '80', '2013-10-30 15:29:57', 'U548391', NULL, NULL, 0),
(438, 86, 1, '1', '2013-10-30 15:30:19', 'U548391', '2013-10-30 15:30:19', 'U548391', 0),
(439, 86, 14, '80', '2013-10-30 15:30:19', 'U548391', NULL, NULL, 0),
(440, 87, 1, '1', '2013-10-30 15:31:05', 'U548391', '2013-10-30 15:31:05', 'U548391', 0),
(441, 87, 14, '46', '2013-10-30 15:31:05', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(442, 88, 1, '1', '2013-10-30 15:31:19', 'U548391', '2013-10-30 15:31:19', 'U548391', 0),
(443, 88, 14, '46', '2013-10-30 15:31:19', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(444, 89, 1, '1', '2013-10-30 15:31:57', 'U548391', '2013-10-30 15:31:57', 'U548391', 0),
(445, 89, 14, '46', '2013-10-30 15:31:57', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(446, 90, 1, '1', '2013-10-30 15:32:54', 'U548391', '2013-10-30 15:32:54', 'U548391', 0),
(447, 90, 14, '46', '2013-10-30 15:32:54', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(448, 91, 1, '1', '2013-10-30 15:33:15', 'U548391', '2013-10-30 15:33:15', 'U548391', 0),
(449, 91, 14, '46', '2013-10-30 15:33:15', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(450, 92, 1, '1', '2013-10-30 15:33:33', 'U548391', '2013-10-30 15:33:33', 'U548391', 0),
(451, 92, 2, '0', '2013-10-30 15:33:33', 'U548391', NULL, NULL, 0),
(452, 93, 1, '1', '2013-10-30 15:33:51', 'U548391', '2013-10-30 15:33:51', 'U548391', 0),
(453, 93, 14, '46', '2013-10-30 15:33:51', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(454, 94, 1, '1', '2013-10-30 15:35:44', 'U548391', '2013-10-30 15:35:44', 'U548391', 0),
(455, 94, 14, '46', '2013-10-30 15:35:44', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(456, 95, 1, '1', '2013-10-30 15:36:08', 'U548391', '2013-10-30 15:36:08', 'U548391', 0),
(457, 95, 14, '46', '2013-10-30 15:36:08', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(458, 96, 1, '1', '2013-10-30 15:37:25', 'U548391', '2013-10-30 15:37:25', 'U548391', 0),
(459, 96, 14, '46', '2013-10-30 15:37:25', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(460, 97, 1, '1', '2013-10-30 15:37:59', 'U548391', '2013-10-30 15:37:59', 'U548391', 0),
(461, 97, 14, '46', '2013-10-30 15:37:59', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(462, 98, 1, '1', '2013-10-30 15:39:01', 'U548391', '2013-10-30 15:39:01', 'U548391', 0),
(463, 98, 14, '46', '2013-10-30 15:39:01', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(464, 99, 1, '1', '2013-10-30 15:45:35', 'U548391', '2013-10-30 15:45:35', 'U548391', 0),
(465, 99, 14, '46', '2013-10-30 15:45:35', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(466, 100, 1, '1', '2013-10-30 15:46:28', 'U548391', '2013-10-30 15:46:28', 'U548391', 0),
(467, 100, 14, '46', '2013-10-30 15:46:28', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(468, 101, 1, '1', '2013-10-30 15:46:30', 'U548391', '2013-10-30 15:46:30', 'U548391', 0),
(469, 101, 14, '46', '2013-10-30 15:46:30', 'U548391', '2013-11-01 15:45:25', 'U548391', 0),
(470, 102, 1, '1', '2013-10-30 15:47:04', 'U548391', '2013-10-30 15:47:04', 'U548391', 0),
(471, 102, 14, '46', '2013-10-30 15:47:04', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(472, 103, 1, '1', '2013-10-30 15:48:07', 'U548391', '2013-10-30 15:48:07', 'U548391', 0),
(473, 103, 14, '46', '2013-10-30 15:48:07', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(474, 104, 1, '1', '2013-10-30 15:48:28', 'U548391', '2013-10-30 15:48:28', 'U548391', 0),
(475, 104, 14, '46', '2013-10-30 15:48:28', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(476, 105, 1, '1', '2013-10-30 15:53:54', 'U548391', '2013-10-30 15:53:54', 'U548391', 0),
(477, 105, 14, '46', '2013-10-30 15:53:54', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(478, 106, 1, '1', '2013-10-30 15:57:09', 'U548391', '2013-10-30 15:57:09', 'U548391', 0),
(479, 106, 14, '46', '2013-10-30 15:57:09', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(480, 107, 1, '1', '2013-10-30 15:58:01', 'U548391', '2013-10-30 15:58:01', 'U548391', 0),
(481, 107, 14, '46', '2013-10-30 15:58:01', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(482, 108, 1, '1', '2013-10-30 15:58:22', 'U548391', '2013-10-30 15:58:22', 'U548391', 0),
(483, 108, 14, '46', '2013-10-30 15:58:22', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(484, 109, 1, '1', '2013-10-30 15:59:26', 'U548391', '2013-10-30 15:59:26', 'U548391', 0),
(485, 109, 14, '46', '2013-10-30 15:59:26', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(486, 110, 1, '1', '2013-10-30 16:02:14', 'U548391', '2013-10-30 16:02:14', 'U548391', 0),
(487, 110, 14, '46', '2013-10-30 16:02:14', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(488, 111, 1, '1', '2013-10-30 16:03:46', 'U548391', '2013-10-30 16:03:46', 'U548391', 0),
(489, 111, 14, '46', '2013-10-30 16:03:46', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(490, 112, 1, '1', '2013-10-30 16:04:42', 'U548391', '2013-10-30 16:04:42', 'U548391', 0),
(491, 112, 14, '46', '2013-10-30 16:04:42', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(492, 113, 1, '1', '2013-10-30 16:04:59', 'U548391', '2013-10-30 16:04:59', 'U548391', 0),
(493, 113, 14, '71', '2013-10-30 16:04:59', 'U548391', NULL, NULL, 0),
(494, 114, 1, '1', '2013-10-30 16:07:37', 'U548391', '2013-10-30 16:07:37', 'U548391', 0),
(495, 114, 14, '51', '2013-10-30 16:07:37', 'U548391', NULL, NULL, 0),
(496, 115, 1, '1', '2013-10-30 16:09:33', 'U548391', '2013-10-30 16:09:33', 'U548391', 0),
(497, 115, 14, '51', '2013-10-30 16:09:33', 'U548391', NULL, NULL, 0),
(498, 116, 1, '1', '2013-10-30 16:10:55', 'U548391', '2013-10-30 16:10:55', 'U548391', 0),
(499, 116, 14, '51', '2013-10-30 16:10:55', 'U548391', NULL, NULL, 0),
(500, 117, 1, '1', '2013-10-30 16:11:33', 'U548391', '2013-10-30 16:11:33', 'U548391', 0),
(501, 117, 14, '51', '2013-10-30 16:11:33', 'U548391', NULL, NULL, 0),
(502, 118, 1, '1', '2013-10-30 16:11:58', 'U548391', '2013-10-30 16:11:58', 'U548391', 0),
(503, 118, 14, '71', '2013-10-30 16:11:58', 'U548391', NULL, NULL, 0),
(504, 119, 1, '1', '2013-10-30 16:13:51', 'U548391', '2013-10-30 16:13:51', 'U548391', 0),
(505, 119, 14, '71', '2013-10-30 16:13:51', 'U548391', NULL, NULL, 0),
(506, 120, 1, '1', '2013-10-30 16:16:12', 'U548391', '2013-10-30 16:16:12', 'U548391', 0),
(507, 120, 2, '0', '2013-10-30 16:16:12', 'U548391', NULL, NULL, 0),
(508, 121, 1, '1', '2013-10-30 16:16:27', 'U548391', '2013-10-30 16:57:47', 'U548391', 0),
(509, 122, 1, '1', '2013-10-30 16:16:52', 'U548391', '2013-10-30 16:16:52', 'U548391', 0),
(510, 122, 14, '51', '2013-10-30 16:16:52', 'U548391', NULL, NULL, 0),
(511, 123, 1, '1', '2013-10-30 16:19:00', 'U548391', '2013-10-30 16:19:00', 'U548391', 0),
(512, 123, 14, '42', '2013-10-30 16:19:00', 'U548391', NULL, NULL, 0),
(513, 124, 1, '1', '2013-10-30 16:23:02', 'U548391', '2013-10-30 16:23:02', 'U548391', 0),
(514, 124, 14, '51', '2013-10-30 16:23:02', 'U548391', NULL, NULL, 0),
(515, 41, 5, '0', '2013-10-30 16:23:36', 'U548391', '2014-05-26 15:12:26', 'U548391', 0),
(516, 17, 6, '0', '2013-10-30 16:24:39', 'U548391', '2013-10-30 16:24:45', 'U548391', 0),
(517, 17, 5, '0', '2013-10-30 16:24:45', 'U1548', '2013-10-30 16:43:34', 'U548391', 0),
(518, 17, 6, '0', '2013-10-30 16:43:34', 'U548391', '2013-10-30 16:58:11', 'U548391', 0),
(519, 121, 5, '0', '2013-10-30 16:57:47', 'U548391', '2013-11-01 11:54:11', 'U548391', 0),
(520, 17, 5, '0', '2013-10-30 16:58:11', 'U548391', '2013-11-01 11:57:47', 'U548391', 0),
(521, 21, 14, '17', '2013-10-30 16:58:31', 'U548391', '2013-11-01 11:57:47', 'U548391', 0),
(522, 22, 14, '17', '2013-10-30 16:58:31', 'U548391', '2013-11-01 11:57:47', 'U548391', 0),
(523, 23, 14, '17', '2013-10-30 16:58:31', 'U548391', '2013-11-01 11:57:47', 'U548391', 0),
(524, 45, 5, '0', '2013-11-01 09:49:51', 'U548391', '2013-11-01 09:50:05', 'U548391', 0),
(525, 45, 10, '0', '2013-11-01 09:50:05', 'U548391', '2013-11-01 09:50:10', 'U548391', 0),
(526, 45, 6, '0', '2013-11-01 09:50:10', 'U548391', '2014-05-21 17:51:53', 'U548391', 0),
(527, 125, 1, '1', '2013-11-01 10:04:57', 'U548391', '2013-11-01 10:08:02', 'U548391', 0),
(528, 125, 5, '0', '2013-11-01 10:08:02', 'U548391', '2013-11-01 10:09:31', 'U548391', 0),
(529, 125, 2, '0', '2013-11-01 10:09:31', 'U548391', NULL, NULL, 0),
(530, 126, 1, '1', '2013-11-01 10:27:36', 'U548391', '2013-11-05 16:31:38', 'U548391', 0),
(531, 121, 10, '0', '2013-11-01 11:54:11', 'U548391', '2013-11-01 11:54:45', 'U548391', 0),
(532, 121, 10, '0', '2013-11-01 11:54:45', 'U548391', '2013-11-01 11:55:23', 'U548391', 0),
(533, 121, 10, '0', '2013-11-01 11:55:23', 'U548391', '2013-11-01 11:55:59', 'U548391', 0),
(534, 121, 10, '0', '2013-11-01 11:55:59', 'U548391', '2013-11-01 11:56:31', 'U548391', 0),
(535, 121, 10, '0', '2013-11-01 11:56:31', 'U548391', '2013-11-01 11:57:09', 'U548391', 0),
(536, 121, 14, '17', '2013-11-01 11:57:09', 'U548391', '2013-11-01 11:57:47', 'U548391', 0),
(537, 17, 2, '0', '2013-11-01 11:57:47', 'U548391', NULL, NULL, 0),
(538, 21, 2, '537', '2013-11-01 11:57:47', 'U548391', NULL, NULL, 0),
(539, 22, 2, '537', '2013-11-01 11:57:47', 'U548391', NULL, NULL, 0),
(540, 23, 2, '537', '2013-11-01 11:57:47', 'U548391', NULL, NULL, 0),
(541, 121, 2, '537', '2013-11-01 11:57:47', 'U548391', NULL, NULL, 0),
(542, 51, 5, '0', '2013-11-01 12:21:49', 'U548391', '2014-06-16 14:26:24', 'U548391', 0),
(543, 60, 5, '0', '2013-11-01 12:29:06', 'U548391', '2014-06-16 14:26:24', 'U548391', 0),
(544, 34, 13, '0', '2013-11-01 14:34:09', 'U548391', '2013-11-01 14:34:50', 'U548391', 0),
(545, 34, 13, '0', '2013-11-01 14:34:50', 'U548391', '2014-06-16 16:27:35', 'U548391', 0),
(546, 36, 10, '0', '2013-11-01 14:38:40', 'U548391', '2013-11-01 14:41:22', 'U548391', 0),
(547, 24, 14, '36', '2013-11-01 14:41:22', 'U548391', '2013-11-01 14:44:00', 'U548391', 0),
(548, 36, 23, '0', '2013-11-01 14:41:22', 'U548391', '2013-11-01 14:44:00', 'U548391', 0),
(549, 36, 14, '24', '2013-11-01 14:44:00', 'U548391', '2013-11-01 14:44:31', 'U548391', 0),
(550, 24, 23, '0', '2013-11-01 14:44:00', 'U548391', '2013-11-01 14:44:09', 'U548391', 0),
(551, 24, 10, '0', '2013-11-01 14:44:09', 'U548391', '2013-11-01 14:44:38', 'U548391', 0),
(552, 36, 10, '0', '2013-11-01 14:44:31', 'U548391', '2013-11-01 14:44:38', 'U548391', 0),
(553, 24, 14, '36', '2013-11-01 14:44:38', 'U548391', '2013-11-01 14:47:13', 'U548391', 0),
(554, 36, 23, '0', '2013-11-01 14:44:38', 'U548391', '2013-11-01 14:47:27', 'U548391', 0),
(555, 24, 10, '0', '2013-11-01 14:47:13', 'U548391', '2013-11-01 14:47:27', 'U548391', 0),
(556, 36, 14, '24', '2013-11-01 14:47:27', 'U548391', '2013-11-01 14:47:48', 'U548391', 0),
(557, 24, 23, '0', '2013-11-01 14:47:27', 'U548391', '2013-11-01 14:47:53', 'U548391', 0),
(558, 36, 10, '0', '2013-11-01 14:47:48', 'U548391', '2013-11-01 14:47:53', 'U548391', 0),
(559, 24, 14, '36', '2013-11-01 14:47:53', 'U548391', '2014-04-09 15:34:05', 'U1', 0),
(560, 36, 23, '0', '2013-11-01 14:47:53', 'U548391', '2014-04-09 15:32:47', 'U548391', 0),
(561, 32, 10, '0', '2013-11-01 14:48:31', 'U548391', '2013-11-01 14:48:39', 'U548391', 0),
(562, 32, 17, '123', '2013-11-01 14:48:39', 'U548391', '2013-11-01 15:33:34', 'U548391', 0),
(563, 32, 2, '0', '2013-11-01 15:33:34', 'U548391', NULL, NULL, 0),
(564, 101, 10, '0', '2013-11-01 15:45:25', 'U548391', '2013-11-01 15:45:40', 'U548391', 0),
(565, 101, 10, '0', '2013-11-01 15:45:40', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(566, 46, 5, '0', '2013-11-01 15:55:34', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(567, 127, 1, '1', '2013-11-01 17:09:48', 'U548391', '2013-11-01 17:12:15', 'U548391', 0),
(568, 127, 5, '0', '2013-11-01 17:12:15', 'U548391', '2013-11-04 11:12:52', 'U548391', 0),
(569, 128, 1, '1', '2013-11-01 17:17:46', 'U548391', '2013-11-01 17:17:46', 'U548391', 0),
(570, 128, 14, '46', '2013-11-01 17:17:46', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(571, 26, 14, '127', '2013-11-01 17:19:25', 'U548391', '2013-11-04 11:12:52', 'U548391', 0),
(572, 129, 1, '1', '2013-11-04 09:52:33', 'U548391', '2013-11-04 09:52:33', 'U548391', 0),
(573, 129, 2, '0', '2013-11-04 09:52:33', 'U548391', NULL, NULL, 0),
(574, 130, 1, '1', '2013-11-04 09:54:55', 'U548391', '2013-11-04 09:54:55', 'U548391', 0),
(575, 130, 2, '0', '2013-11-04 09:54:55', 'U548391', NULL, NULL, 0),
(576, 131, 1, '1', '2013-11-04 09:55:21', 'U548391', '2013-11-04 09:55:21', 'U548391', 0),
(577, 131, 2, '0', '2013-11-04 09:55:21', 'U548391', NULL, NULL, 0),
(578, 132, 1, '1', '2013-11-04 10:03:28', 'U548391', '2013-11-04 10:03:28', 'U548391', 0),
(579, 132, 2, '0', '2013-11-04 10:03:28', 'U548391', NULL, NULL, 0);
INSERT INTO `tickets_m` (`id`, `idtkt`, `idaccion`, `valoraccion`, `FA`, `UA`, `FB`, `UB`, `estado`) VALUES
(580, 133, 1, '1', '2013-11-04 10:05:29', 'U548391', '2013-11-04 10:05:29', 'U548391', 0),
(581, 133, 2, '0', '2013-11-04 10:05:29', 'U548391', NULL, NULL, 0),
(582, 134, 1, '1', '2013-11-04 10:06:06', 'U548391', '2013-11-04 10:06:06', 'U548391', 0),
(583, 134, 2, '0', '2013-11-04 10:06:06', 'U548391', NULL, NULL, 0),
(584, 135, 1, '1', '2013-11-04 10:07:35', 'U548391', '2013-11-04 10:07:35', 'U548391', 0),
(585, 135, 2, '0', '2013-11-04 10:07:35', 'U548391', NULL, NULL, 0),
(586, 136, 1, '1', '2013-11-04 10:08:15', 'U548391', '2013-11-04 10:08:15', 'U548391', 0),
(587, 136, 2, '0', '2013-11-04 10:08:15', 'U548391', NULL, NULL, 0),
(588, 137, 1, '1', '2013-11-04 10:08:27', 'U548391', '2013-11-04 10:08:27', 'U548391', 0),
(589, 137, 2, '0', '2013-11-04 10:08:27', 'U548391', NULL, NULL, 0),
(590, 138, 1, '1', '2013-11-04 10:09:03', 'U548391', '2013-11-04 10:09:03', 'U548391', 0),
(591, 138, 2, '0', '2013-11-04 10:09:03', 'U548391', NULL, NULL, 0),
(592, 139, 1, '1', '2013-11-04 10:09:19', 'U548391', '2013-11-04 10:09:19', 'U548391', 0),
(593, 139, 2, '0', '2013-11-04 10:09:19', 'U548391', NULL, NULL, 0),
(594, 140, 1, '1', '2013-11-04 10:11:23', 'U548391', '2013-11-04 10:11:23', 'U548391', 0),
(595, 140, 2, '0', '2013-11-04 10:11:23', 'U548391', NULL, NULL, 0),
(596, 141, 1, '1', '2013-11-04 10:11:51', 'U548391', '2013-11-04 10:11:51', 'U548391', 0),
(597, 141, 2, '0', '2013-11-04 10:11:51', 'U548391', NULL, NULL, 0),
(598, 142, 1, '1', '2013-11-04 10:11:56', 'U548391', '2013-11-04 10:11:56', 'U548391', 0),
(599, 142, 2, '0', '2013-11-04 10:11:56', 'U548391', NULL, NULL, 0),
(600, 143, 1, '1', '2013-11-04 10:12:19', 'U548391', '2013-11-04 10:12:19', 'U548391', 0),
(601, 143, 2, '0', '2013-11-04 10:12:19', 'U548391', NULL, NULL, 0),
(602, 144, 1, '1', '2013-11-04 10:13:14', 'U548391', '2013-11-04 10:13:14', 'U548391', 0),
(603, 144, 2, '0', '2013-11-04 10:13:14', 'U548391', NULL, NULL, 0),
(604, 145, 1, '1', '2013-11-04 10:13:34', 'U548391', '2013-11-04 10:13:34', 'U548391', 0),
(605, 145, 2, '0', '2013-11-04 10:13:34', 'U548391', NULL, NULL, 0),
(606, 146, 1, '1', '2013-11-04 10:13:45', 'U548391', '2013-11-04 10:13:45', 'U548391', 0),
(607, 146, 2, '0', '2013-11-04 10:13:45', 'U548391', NULL, NULL, 0),
(608, 147, 1, '1', '2013-11-04 10:14:18', 'U548391', '2013-11-04 10:14:18', 'U548391', 0),
(609, 147, 2, '0', '2013-11-04 10:14:18', 'U548391', NULL, NULL, 0),
(610, 148, 1, '1', '2013-11-04 10:15:04', 'U548391', '2013-11-04 10:15:04', 'U548391', 0),
(611, 148, 2, '0', '2013-11-04 10:15:04', 'U548391', NULL, NULL, 0),
(612, 149, 1, '1', '2013-11-04 10:15:33', 'U548391', '2013-11-04 10:15:33', 'U548391', 0),
(613, 149, 2, '0', '2013-11-04 10:15:33', 'U548391', NULL, NULL, 0),
(614, 150, 1, '1', '2013-11-04 10:17:45', 'U548391', '2013-11-04 11:11:32', 'U548391', 0),
(615, 151, 1, '1', '2013-11-04 10:18:30', 'U548391', '2013-11-05 16:38:54', 'U548391', 0),
(616, 152, 1, '1', '2013-11-04 10:19:41', 'U548391', '2013-11-05 16:51:17', 'U548391', 0),
(617, 153, 1, '1', '2013-11-04 10:20:09', 'U548391', '2013-11-05 16:41:45', 'U548391', 0),
(618, 154, 1, '1', '2013-11-04 10:22:54', 'U548391', '2013-11-14 09:02:19', 'U548391', 0),
(619, 155, 1, '1', '2013-11-04 10:23:16', 'U548391', '2013-11-04 10:23:16', 'U548391', 0),
(620, 155, 2, '0', '2013-11-04 10:23:16', 'U548391', NULL, NULL, 0),
(621, 156, 1, '1', '2013-11-04 10:24:14', 'U548391', '2013-11-04 10:24:14', 'U548391', 0),
(622, 156, 2, '0', '2013-11-04 10:24:14', 'U548391', NULL, NULL, 0),
(623, 157, 1, '1', '2013-11-04 10:24:34', 'U548391', NULL, NULL, 0),
(624, 158, 1, '1', '2013-11-04 10:48:13', 'U548391', '2014-01-29 11:27:43', 'U548391', 0),
(625, 159, 1, '1', '2013-11-04 10:49:40', 'U548391', NULL, NULL, 0),
(626, 160, 1, '1', '2013-11-04 10:54:03', 'U548391', '2013-11-26 12:01:26', 'U548391', 0),
(627, 161, 1, '1', '2013-11-04 10:55:00', 'U548391', '2013-11-22 11:23:15', 'U188353', 0),
(628, 162, 1, '1', '2013-11-04 10:55:39', 'U548391', NULL, NULL, 0),
(629, 163, 1, '1', '2013-11-04 10:58:32', 'U548391', NULL, NULL, 0),
(630, 164, 1, '1', '2013-11-04 11:00:24', 'U548391', NULL, NULL, 0),
(631, 165, 1, '1', '2013-11-04 11:01:01', 'U548391', NULL, NULL, 0),
(632, 166, 1, '1', '2013-11-04 11:02:57', 'U548391', NULL, NULL, 0),
(633, 167, 1, '1', '2013-11-04 11:03:29', 'U548391', NULL, NULL, 0),
(634, 168, 1, '1', '2013-11-04 11:03:57', 'U548391', '2013-11-22 16:16:11', 'U188353', 0),
(635, 169, 1, '1', '2013-11-04 11:04:51', 'U548391', NULL, NULL, 0),
(636, 170, 1, '1', '2013-11-04 11:05:35', 'U548391', NULL, NULL, 0),
(637, 171, 1, '1', '2013-11-04 11:06:27', 'U548391', NULL, NULL, 0),
(638, 172, 1, '1', '2013-11-04 11:07:08', 'U548391', NULL, NULL, 0),
(639, 173, 1, '1', '2013-11-04 11:08:16', 'U548391', '2013-11-22 16:21:22', 'U188353', 0),
(640, 174, 1, '1', '2013-11-04 11:09:21', 'U548391', NULL, NULL, 0),
(641, 175, 1, '1', '2013-11-04 11:09:49', 'U548391', NULL, NULL, 0),
(642, 176, 1, '1', '2013-11-04 11:10:05', 'U548391', NULL, NULL, 0),
(643, 177, 1, '1', '2013-11-04 11:11:00', 'U548391', '2013-11-04 11:11:00', 'U548391', 0),
(644, 177, 2, '0', '2013-11-04 11:11:00', 'U548391', NULL, NULL, 0),
(645, 178, 1, '1', '2013-11-04 11:11:10', 'U548391', '2013-11-22 16:46:14', 'U548391', 0),
(646, 150, 5, '0', '2013-11-04 11:11:32', 'U548391', '2013-11-04 11:12:26', 'U548391', 0),
(647, 150, 10, '0', '2013-11-04 11:12:26', 'U548391', '2013-11-04 11:12:39', 'U548391', 0),
(648, 150, 11, '0', '2013-11-04 11:12:39', 'U548391', '2013-11-05 16:33:28', 'U548391', 0),
(649, 127, 2, '0', '2013-11-04 11:12:52', 'U548391', NULL, NULL, 0),
(650, 26, 2, '649', '2013-11-04 11:12:52', 'U548391', NULL, NULL, 0),
(651, 179, 1, '1', '2013-11-04 11:44:00', 'U548391', '2013-11-04 11:44:00', 'U548391', 0),
(652, 179, 2, '0', '2013-11-04 11:44:00', 'U548391', NULL, NULL, 0),
(653, 180, 1, '1', '2013-11-04 11:44:08', 'U548391', NULL, NULL, 0),
(654, 126, 5, '0', '2013-11-05 16:31:38', 'U548391', '2013-11-05 16:31:44', 'U548391', 0),
(655, 126, 10, '0', '2013-11-05 16:31:44', 'U548391', '2013-11-05 16:31:51', 'U548391', 0),
(656, 126, 10, '0', '2013-11-05 16:31:51', 'U548391', '2013-11-05 16:32:31', 'U548391', 0),
(657, 126, 10, '0', '2013-11-05 16:32:31', 'U548391', '2013-11-05 17:01:48', 'U548391', 0),
(658, 150, 10, '0', '2013-11-05 16:33:28', 'U548391', '2013-11-05 16:33:37', 'U548391', 0),
(659, 150, 10, '0', '2013-11-05 16:33:37', 'U548391', '2013-11-05 16:34:30', 'U548391', 0),
(660, 150, 10, '0', '2013-11-05 16:34:30', 'U548391', '2013-11-05 16:34:39', 'U548391', 0),
(661, 150, 10, '0', '2013-11-05 16:34:39', 'U548391', '2013-11-14 08:59:25', 'U548391', 0),
(662, 151, 10, '0', '2013-11-05 16:38:54', 'U548391', '2013-11-05 16:39:02', 'U548391', 0),
(663, 151, 5, '0', '2013-11-05 16:39:02', 'U548391', '2013-11-05 16:39:10', 'U548391', 0),
(664, 151, 10, '0', '2013-11-05 16:39:10', 'U548391', '2013-11-05 17:02:54', 'U548391', 0),
(665, 153, 10, '0', '2013-11-05 16:41:45', 'U548391', '2013-11-05 16:41:51', 'U548391', 0),
(666, 153, 10, '0', '2013-11-05 16:41:51', 'U548391', '2013-11-05 16:42:09', 'U548391', 0),
(667, 153, 5, '0', '2013-11-05 16:42:09', 'U548391', '2013-11-05 16:42:15', 'U548391', 0),
(668, 153, 10, '0', '2013-11-05 16:42:15', 'U548391', '2013-11-14 09:36:26', 'U548391', 0),
(669, 152, 10, '0', '2013-11-05 16:51:17', 'U548391', '2013-11-05 16:52:46', 'U548391', 0),
(670, 152, 10, '0', '2013-11-05 16:52:46', 'U548391', '2013-11-05 16:52:50', 'U548391', 0),
(671, 152, 10, '0', '2013-11-05 16:52:50', 'U548391', '2013-11-05 16:52:52', 'U548391', 0),
(672, 152, 5, '0', '2013-11-05 16:52:52', 'U548391', '2013-11-05 16:52:59', 'U548391', 0),
(673, 152, 10, '0', '2013-11-05 16:52:59', 'U548391', '2013-11-05 16:53:06', 'U548391', 0),
(674, 152, 6, '0', '2013-11-05 16:53:06', 'U548391', '2013-11-05 16:53:10', 'U548391', 0),
(675, 152, 10, '0', '2013-11-05 16:53:10', 'U548391', '2013-11-05 16:58:22', 'U548391', 0),
(676, 152, 5, '0', '2013-11-05 16:58:22', 'U548391', '2013-11-05 16:58:31', 'U548391', 0),
(677, 152, 6, '0', '2013-11-05 16:58:31', 'U548391', '2013-11-05 16:58:36', 'U548391', 0),
(678, 152, 10, '0', '2013-11-05 16:58:36', 'U548391', '2013-11-05 16:58:40', 'U548391', 0),
(679, 152, 5, '0', '2013-11-05 16:58:40', 'U548391', '2013-11-05 16:58:46', 'U548391', 0),
(680, 152, 10, '0', '2013-11-05 16:58:46', 'U548391', '2013-11-05 16:58:51', 'U548391', 0),
(681, 152, 6, '0', '2013-11-05 16:58:51', 'U548391', '2013-11-05 16:58:59', 'U548391', 0),
(682, 152, 10, '0', '2013-11-05 16:58:59', 'U548391', '2013-11-05 17:04:17', 'U548391', 0),
(683, 126, 2, '0', '2013-11-05 17:01:48', 'U548391', '2013-11-05 17:01:54', 'U548391', 0),
(684, 126, 17, '22', '2013-11-05 17:01:54', 'U548391', NULL, NULL, 0),
(685, 151, 10, '0', '2013-11-05 17:02:54', 'U548391', '2013-11-05 17:03:04', 'U548391', 0),
(686, 151, 17, '44', '2013-11-05 17:03:04', 'U548391', '2013-11-12 10:46:21', 'U548391', 0),
(687, 152, 10, '0', '2013-11-05 17:04:17', 'U548391', '2013-11-05 17:04:20', 'U548391', 0),
(688, 152, 5, '0', '2013-11-05 17:04:20', 'U548391', '2013-11-05 17:04:27', 'U548391', 0),
(689, 152, 10, '0', '2013-11-05 17:04:27', 'U548391', '2013-11-05 17:04:34', 'U548391', 0),
(690, 152, 18, '39', '2013-11-05 17:04:34', 'U548391', '2013-11-05 17:04:39', 'U548391', 0),
(691, 152, 6, '0', '2013-11-05 17:04:39', 'U548391', '2013-11-05 17:04:44', 'U548391', 0),
(692, 152, 10, '0', '2013-11-05 17:04:44', 'U548391', '2013-11-14 09:02:03', 'U548391', 0),
(693, 151, 17, '456', '2013-11-12 10:46:21', 'U548391', '2013-11-12 15:23:15', 'U548391', 0),
(694, 151, 17, '44564', '2013-11-12 15:23:15', 'U548391', '2013-12-03 09:46:19', 'U548391', 0),
(695, 150, 10, '0', '2013-11-14 08:59:25', 'U548391', '2013-11-14 09:00:54', 'U548391', 0),
(696, 150, 10, '0', '2013-11-14 09:00:54', 'U548391', '2013-12-16 09:59:33', 'U548391', 0),
(697, 152, 5, '0', '2013-11-14 09:02:03', 'U548391', '2013-11-14 09:13:09', 'U548391', 0),
(698, 154, 10, '0', '2013-11-14 09:02:19', 'U548391', '2013-11-14 09:03:01', 'U548391', 0),
(699, 154, 10, '0', '2013-11-14 09:03:01', 'U548391', '2013-11-14 09:03:30', 'U548391', 0),
(700, 154, 10, '0', '2013-11-14 09:03:30', 'U548391', '2013-11-14 09:05:39', 'U548391', 0),
(701, 154, 5, '0', '2013-11-14 09:05:39', 'U548391', '2013-11-14 09:06:08', 'U548391', 0),
(702, 154, 10, '0', '2013-11-14 09:06:08', 'U548391', '2013-11-14 09:06:50', 'U548391', 0),
(703, 154, 6, '0', '2013-11-14 09:06:50', 'U548391', '2013-11-14 09:06:55', 'U548391', 0),
(704, 154, 5, '0', '2013-11-14 09:06:55', 'U548391', '2013-11-14 09:07:59', 'U548391', 0),
(705, 154, 6, '0', '2013-11-14 09:07:59', 'U548391', '2013-11-14 09:08:03', 'U548391', 0),
(706, 154, 5, '0', '2013-11-14 09:08:03', 'U548391', '2013-11-14 09:10:18', 'U548391', 0),
(707, 154, 10, '0', '2013-11-14 09:10:18', 'U548391', '2013-11-21 09:39:06', 'U548391', 0),
(708, 152, 6, '0', '2013-11-14 09:13:09', 'U548391', '2013-11-14 09:13:14', 'U548391', 0),
(709, 152, 5, '0', '2013-11-14 09:13:14', 'U548391', '2014-04-07 15:46:58', 'U1', 0),
(710, 153, 6, '0', '2013-11-14 09:36:26', 'U548391', '2013-11-14 09:36:30', 'U548391', 0),
(711, 153, 5, '0', '2013-11-14 09:36:30', 'U548391', '2013-11-21 09:41:19', 'U548391', 0),
(712, 181, 1, '1', '2013-11-18 10:33:24', 'U548391', '2013-11-18 10:33:24', 'U548391', 0),
(713, 181, 2, '0', '2013-11-18 10:33:24', 'U548391', NULL, NULL, 0),
(714, 182, 1, '1', '2013-11-18 10:33:34', 'U548391', '2013-11-18 10:33:34', 'U548391', 0),
(715, 182, 2, '0', '2013-11-18 10:33:34', 'U548391', NULL, NULL, 0),
(716, 183, 1, '1', '2013-11-18 10:33:43', 'U548391', NULL, NULL, 0),
(717, 184, 1, '1', '2013-11-18 10:44:01', 'U548391', '2013-11-18 10:44:01', 'U548391', 0),
(718, 184, 2, '0', '2013-11-18 10:44:01', 'U548391', NULL, NULL, 0),
(719, 185, 1, '1', '2013-11-18 10:44:14', 'U548391', NULL, NULL, 0),
(720, 154, 2, '0', '2013-11-21 09:39:06', 'U548391', NULL, NULL, 0),
(721, 153, 2, '0', '2013-11-21 09:41:19', 'U548391', NULL, NULL, 0),
(722, 161, 5, '0', '2013-11-22 11:23:15', 'U188353', NULL, NULL, 0),
(723, 186, 1, '1', '2013-11-22 11:43:50', 'U188353', NULL, NULL, 0),
(724, 48, 5, '0', '2013-11-22 16:09:17', 'U188353', '2013-11-22 16:09:57', 'U188353', 0),
(725, 48, 12, '3', '2013-11-22 16:09:57', 'U188353', '2013-11-22 16:10:12', 'U188353', 0),
(726, 48, 6, '0', '2013-11-22 16:10:12', 'U188353', '2013-11-22 16:11:11', 'U188353', 0),
(727, 48, 5, '0', '2013-11-22 16:11:11', 'U188353', '2013-11-22 16:11:26', 'U188353', 0),
(728, 48, 6, '0', '2013-11-22 16:11:26', 'U188353', '2013-11-22 16:11:42', 'U188353', 0),
(729, 48, 8, '196798', '2013-11-22 16:11:42', 'U188353', '2014-04-30 17:02:59', 'U548391', 0),
(730, 168, 5, '0', '2013-11-22 16:16:11', 'U188353', '2013-11-22 16:16:19', 'U188353', 0),
(731, 168, 6, '0', '2013-11-22 16:16:19', 'U188353', '2013-11-22 16:16:42', 'U188353', 0),
(732, 168, 8, '199629', '2013-11-22 16:16:42', 'U188353', '2014-01-28 12:46:57', 'U548391', 0),
(733, 173, 5, '0', '2013-11-22 16:21:22', 'U188353', NULL, NULL, 0),
(734, 178, 5, '0', '2013-11-22 16:46:14', 'U548391', '2014-06-16 14:26:26', 'U548391', 0),
(735, 187, 1, '1', '2013-11-26 11:37:48', 'U548391', '2013-11-26 11:37:48', 'U548391', 0),
(736, 187, 14, '46', '2013-11-26 11:37:48', 'U548391', '2014-05-21 16:54:11', 'U548391', 0),
(737, 160, 5, '0', '2013-11-26 12:01:26', 'U548391', '2014-06-16 14:26:25', 'U548391', 0),
(738, 188, 1, '1', '2013-11-26 12:04:40', 'U548391', NULL, NULL, 0),
(739, 42, 5, '0', '2013-11-26 16:38:39', 'U548391', '2013-11-26 16:38:55', 'U548391', 0),
(740, 42, 6, '0', '2013-11-26 16:38:55', 'U548391', NULL, NULL, 0),
(741, 151, 10, '0', '2013-12-03 09:46:19', 'U548391', '2013-12-16 11:43:03', 'U548391', 0),
(742, 33, 6, '0', '2013-12-03 10:38:20', 'U548391', '2014-04-07 15:46:51', 'U1', 0),
(743, 150, 10, '0', '2013-12-16 09:59:33', 'U548391', '2014-03-25 11:55:29', 'U548391', 0),
(744, 151, 10, '0', '2013-12-16 11:43:03', 'U548391', '2013-12-16 11:43:15', 'U548391', 0),
(745, 151, 10, '0', '2013-12-16 11:43:15', 'U548391', '2013-12-16 12:47:31', 'U548391', 0),
(746, 151, 10, '0', '2013-12-16 12:47:31', 'U548391', '2013-12-16 12:48:38', 'U548391', 0),
(747, 151, 10, '0', '2013-12-16 12:48:38', 'U548391', '2013-12-16 15:07:47', 'U548391', 0),
(748, 151, 10, '0', '2013-12-16 15:07:47', 'U548391', '2013-12-16 15:14:32', 'U548391', 0),
(749, 151, 10, '0', '2013-12-16 15:14:32', 'U548391', '2014-03-21 16:32:28', 'U548391', 0),
(750, 189, 1, '1', '2013-12-17 10:00:25', 'U548391', NULL, NULL, 0),
(751, 190, 1, '1', '2014-01-13 12:08:53', 'U548391', '2014-01-13 12:08:53', 'U548391', 0),
(752, 190, 2, '0', '2014-01-13 12:08:53', 'U548391', NULL, NULL, 0),
(753, 191, 1, '1', '2014-01-24 11:45:04', 'U548391', NULL, NULL, 0),
(754, 168, 6, '0', '2014-01-28 12:46:57', 'U548391', NULL, NULL, 0),
(755, 1, 6, '0', '2014-01-28 14:36:38', 'U548391', NULL, NULL, 0),
(756, 192, 1, '1', '2014-01-28 14:51:07', 'U548391', NULL, NULL, 0),
(757, 193, 1, '1', '2014-01-28 14:52:43', 'U548391', NULL, NULL, 0),
(758, 194, 1, '1', '2014-01-28 14:53:04', 'U548391', '2014-05-21 16:51:29', 'U548391', 0),
(759, 195, 1, '1', '2014-01-28 14:55:50', 'U548391', NULL, NULL, 0),
(760, 158, 5, '0', '2014-01-29 11:27:43', 'U548391', '2014-06-16 14:26:25', 'U548391', 0),
(761, 196, 1, '1', '2014-01-31 09:48:44', 'U548391', NULL, NULL, 0),
(762, 197, 1, '1', '2014-02-04 10:22:27', 'U548391', '2014-05-21 16:46:23', 'U548391', 0),
(763, 198, 1, '1', '2014-02-04 10:41:47', 'U548391', NULL, NULL, 0),
(764, 199, 1, '1', '2014-02-04 10:43:41', 'U548391', NULL, NULL, 0),
(765, 151, 10, '0', '2014-03-21 16:32:28', 'U548391', '2014-04-30 17:13:14', 'U548391', 0),
(766, 150, 18, '1234', '2014-03-25 11:55:29', 'U548391', '2014-03-25 11:57:21', 'U548391', 0),
(767, 150, 18, '416708', '2014-03-25 11:57:21', 'U548391', '2014-03-25 15:45:53', 'U548391', 0),
(768, 150, 19, '269215', '2014-03-25 15:45:53', 'U548391', '2014-03-26 10:00:56', 'U548391', 0),
(769, 150, 17, '923677', '2014-03-26 10:00:56', 'U548391', '2014-03-28 11:42:51', 'U548391', 0),
(770, 150, 10, '0', '2014-03-28 11:42:51', 'U548391', '2014-04-07 15:46:52', 'U1', 0),
(771, 6, 27, '77', '2014-04-07 15:46:48', 'U1', '2014-04-07 15:46:49', 'U1', 0),
(772, 18, 2, '771', '2014-04-07 15:46:48', 'U1', '2014-04-07 15:46:49', 'U1', 0),
(773, 19, 2, '771', '2014-04-07 15:46:48', 'U1', '2014-04-07 15:46:49', 'U1', 0),
(774, 6, 28, '145', '2014-04-07 15:46:49', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(775, 18, 2, '774', '2014-04-07 15:46:49', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(776, 19, 2, '774', '2014-04-07 15:46:49', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(777, 6, 26, '4578', '2014-04-07 15:46:50', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(778, 18, 2, '777', '2014-04-07 15:46:50', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(779, 19, 2, '777', '2014-04-07 15:46:50', 'U1', '2014-04-07 15:46:50', 'U1', 0),
(780, 6, 27, '4578', '2014-04-07 15:46:50', 'U1', '2014-04-07 16:18:18', 'U548391', 0),
(781, 18, 2, '780', '2014-04-07 15:46:50', 'U1', '2014-04-07 16:18:52', 'U1', 0),
(782, 19, 2, '780', '2014-04-07 15:46:50', 'U1', '2014-04-07 16:18:52', 'U1', 0),
(783, 33, 27, '1234', '2014-04-07 15:46:51', 'U1', NULL, NULL, 0),
(784, 35, 2, '783', '2014-04-07 15:46:51', 'U1', NULL, NULL, 0),
(785, 150, 26, '1234', '2014-04-07 15:46:52', 'U1', '2014-04-07 15:46:53', 'U1', 0),
(786, 150, 28, '269215', '2014-04-07 15:46:53', 'U1', '2014-04-07 15:46:53', 'U1', 0),
(787, 150, 26, '416708', '2014-04-07 15:46:53', 'U1', NULL, NULL, 0),
(788, 152, 26, '39', '2014-04-07 15:46:58', 'U1', NULL, NULL, 0),
(789, 6, 25, '0', '2014-04-07 16:18:18', 'U548391', '2014-04-07 16:18:52', 'U1', 0),
(790, 7, 5, '0', '2014-04-07 16:18:27', 'U548391', '2014-04-07 16:18:36', 'U548391', 0),
(791, 7, 17, '77', '2014-04-07 16:18:36', 'U548391', '2014-04-07 16:18:55', 'U1', 0),
(792, 6, 27, '77', '2014-04-07 16:18:52', 'U1', '2014-04-07 16:18:53', 'U1', 0),
(793, 18, 2, '792', '2014-04-07 16:18:52', 'U1', '2014-04-07 16:18:53', 'U1', 0),
(794, 19, 2, '792', '2014-04-07 16:18:52', 'U1', '2014-04-07 16:18:53', 'U1', 0),
(795, 6, 28, '145', '2014-04-07 16:18:53', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(796, 18, 2, '795', '2014-04-07 16:18:53', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(797, 19, 2, '795', '2014-04-07 16:18:53', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(798, 6, 26, '4578', '2014-04-07 16:18:54', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(799, 18, 2, '798', '2014-04-07 16:18:54', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(800, 19, 2, '798', '2014-04-07 16:18:54', 'U1', '2014-04-07 16:18:54', 'U1', 0),
(801, 6, 27, '4578', '2014-04-07 16:18:54', 'U1', NULL, NULL, 0),
(802, 18, 2, '801', '2014-04-07 16:18:54', 'U1', NULL, NULL, 0),
(803, 19, 2, '801', '2014-04-07 16:18:54', 'U1', NULL, NULL, 0),
(804, 7, 27, '77', '2014-04-07 16:18:55', 'U1', NULL, NULL, 0),
(805, 36, 17, '4578', '2014-04-09 15:32:47', 'U548391', '2014-04-09 15:33:26', 'U548391', 0),
(806, 36, 18, '4578', '2014-04-09 15:33:26', 'U548391', '2014-04-09 15:34:04', 'U1', 0),
(807, 36, 27, '4578', '2014-04-09 15:34:04', 'U1', '2014-04-09 15:34:05', 'U1', 0),
(808, 24, 2, '807', '2014-04-09 15:34:05', 'U1', '2014-04-09 15:34:05', 'U1', 0),
(809, 36, 26, '4578', '2014-04-09 15:34:05', 'U1', '2014-04-09 15:46:00', 'U548391', 0),
(810, 24, 2, '809', '2014-04-09 15:34:05', 'U1', '2014-04-09 15:47:06', 'U1', 0),
(811, 36, 25, '0', '2014-04-09 15:46:00', 'U548391', '2014-04-09 15:47:06', 'U1', 0),
(812, 36, 27, '4578', '2014-04-09 15:47:06', 'U1', '2014-04-09 15:47:07', 'U1', 0),
(813, 24, 2, '812', '2014-04-09 15:47:06', 'U1', '2014-04-09 15:56:26', 'U548391', 0),
(814, 36, 29, '0', '2014-04-09 15:47:07', 'U1', '2014-04-09 15:48:00', 'U548391', 0),
(815, 36, 25, '0', '2014-04-09 15:48:00', 'U548391', '2014-06-16 14:26:23', 'U548391', 0),
(816, 24, 17, '63589', '2014-04-09 15:56:26', 'U548391', '2014-04-09 15:56:36', 'U1', 0),
(817, 24, 30, '0', '2014-04-09 15:56:36', 'U1', NULL, NULL, 0),
(818, 48, 6, '0', '2014-04-30 17:03:00', 'U548391', NULL, NULL, 0),
(819, 151, 2, '0', '2014-04-30 17:13:14', 'U548391', NULL, NULL, 0),
(820, 200, 1, '1', '2014-05-15 16:21:27', 'U548391', '2014-05-15 16:22:15', 'U548391', 0),
(821, 200, 5, '0', '2014-05-15 16:22:15', 'U548391', '2014-05-21 16:54:30', 'U548391', 0),
(822, 201, 1, '1', '2014-05-21 15:07:05', 'U548391', '2014-05-23 10:30:29', 'U548391', 0),
(823, 202, 1, '1', '2014-05-21 15:24:13', 'U548391', NULL, NULL, 0),
(824, 203, 1, '1', '2014-05-21 15:27:18', 'U548391', '2014-05-21 17:23:10', 'U548391', 0),
(825, 197, 5, '0', '2014-05-21 16:46:23', 'U548391', '2014-06-16 14:26:27', 'U548391', 0),
(826, 194, 5, '0', '2014-05-21 16:51:29', 'U548391', '2014-06-16 14:26:27', 'U548391', 0),
(827, 47, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(828, 62, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(829, 65, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(830, 67, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(831, 70, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(832, 72, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(833, 73, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(834, 74, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(835, 75, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(836, 76, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(837, 77, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(838, 78, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(839, 81, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(840, 82, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(841, 83, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(842, 84, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(843, 87, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(844, 88, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(845, 89, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(846, 90, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(847, 91, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(848, 93, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(849, 94, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(850, 95, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(851, 96, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(852, 97, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(853, 98, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(854, 99, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(855, 100, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(856, 101, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(857, 102, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(858, 103, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(859, 104, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(860, 105, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(861, 106, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(862, 107, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(863, 108, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(864, 109, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(865, 110, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(866, 111, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(867, 112, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(868, 128, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(869, 187, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(870, 46, 4, '5', '2014-05-21 16:54:11', 'U548391', NULL, NULL, 0),
(871, 200, 4, '2', '2014-05-21 16:54:30', 'U548391', NULL, NULL, 0),
(872, 203, 10, '0', '2014-05-21 17:23:10', 'U548391', NULL, NULL, 0),
(873, 45, 5, '0', '2014-05-21 17:51:53', 'U548391', '2014-05-26 16:14:20', 'U548391', 0),
(874, 201, 5, '0', '2014-05-23 10:30:29', 'U548391', '2014-06-16 14:26:28', 'U548391', 0),
(875, 41, 14, '201', '2014-05-26 15:12:26', 'U548391', '2014-05-26 16:10:50', 'U548391', 0),
(876, 79, 16, '0', '2014-05-26 15:13:02', 'U548391', '2014-05-26 16:14:20', 'U548391', 0),
(877, 41, 15, '0', '2014-05-26 16:10:51', 'U548391', '2014-06-16 14:26:24', 'U548391', 0),
(878, 45, 2, '0', '2014-05-26 16:14:20', 'U548391', NULL, NULL, 0),
(879, 66, 2, '0', '2014-05-26 16:14:20', 'U548391', NULL, NULL, 0),
(880, 68, 2, '0', '2014-05-26 16:14:20', 'U548391', NULL, NULL, 0),
(881, 69, 2, '0', '2014-05-26 16:14:20', 'U548391', NULL, NULL, 0),
(882, 79, 2, '0', '2014-05-26 16:14:20', 'U548391', NULL, NULL, 0),
(883, 204, 1, '1', '2014-05-26 16:33:47', 'U548391', '2014-05-26 16:33:47', 'U548391', 0),
(884, 204, 14, '199', '2014-05-26 16:33:47', 'U548391', NULL, NULL, 0),
(885, 205, 1, '1', '2014-06-04 12:34:23', 'U548391', NULL, NULL, 0),
(886, 206, 1, '1', '2014-06-04 12:37:04', 'U548391', NULL, NULL, 0),
(887, 207, 1, '1', '2014-06-04 12:38:58', 'U548391', NULL, NULL, 0),
(888, 208, 1, '1', '2014-06-04 12:39:56', 'U548391', NULL, NULL, 0),
(889, 209, 1, '1', '2014-06-04 12:44:19', 'U548391', '2014-06-05 11:05:48', 'U548391', 0),
(890, 210, 1, '1', '2014-06-04 16:44:38', 'U548391', NULL, NULL, 0),
(891, 209, 5, '0', '2014-06-05 11:05:48', 'U548391', '2014-06-05 11:07:02', 'U548391', 0),
(892, 209, 10, '0', '2014-06-05 11:07:02', 'U548391', '2014-06-16 14:26:28', 'U548391', 0),
(893, 211, 1, '1', '2014-06-05 14:39:23', 'U548391', NULL, NULL, 0),
(894, 212, 1, '1', '2014-06-05 14:56:48', 'U548391', '2014-06-05 14:56:48', 'U548391', 0),
(895, 212, 14, '197', '2014-06-05 14:56:48', 'U548391', NULL, NULL, 0),
(896, 213, 1, '1', '2014-06-05 15:06:00', 'U548391', NULL, NULL, 0),
(897, 36, 6, '0', '2014-06-16 14:26:23', 'U548391', NULL, NULL, 0),
(898, 41, 6, '0', '2014-06-16 14:26:24', 'U548391', NULL, NULL, 0),
(899, 51, 6, '0', '2014-06-16 14:26:24', 'U548391', NULL, NULL, 0),
(900, 60, 6, '0', '2014-06-16 14:26:24', 'U548391', NULL, NULL, 0),
(901, 158, 6, '0', '2014-06-16 14:26:25', 'U548391', NULL, NULL, 0),
(902, 160, 6, '0', '2014-06-16 14:26:25', 'U548391', NULL, NULL, 0),
(903, 178, 6, '0', '2014-06-16 14:26:26', 'U548391', NULL, NULL, 0),
(904, 194, 6, '0', '2014-06-16 14:26:27', 'U548391', NULL, NULL, 0),
(905, 197, 6, '0', '2014-06-16 14:26:27', 'U548391', NULL, NULL, 0),
(906, 201, 6, '0', '2014-06-16 14:26:28', 'U548391', NULL, NULL, 0),
(907, 209, 6, '0', '2014-06-16 14:26:28', 'U548391', NULL, NULL, 0),
(908, 34, 5, '0', '2014-06-16 16:27:35', 'U548391', NULL, NULL, 0),
(909, 214, 1, '1', '2014-06-17 17:28:19', 'U548391', '2014-06-17 17:28:20', 'U548391', 0),
(910, 214, 2, '0', '2014-06-17 17:28:20', 'U548391', NULL, NULL, 0),
(911, 215, 1, '1', '2014-06-17 17:29:52', 'U548391', NULL, NULL, 0),
(912, 216, 1, '1', '2014-06-18 10:18:24', 'U548391', NULL, NULL, 0),
(913, 217, 1, '1', '2014-07-08 14:51:14', 'U548391', NULL, NULL, 0),
(914, 218, 1, '1', '2014-07-08 15:13:13', 'U548391', NULL, NULL, 0),
(915, 219, 1, '1', '2014-07-08 15:21:46', 'U548391', NULL, NULL, 0),
(916, 220, 1, '1', '2014-07-10 10:18:18', 'U548391', NULL, NULL, 0),
(917, 224, 1, '1', '2014-07-11 11:12:47', 'U548391', '2014-07-11 11:12:47', 'U548391', 0),
(918, 224, 14, '186', '2014-07-11 11:12:47', 'U548391', NULL, NULL, 0),
(919, 225, 1, '1', '2014-07-11 11:14:58', 'U548391', NULL, NULL, 0),
(920, 226, 1, '2', '2014-07-11 11:26:05', 'U548391', NULL, NULL, 0),
(921, 227, 1, '2', '2014-07-11 11:26:42', 'U548391', '2014-07-11 11:26:42', 'U548391', 0),
(922, 227, 4, '1', '2014-07-11 11:26:42', 'U548391', '2014-07-11 11:26:42', 'U548391', 0),
(923, 227, 14, '51', '2014-07-11 11:26:42', 'U548391', NULL, NULL, 0),
(924, 228, 1, '2', '2014-07-11 11:34:27', 'U548391', NULL, NULL, 0),
(925, 229, 1, '1', '2014-07-11 11:35:06', 'U548391', NULL, NULL, 0),
(926, 230, 1, '1', '2014-07-11 11:49:01', 'U548391', '2014-07-11 11:49:01', 'U548391', 0),
(927, 230, 14, '206', '2014-07-11 11:49:01', 'U548391', NULL, NULL, 0),
(928, 231, 1, '1', '2014-07-11 11:51:05', 'U548391', '2014-07-11 11:51:05', 'U548391', 0),
(929, 231, 14, '71', '2014-07-11 11:51:05', 'U548391', NULL, NULL, 0),
(930, 232, 1, '2', '2014-07-11 12:52:09', 'U548391', '2014-07-11 12:54:32', 'U199629', 0),
(931, 232, 5, '0', '2014-07-11 12:54:32', 'U199629', '2014-07-11 12:54:43', 'U199629', 0),
(932, 232, 4, '1', '2014-07-11 12:54:43', 'U199629', '2014-07-11 13:27:23', 'U548391', 0),
(933, 233, 1, '2', '2014-07-11 12:55:23', 'U548391', '2014-07-11 12:55:23', 'U548391', 0),
(934, 233, 4, '1', '2014-07-11 12:55:23', 'U548391', '2014-07-11 12:55:23', 'U548391', 0),
(935, 233, 14, '232', '2014-07-11 12:55:23', 'U548391', NULL, NULL, 0),
(936, 234, 1, '2', '2014-07-11 12:56:22', 'U199629', '2014-07-11 16:52:24', 'U199629', 0),
(937, 235, 1, '1', '2014-07-11 13:24:57', 'U548391', '2014-07-11 13:27:43', 'U548391', 0),
(938, 236, 1, '2', '2014-07-11 13:25:41', 'U199629', '2014-09-11 14:47:35', 'U199629', 0),
(939, 237, 1, '1', '2014-07-11 13:26:23', 'U548391', '2014-07-11 14:30:05', 'U548391', 0),
(940, 238, 1, '2', '2014-07-11 13:26:51', 'U199629', NULL, NULL, 0),
(941, 232, 5, '0', '2014-07-11 13:27:23', 'U548391', '2014-07-11 13:27:28', 'U548391', 0),
(942, 232, 10, '0', '2014-07-11 13:27:28', 'U548391', '2014-07-11 14:09:21', 'U548391', 0),
(943, 235, 5, '0', '2014-07-11 13:27:43', 'U548391', '2014-07-11 13:27:47', 'U548391', 0),
(944, 235, 14, '232', '2014-07-11 13:27:47', 'U548391', NULL, NULL, 0),
(945, 232, 10, '0', '2014-07-11 14:09:21', 'U548391', '2014-07-11 14:15:22', 'U548391', 0),
(946, 232, 10, '0', '2014-07-11 14:15:22', 'U548391', NULL, NULL, 0),
(947, 237, 10, '0', '2014-07-11 14:30:05', 'U548391', NULL, NULL, 0),
(948, 239, 1, '2', '2014-07-11 15:28:17', 'U548391', '2014-09-03 12:08:51', 'U199629', 0),
(949, 240, 1, '1', '2014-07-11 15:49:52', 'U548391', '2014-07-11 15:49:52', 'U548391', 0),
(950, 240, 2, '0', '2014-07-11 15:49:52', 'U548391', NULL, NULL, 0),
(951, 234, 10, '0', '2014-07-11 16:52:24', 'U199629', '2014-09-10 10:33:04', 'U199629', 0),
(952, 241, 1, '2', '2014-08-14 10:02:31', 'U548391', '2014-09-09 17:19:47', 'U199629', 0),
(953, 242, 1, '2', '2014-08-14 10:03:24', 'U548391', '2014-09-11 14:47:47', 'U199629', 0),
(954, 243, 1, '1', '2014-08-14 10:04:14', 'U548391', '2014-09-03 12:05:19', 'U548391', 0),
(955, 244, 1, '2', '2014-08-14 10:04:48', 'U548391', '2014-09-11 14:49:02', 'U199629', 0),
(956, 245, 1, '1', '2014-09-03 12:04:59', 'U548391', NULL, NULL, 0),
(957, 243, 5, '0', '2014-09-03 12:05:19', 'U548391', '2014-09-03 12:05:36', 'U548391', 0),
(958, 243, 2, '0', '2014-09-03 12:05:36', 'U548391', NULL, NULL, 0),
(959, 239, 5, '0', '2014-09-03 12:08:51', 'U199629', '2014-09-03 12:08:59', 'U199629', 0),
(960, 239, 4, '1', '2014-09-03 12:08:59', 'U199629', '2014-09-11 12:00:40', 'U548391', 0),
(961, 246, 1, '1', '2014-09-05 13:20:17', 'U548391', NULL, NULL, 0),
(962, 247, 1, '1', '2014-09-05 13:22:43', 'U548391', '2014-09-10 10:37:57', 'U548391', 0),
(963, 241, 5, '0', '2014-09-09 17:19:47', 'U199629', '2014-09-09 17:19:55', 'U199629', 0),
(964, 241, 4, '1', '2014-09-09 17:19:55', 'U199629', NULL, NULL, 0),
(965, 234, 5, '0', '2014-09-10 10:33:04', 'U199629', '2014-09-10 10:33:12', 'U199629', 0),
(966, 234, 4, '1', '2014-09-10 10:33:12', 'U199629', '2014-09-10 10:33:58', 'U548391', 0),
(967, 234, 5, '0', '2014-09-10 10:33:58', 'U548391', '2014-09-10 10:34:32', 'U548391', 0),
(968, 234, 14, '232', '2014-09-10 10:34:32', 'U548391', NULL, NULL, 0),
(969, 248, 1, '1', '2014-09-10 10:36:04', 'U199629', '2014-09-10 10:36:28', 'U548391', 0),
(970, 248, 5, '0', '2014-09-10 10:36:28', 'U548391', '2014-09-10 10:36:34', 'U548391', 0),
(971, 248, 14, '232', '2014-09-10 10:36:34', 'U548391', '2014-09-10 10:37:36', 'U548391', 0),
(972, 248, 15, '0', '2014-09-10 10:37:36', 'U548391', '2014-09-10 10:38:10', 'U548391', 0),
(973, 247, 5, '0', '2014-09-10 10:37:57', 'U548391', '2014-09-11 15:13:48', 'U548391', 0),
(974, 248, 14, '247', '2014-09-10 10:38:10', 'U548391', '2014-09-11 15:13:48', 'U548391', 0),
(975, 249, 1, '1', '2014-09-11 11:15:01', 'U199629', NULL, NULL, 0),
(976, 239, 5, '0', '2014-09-11 12:00:40', 'U548391', NULL, NULL, 0),
(977, 250, 1, '1', '2014-09-11 12:05:28', 'U548391', '2014-09-11 12:30:24', 'U548391', 0),
(978, 251, 1, '1', '2014-09-11 12:12:09', 'U199629', '2014-09-11 12:12:09', 'U199629', 0),
(979, 251, 14, '250', '2014-09-11 12:12:09', 'U199629', '2014-09-11 12:30:33', 'U548391', 0),
(980, 250, 5, '0', '2014-09-11 12:30:24', 'U548391', '2014-09-11 12:30:33', 'U548391', 0),
(981, 250, 2, '0', '2014-09-11 12:30:33', 'U548391', NULL, NULL, 0),
(982, 251, 2, '0', '2014-09-11 12:30:33', 'U548391', NULL, NULL, 0),
(983, 236, 5, '0', '2014-09-11 14:47:35', 'U199629', '2014-09-11 14:55:28', 'U199629', 0),
(984, 242, 5, '0', '2014-09-11 14:47:47', 'U199629', '2014-09-11 14:47:58', 'U199629', 0),
(985, 242, 14, '236', '2014-09-11 14:47:58', 'U199629', '2014-09-11 15:13:57', 'U548391', 0),
(986, 244, 5, '0', '2014-09-11 14:49:02', 'U199629', '2014-09-11 14:52:10', 'U199629', 0),
(987, 244, 2, '0', '2014-09-11 14:52:10', 'U199629', NULL, NULL, 0),
(988, 236, 2, '0', '2014-09-11 14:55:28', 'U199629', NULL, NULL, 0),
(989, 247, 2, '0', '2014-09-11 15:13:48', 'U548391', NULL, NULL, 0),
(990, 248, 2, '989', '2014-09-11 15:13:48', 'U548391', NULL, NULL, 0),
(991, 242, 15, '0', '2014-09-11 15:13:57', 'U548391', NULL, NULL, 0),
(992, 252, 1, '1', '2014-09-11 16:18:17', 'U123456', '2014-09-11 16:39:19', 'U548391', 0),
(993, 253, 1, '1', '2014-09-11 16:21:39', 'U186462', '2014-09-11 16:36:30', 'U548391', 0),
(994, 254, 1, '1', '2014-09-11 16:24:39', 'U123456', '2014-09-11 16:24:39', 'U123456', 0),
(995, 254, 14, '253', '2014-09-11 16:24:39', 'U123456', '2014-09-11 16:40:39', 'U548391', 0),
(996, 255, 1, '2', '2014-09-11 16:26:17', 'U123456', '2014-09-12 15:10:23', 'U199629', 0),
(997, 253, 5, '0', '2014-09-11 16:36:30', 'U548391', '2014-09-11 16:40:39', 'U548391', 0),
(998, 252, 5, '0', '2014-09-11 16:39:19', 'U548391', '2014-09-11 16:39:23', 'U548391', 0),
(999, 252, 4, '2', '2014-09-11 16:39:23', 'U548391', '2014-09-11 16:39:55', 'U196798', 0),
(1000, 252, 5, '0', '2014-09-11 16:39:55', 'U196798', NULL, NULL, 0),
(1001, 253, 2, '0', '2014-09-11 16:40:39', 'U548391', NULL, NULL, 0),
(1002, 254, 2, '1001', '2014-09-11 16:40:39', 'U548391', NULL, NULL, 0),
(1003, 255, 10, '0', '2014-09-12 15:10:23', 'U199629', NULL, NULL, 0),
(1004, 256, 1, '1', '2014-09-12 15:10:38', 'U199629', '2014-09-12 15:34:55', 'U548391', 0),
(1005, 256, 5, '0', '2014-09-12 15:34:55', 'U548391', '2014-09-12 15:42:10', 'U548391', 0),
(1006, 257, 1, '2', '2014-09-12 15:38:07', 'U548391', '2014-09-12 15:39:36', 'U196798', 0),
(1007, 257, 5, '0', '2014-09-12 15:39:36', 'U196798', '2014-09-15 17:30:53', 'U548391', 0),
(1008, 256, 4, '2', '2014-09-12 15:42:10', 'U548391', NULL, NULL, 0),
(1009, 258, 1, '1', '2014-09-12 15:56:23', 'U548391', '2014-09-12 15:56:26', 'U548391', 0),
(1010, 258, 5, '0', '2014-09-12 15:56:26', 'U548391', '2014-09-15 10:37:14', 'U548391', 0),
(1011, 259, 1, '1', '2014-09-12 17:15:53', 'U196798', '2014-09-15 16:15:37', 'U548391', 0),
(1012, 260, 1, '1', '2014-09-12 19:30:47', 'U196798', '2014-09-15 16:16:38', 'U548391', 0),
(1013, 258, 10, '0', '2014-09-15 10:37:14', 'U548391', '2014-09-15 14:19:20', 'U548391', 0),
(1014, 258, 10, '0', '2014-09-15 14:19:20', 'U548391', '2014-09-15 14:57:49', 'U548391', 0),
(1015, 258, 6, '0', '2014-09-15 14:57:49', 'U548391', '2014-09-15 14:57:58', 'U548391', 0),
(1016, 258, 5, '0', '2014-09-15 14:57:58', 'U548391', '2014-09-15 14:58:22', 'U548391', 0),
(1017, 258, 6, '0', '2014-09-15 14:58:22', 'U548391', '2014-09-15 14:59:18', 'U548391', 0),
(1018, 258, 10, '0', '2014-09-15 14:59:18', 'U548391', '2014-09-15 14:59:27', 'U548391', 0),
(1019, 258, 5, '0', '2014-09-15 14:59:27', 'U548391', '2014-09-15 17:01:26', 'U548391', 0),
(1020, 261, 1, '1', '2014-09-15 15:00:11', 'U548391', '2014-09-15 15:00:17', 'U548391', 0),
(1021, 261, 5, '0', '2014-09-15 15:00:17', 'U548391', '2014-09-15 15:00:42', 'U548391', 0),
(1022, 261, 4, '2', '2014-09-15 15:00:42', 'U548391', NULL, NULL, 0),
(1023, 259, 5, '0', '2014-09-15 16:15:37', 'U548391', '2014-09-15 16:15:55', 'U548391', 0),
(1024, 259, 10, '0', '2014-09-15 16:15:55', 'U548391', '2014-09-15 16:22:52', 'U548391', 0),
(1025, 260, 5, '0', '2014-09-15 16:16:38', 'U548391', '2014-09-15 17:12:47', 'U548391', 0),
(1026, 259, 16, '0', '2014-09-15 16:22:52', 'U548391', '2014-09-15 17:09:29', 'U548391', 0),
(1027, 258, 2, '0', '2014-09-15 17:01:26', 'U548391', NULL, NULL, 0),
(1028, 259, 2, '0', '2014-09-15 17:09:29', 'U548391', NULL, NULL, 0),
(1029, 260, 2, '0', '2014-09-15 17:12:47', 'U548391', NULL, NULL, 0),
(1030, 262, 1, '1', '2014-09-15 17:16:55', 'U548391', '2014-09-15 17:16:59', 'U548391', 0),
(1031, 262, 5, '0', '2014-09-15 17:16:59', 'U548391', '2014-09-15 17:17:43', 'U548391', 0),
(1032, 262, 2, '0', '2014-09-15 17:17:43', 'U548391', NULL, NULL, 0),
(1033, 257, 13, '0', '2014-09-15 17:30:53', 'U548391', NULL, NULL, 0),
(1034, 263, 1, '1', '2014-09-15 17:34:33', 'U548391', '2014-09-15 17:34:39', 'U548391', 0),
(1035, 263, 5, '0', '2014-09-15 17:34:39', 'U548391', '2014-09-15 17:34:43', 'U548391', 0),
(1036, 263, 6, '0', '2014-09-15 17:34:43', 'U548391', '2014-09-15 17:34:45', 'U548391', 0),
(1037, 263, 5, '0', '2014-09-15 17:34:45', 'U548391', '2014-09-15 17:34:49', 'U548391', 0),
(1038, 263, 11, '0', '2014-09-15 17:34:49', 'U548391', '2014-09-15 17:35:04', 'U548391', 0),
(1039, 263, 6, '0', '2014-09-15 17:35:04', 'U548391', '2014-09-15 17:35:10', 'U548391', 0),
(1040, 263, 17, '1234', '2014-09-15 17:35:10', 'U548391', '2014-09-15 17:35:16', 'U548391', 0),
(1041, 263, 5, '0', '2014-09-15 17:35:16', 'U548391', NULL, NULL, 0),
(1042, 264, 1, '1', '2014-09-16 17:00:24', 'U548391', '2014-09-16 17:00:32', 'U548391', 0),
(1043, 264, 5, '0', '2014-09-16 17:00:32', 'U548391', '2014-09-16 17:00:55', 'U548391', 0),
(1044, 264, 2, '0', '2014-09-16 17:00:55', 'U548391', NULL, NULL, 0),
(1045, 265, 1, '1', '2014-09-22 15:18:22', 'U548391', NULL, NULL, 0),
(1046, 287, 1, '1', '2014-11-12 22:54:48', 'IT1', NULL, NULL, 0),
(1047, 288, 1, '1', '2014-11-12 22:55:15', 'IT1', NULL, NULL, 0),
(1048, 289, 1, '1', '2014-11-12 22:57:37', 'IT1', NULL, NULL, 0),
(1049, 291, 1, '1', '2014-11-12 23:41:29', 'IT1', NULL, NULL, 0),
(1050, 292, 1, '1', '2014-11-12 23:42:32', 'IT1', NULL, NULL, 0),
(1051, 293, 1, '1', '2014-11-13 07:24:12', 'IT1', NULL, NULL, 0),
(1052, 294, 1, '1', '2014-11-13 07:42:24', 'IT1', NULL, NULL, 0),
(1053, 295, 1, '1', '2014-11-13 07:42:44', 'IT1', NULL, NULL, 0),
(1054, 296, 1, '1', '2014-11-13 07:44:50', 'IT1', NULL, NULL, 0),
(1055, 297, 1, '1', '2014-11-13 11:41:02', 'IT1', NULL, NULL, 0),
(1056, 298, 1, '1', '2014-11-13 11:41:52', 'IT1', NULL, NULL, 0),
(1057, 299, 1, '1', '2014-11-13 11:47:17', 'IT1', NULL, NULL, 0),
(1058, 300, 1, '1', '2014-11-13 11:48:26', 'IT1', NULL, NULL, 0),
(1059, 301, 1, '1', '2014-11-13 12:03:51', 'IT1', NULL, NULL, 0),
(1060, 302, 1, '1', '2014-11-13 12:05:22', 'IT1', NULL, NULL, 0),
(1061, 303, 1, '1', '2014-11-13 12:06:02', 'IT1', NULL, NULL, 0),
(1062, 304, 1, '1', '2014-11-13 12:07:09', 'IT1', NULL, NULL, 0),
(1063, 305, 1, '1', '2014-11-13 12:08:40', 'IT1', NULL, NULL, 0),
(1064, 306, 1, '1', '2014-11-13 12:09:17', 'IT1', NULL, NULL, 0),
(1065, 307, 1, '1', '2014-11-13 12:09:57', 'IT1', NULL, NULL, 0),
(1066, 308, 1, '1', '2014-11-13 12:11:42', 'IT1', NULL, NULL, 0),
(1067, 309, 1, '1', '2014-11-13 12:12:26', 'IT1', NULL, NULL, 0),
(1068, 310, 1, '1', '2014-11-13 12:13:12', 'IT1', NULL, NULL, 0),
(1069, 311, 1, '1', '2014-11-13 12:15:10', 'IT1', NULL, NULL, 0),
(1070, 312, 1, '1', '2014-11-13 12:16:15', 'IT1', NULL, NULL, 0),
(1071, 313, 1, '1', '2014-11-13 12:19:15', 'IT1', NULL, NULL, 0),
(1072, 314, 1, '1', '2014-11-13 12:19:57', 'IT1', NULL, NULL, 0),
(1073, 315, 1, '1', '2014-11-13 12:22:08', 'IT1', NULL, NULL, 0),
(1074, 316, 1, '1', '2014-11-13 12:23:46', 'IT1', NULL, NULL, 0),
(1075, 317, 1, '1', '2014-11-13 13:09:32', 'IT1', NULL, NULL, 0),
(1076, 318, 1, '1', '2014-11-13 13:11:33', 'IT1', NULL, NULL, 0),
(1077, 319, 1, '1', '2014-11-13 13:12:14', 'IT1', NULL, NULL, 0),
(1078, 320, 1, '1', '2014-11-13 13:14:13', 'IT1', NULL, NULL, 0),
(1079, 321, 1, '1', '2014-11-13 13:16:13', 'IT1', NULL, NULL, 0),
(1080, 322, 1, '1', '2014-11-13 13:17:30', 'IT1', NULL, NULL, 0),
(1081, 323, 1, '1', '2014-11-13 13:19:01', 'IT1', NULL, NULL, 0),
(1082, 324, 1, '1', '2014-11-13 13:20:41', 'IT1', NULL, NULL, 0),
(1083, 325, 1, '1', '2014-11-13 13:21:56', 'IT1', NULL, NULL, 0),
(1084, 326, 1, '1', '2014-11-13 13:25:36', 'IT1', NULL, NULL, 0),
(1085, 327, 1, '1', '2014-11-13 13:28:44', 'IT1', NULL, NULL, 0),
(1086, 328, 1, '1', '2014-11-13 13:29:53', 'IT1', NULL, NULL, 0),
(1087, 329, 1, '1', '2014-11-13 13:30:43', 'IT1', NULL, NULL, 0),
(1088, 330, 1, '1', '2014-11-13 13:46:44', 'IT1', NULL, NULL, 0),
(1089, 331, 1, '1', '2014-11-13 13:47:20', 'IT1', NULL, NULL, 0),
(1090, 332, 1, '1', '2014-11-13 13:47:44', 'IT1', NULL, NULL, 0),
(1091, 333, 1, '1', '2014-11-13 13:48:05', 'IT1', NULL, NULL, 0),
(1092, 334, 1, '1', '2014-11-13 13:49:52', 'IT1', NULL, NULL, 0),
(1093, 335, 1, '1', '2014-11-13 13:50:59', 'IT1', NULL, NULL, 0),
(1094, 336, 1, '1', '2014-11-13 13:52:12', 'IT1', NULL, NULL, 0),
(1095, 337, 1, '1', '2014-11-13 13:58:45', 'IT1', NULL, NULL, 0),
(1096, 341, 1, '1', '2014-11-13 14:25:15', 'IT1', NULL, NULL, 0),
(1097, 342, 1, '1', '2014-11-17 17:36:45', 'IT1', NULL, NULL, 0),
(1098, 343, 1, '1', '2014-11-17 17:37:12', 'IT1', NULL, NULL, 0),
(1099, 346, 2, '', '2014-11-18 09:44:10', 'IT1', '2014-11-18 09:44:10', 'IT1', 0),
(1100, 346, 1, '1', '2014-11-18 09:44:10', 'IT1', NULL, NULL, 0),
(1101, 347, 1, '1', '2014-11-18 10:12:35', 'IT1', '2014-11-18 10:12:35', 'IT1', 0),
(1102, 347, 2, '', '2014-11-18 10:12:35', 'IT1', NULL, NULL, 0),
(1103, 348, 1, '1', '2014-11-18 10:19:02', 'IT1', '2014-11-18 10:19:02', 'IT1', 0),
(1104, 348, 2, '', '2014-11-18 10:19:02', 'IT1', NULL, NULL, 0),
(1105, 349, 1, '1', '2014-11-18 10:20:41', 'IT1', '2014-11-18 10:20:41', 'IT1', 0),
(1106, 349, 2, '', '2014-11-18 10:20:41', 'IT1', NULL, NULL, 0),
(1107, 350, 1, '1', '2014-11-18 10:22:22', 'IT1', '2014-11-18 10:22:22', 'IT1', 0),
(1108, 350, 2, '', '2014-11-18 10:22:22', 'IT1', NULL, NULL, 0),
(1109, 351, 1, '1', '2014-11-18 10:25:02', 'IT1', '2014-11-18 10:25:02', 'IT1', 0),
(1110, 351, 2, '', '2014-11-18 10:25:02', 'IT1', NULL, NULL, 0),
(1111, 352, 1, '1', '2014-11-18 10:26:50', 'IT1', '2014-11-18 10:26:50', 'IT1', 0),
(1112, 352, 2, '', '2014-11-18 10:26:50', 'IT1', NULL, NULL, 0),
(1113, 353, 1, '1', '2014-11-18 10:28:05', 'IT1', '2014-11-18 10:28:05', 'IT1', 0),
(1114, 353, 2, '', '2014-11-18 10:28:05', 'IT1', NULL, NULL, 0),
(1115, 354, 1, '1', '2014-11-18 10:33:14', 'IT1', '2014-11-18 10:33:14', 'IT1', 0),
(1116, 354, 2, '', '2014-11-18 10:33:14', 'IT1', NULL, NULL, 0),
(1117, 355, 1, '1', '2014-11-18 10:35:25', 'IT1', '2014-11-18 10:35:25', 'IT1', 0),
(1118, 355, 2, '', '2014-11-18 10:35:25', 'IT1', NULL, NULL, 0),
(1119, 356, 1, '1', '2014-11-18 10:36:04', 'IT1', '2014-11-18 10:36:05', 'IT1', 0),
(1120, 356, 2, '', '2014-11-18 10:36:05', 'IT1', NULL, NULL, 0),
(1121, 357, 1, '1', '2014-11-18 10:38:16', 'IT1', '2014-11-18 10:38:17', 'IT1', 0),
(1122, 357, 2, '', '2014-11-18 10:38:17', 'IT1', NULL, NULL, 0),
(1123, 358, 1, '1', '2014-11-18 10:39:18', 'IT1', '2014-11-18 10:39:18', 'IT1', 0),
(1124, 358, 2, '', '2014-11-18 10:39:18', 'IT1', NULL, NULL, 0),
(1125, 359, 1, '2', '2014-11-18 10:40:20', 'IT1', NULL, NULL, 0),
(1126, 360, 1, '2', '2014-11-18 10:43:54', 'IT1', NULL, NULL, 0),
(1127, 361, 1, '2', '2014-11-18 10:46:42', 'IT1', NULL, NULL, 0),
(1128, 362, 1, '2', '2014-11-18 10:49:06', 'IT1', NULL, NULL, 0),
(1129, 363, 1, '1', '2014-11-18 10:51:02', 'IT1', NULL, NULL, 0),
(1130, 364, 1, '2', '2014-11-18 10:53:40', 'IT1', NULL, NULL, 0),
(1131, 365, 1, '2', '2014-11-18 10:56:55', 'IT1', NULL, NULL, 0),
(1132, 366, 1, '2', '2014-11-18 10:58:17', 'IT1', NULL, NULL, 0),
(1133, 367, 1, '2', '2014-11-18 10:59:45', 'IT1', NULL, NULL, 0),
(1134, 368, 1, '2', '2014-11-18 11:01:27', 'IT1', NULL, NULL, 0),
(1135, 369, 1, '2', '2014-11-18 11:05:35', 'IT1', NULL, NULL, 0),
(1136, 370, 1, '2', '2014-11-18 11:07:24', 'IT1', NULL, NULL, 0),
(1137, 371, 1, '2', '2014-11-18 11:10:21', 'IT1', NULL, NULL, 0),
(1138, 372, 1, '2', '2014-11-18 12:00:07', 'IT1', NULL, NULL, 0),
(1139, 373, 1, '1', '2014-11-18 12:41:51', 'IT1', '2014-11-18 12:41:51', 'IT1', 0),
(1140, 373, 2, '', '2014-11-18 12:41:51', 'IT1', NULL, NULL, 0),
(1141, 374, 1, '2', '2014-11-18 14:32:09', 'IT1', '2014-11-18 15:34:54', 'IT1', 0),
(1142, 375, 1, '1', '2014-11-18 15:14:52', 'IT1', '2014-11-18 15:32:49', 'IT1', 0),
(1143, 375, 5, '', '2014-11-18 15:32:49', 'IT1', '2014-11-18 15:34:06', 'IT1', 0),
(1144, 375, 5, '', '2014-11-18 15:34:06', 'IT1', '2014-11-18 15:40:30', 'IT1', 0),
(1145, 374, 5, '', '2014-11-18 15:34:54', 'IT1', NULL, NULL, 0),
(1146, 375, 5, '', '2014-11-18 15:40:30', 'IT1', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_m_detalles`
--

CREATE TABLE IF NOT EXISTS `tickets_m_detalles` (
  `idtktm` int(11) NOT NULL,
  `detalle` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets_m_detalles`
--

INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(1, '<table> <tr> <td><b>Usuarios</b></td> <td>434343</td> </tr> <tr> <td><b>Lineas</b></td> <td>343434</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> prueba'),
(3, 'lo estamos viendo'),
(4, 'http://ventas/smartkt/incidentlst.php?id=14'),
(7, '<table> <tr> <td><b>Usuarios</b></td> <td>aas</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdasd'),
(10, '<table> <tr> <td><b>Indique usuario afectado</b></td> <td>14578</td> </tr> <tr> <td><b>Indique oblea afectada</b></td> <td>5445</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> fsfdsf'),
(11, 'ty'),
(12, '<table> <tr> <td><b>Usuarios</b></td> <td>21341</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sasfd sd'),
(15, 'mmfd im'),
(17, 'se genero el tkt 115646'),
(18, 'sdsgfh sfgdf'),
(22, 'sd'),
(24, 'sd'),
(31, 'se adjunto el tkt'),
(33, '<table> <tr> <td><b>Usuarios</b></td> <td>78978</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> 678678'),
(34, 'Contraseña nueva para el usuario:<br> 34'),
(37, 'Va para procesos, el usuario tiene la cuenta activa.'),
(38, 'Ya tenìa USR'),
(39, '<table> <tr> <td><b>Usuarios</b></td> <td>222</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> 222'),
(41, '<table> <tr> <td><b>Usuarios</b></td> <td>444</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> dfs'),
(43, '<table> <tr> <td><b>Usuarios</b></td> <td>232</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sfds'),
(45, '<table> <tr> <td><b>Usuarios</b></td> <td>232</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdf'),
(47, '<table> <tr> <td><b>Usuarios</b></td> <td>34234</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> dfsf'),
(49, '<table> <tr> <td><b>Usuarios</b></td> <td>3453</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sdfs'),
(51, '<table> <tr> <td><b>Usuarios</b></td> <td>3242</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> dfs'),
(53, '<table> <tr> <td><b>Usuarios</b></td> <td>32432</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asda'),
(55, '<table> <tr> <td><b>Usuarios</b></td> <td>234asd</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asd'),
(57, 'prueba'),
(58, 'deteccion de sd y tksts'),
(59, 'hay un tkt cargado'),
(60, 'se genero el sd 455215'),
(61, 'se genero el sd 546'),
(62, 'se generó el tkt 54654'),
(63, 'sdfsd aa'),
(64, 'tktssdas'),
(65, 'asdasd'),
(66, 'aaa tkt'),
(67, 'sd aa'),
(68, 'tkt asada'),
(69, 'fff sd'),
(70, 'asjdklñas sd'),
(71, 'sd'),
(74, 'sd 14578'),
(76, 'tkt adjunto'),
(77, 'generado sd 4578'),
(80, 'sd ereter'),
(81, 'ddd'),
(82, '<table> <tr> <td><b>Usuarios</b></td> <td>548391</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> no me anda'),
(84, 'http://ventas/smartkt/incidentlst.php?id=50'),
(85, 'khk'),
(87, 'sds'),
(88, 'sdsa'),
(89, 'listo'),
(90, 'pass 123'),
(91, '<table> <tr> <td><b>Usuarios</b></td> <td>xc454</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> 4534'),
(94, '<table> <tr> <td><b>Usuarios</b></td> <td>564rt</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> dfgf'),
(136, 'ok!'),
(138, 'todo ok'),
(139, 'sigue sin funcionar'),
(140, 'ahora?'),
(141, 'tampoco'),
(151, 'listo'),
(152, 'ok!'),
(153, 'a mi no me funciona'),
(160, 'todos cerrados'),
(161, '111111'),
(165, 'gvb'),
(166, 'no conforme!'),
(170, 'aaa'),
(171, 'no funciopnma'),
(173, '<table> <tr> <td><b>Usuarios</b></td> <td>asdfas</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdasdas'),
(174, '<table> <tr> <td><b>Usuarios</b></td> <td>cfc</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> dcz'),
(176, '<table> <tr> <td><b>Usuarios</b></td> <td>asdas</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdas'),
(181, 'listo'),
(182, 'error persiste'),
(188, 'listo'),
(191, 'sigue sin funcionar'),
(195, 'fin'),
(198, 'no funciona, comentario de prueba'),
(202, 'cierre'),
(205, 'continua fallando'),
(209, 'ahora si, cerrado'),
(213, 'falla, comentario #10'),
(218, 'aaaaa'),
(223, 'aaa'),
(224, 'sd gdsdfs'),
(228, 'sd asfdas'),
(232, 'sd gfdg'),
(237, 'listo, MASTER!!'),
(243, 'no funciona'),
(247, 'ok!'),
(251, 'no anda'),
(254, '<table> <tr> <td><b>Indique usuario afectado</b></td> <td>1212</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdasdas'),
(255, '<table> <tr> <td><b>Usuarios</b></td> <td>sda</td> </tr> <tr> <td><b>Lineas</b></td> <td>asd</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdasd'),
(256, 'Contraseña nueva para el usuario:<br> 23423'),
(257, '<table> <tr> <td><b>Usuario</b></td> <td>321</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdad'),
(258, '<table> <tr> <td><b>Indique usuario afectado</b></td> <td>32432</td> </tr> <tr> <td><b>Indique oblea afectada</b></td> <td>2342</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sdfsa'),
(259, '<table> <tr> <td><b>Indique 3 usuarios afectados</b></td> <td>asdasd</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> asdasd'),
(260, '<table> <tr> <td><b>Indique usuario afectado</b></td> <td>234</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> 234'),
(261, '<table>  <tr>  <td><b>Usuarios</b></td>  <td>asd</td>  </tr>  <tr>  <td><b>Linea</b></td>  <td>2134</td>  </tr>  <tr>  <td><b>Print de patalla del error</b></td>  <td><u>(ver adjuntos)</u></td>  </tr>  </table>  <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br />  asdasd'),
(262, 'Contraseña nueva para el usuario:<br> 123'),
(264, 'listo'),
(265, 'no funciona'),
(268, 'listo'),
(269, '<table> <tr> <td><b>Indique usuario afectado</b></td> <td>34</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> fff<br/>\nademas falla cuando ingreso porque lalalallala\n<br/>\n<br />\nasdasdasfasdfdsfdglkfjdgijsfpgisdpjfodgsdfjogpsdfjgsdfjgfdsgjhsdfgsdfghfdh'),
(270, 'Contraseña nueva para el usuario:<br> 183988'),
(272, 'Va para procesos.'),
(273, 'Tu caso se fue para procesos'),
(274, 'Puedo mandar info si el caso no está asociado a sistemas? o solo con algun perfil en particular?'),
(275, '<table> <tr> <td><b>Usuarios</b></td> <td>asda</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> ads'),
(277, '<table> <tr> <td><b>Usuarios</b></td> <td>345r</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sdfds'),
(279, 'aa'),
(280, 'dd'),
(281, 'hh'),
(282, 'rr'),
(283, 'fff'),
(284, 'fff'),
(285, 'fff'),
(286, 'as'),
(289, 'ok'),
(290, 'aa'),
(291, 'oka'),
(292, 'a'),
(293, 'a'),
(294, 'd'),
(295, 'd'),
(296, 'ss'),
(297, 'g'),
(298, '<table> <tr> <td><b>Indique 3 usuarios afectados</b></td> <td>eddf</td> </tr> <tr> <td><b>Print de patalla del error</b></td> <td><u>(ver adjuntos)</u></td> </tr> </table> <b>Describa cuando le sucede el error y cualquier dato que pueda ser de utilidad</b><br /> sddd'),
(306, 'no puedo pedir los perfiles'),
(307, '<table>  <tr>  <td>  LINEAS EJEMPLO  </td>  <td>  weas  </td>  <td>  (minimo 3 lineas)  </td>  </tr>    <tr>  <td>  USUARIOS EJEMPLO  </td>  <td>  asssa  </td>  <td>  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td>  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td>  (sin recortes, maximo 3)  </td>  </tr>  </table>'),
(308, '<table>  <tr>  <td>  LINEAS EJEMPLO  </td>  <td>  asda  </td>  <td>  (minimo 3 lineas)  </td>  </tr>    <tr>  <td>  USUARIOS EJEMPLO  </td>  <td>  asda  </td>  <td>  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td>  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td>  (sin recortes, maximo 3)  </td>  </tr>  </table>  DESCRIPCION:<br />  asdas'),
(312, '<table>  <tr>  <td>  USUARIOS EJEMPLO  </td>  <td>  asda  </td>  <td>  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td>  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td>  (print completo sin recortes)  </td>  </tr>  </table>  DESCRIPCION:<br />  asda'),
(313, '<table>  <tr>  <td>  USUARIOS EJEMPLO  </td>  <td>  196464  </td>  <td>  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td>  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td>  (print completo sin recortes)  </td>  </tr>  </table>  DESCRIPCION:<br />  Murió Siebel'),
(314, '<table>  <tr>  <td>  USUARIOS EJEMPLO  </td>  <td>  u196464  </td>  <td>  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td>  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td>  (print completo sin recortes)  </td>  </tr>  </table>  DESCRIPCION:<br />  Murió de nuevo'),
(316, '<table>  <tr>  <td>  USUARIO  </td>  <td>  2465  </td>  <td>  (ej: 124578)  </td>  </tr>    </table>'),
(317, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 45 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> asda'),
(318, '<table>  <tr>  <td class="tree_form_title">  USUARIO CMS SUPERVISOR  </td>  <td>  1564  </td>  <td class="tree_form_comment">    </td>  </tr>  </table>'),
(319, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> f </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> df </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> af'),
(328, 'no anda'),
(335, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  12312  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>'),
(336, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  324234  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  324  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asd'),
(337, '<table>  <tr>  <td class="tree_form_title">  USUARIO CMS SUPERVISOR  </td>  <td>  2354  </td>  <td class="tree_form_comment">    </td>  </tr>  </table>'),
(338, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> rerr </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asdf </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> asd'),
(343, 'aaaa'),
(344, 'aaa'),
(345, 'aaa'),
(346, 'aaaa'),
(348, 'fff'),
(349, 'dddd'),
(352, 'sss'),
(353, 'ddd'),
(354, 'aasss'),
(361, 'fcsdfg'),
(362, 'fcsdfg'),
(364, 'sd fgfg'),
(366, 'sd dgfdgdf'),
(371, 'sdasd'),
(378, 'aaasd'),
(381, 'aaa'),
(388, '5445'),
(389, '44'),
(390, '478'),
(393, 'ghfg'),
(398, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> rth </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gf </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> erter'),
(400, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(402, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(404, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(406, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(408, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(410, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(411, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(413, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(415, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(417, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(419, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(421, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(423, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(425, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(427, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(428, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(430, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(432, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(434, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(436, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(438, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(440, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(442, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(444, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(446, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(448, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> ads'),
(452, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(454, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(456, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(458, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(460, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(462, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(464, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(466, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(468, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(470, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(472, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(474, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(476, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(478, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(480, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(482, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(484, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(486, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(488, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(490, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(492, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(494, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(496, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(498, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(500, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(502, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(504, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gyhhj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gjghj </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> gjg'),
(508, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 54 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(509, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> gfhbgf </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> ghfgh </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> fghgfh'),
(511, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> hggf </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> gh </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 123 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> ghh </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> dhg </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> dfgdg'),
(513, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> asda </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> asd </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> asd'),
(525, 'ghj'),
(527, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 1564656 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 564565 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> madero </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(529, 'listo'),
(530, '<table>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  324523  </td>  <td class="tree_form_comment">  (ej: 154867)  </td>  </tr>    <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  fdsfsdf'),
(531, 'lala'),
(532, 'kk'),
(533, 'hjh'),
(534, 'hjh'),
(535, 'ffff'),
(537, 'listo'),
(544, 'aasd'),
(545, 'efs'),
(546, 'asdas'),
(551, 'sdsafdfds'),
(552, 'dfd sd'),
(555, 'gffg im'),
(558, 'asds hhh im'),
(561, 'sd afdgfds'),
(563, '456'),
(564, 'sd fgfg'),
(565, 'fff sd'),
(567, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 547533 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION</p> ME ROBARON LA IMAGEN!!!'),
(569, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> JIKHJH </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> HJHJ </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> HJH'),
(614, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 154 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 34523 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> asdasd </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(615, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 2232 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(616, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 2232 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(617, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 3453 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 343 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> sdf </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(618, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 3453 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 343 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> sdf </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(623, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> 234 </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(624, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 3424 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 23424 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> 234 </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(625, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 3424 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 23424 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> 234 </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(626, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 232 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(627, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 111 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(628, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 111 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(629, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 34 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(630, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 34 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(631, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 34 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>');
INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(632, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 34 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(633, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> 243 </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(634, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> 243 </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(635, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 232 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(636, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(637, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(638, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(639, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(640, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(641, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(642, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(645, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 2323 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(647, 'en analisis'),
(648, 'asda'),
(649, 'asdasd'),
(653, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(655, 'fdsdfsd'),
(656, 'ddd sd fdgf'),
(657, 'aaaa'),
(658, 'ddd'),
(659, 'dd'),
(660, 'aa'),
(661, 'sd gfgfdg'),
(662, 'ssd rgf'),
(664, 'fddgf sd'),
(665, 'fff'),
(666, 'sd fff'),
(668, 'sd gdfg'),
(669, 'sd fdgf'),
(670, 'sd fadfdf'),
(671, 'fgdf'),
(673, 'fdfs sd'),
(675, 'sd dfd'),
(678, 'sd'),
(680, 'as im'),
(682, 'sd gfgfd'),
(683, 'sd adsf'),
(685, 'aaa sd'),
(687, 'sd fdf'),
(689, 'im 34'),
(692, 'rq afsd'),
(695, 'sdasd'),
(696, 'ghghg'),
(698, 'fgfg'),
(699, 'hhh'),
(700, 'fff'),
(702, 'hhh'),
(707, 'asdas'),
(720, 'asdasd'),
(721, 'sdf fgd'),
(723, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> sdfsdf </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> sdfsdf      ad    asd    asd    asda    asdfasd'),
(735, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 4534 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 345435'),
(738, '<table>  <tr>  <td class="tree_form_title">  USUARIOS EJEMPLO  </td>  <td>  asd  </td>  <td class="tree_form_comment">  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asd'),
(741, 'sde dsgsdg'),
(743, 'fkasd'),
(744, 'asdad'),
(745, 'hgjghj'),
(746, 'ttt'),
(747, 'dd'),
(748, 'asdaf'),
(749, 'coment test'),
(750, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  54456  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  123  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  13213'),
(753, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> erws </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> dsfsdf  sin anexar'),
(756, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 1548 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(757, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 3234234 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(758, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 4565 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(759, '<table> <tr> <td class="tree_form_title"> LEGAJO </td> <td> 3564 </td> <td class="tree_form_comment"> (ej: 123589) </td> </tr>  <tr> <td class="tree_form_title"> DNI </td> <td> 345435 </td> <td class="tree_form_comment"> (ej: 25369785) </td> </tr>  <tr> <td class="tree_form_title"> CANAL DE VENTA </td> <td> dfgdgfdg </td> <td class="tree_form_comment"> (ej: CCT Cordoba, CC3 kitec) </td> </tr>  </table>'),
(761, '<table>    <tr>  <td  class="tree_form_title">  USUARIO  </td>  <td>  4546  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  NOMBRE  </td>  <td>  juan  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  APELLIDO  </td>  <td>  arana  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  JERARQU&Iacute;A  </td>  <td>  team  </td>  <td  class="tree_form_comment">  team / supervidor / jefe / jefe regional  </td>  </tr>    <tr>  <td  class="tree_form_title">  LOGIN AVAYA  </td>  <td>  112233  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  COD. CAMPA&Ntilde;A  </td>  <td>  AKIT04  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  NOM. CAMPA&Ntilde;A  </td>  <td>  asadsd campa  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  TERNA  </td>  <td>  aa/bb/cc  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  PERFIL  </td>  <td>  full  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  U SUPERVISOR  </td>  <td>  12345  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  APE NOM SUPERVISOR  </td>  <td>  gaston  </td>  <td  class="tree_form_comment">  </td>  </tr>    <tr>  <td  class="tree_form_title">  TERCERO  </td>  <td>  no  </td>  <td  class="tree_form_comment">  SI / NO  </td>  </tr>    <tr>  <td  class="tree_form_title">  HORAS  </td>  <td>  15  </td>  <td  class="tree_form_comment">    </td>  </tr>    </table>  <p  class="tree_form_title">IMPORTANTE<p/>  <p class="tree_form_comment">  	Si necesita gestionar m&aacute;s de un usuario descargue la siguiente&nbsp;<a href="http://itracker/TKTS/files_sol/VENTAS/AC/Usuario_Alta.xls">planilla</a>&nbsp; y enviela <b>junto con el numero de ticket</b> a&nbsp;<a href="mailto:sistemas_de_ventas@ta.telecom.com.ar">Sistemas de ventas</a>  </p>'),
(763, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 123 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 1231 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> delete from itracker_uta.equipos'),
(764, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 34534 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> '';delete from itracker_uta.equipos'),
(765, 'test ok'),
(770, 'gg'),
(789, 'no anda'),
(792, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>77</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td> </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (05/11/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>El Cliente ha validado la solución aplicada. Un incidente cerrado con la conformidad del usuario por mail o por teléfono.</td>\r\n            </tr>\r\n        </table>'),
(795, '<table>\r\n            <tr>\r\n                <td><b>RQ</b></td>\r\n                <td><b>145</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cancelado (04/10/2011) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Fase</b></td>\r\n                <td>Registro</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>Cancelación automática por inactividad en registro mayor a 10 días</td>\r\n            </tr>\r\n        </table>'),
(798, '<table>\r\n            <tr>\r\n                <td><b>IM</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>CMS_APL</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (26/11/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>SE TRABAJO SE CIERRA CON CONFORMIDAD.</td>\r\n            </tr>\r\n        </table>'),
(801, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>RCSALT2</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (01/12/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>Se ha cerrado el incidente relacionado IM0001452.27/11/08 10:00:37 (U186355):Equipo normalizadoEl incidente ha sido resuelto sin validación del usuario. El cierre formal se produce por la definición de un time-out (48 horas).*** *** Resolución actualizada por IM0001452  Existen registros relacionados. No se ha cerrado la llamada</td>\r\n            </tr>\r\n        </table>'),
(804, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>77</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td> </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (05/11/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>El Cliente ha validado la solución aplicada. Un incidente cerrado con la conformidad del usuario por mail o por teléfono.</td>\r\n            </tr>\r\n        </table>'),
(807, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>RCSALT2</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (01/12/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>Se ha cerrado el incidente relacionado IM0001452.27/11/08 10:00:37 (U186355):Equipo normalizadoEl incidente ha sido resuelto sin validación del usuario. El cierre formal se produce por la definición de un time-out (48 horas).*** *** Resolución actualizada por IM0001452  Existen registros relacionados. No se ha cerrado la llamada</td>\r\n            </tr>\r\n        </table>'),
(809, '<table>\r\n            <tr>\r\n                <td><b>IM</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>CMS_APL</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (26/11/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>SE TRABAJO SE CIERRA CON CONFORMIDAD.</td>\r\n            </tr>\r\n        </table>'),
(811, 'no anda'),
(812, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>RCSALT2</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (01/12/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>Se ha cerrado el incidente relacionado IM0001452.27/11/08 10:00:37 (U186355):Equipo normalizadoEl incidente ha sido resuelto sin validación del usuario. El cierre formal se produce por la definición de un time-out (48 horas).*** *** Resolución actualizada por IM0001452  Existen registros relacionados. No se ha cerrado la llamada</td>\r\n            </tr>\r\n        </table>'),
(814, '<table>\r\n            <tr>\r\n                <td><b>IM</b></td>\r\n                <td><b>4578</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>CMS_APL</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (26/11/2008) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>SE TRABAJO SE CIERRA CON CONFORMIDAD.</td>\r\n            </tr>\r\n        </table>'),
(815, 'no anda'),
(817, '<table>\r\n            <tr>\r\n                <td><b>SD</b></td>\r\n                <td><b>63589</b></td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Grupo</b></td>\r\n                <td>INTERNET EXPLORER 6.0  SP1 (PARA WIN98 O SUPERIOR)</td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Estado</b></td>\r\n                <td>Cerrado (22/02/2009) </td>\r\n            </tr>\r\n            <tr>\r\n                <td><b>Texto</b></td>\r\n                <td>se configura proxy.usuario ingresa a pagina de internet</td>\r\n            </tr>\r\n        </table>'),
(819, 'listo'),
(820, '<table>  <tr>  <td class="tree_form_title">  USUARIOS NICE  </td>  <td>  45454  </td>  <td class="tree_form_comment">  (minimo 3 ejemplos)  </td>  </tr>    <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  gfhgfhfg'),
(822, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 123123 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION</p> sdfsdf'),
(823, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 4654 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(824, '<table>  <tr>  <td class="tree_form_title">  USUARIOS EJEMPLO  </td>  <td>  12312  </td>  <td class="tree_form_comment">  (minimo 3 usuarios)  </td>  </tr>    <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asdasd'),
(870, 'fgdfg'),
(871, 'jhhgjk'),
(872, 'hgjghjghj'),
(876, '1234'),
(878, 'rtyry'),
(883, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> ghj </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> gfjh </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> fghfg'),
(885, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  123123  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  123123  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asdasdas'),
(886, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 3243 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 23423 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 234243'),
(887, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  432  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  3424  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asdad'),
(888, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  432  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  3424  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asdad'),
(889, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  324  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  234234  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  234234'),
(890, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  2131  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  123132  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  123123123'),
(892, 'sdfsfsdfsdf'),
(893, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 54645 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 45646456'),
(894, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> ghj </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> fg'),
(896, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> xzcvxc </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> asass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfgasass    asdasd  adasdsadsasdasdasdashghfdg dfgdf dfg'),
(911, '<table>  <tr>  <td class="tree_form_title">  USUARIOS NICE  </td>  <td>  4534534  </td>  <td class="tree_form_comment">  (minimo 3 ejemplos)  </td>  </tr>    <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  fghfghfg'),
(912, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  45645  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  fghf'),
(913, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 1'),
(914, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 1'),
(915, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 1 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 1'),
(916, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 5345 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 34534 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 345345'),
(917, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> dfg </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> dfg </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> dfg'),
(919, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> sdf </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> sdf </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> sdf'),
(920, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> sfgsd </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> sdfsdf </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> sdfsdf'),
(921, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> dfgh </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> dfg </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> dfgdfg'),
(924, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> sdf </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 324 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 234 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 234 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 234 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 234'),
(925, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 34 </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 234 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 243 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 234 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 234 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 234'),
(926, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 345 </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 345 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 345 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 345 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 345 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 345'),
(928, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 5654 </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 456 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 456 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 456 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 456 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 456'),
(930, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 11 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 222 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> deberia derivar a gest de demanda'),
(932, 'deri'),
(933, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 123 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 123123 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> anexado'),
(936, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 343 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 3434 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> a gest pogest'),
(937, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 11 </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 122 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 23 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 44 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 33 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 1212'),
(938, '<table> <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 1312 </td> <td  class="tree_form_comment"> </td> </tr> <tr> <td  class="tree_form_title"> CLIENTE </td> <td> 234 </td> <td  class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td  class="tree_form_title"> LINEA </td> <td> 45 </td> <td  class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td  class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 67 </td> <td>  </td> </tr>  <tr> <td  class="tree_form_title"> TIPIFICACION </td> <td> 45 </td> <td>  </td> </tr>   <tr> <td  class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:<p/> 454'),
(939, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 456 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 456 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 45 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 456 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 456 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> dfgdf'),
(940, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 67 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 567 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 567 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 567 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 567 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 567567'),
(942, 'fgjhg'),
(945, 'gfhfgh'),
(946, 'sd sgfg'),
(947, 'prueba'),
(948, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 454 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 454 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> sdgsdf'),
(951, 'tyhdfh'),
(952, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 111 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 333 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 444 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 555 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 66 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 777'),
(953, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 1231 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 123123 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 123123 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 1231 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 123 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 123123'),
(954, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 3453 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 34534 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 345 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 34534 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 345345 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 345345'),
(955, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 4564 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 456 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 456 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 456 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 142 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 1465'),
(956, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 23424 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION</p> adasdasd'),
(958, 'listo'),
(960, 'hgjg'),
(961, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 1111111 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(962, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  11111  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>'),
(964, 'sdfsdf'),
(966, '543'),
(969, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  11111  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>'),
(975, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 334513215513 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 222 asdas 1445522'),
(977, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 32432423423423423 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> 234234234 sdfgd'),
(978, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> d </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> sdf'),
(981, 'listo! 45654654'),
(987, 'fin'),
(988, 'fin del reclamo 54365465876'),
(989, 'listo 46453543543'),
(992, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 123123123 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION</p> sdfsdf 34534'),
(993, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 42587896 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 456512,45 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> asdasdasd'),
(994, '<table> <tr> <td class="tree_form_title"> LINEAS EJEMPLO </td> <td> 4353 </td> <td  class="tree_form_comment"> (minimo 3 lineas) </td> </tr>  <tr> <td  class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 345345 </td> <td  class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td  class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p  class="tree_form_title">DESCRIPCION:</p> 345345'),
(996, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 123456 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 12345 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 1231243 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 123412 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 1122 pepe </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> asdasdasd'),
(999, 'fghf'),
(1001, 'solucionado! 123456789'),
(1003, 'test 1'),
(1004, '<table>  <tr>  <td class="tree_form_title">  USUARIO CMS SUPERVISOR  </td>  <td>  1234  </td>  <td class="tree_form_comment">    </td>  </tr>  </table>'),
(1006, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 456456455645 </td> <td class="tree_form_comment"> (ej: 548697) </td> </tr> <tr> <td class="tree_form_title"> CLIENTE </td> <td> 123123 </td> <td class="tree_form_comment"> (DNI - CUIT ..) </td> </tr>  <tr> <td class="tree_form_title"> LINEA </td> <td> 123 </td> <td class="tree_form_comment"> (ej: 1149683877) </td> </tr> <tr> <td class="tree_form_title"> NUMERO DE PEDIDO </td> <td> 123123123 </td> <td>  </td> </tr>  <tr> <td class="tree_form_title"> TIPIFICACION </td> <td> 123123123 </td> <td>  </td> </tr>   <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (sin recortes, maximo 3) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> asdasdasd'),
(1008, 'asdasd'),
(1009, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 354634 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> OBLEA </td> <td> 345435 </td> <td class="tree_form_comment"> (ej: 0002645805) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:<p/> 345435'),
(1011, '<table> <tr> <td class="tree_form_title"> USUARIOS EJEMPLO </td> <td> 435 </td> <td class="tree_form_comment"> (minimo 3 usuarios) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (print completo sin recortes) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION:</p> &lt;a href="http://aa"&gt;hola&lt;/a&gt;'),
(1012, '<table> <tr> <td class="tree_form_title"> USUARIO AFECTADO </td> <td> 123455 </td> <td class="tree_form_comment"> (ej: 548624) </td> </tr>  <tr> <td class="tree_form_title"> PRINT DE PANTALLA </td> <td> <u>(ver adjuntos)</u> </td> <td class="tree_form_comment"> (ademas del error incluir uno de <b>tuid->mis accesos</b>) </td> </tr> </table> <p class="tree_form_title">DESCRIPCION</p> Prueba'),
(1013, 'prueba'),
(1014, 't2'),
(1018, 'test'),
(1020, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  232323  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>'),
(1022, 'asdasd'),
(1024, 'prueba'),
(1026, 'asdasd'),
(1027, '<div id=''cierre''>Cierre:&nbsp;Reingresar</div>.'),
(1028, '<div id=''cierre''>Cierre:&nbsp;No corresponde</div>finalizado'),
(1029, '<b>Cierre</b>:<div id=''cierre''>Reingresar</div>hgjgh'),
(1030, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  23123123  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asdasd'),
(1032, '<b>Cierre</b>:<div id=''cierre''>Correcto</div>hgngv'),
(1033, 'sdfsdf'),
(1034, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  23423  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  <tr>  <td class="tree_form_title">  USUARIO  </td>  <td>  234234  </td>  <td class="tree_form_comment">  (ej: 356278)  </td>  </tr>  <tr>  <td class="tree_form_title">  PRINT DE PANTALLA  </td>  <td>  <u>(ver adjuntos)</u>  </td>  <td class="tree_form_comment">  (print completo sin recortes)  </td>  </tr>  </table>  <p class="tree_form_title">DESCRIPCION:</p>  asfsdfsdf'),
(1038, '213424'),
(1042, '<table> <tr> <td class="tree_form_title"> USUARIO </td> <td> 2342342354 </td> <td class="tree_form_comment"> (ej: 124578) </td> </tr>  </table>'),
(1044, '<b>Cierre</b>:<div id=''cierre''>Reingresar</div><div id=''cierre''>Corresponde</div>'),
(1045, '<table>  <tr>  <td class="tree_form_title">  OBLEA  </td>  <td>  123123243.54  </td>  <td class="tree_form_comment">  (ej: 0002896358)  </td>  </tr>  </table>'),
(1047, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>333</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U111111,U111111,U111111</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1048, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>333</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U111111,U111111,U111111</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1049, '');
INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(1053, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>12345</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U111111,U444444,U111123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>comentario</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>12-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>12-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1054, '<?xml version="1.0"?>\n<itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>12345</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U111111,U444444,U111123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>comentario</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>12-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>12-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1055, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>23424</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>dfd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1056, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>23424</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>dfd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1057, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>23424</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>dfd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1058, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>23424</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>dfd</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1059, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1060, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1061, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1062, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1063, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1064, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1065, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1066, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1067, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1068, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1069, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1070, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1071, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1072, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1073, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1074, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1075, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1076, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1077, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1078, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1079, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1080, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1081, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1082, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1083, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1084, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1085, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1086, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123334</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1087, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>233</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U121234</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1088, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12313</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U112344</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1089, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>3434</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1090, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>3434</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1091, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>213213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1092, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>213213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1093, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>213213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1094, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>213213</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n');
INSERT INTO `tickets_m_detalles` (`idtktm`, `detalle`) VALUES
(1095, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>343</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1096, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>12321</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U432123</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1097, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>1234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U145873</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1098, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>1234</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U145873</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1099, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1102, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1104, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1106, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1108, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1110, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1112, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>'),
(1114, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1116, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1118, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1120, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1122, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>\n'),
(1124, '<?xml version="1.0"?><itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Cerrado con archivo. TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx</value></element> </itform>'),
(1125, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>4354</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1126, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>23434</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1127, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>345435</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1128, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>45654</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1129, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>345345</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1130, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>7657</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1131, '<?xml version="1.0"?><itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id><value/></element><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>345435</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1132, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element>  <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1133, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element>  <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1134, '<?xml version="1.0"?>\n<itform>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element>  <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1135, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>34534</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1136, '<?xml version="1.0"?><itform><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave><value/></element> <element><type>input</type><label>legajo</label><id>Hola</id><value>345345</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1137, '<?xml version="1.0"?><itform> <element><type>input</type><label>legajo</label><id>Hola</id><value>3455</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U123456</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>'),
(1138, '<?xml version="1.0"?>\n<itform>\n <element><type>input</type><label>legajo</label><id>Hola</id><value>2343423</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U111111</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value/></element> <element><type>date</type><id>32</id><label>Fecha</label><value/></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1140, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>Cerrado con archivo. TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx</value></element> </itform>\n'),
(1141, '<?xml version="1.0"?>\n<itform>\n <element><type>input</type><label>legajo</label><id>Hola</id><value>566456</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U145783</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value>hola</value></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>04-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>13-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>2</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n'),
(1142, '<?xml version="1.0"?>\n<itform>\n <element><type>input</type><label>legajo</label><id>Hola</id><value>657657</value></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text><value/></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><value>U456789</value></element> <element><type>inputlong</type><label>comentario</label><id>2</id><value/></element> <element><type>datetime</type><id>date</id><label>Fecha</label><value>04-11-2014 00:00</value></element> <element><type>date</type><id>32</id><label>Fecha</label><value>18-11-2014</value></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option><value>1</value></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment><value/></element> </itform>\n');

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
 ADD UNIQUE KEY `idtktm` (`idtktm`), ADD KEY `idtktm_2` (`idtktm`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=376;
--
-- AUTO_INCREMENT de la tabla `tickets_m`
--
ALTER TABLE `tickets_m`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1147;--
-- Base de datos: `itracker_telecomcct_uta`
--
DROP DATABASE `itracker_telecomcct_uta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE IF NOT EXISTS `acciones` (
`id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `estadotkt` varchar(50) DEFAULT NULL,
  `ejecuta` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  `formulario` tinyint(1) NOT NULL,
  `form` text,
  `habilita_t_propio` int(11) NOT NULL,
  `habilita_tomado` int(11) NOT NULL,
  `habilita_perfiles` varchar(100) NOT NULL,
  `habilita_a_propio` int(11) NOT NULL,
  `habilita_abierto` int(11) NOT NULL,
  `habilita_equipo` int(11) NOT NULL,
  `habilita_master` int(11) NOT NULL,
  `notificacion_param` varchar(255) NOT NULL,
  `notificacion_texto` text NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=231 ;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `nombre`, `alias`, `estadotkt`, `ejecuta`, `tipo`, `formulario`, `form`, `habilita_t_propio`, `habilita_tomado`, `habilita_perfiles`, `habilita_a_propio`, `habilita_abierto`, `habilita_equipo`, `habilita_master`, `notificacion_param`, `notificacion_texto`, `descripcion`, `estado`) VALUES
(1, 'ABRIR', 'ABRIR', 'Pendiente', 'open', 1, 1, NULL, 0, 2, '*', 2, 2, 0, 0, '({idmaster}==NULL && {fb}==NULL )(to:{team}::cc:{team_profile=>coordinador})', 'Se ha generado un nuevo tkt derivado al area.<br />\nID: {id}<br />\nSistema: {system->name}<br />\nPuedes verlo en <a href="{html_dir}staffhome.php">ITRACKER</a>', 'Genera un nuevo ticket', 0),
(2, 'CERRAR', 'CERRAR', 'Cerrado', 'close', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 1, 1, '1,2,3,', 0, 1, 1, 1, '(1==1)(to:{clients}::cc:{team})', 'Se ha solucionado un tkt que generaste.<br/>ID: {id}<br />Sistema: {system->name}<br />Puedes ver la solucion en <a href="{html_dir}mytkts.php">ITRACKER</a> en la lista de los ultimos solucionados.<b>No olvides dar tu conformidad!</b>', 'Indicar que el ticket esta solucionado', 0),
(3, 'LIBERAR', 'LIBERAR', NULL, 'free', 2, 0, NULL, 2, 1, '1,2,3,', 0, 1, 1, 1, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(4, 'DERIVAR', 'DERIVAR', 'derivado', 'derive', 1, 1, '<itform> 	<element> 		<label> 			Equipo a derivar 		</label> 		<notsave>true</notsave> 		<type> 			idsel 		</type> 		<id> 			idequipo 		</id> 		<idselparams> 			<class>tkt</class> 			<method>idsel_derive</method> 		</idselparam> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element> 	<element> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<comment> 			Commentario 		</comment> 	</element> </itform>', 1, 1, '1,2,3,', 0, 1, 1, 1, '(1==1)(to:{team}::cc:{prev_team})', '{prev_team->name} ha derivado un tkt al area.<br />\nID: {id}<br />\nApertura: {FA}<br />\nSistema: {system->name}<br />\nPuedes verlo en <a href="{html_dir}staffhome.php">ITRACKER</a>', 'Asignar el ticket a otro equipo', 0),
(5, 'TOMAR', 'TOMAR', 'en analisis', 'take', 2, 0, NULL, 0, 2, '1,2,3,', 0, 1, 1, 1, '(1==1)(to:{clients})', 'Tu tkt {id} ha sido tomado por {u_tom->name} y esta siendo tratado.<br />Se te comunicar&aacute; por este medio los avances. Asi mismo puedes darle seguimenteo en <a href="{html_dir}mytkts.php">ITRACKER</a>.', 'Reservar el ticket para su tratamiento', 0),
(6, 'REABRIR', 'RE ABRIR', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 0, 0, '1,2,3,', 1, 2, 0, 0, '', '', 'Libera el ticket para que lo pueda tomar otro usuario.', 0),
(7, 'SET_MASTER', 'Set master', NULL, 'setmaster', 2, 0, NULL, 0, 0, '*', 0, 1, 0, 2, '', '', NULL, 0),
(8, 'ASIGNAR', 'Asignar', NULL, 'asign', 2, 1, '<itform> 	<element> 		<label> 			Usuario a asignar: 		</label> 		<notsave>true</notsave> 		<type> 			idsel 		</type> 		<id> 			idusr 		</id> 		<idselparams> 			<class>tkt</class> 			<method>idsel_listasign</method> 		</idselparam> 		<validations> 			<required>true</required> 		</validations>		 	</element> </itform>', 0, 2, '3,', 0, 1, 1, 1, '(1==1)(to:{u_tom})', 'Se te ha asignado el tkt {id} del sistema {system->name}.<br />\nPuedes verlo en <a href="{html_dir}staffhome.php">ITRACKER</a>.\n', 'Asignar el ticket a un miembro del equipo', 0),
(12, 'PRIORIZAR', 'Priorizar', NULL, 'priorice', 2, 1, '<itform> 	<element> 		<label> 			Prioridad: 		</label> 		<notsave>true</notsave> 		<type> 			select 		</type> 		<id> 			prioridad 		</id> 		<option><value>1</value><text>ALTA</text></option> 		<option><value>2</value><text>MEDIA</text></option> 		<option><value>3</value><text>BAJA</text></option> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', 0, 0, '3,', 0, 1, 1, 1, '({u_tom}!=NULL)(to:{u_tom})$$(u_tom==NULL)(to:{team})', 'Se cambio la prioridad del tkt {id} del sistema {system->name}.<br/>\nActualmente tomado por {u_tom->name}.<br/>\nPuedes verlo en <a href="{html_dir}staffhome.php">ITRACKER</a>.', 'Establece una nueva prioridad al ticket', 0),
(14, 'UNIR', 'UNIR', NULL, 'join', 1, 1, '<itform> 	<element> 		<label> 			Unir a: 		</label> 		<notsave>true</notsave> 		<type> 			input 		</type> 		<id> 			idmaster 		</id> 		<validations> 			<required>true</required> 			<numeric>true</numeric> 		</validations>		 	</element>	 </itform>', 1, 1, '1,2,3,', 0, 1, 1, 1, '', '', 'Relaciona el ticket a otro', 0),
(15, 'SEPARAR', 'Separar', NULL, 'unjoin', 1, 0, NULL, 1, 1, '1,2,3,', 0, 1, 1, 2, '', '', 'Elimina la relacion al ticket padre', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `linkwi` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `nombre`, `linkwi`, `estado`) VALUES
(1, 'Ventas', '', 0),
(4, 'dsfds', '', 1),
(5, 'Pymes', '', 0),
(6, '45', 'asdasd', 1),
(7, 'test 2', ''' > obj "\\''''', 1),
(8, '54', '', 1),
(9, '789', '''\\ obj "\\', 1),
(10, '346', 'dfs\\" ''''\\ /"´''''', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `t_conformidad`, `idlistin`, `iddireccion`, `idsequipos_deriva`, `idsequipos_visible`, `mytkts_vista`, `staffhome_vista`, `estado`) VALUES
(1, 'Sistemas De Ventas', '41:00', 10, 1, '2,5', '5', 'id,usr_o.nombre=>Nombre,FA=>Apertura', '*', 0),
(2, 'Gestion De La Demanda Procesos', '02:00', 1, 1, '1', '1', '%aa%', 'all', 0),
(5, 'CCT AGUERO', '02:00', 1, 1, '1', '2,6', '', '', 0),
(6, 'Admgirafe', '50:00', 1, 1, '', '1,2', NULL, NULL, 0),
(7, 'aaaaaa', '11:00', 2, 1, NULL, '', NULL, NULL, 1),
(8, 'CCT CORDOBA', '02:00', 2, 1, '', '5', NULL, NULL, 0),
(9, 'Prueba Alta', '12:00', 6, 5, '8', '6', NULL, NULL, 1),
(10, 'nuevo equipo', '03:25', 6, 5, '2,5', '1,2,5,6,8', 'mytkts', 'inbox', 0),
(11, 'equipo test 2', '02:00', 1, 1, '', '', '', '', 1),
(12, 'Prueba', '41:00', 1, 5, '1', '', 'asdd', 'asdas', 0),
(13, 'Nuevo -', '41:00', 1, 1, '', '', 'dgdf', 'asdas', 0),
(14, 'nuevo +', '41:00', 1, 1, '', '', 'asdasd', 'asdas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listines`
--

CREATE TABLE IF NOT EXISTS `listines` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `too` text,
  `cc` text,
  `estado` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `listines`
--

INSERT INTO `listines` (`id`, `nombre`, `too`, `cc`, `estado`) VALUES
(1, 'EQUIPO_SISTEMAS'' DE VENTA', 'sistemas_de_ventas@ta.telecom.com.sar', 'ss@ss.comd', '0'),
(2, 'fdsf ''''\\', 'aa@bb.com', '', '1'),
(3, 'Listin Test 2', 'a2a@bb.com', 'ddd.7@ss.dom', '1'),
(4, 'prueba chrome', 'asasd@bb.com', '', '1'),
(5, 'Asdas\\''', 'aa@cc.com', '', '1'),
(6, 'Alert(hola)', 'asda@gg.com', 'asdas@dd.ar', '0'),
(7, 'Alert(hola)''>', 'ss@cc.com', '', '1'),
(8, 'Alert(hola)''2 & juan', 'ss@cc.comss', 'ss@ss.com;pepe@jj.com', '1'),
(9, 'prueba full''; se', 'tt@cc.com', '', '1'),
(10, 'Vacio', '', '', '0'),
(11, 'asdas', '', '', '1'),
(12, 'alta listin', '', '', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE IF NOT EXISTS `opciones` (
`id` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `texto_critico` varchar(50) DEFAULT NULL,
  `ruta_destino` varchar(255) DEFAULT NULL,
  `idequipo_destino` varchar(255) DEFAULT NULL,
  `pretext` longtext,
  `idpregunta_destino` int(11) DEFAULT NULL,
  `autocerrar` tinyint(1) NOT NULL,
  `no_anexar` tinyint(1) NOT NULL,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `ruta_destino`, `idequipo_destino`, `pretext`, `idpregunta_destino`, `autocerrar`, `no_anexar`, `UA`, `FA`, `UB`, `FB`) VALUES
(1, 1, 'alta de usuario', NULL, 'TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx', 'default=>1', NULL, NULL, 0, 1, 'U548391', '2014-01-24', NULL, NULL),
(2, 1, 'usuario de baja', NULL, 'TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx', 'default=>1', NULL, NULL, 1, 0, 'U548391', '2014-01-24', NULL, NULL),
(3, 1, 'error al realizar gestiones', NULL, NULL, NULL, NULL, 2, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(4, 1, 'lentitud en la web', 'lentitud/error', NULL, NULL, NULL, 3, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(5, 1, 'pagina web no responde', 'lentitud/error', NULL, NULL, NULL, 3, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(6, 2, 'si', 'masivo', NULL, NULL, NULL, 4, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(7, 2, 'no', NULL, NULL, NULL, NULL, 5, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(8, 3, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>month</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', 0, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(9, 3, 'no', NULL, NULL, NULL, NULL, 6, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(10, 4, 'si', NULL, NULL, 'TEAM:1,2=>2;default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(11, 4, 'no', NULL, NULL, 'TEAM:2=>2;default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(12, 5, 'si', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(13, 5, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(14, 6, 'si', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(15, 6, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(16, 7, 'alta de usuario', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(17, 7, 'usuario bloqueado', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 1, 'U548391', '2014-01-24', NULL, NULL),
(18, 7, 'cambio de contraseña', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(19, 7, 'lentitud en la web', 'lentitud/error', NULL, NULL, NULL, 8, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(20, 7, 'pagina web no responde', 'lentitud/error', NULL, NULL, NULL, 8, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(21, 8, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(22, 8, 'no', NULL, NULL, NULL, NULL, 9, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(23, 9, 'si', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(24, 9, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(25, 10, 'sin dominio telecom', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(26, 10, 'sin conectividad', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(27, 10, 'periferico faltante/falla (mouse, teclado,monitor)', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(28, 10, 'otro inconveniente', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(29, 11, 'problemas de usuario en el puesto', NULL, NULL, NULL, NULL, 12, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(30, 11, 'problemas discador', NULL, NULL, NULL, NULL, 13, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(31, 11, 'CMS supervisor', NULL, NULL, NULL, NULL, 14, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(32, 11, 'nice', NULL, NULL, NULL, NULL, 17, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(33, 11, 'telefonia / llamadas', NULL, NULL, NULL, NULL, 20, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(34, 12, 'ips', NULL, NULL, NULL, NULL, 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(35, 12, 'aic', NULL, NULL, NULL, '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(36, 12, 'apc', NULL, NULL, NULL, NULL, 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(37, 16, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(38, 16, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(39, 13, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(40, 13, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(41, 14, 'error / incidente', NULL, NULL, NULL, NULL, 15, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(42, 14, 'blanqueo de clave', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(43, 15, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(44, 15, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(45, 17, 'error / incidente', NULL, NULL, NULL, NULL, 19, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(46, 17, 'blanqueo de clave', NULL, NULL, NULL, NULL, 18, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(47, 19, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(48, 19, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(49, 18, 'no la recuerdo', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(50, 18, 'usuario bloqueado', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(51, 20, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(52, 20, 'no', NULL, NULL, NULL, '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(53, 21, 'usuarios', NULL, NULL, NULL, NULL, 22, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(54, 21, 'aplicacion', NULL, NULL, NULL, NULL, 23, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(55, 22, 'alta', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(56, 22, 'baja', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(57, 22, 'modificacion', NULL, NULL, NULL, NULL, 24, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(58, 24, 'contraseña', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(59, 24, 'perfil', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL);
INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `ruta_destino`, `idequipo_destino`, `pretext`, `idpregunta_destino`, `autocerrar`, `no_anexar`, `UA`, `FA`, `UB`, `FB`) VALUES
(60, 24, 'jerarquia', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(61, 24, 'login', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(62, 22, 'usuario bloqueado', NULL, 'TKTS/files_sol/VENTAS/AC/Instructivo_Desbloqueo_de_Usuarios_de_Ac_en_Base_de_Datos_Oracle.doc', 'default=>1', NULL, NULL, 1, 0, 'U548391', '2014-01-24', NULL, NULL),
(63, 23, 'boton envio a siebel desactivado', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(64, 23, 'lentitud', 'error/lentitud', NULL, NULL, NULL, 25, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(65, 23, 'error', 'error/lentitud', NULL, NULL, NULL, 25, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(66, 25, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(67, 25, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(68, 26, 'si', 'masivo', NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(69, 26, 'no', NULL, NULL, 'default=>1', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `accesos` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre`, `accesos`) VALUES
(1, 'anonimo', ''),
(2, 'adm_full', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115'),
(3, 'adm_team', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefiles_vistas`
--

CREATE TABLE IF NOT EXISTS `prefiles_vistas` (
`id` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL,
  `perfil` int(50) NOT NULL,
  `relacion` varchar(255) NOT NULL,
  `vista` int(11) NOT NULL,
  `tipos_eventos` varchar(50) NOT NULL,
  `archivo_descarga` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `prefiles_vistas`
--

INSERT INTO `prefiles_vistas` (`id`, `prioridad`, `perfil`, `relacion`, `vista`, `tipos_eventos`, `archivo_descarga`) VALUES
(1, 0, 1, '*', 1, '*', 1),
(2, 1, 2, '3,4,5', 1, '*', 1),
(3, 2, 2, '7', 2, '1', 1),
(4, 3, 2, '8,9', 2, '1', 0),
(5, 1, 3, '3,4,5', 1, '*', 1),
(6, 2, 3, '7', 1, '1', 1),
(7, 3, 3, '8,9', 2, '1', 0),
(8, 1, 4, '4,5', 1, '1', 1),
(9, 2, 4, '8,9', 2, '1', 0),
(10, 1, 5, '3,4,5', 1, '*', 1),
(11, 2, 5, '7', 1, '1', 1),
(12, 3, 5, '8,9', 2, '1', 0),
(13, 1, 7, '4,5', 1, '1', 1),
(14, 2, 7, '8,9', 2, '1', 0),
(15, 4, 2, '6', 2, '0', 0),
(16, 4, 4, '6', 2, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
`id` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `detalle` longtext,
  `UA` varchar(15) NOT NULL,
  `FA` date NOT NULL,
  `UB` varchar(15) DEFAULT NULL,
  `FB` date DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

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

CREATE TABLE IF NOT EXISTS `sisdir` (
`id` int(11) NOT NULL,
  `idsistema` int(11) NOT NULL,
  `iddireccion` int(11) NOT NULL,
  `p_pregunta` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `sisdir`
--

INSERT INTO `sisdir` (`id`, `idsistema`, `iddireccion`, `p_pregunta`, `estado`) VALUES
(1, 1, 1, 1, 0),
(2, 2, 1, 1, 0),
(3, 3, 1, 1, 0),
(4, 4, 1, 11, 0),
(5, 5, 1, 21, 0),
(6, 6, 1, 26, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemas`
--

CREATE TABLE IF NOT EXISTS `sistemas` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

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
('U548391', '3,5,8', '12,2,1', 3, 0),
('U188353', '5', '14', 4, 0),
('U196798', '2', '', 2, 1),
('U199629', '1,2', NULL, 2, 0),
('U186462', '5', '13,5,12', 4, 0),
('IT1', '1,2', '1,2', 2, 0),
('AG0689', '8', '', 4, 0),
('ITK184050', NULL, '', 2, 0),
('FG44', '1', NULL, 3, 1),
('PRUEBA', '2', NULL, 2, 0),
('ASDASñ', '2', NULL, 3, 0),
('ASDASD', '2,2,2', NULL, 1, 0),
('ASDAS', '2', NULL, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `listines`
--
ALTER TABLE `listines`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `prefiles_vistas`
--
ALTER TABLE `prefiles_vistas`
 ADD PRIMARY KEY (`id`), ADD KEY `perfil` (`perfil`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=231;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `listines`
--
ALTER TABLE `listines`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `prefiles_vistas`
--
ALTER TABLE `prefiles_vistas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `sisdir`
--
ALTER TABLE `sisdir`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `sistemas`
--
ALTER TABLE `sistemas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
