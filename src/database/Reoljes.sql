CREATE DATABASE  IF NOT EXISTS `Human` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Human`;
-- Tabla 'Direccion'

CREATE TABLE `Direccion` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `calle` smallint(6) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `localidad` varchar(26) DEFAULT NULL,
  `provincia` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla `Usuarios`

CREATE TABLE `Usuario` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
-- `id_direccion` smallint(6) unsigned NOT NULL,
  `nombre` varchar(26) DEFAULT NULL,
  `apellido` varchar(26) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` int unsigned NOT NULL,
  `contraseña` text DEFAULT NULL,
  `img`  text NOT NULL,
  `fechaDeNacimiento` DATE Not null,
  `admin` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
-- FOREIGN KEY (`id_direccion`) REFERENCES Direccion (`id`)
);


-- Tabla 'Venta'

CREATE TABLE `Venta` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(6) unsigned NOT NULL,
  `id_carrito` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_usuario`) REFERENCES Usuario (`id`)
);


-- Tabla de 'Categorias'
CREATE TABLE `Categoria`(
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(26) NOT NULL, 
  `img_Baner` text DEFAULT Null,
  `img_Port` text DEFAULT Null,
  PRIMARY KEY (`id`)
);

-- Tabla 'Carrito'

CREATE TABLE `Carrito` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_venta` smallint(6) unsigned NOT NULL,
  `id_usuario` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_venta`) REFERENCES Venta (`id`),
  FOREIGN KEY (`id_usuario`) REFERENCES Usuario (`id`)
);

-- Tabla 'Productos'

CREATE TABLE `Producto` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(26) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img`  text NOT NULL,
  `id_tipo` smallint(6) unsigned NOT NULL,
  `show` smallint(2) NOT NULL ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_tipo`) REFERENCES Categoria (`id`)
);

-- Tabla 'CompraIndividual'

CREATE TABLE `CompraIndividual` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` smallint(6) unsigned NOT NULL,
  `id_usuario` smallint(6)unsigned  NOT NULL,
  `id_venta` smallint(6)  unsigned NOT NULL,
  `precio` decimal(3,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_producto`) REFERENCES Producto (`id`),
  FOREIGN KEY (`id_usuario`) REFERENCES Usuario (`id`),
  FOREIGN KEY (`id_venta`) REFERENCES Venta (`id`)
);

-- Tabla 'Favoritos'

CREATE TABLE `Favorito` (
 `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` smallint(6) unsigned  NOT NULL,
  `id_usuario` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_producto`) REFERENCES Producto (`id`),
  FOREIGN KEY (`id_usuario`) REFERENCES Usuario (`id`)
);

-- Tabla de 'ProductImg'

CREATE TABLE `ProductImg`(
  `id` smallint(6) NOT NULL,
  `id_producto` smallint(6) unsigned NOT NULL,
  `img` text NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`id_producto`) REFERENCES Producto (`id`)
);

-- Tabla de 'FormasDePago'

CREATE TABLE `FormasDePago`(
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `formaDePago` text NOT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla de 'Productos_FormasDePago'

CREATE TABLE `Productos_FormasDePago`(
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` smallint(6) unsigned NOT NULL,
  `id_formaDePago` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_producto`) REFERENCES Producto (`id`),
  FOREIGN KEY (`id_formaDePago`) REFERENCES FormasDePago (`id`)
);


-- Valores de ejemplo 

INSERT INTO `Categoria` VALUES (1,"reloj","reloj.jpg","reloj4x4.jpeg"),
 (2,"billetera","pulsera.jpg","pulsera4x4.jpeg"),
 (3,"pulseras","billetera.jpg","billetera4x4.jpeg"),
 (4,"otros","otros.jpg","otros4x4.jpeg");

INSERT INTO `Producto` VALUES (1,"Tesla Sepia","El Reloj Tesla Sepia fue diseñado como el compañero para todo el día. Es un reloj que te lo vas a querer sacar nunca más.",23000,3,"TeslaSepia01.webp",1,1),
 (2,"Hades Acero","igual que el dios fuerte como el acero",2000,5,"1649273314571.webp",1,1),
 (3,"Enrico Toffee","No vas a conocer un reloj tan clásico y minimalista como el Enrico Toffee.",15000,3,"EnricoToffee01.webp",1,1);

INSERT INTO `ProductImg` VALUES 
  (1,1,"TeslaSepia02.webp"),
  (2,1,"TeslaSepia03.webp"),
  (3,1,"TeslaSepia04.webp"),
  (4,2,"1649273314573.webp"),
  (5,2,"1649273314575.webp"),
  (6,3,"EnricoToffee02.webp"),
  (7,3,"EnricoToffee03.webp"),
  (8,3,"EnricoToffee04.webp");


INSERT INTO `FormasDePago` VALUES 
  (1,"Mercado Pago"),
  (2,"Tranferencia"),
  (3,"Tarjeta De Credito"),
  (4,"Tarjeta de Debito"),
  (5,"Efectivo");

INSERT INTO `Productos_FormasDePago` VALUES 
  (1,1,1),
  (2,1,2),
  (3,1,3),
  (4,2,1),
  (5,2,5),
  (6,2,2),
  (7,3,5),
  (8,3,1),
  (9,3,2);


INSERT INTO `Usuario` VALUES 
  (1,"Francisco", "Lema","franciscolemacr@gmail.com",45221515,"$2b$10$LNcQGxnvO5.R4sUGq/IuxOhvK1EdkexMMM.sRcaCWVUhUMdz29Cau","default-image.png","2002-06-11",1),
  (2,"Juan Manuel", "Carlos Ferre", "JuancarlosF@gmail.com",45221515,'12345678',"default-image.png","2002-07-12",0);
