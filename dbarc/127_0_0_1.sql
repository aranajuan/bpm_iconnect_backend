-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2014 a las 13:41:28
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `usr`, `idmaster`, `origen`, `idequipo`, `u_tom`, `u_asig`, `prioridad`, `FA`, `UA`, `FB`, `UB`) VALUES
(1, 'U1AG1', NULL, 'D1-S1-O4-O9-O15-', 1, NULL, NULL, NULL, '2014-11-23 21:11:04', 'U1AG1', NULL, NULL),
(2, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2014-11-23 21:11:55', 'U1AG1', '2014-11-24 14:02:37', 'COM1'),
(3, 'U1AG1', NULL, 'D1-S1-O5-O9-O15-', 2, 'COM1', NULL, NULL, '2014-11-23 21:13:17', 'U1AG1', '2014-11-24 14:13:47', 'COM1'),
(4, 'U1AG1', NULL, 'D1-S1-O3-O7-O13-', 2, 'COM1', NULL, NULL, '2014-11-27 13:18:31', 'U1AG1', NULL, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

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
(18, 4, 5, '', '2014-11-28 14:47:26', 'COM1', NULL, NULL, 0),
(19, 1, 16, '', '2014-12-10 09:40:14', 'U1AG1', NULL, NULL, 0);

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
(19, '<?xml version="1.0"?>\n<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		 	<value>asdsa</value></element> </itform>\n');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tickets_m`
--
ALTER TABLE `tickets_m`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;--
-- Base de datos: `itracker_agentes_uta`
--

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
(13, 'CERRAR_COMISIONES_NOPROCE', 'Cerrar No Procedente', 'cerrado', 'close', 1, 1, '<itform>\n  <element>\n    <label>Tipo cierre</label>\n    <id>tipocierre</id>\n    <type>select</type>\n    <option>\n      <value>2</value>\n      <text>No corresponde</text>\n    </option>\n    <option>\n      <value>3</value>\n      <text>Error de formato</text>\n    </option>\n    <validations>\n      <required>true</required>\n      <numeric>true</numeric>\n    </validations>\n  </element>\n  <element>\n    <label>Adjunto</label>\n    <type>fileupl</type>\n    <id>adjunto</id>\n    <notsave>true</notsave>\n  </element>\n  <element>\n    <label> 			Comentario 		</label>\n    <type> 			inputlong 		</type>\n    <id> 			comment 		</id>\n    <validations>\n      <required>true</required>\n    </validations>\n  </element>\n</itform>', 1, 1, '*', '3,4,', 0, 1, 1, 1, '(always)(to:{clients}::cc:{clients->teams})', 'Se ha cerrado un itracker que generaste.<br/>\nID: {id}<br/>\nPuedes verlo en ITRACKER', 'cerrar comisiones no procedente', 0),
(14, 'REABRIR_COOR', 'Reabrir', 're abierto', 'reopen', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 2, 0, '*', '4,', 0, 2, 1, 1, '', '', 'reabrir coordinador', 0),
(15, 'LIBERAR_COOR', 'Liberar', '', 'free', 2, 0, NULL, 2, 1, '*', '4,', 0, 1, 1, 1, '', '', 'librerar coordinador', 0),
(16, 'COMENTARIO_GENERADOR', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 0, 0, '*', '5,', 1, 0, 0, 0, '', '', 'comentario cliente', 0),
(17, 'COMENTARIO_EQUIPO', 'COMENTARIO', NULL, '', 1, 1, '<itform> 	<element> 		<label> 			Comentario 		</label> 		<type> 			inputlong 		</type> 		<id> 			comment 		</id> 		<validations> 			<required>true</required> 		</validations> 	</element> </itform>', 0, 0, '*', '3,4,', 2, 0, 1, 0, '', '', 'comentario equipo', 0);

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
(2, 'Comisiones', '48:00', 1, 1, '1', '1,3,4', '', 'id,FA=>Fecha cracion,usr_o.nombre=>Agente,nextans:S1=>S1,nextans:O33:P2=>S2,nextans:O24=>S3', 0),
(3, 'Agente1', '03:00', 3, 1, '2', '2', 'id,status', '', 0),
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
(1, 1, 'alta de usuario', NULL, 'TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx', 'default=>2', NULL, NULL, 0, 1, 'U548391', '2014-01-24', NULL, NULL),
(2, 1, 'usuario de baja', NULL, 'TKTS/files_sol/VENTAS/SIEBEL/usuarios.ppsx', 'default=>2', NULL, NULL, 1, 0, 'U548391', '2014-01-24', NULL, NULL),
(3, 1, 'error al realizar gestiones', NULL, NULL, 'default=>2', NULL, 2, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(4, 1, 'lentitud en la web', 'lentitud/error', NULL, 'default=>2', NULL, 3, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(5, 1, 'pagina web no responde', 'lentitud/error', NULL, 'default=>2', NULL, 3, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(6, 2, 'si', 'masivo', NULL, 'default=>2', NULL, 4, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(7, 2, 'no', NULL, NULL, 'default=>2', NULL, 5, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(8, 3, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>month</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', 0, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(9, 3, 'no', NULL, NULL, 'default=>2', NULL, 6, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(10, 4, 'si', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(11, 4, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(12, 5, 'si', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(13, 5, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element><element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(14, 6, 'si', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(15, 6, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(16, 7, 'alta de usuario', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(17, 7, 'usuario bloqueado', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 1, 'U548391', '2014-01-24', NULL, NULL),
(18, 7, 'cambio de contraseña', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(19, 7, 'lentitud en la web', 'lentitud/error', NULL, 'default=>2', NULL, 8, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(20, 7, 'pagina web no responde', 'lentitud/error', NULL, 'default=>2', NULL, 8, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(21, 8, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(22, 8, 'no', NULL, NULL, 'default=>2', NULL, 9, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(23, 9, 'si', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(24, 9, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(25, 10, 'sin dominio telecom', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(26, 10, 'sin conectividad', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(27, 10, 'periferico faltante/falla (mouse, teclado,monitor)', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(28, 10, 'otro inconveniente', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(29, 11, 'problemas de usuario en el puesto', NULL, NULL, 'default=>2', NULL, 12, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(30, 11, 'problemas discador', NULL, NULL, 'default=>2', NULL, 13, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(31, 11, 'CMS supervisor', NULL, NULL, 'default=>2', NULL, 14, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(32, 11, 'nice', NULL, NULL, 'default=>2', NULL, 17, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(33, 11, 'telefonia / llamadas', NULL, NULL, 'default=>2', NULL, 20, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(34, 12, 'ips', NULL, NULL, 'default=>2', NULL, 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(35, 12, 'aic', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(36, 12, 'apc', NULL, NULL, 'default=>2', NULL, 16, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(37, 16, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(38, 16, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(39, 13, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(40, 13, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(41, 14, 'error / incidente', NULL, NULL, 'default=>2', NULL, 15, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(42, 14, 'blanqueo de clave', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(43, 15, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(44, 15, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(45, 17, 'error / incidente', NULL, NULL, 'default=>2', NULL, 19, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(46, 17, 'blanqueo de clave', NULL, NULL, 'default=>2', NULL, 18, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(47, 19, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(48, 19, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(49, 18, 'no la recuerdo', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(50, 18, 'usuario bloqueado', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(51, 20, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(52, 20, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(53, 21, 'usuarios', NULL, NULL, 'default=>2', NULL, 22, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(54, 21, 'aplicacion', NULL, NULL, 'default=>2', NULL, 23, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(55, 22, 'alta', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(56, 22, 'baja', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(57, 22, 'modificacion', NULL, NULL, 'default=>2', NULL, 24, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(58, 24, 'contraseña', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(59, 24, 'perfil', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL);
INSERT INTO `opciones` (`id`, `idpregunta`, `texto`, `texto_critico`, `ruta_destino`, `idequipo_destino`, `pretext`, `idpregunta_destino`, `autocerrar`, `no_anexar`, `UA`, `FA`, `UB`, `FB`) VALUES
(60, 24, 'jerarquia', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(61, 24, 'login', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(62, 22, 'usuario bloqueado', NULL, 'TKTS/files_sol/VENTAS/AC/Instructivo_Desbloqueo_de_Usuarios_de_Ac_en_Base_de_Datos_Oracle.doc', 'default=>2', NULL, NULL, 1, 0, 'U548391', '2014-01-24', NULL, NULL),
(63, 23, 'boton envio a siebel desactivado', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(64, 23, 'lentitud', 'error/lentitud', NULL, 'default=>2', NULL, 25, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(65, 23, 'error', 'error/lentitud', NULL, 'default=>2', NULL, 25, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(66, 25, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(67, 25, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(68, 26, 'si', 'masivo', NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL),
(69, 26, 'no', NULL, NULL, 'default=>2', '<itform><element><type>hidden</type><notsave>true</notsave><id>idmaster</id></element>\n<element><type>fileupl</type><id>archivos</id><label>archivos</label><notsave>true</notsave></element> <element><type>input</type><label>legajo</label><id>Hola</id><validations><numeric>true</numeric><required>true</required></validations></element> <element><type>text</type><id>juan</id><text>holatext este si es largo para verificar el contenido alargado a su maxima longitud</text></element> <element><type>input</type><id>21</id><comment>3 usuarios de ejemplo</comment><label>usuarios</label><validations><regex>/U[0-9]{6}/</regex></validations></element> <element><type>inputlong</type><label>comentario</label><id>2</id></element> <element><type>datetime</type><id>date</id><label>Fecha</label></element> <element><type>date</type><id>32</id><label>Fecha</label></element> <element><type>select</type><id>321</id><label>seleccion</label><option><value>1</value><text>opcion1</text></option><option><value>2</value><text>opcion2</text></option></element> <element><type>link</type><id>322</id><label>wAnexo</label><path>siebel/aa/dd.ppt</path><text>Link</text><comment>Descargue el archivo para luego anexarlo</comment></element> </itform>', NULL, 0, 0, 'U548391', '2014-01-24', NULL, NULL);

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
(1, 'admin_full', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56'),
(2, 'admin_teams', '0,19,20,21,22,23,24,30,31,47,49,50,51,52,53,56'),
(3, 'comisiones_analista', '0,24,30,31,32,33,34,35,36,37,38,47,53,54,55,56'),
(4, 'comisiones_responsable', '0,24,30,31,32,33,34,35,36,37,38,41,47,53,54,55,56'),
(5, 'agente', '0,24,30,31,32,34,36,37,39,40,43,46,47,53,56');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `prefiles_vistas`
--

INSERT INTO `prefiles_vistas` (`id`, `prioridad`, `perfil`, `relacion`, `vista`, `tipos_eventos`, `archivo_descarga`) VALUES
(1, 0, 1, '*', 1, '*', 1),
(2, 0, 3, '3,7', 1, '*', 1),
(3, 0, 2, '6', 1, '*', 1),
(4, 0, 4, '3,7', 1, '*', 1),
(5, 0, 5, '4,5', 1, '1', 1);

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
('fulladm', NULL, '1,2,3,4,5', 1, 0),
('FEDE', ',5', '3,4', 2, 0),
('U1AG1', ',3', NULL, 5, 0),
('U2AG1', ',3', NULL, 5, 0),
('U1AG2', ',4', NULL, 5, 0),
('COM1', ',2', NULL, 3, 0),
('COMRES', ',2', NULL, 4, 0),
('COMGO', ',1', NULL, 3, 0),
('SP1', ',3', NULL, 5, 0);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
('AGENTES', 'localhost', '', '', '/home/juan/datosTelecomCCT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE IF NOT EXISTS `sesiones` (
  `usr` varchar(50) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `front` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`usr`, `ip`, `front`, `hash`, `fecha`) VALUES
('COM1', '10.66.93.46', 1, 'aa282755bd76e64c9c40b0b147864a90a15ee882', '2014-12-04 14:39:55'),
('COMGO', '190.175.110.1', 1, 'bdbb102b38ec6e6ceeb0a81c4bb062ab20912fb2', '2014-11-22 20:11:39'),
('COMRES', '190.175.110.1', 1, 'f12d60f9e76b5f31b3ceeb8f4a008a9b15e9cf60', '2014-11-22 20:13:57'),
('FEDE', '190.175.110.1', 1, '33ee60641582d6c6a242d1d98fd1c31e8be71b1e', '2014-11-22 12:15:27'),
('FULLADM', '10.66.93.46', 1, 'a89caa98098f1081e42a5dde7a3eb4c8241a72a5', '2014-12-05 14:26:32'),
('U1AG1', '10.66.93.46', 1, '91338f9214fb2cbdbe53492a8769bee7e650a31c', '2014-12-10 09:40:07'),
('U1AG2', '190.175.110.1', 1, '8facbd022757f9af005a3712a0a339d1071b6c75', '2014-11-22 19:22:58'),
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
('SP1', 'sp1@aa.copm', '', 'sp11', '', '');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
