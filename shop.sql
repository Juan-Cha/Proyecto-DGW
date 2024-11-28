-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-10-2024 a las 21:12:16
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'Celulares', '20241013075802.jpg', 1),
(2, 'Tablets', '20241013080920.jpg', 1),
(3, 'Smartwatch', '20241014002228.jpg', 1),
(4, 'Laptops', '20241014002425.jpg', 1),
(5, 'PC de Escritorio', '20241014002638.jpg', 1),
(6, 'Monitores', '20241014002739.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'Ventas', '6741001010', 'admin@gmail.com', '6741001010', 'Santiago Papasquiaro, Durango, Mexico', 'smtp.gmail.com', 'admin@gmail.com', 'password', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(1, 1, '6999.00', 'POCO X3 PRO MAX', 1, 1),
(2, 2, '7299.00', 'LG 34GP63A-B UltraWide Gaming Monitor 34\" VA WQHD 160Hz 1ms MBR AMD FreeSync Premium, HDMI, Display Port, Curvo 1800R.', 6, 2),
(3, 3, '18699.00', 'XTREME PC GAMING RTX 4060 AMD Ryzen 7 5700X 32GB SSD 1TB Sistema Liquido WiFi (RTX 4060 | Ryzen 7 32GB Tank Pro Black)', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT '0',
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'POCO X3 PRO MAX', 'Con una tecnología de memoria UFS 3.1 mejorada,\r\nel POCO X3 Pro ofrece velocidades\r\nde lectura y escritura rápidas. Carga juegos y aplicaciones\r\nsin tener que esperar.', '6999.00', 9, 1, '20241013080252.jpg', 1, 1),
(2, 'Xiaomi Redmi Pad SE 8', 'Descubre un nuevo mundo de entretenimiento con el Xiaomi Redmi Pad SE. Diseñado para productividad y diversión, cuenta con una amplia pantalla FHD+ de 11\" que te sumerge en visuales nítidos y vibrantes. Equipado con 8GB de RAM y 256GB de almacenamiento, ofrece multitarea sin problemas y espacio más que suficiente para tus archivos, aplicaciones y contenido multimedia. Su conectividad Wi-Fi asegura acceso a Internet sin interrupciones, mientras que el acabado en gris grafito añade un toque de sofisticación a tu estilo. El modelo 23073RPBFG redefine la experiencia con las tabletas, siendo ideal para entusiastas de la productividad, amantes del entretenimiento y usuarios que disfrutan de la tecnología', '3499.00', 5, 0, '20241013081106.jpg', 1, 2),
(3, 'Samsung Galaxy Fit3 Grafito', '\"Galaxy Fit3\" presenta un diseño más amplio y estilizado con funciones mejoradas de salud y conectividad Galaxy. Con una pantalla más grande de 1,6\" y un cuerpo de aluminio resistente, podrás disfrutar de una mejor visibilidad en cualquier actividad. Realiza un seguimiento de los entrenamientos directamente desde tu muñeca, controla tus condiciones diarias e incluso con más detalles desde tu smartphone, todo ello sincronizado automáticamente. Cuando conectes la Fit3 con tu smartphone, podrás disfrutar de prácticas funciones, como Detección de caídas, Sincronización de modo, Buscar mi dispositivo, Respuesta rápida y Controlador de cámara. Echa un vistazo a la Galaxy Fit3 y hazte con la tuya hoy mismo.', '799.00', 20, 0, '20241014002854.jpg', 1, 3),
(4, 'HUAWEI MateBook D 14 i7 13th - Laptop de 14\", IPS, 16GB RAM+1TB SSD, 65W Fast Charging, Win11 Home, Teclado en Español', 'Con su cuerpo metálico al que se le ha aplicado un proceso de arenado y anodizado, para ofrecer texturas finas a la vez que se vuelve resistente al desgaste, llevándote a lugares nuevos y emocionantes', '19799.00', 5, 0, '20241014003007.jpg', 1, 4),
(5, 'XTREME PC GAMING RTX 4060 AMD Ryzen 7 5700X 32GB SSD 1TB Sistema Liquido WiFi (RTX 4060 | Ryzen 7 32GB Tank Pro Black)', 'Descubre el poder absoluto del gaming con una PC equipada con tecnología de vanguardia, disfrutando de un rendimiento excepcional, gráficos impresionantes y una experiencia de juego fluida y vibrante.', '18699.00', 0, 3, '20241014003111.jpg', 1, 5),
(6, 'LG 34GP63A-B UltraWide Gaming Monitor 34\" VA WQHD 160Hz 1ms MBR AMD FreeSync Premium, HDMI, Display Port, Curvo 1800R.', 'Monitor GamingLG Ultragear con Pantalla de 34\" QHD (3440 x 1440, relación de aspecto 21:9) y Frecuencia de actualización 160. Excelente para jugar videojuegos, este monitor curvo ultra ancho te sumerge en el acción y aumenta su campo de visión, lo que te permite ver más en tu pantalla e incrementar tus posibilidades de ganar. Una alta frecuencia de actualización nativa de 160 Hz con reducción de desenfoque de movimiento (MBR) de 1 milisegundo te mantiene dentro de la acción mientras reduce el desenfoque y el efecto fantasma.', '7299.00', 8, 2, '20241014003154.jpg', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT '0',
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'admin@gmail.com', 'Juan', 'Chavez', '$2y$10$3Uth9.7QmHJuZoyijhM0ieu.l3kS872roROT1nPwiA/sQrwgZCUci', 'Santiago Papasquiaro, Durango, Mexico', 1, NULL, 0, NULL, 1),
(2, 'jaja@gmail.com', 'Juan Chavez', NULL, '$2y$10$hE18a4cY9dVGDCZ.5/CxjuabvqYzs0mUHxGZ8B3Xx7bzR2MVSKaIC', NULL, 2, NULL, 0, NULL, 1),
(3, 'prueba@gmail.com', 'Usuario Prueba', NULL, '$2y$10$AP02x4u.rTBP43SI0QdfnubM5j8iYj41WnSQeScEj6bwVZnX6Bd8a', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT '0.00',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proceso` int(11) NOT NULL DEFAULT '1',
  `tipo` int(11) NOT NULL DEFAULT '1',
  `estado` int(11) NOT NULL DEFAULT '1',
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(1, NULL, '6999.00', '7000.00', 'Juan Chavez ', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2024-10-13 14:03:31', 1, 2, 1, 2),
(2, NULL, '14598.00', '15000.00', 'Usuario Prueba ', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2024-10-14 06:35:13', 1, 2, 1, 1),
(3, NULL, '56097.00', '60000.00', 'Usuario Prueba ', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '2024-10-14 06:37:12', 1, 2, 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
