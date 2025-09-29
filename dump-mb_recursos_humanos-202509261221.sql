/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.8.7    Database: mb_recursos_humanos
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `accesos_informaticos`
--

DROP TABLE IF EXISTS `accesos_informaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesos_informaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  `fecha_concesion` date DEFAULT NULL,
  `fecha_revocacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `accesos_informaticos_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesos_informaticos`
--

LOCK TABLES `accesos_informaticos` WRITE;
/*!40000 ALTER TABLE `accesos_informaticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesos_informaticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayudas`
--

DROP TABLE IF EXISTS `ayudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayudas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `tipo_ayuda` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `ayudas_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayudas`
--

LOCK TABLES `ayudas` WRITE;
/*!40000 ALTER TABLE `ayudas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ayudas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `numero_tarjeta_salario` varchar(100) DEFAULT NULL,
  `numero_cuenta_estandar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `bancos_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolsa_empleo`
--

DROP TABLE IF EXISTS `bolsa_empleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolsa_empleo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ci_bolsa_empleo` int(12) DEFAULT NULL,
  `curriculum` varchar(255) DEFAULT NULL,
  `cargo_postulado_id` int(11) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci_bolsa_empleo` (`ci_bolsa_empleo`),
  KEY `cargo_postulado_id` (`cargo_postulado_id`),
  CONSTRAINT `bolsa_empleo_ibfk_1` FOREIGN KEY (`cargo_postulado_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolsa_empleo`
--

LOCK TABLES `bolsa_empleo` WRITE;
/*!40000 ALTER TABLE `bolsa_empleo` DISABLE KEYS */;
INSERT INTO `bolsa_empleo` VALUES
(1,'Pedro Antonio','Manduley Roca',NULL,'uploads/curriculos/pruebaCV.docx',1,'7777777','test@test.cu','2025-09-19 19:08:53','activo'),
(2,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdac9e3441f_pruebaCV (1).docx',1,'+53 5 1234567','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(3,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdaca32071b_pruebaCV (1).docx',1,'+53 5 1234567','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(4,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdb18b2c4a6_pruebaCV (1).docx',1,'+53 5 1237767','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(5,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdb1910ebca_pruebaCV (1).docx',1,'+53 5 1237767','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(6,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdb1b74036c_pruebaCV (1).docx',1,'+53 5 1237767','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(7,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdb1d10ee51_pruebaCV (1).docx',1,'54645656','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(8,'Pablo','Sanchez',NULL,'uploads/curriculos/cv_68cdb255855a7_pruebaCV (1).docx',1,'55646546','pablo@allnovu.net','2025-09-19 04:00:00','pendiente'),
(9,'Juan','Perez Perez',NULL,'uploads/curriculos/cv_68d3039b2d507_3.pdf',1,'54673333','juanpp@gmail.com','2025-09-23 04:00:00','aprobado'),
(10,'Juan','Perez Perez',NULL,'uploads/curriculos/cv_68d303a02e6b8_3.pdf',1,'54673333','juanpp@gmail.com','2025-09-23 04:00:00','aprobado'),
(11,'Juan','Perez Perez',NULL,'uploads/curriculos/cv_68d303a7259d6_3.pdf',1,'54673333','juanpp@gmail.com','2025-09-23 04:00:00','aprobado'),
(12,'Juan','Perez Perez',NULL,'uploads/curriculos/cv_68d303b45d51b_2.pdf',1,'54673333','juanpp@gmail.com','2025-09-23 04:00:00','aprobado'),
(13,'Juancc','Perez Perez',NULL,'uploads/curriculos/cv_68d303bc9c987_2.pdf',1,'54673333','juanpp@gmail.com','2025-09-23 04:00:00','aprobado'),
(14,'Juan','Perez Perez',NULL,'uploads/curriculos/cv_68d30455261a8_2.pdf',1,'54344567','juan@gmail.com','2025-09-23 04:00:00','aprobado');
/*!40000 ALTER TABLE `bolsa_empleo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES
(1,1,'Tecnico Redes','Tecnico Redes',200.00);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequeos_medicos`
--

DROP TABLE IF EXISTS `chequeos_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chequeos_medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `fecha_chequeo` date DEFAULT NULL,
  `tipo_chequeo` varchar(100) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `archivo_informe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `chequeos_medicos_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequeos_medicos`
--

LOCK TABLES `chequeos_medicos` WRITE;
/*!40000 ALTER TABLE `chequeos_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `chequeos_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `archivo_contrato` varchar(255) DEFAULT NULL,
  `firma_digital` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES
(1,5,'Contrato por Tiempo Indeterminado','2025-09-09',NULL,NULL,NULL),
(2,2,'Contrato por Tiempo Indeterminado','2025-09-25',NULL,NULL,NULL),
(3,1,'Contrato por Tiempo Determinado','2025-09-02',NULL,NULL,NULL),
(4,2,'Contrato por Tiempo Determinado','2025-09-24',NULL,NULL,0);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES
(1,'Desarrollo','Departamento de Desarrollo',1);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deudas_trabajador`
--

DROP TABLE IF EXISTS `deudas_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deudas_trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `saldada` tinyint(1) DEFAULT NULL,
  `fecha_saldo` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `deudas_trabajador_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deudas_trabajador`
--

LOCK TABLES `deudas_trabajador` WRITE;
/*!40000 ALTER TABLE `deudas_trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `deudas_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos_trabajador`
--

DROP TABLE IF EXISTS `documentos_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos_trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `documentos_trabajador_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos_trabajador`
--

LOCK TABLES `documentos_trabajador` WRITE;
/*!40000 ALTER TABLE `documentos_trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `tamanno` varchar(255) DEFAULT NULL,
  `estructura` varchar(255) DEFAULT NULL,
  `ubicaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES
(1,'All Novu','prueba','100','prueba','prueba');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xentity` varchar(20) DEFAULT NULL,
  `xaction` varchar(45) DEFAULT NULL,
  `xid` varchar(20) DEFAULT NULL,
  `xuser` varchar(10) DEFAULT NULL,
  `xdate` datetime DEFAULT NULL,
  `xobs` text DEFAULT NULL,
  `xvisto` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N',
  `xvisto_date` datetime DEFAULT NULL,
  `xvisto_user` varchar(10) DEFAULT NULL,
  `xip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1526564 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES
(1,'TRABAJADOR','UPDATE-TRABAJADOR',NULL,'1','0000-00-00 00:00:00','TRABAJADOR: 1 Pedro Antonio','N',NULL,NULL,NULL),
(6,'PROGRAMAS-CAPACITACI','UPDATE-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 6 Capacitacion de Ruso','N',NULL,NULL,NULL),
(8,'BOLSA_EMPLEO','INSERT-POSTULACION',NULL,'1','0000-00-00 00:00:00','POSTULACION: 8 Pablo Sanchez','N',NULL,NULL,NULL),
(9,'TRABAJADOR','INSERT-TRABAJADOR',NULL,'1','0000-00-00 00:00:00','TRABAJADOR: 9 Jorge','N',NULL,NULL,NULL),
(10,'TRABAJADOR','INSERT-TRABAJADOR',NULL,'1','0000-00-00 00:00:00','TRABAJADOR: 10 Jorgea','N',NULL,NULL,NULL),
(11,'TRABAJADOR','INSERT-TRABAJADOR',NULL,'1','0000-00-00 00:00:00','TRABAJADOR: 11 Jorgea','N',NULL,NULL,NULL),
(12,'TRABAJADOR','INSERT-TRABAJADOR',NULL,'1','0000-00-00 00:00:00','TRABAJADOR: 12 Jorgea','N',NULL,NULL,NULL),
(13,'BOLSA_EMPLEO','INSERT-POSTULACION',NULL,'1','0000-00-00 00:00:00','POSTULACION: 13 Juancc Perez Perez','N',NULL,NULL,NULL),
(14,'BOLSA_EMPLEO','INSERT-POSTULACION',NULL,'1','0000-00-00 00:00:00','POSTULACION: 14 Juan Perez Perez','N',NULL,NULL,NULL),
(15,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 15 Capacitacion de Java 13','N',NULL,NULL,NULL),
(16,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 16 Capacitacion de Java 12','N',NULL,NULL,NULL),
(17,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 17 Capacitacion de Java 7','N',NULL,NULL,NULL),
(18,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 18 Capacitacion de Java 7','N',NULL,NULL,NULL),
(19,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 19 Capacitacion de Java 7','N',NULL,NULL,NULL),
(20,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 20 Capacitacion de Java 7','N',NULL,NULL,NULL),
(21,'PROGRAMAS-CAPACITACI','INSERT-PROGRAMA',NULL,'1','0000-00-00 00:00:00','PROGRAMA: 21 Capacitacion de Java 7','N',NULL,NULL,NULL),
(1526514,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: N','N',NULL,NULL,NULL),
(1526515,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: S','N',NULL,NULL,NULL),
(1526516,'TRABAJADORES','DEL-TRABAJADORES','8','1','0000-00-00 00:00:00','DEL TRABAJADOR: 8','N',NULL,NULL,NULL),
(1526517,'TRABAJADORES','DEL-TRABAJADORES','11','1','0000-00-00 00:00:00','DEL TRABAJADOR: 11','N',NULL,NULL,NULL),
(1526518,'TRABAJADORES','DEL-TRABAJADORES','10','1','0000-00-00 00:00:00','DEL TRABAJADOR: 10','N',NULL,NULL,NULL),
(1526519,'TRABAJADORES','DEL-TRABAJADORES','12','1','0000-00-00 00:00:00','DEL TRABAJADOR: 12','N',NULL,NULL,NULL),
(1526520,'TRABAJADORES','DEL-TRABAJADORES','9','1','0000-00-00 00:00:00','DEL TRABAJADOR: 9','N',NULL,NULL,NULL),
(1526521,'TRABAJADORES','DEL-TRABAJADORES','7','1','0000-00-00 00:00:00','BAJA TRABAJADOR: 7 - Fecha: 2025-09-23','N',NULL,NULL,NULL),
(1526522,'USUARIOS','CHG-ACTIVO','86','1','0000-00-00 00:00:00','USUARIO: 86 Activo: N','N',NULL,NULL,NULL),
(1526523,'USUARIOS','CHG-ACTIVO','86','1','0000-00-00 00:00:00','USUARIO: 86 Activo: S','N',NULL,NULL,NULL),
(1526524,'SUBCONTRATOS','BAJA-SUBCONTRATO','1','1','0000-00-00 00:00:00','BAJA SUBCONTRATO: 1 - Fecha: 2025-09-23','N',NULL,NULL,NULL),
(1526525,'PROGRAMAS-CAPACITACI','FINALIZAR-PROGRAMA','1','1','0000-00-00 00:00:00','FINALIZAR PROGRAMA: 1 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526526,'SUBCONTRATOS','BAJA-SUBCONTRATO','2','1','0000-00-00 00:00:00','BAJA SUBCONTRATO: 2 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526527,'PROGRAMAS-CAPACITACI','FINALIZAR-PROGRAMA','3','1','0000-00-00 00:00:00','FINALIZAR PROGRAMA: 3 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526528,'SUBCONTRATOS','BAJA-SUBCONTRATO','3','1','0000-00-00 00:00:00','BAJA SUBCONTRATO: 3 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526529,'SUBCONTRATOS','BAJA-SUBCONTRATO','7','1','0000-00-00 00:00:00','BAJA SUBCONTRATO: 7 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526530,'PROGRAMAS-CAPACITACI','FINALIZAR-PROGRAMA','20','1','0000-00-00 00:00:00','FINALIZAR PROGRAMA: 20 - Fecha: 2025-09-24','N',NULL,NULL,NULL),
(1526531,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: N','N',NULL,NULL,NULL),
(1526532,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: S','N',NULL,NULL,NULL),
(1526533,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: N','N',NULL,NULL,NULL),
(1526534,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: S','N',NULL,NULL,NULL),
(1526535,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: N','N',NULL,NULL,NULL),
(1526536,'USUARIOS','CHG-ACTIVO','1','1','0000-00-00 00:00:00','USUARIO: 1 Activo: S','N',NULL,NULL,NULL),
(1526537,'RECURSOS','INSERT-RECURSO',NULL,'1','0000-00-00 00:00:00','RECURSO: 10 2 portvasos all novu','N',NULL,NULL,NULL),
(1526538,'RECURSOS','INSERT-RECURSO',NULL,'1','0000-00-00 00:00:00','RECURSO: 11 1 refrigerador solar','N',NULL,NULL,NULL),
(1526539,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 15:41:39','RECURSO: 12 1 celular petrolero','N',NULL,NULL,NULL),
(1526540,'RECURSOS','INSERT-RECURSO',NULL,'1','0000-00-00 00:00:00','RECURSO: 13 5 cafetera all novu','N',NULL,NULL,NULL),
(1526541,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 17:27:36','RECURSO: 14 2 ranas','N',NULL,NULL,NULL),
(1526542,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 19:40:29','RECURSO: 15 5 celular petrolero 2.0','N',NULL,NULL,NULL),
(1526543,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 19:57:06','RECURSO: undefined 2 ranassss','N',NULL,NULL,NULL),
(1526544,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 19:57:34','RECURSO: undefined 5 ranassss','N',NULL,NULL,NULL),
(1526545,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 20:03:43','RECURSO: undefined 5 celular petroleroffff','N',NULL,NULL,NULL),
(1526546,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 20:04:18','RECURSO: undefined 5 celular petroleroffff','N',NULL,NULL,NULL),
(1526547,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 20:27:32','RECURSO: 15 5 celular petrolero 7.0','N',NULL,NULL,NULL),
(1526548,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 21:01:59','RECURSO: 15 5 celular petrolero 7.0','N',NULL,NULL,NULL),
(1526549,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 21:46:23','RECURSO: 14 2 ranas ','N',NULL,NULL,NULL),
(1526550,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 21:47:46','RECURSO: 16 5  zapatillas all novu','N',NULL,NULL,NULL),
(1526551,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 21:48:42','RECURSO: 16 5  zapatillas all novu ','N',NULL,NULL,NULL),
(1526552,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 21:50:26','RECURSO: 17 2  ventilador','N',NULL,NULL,NULL),
(1526553,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 21:51:26','RECURSO: 18 2  ventilador','N',NULL,NULL,NULL),
(1526554,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 21:51:35','RECURSO: 18 2  ventilador ','N',NULL,NULL,NULL),
(1526555,'RECURSOS','INSERT-RECURSO',NULL,'1','2025-09-25 22:06:54','RECURSO: 19 2  zapatillas all novu','N',NULL,NULL,NULL),
(1526556,'RECURSOS','UPDATE-RECURSO',NULL,'1','2025-09-25 22:08:17','RECURSO: 19 2  zapatillas all novu ','N',NULL,NULL,NULL),
(1526557,'RECURSOS','DEL-RECURSO','10','1','2025-09-26 14:21:24','DEL RECURSO: 10','N',NULL,NULL,NULL),
(1526558,'RECURSOS','DEL-RECURSO','8','1','2025-09-26 14:22:04','DEL RECURSO: 8','N',NULL,NULL,NULL),
(1526559,'RECURSOS','DEL-RECURSO',NULL,'1','2025-09-26 14:26:44','DEL RECURSO: 1','N',NULL,NULL,NULL),
(1526560,'RECURSOS','DEL-RECURSO',NULL,'1','2025-09-26 14:35:57','DEL RECURSO: 5','N',NULL,NULL,NULL),
(1526561,'RECURSOS','DEL-RECURSO',NULL,'1','2025-09-26 14:36:05','DEL RECURSO: 4','N',NULL,NULL,NULL),
(1526562,'RECURSOS','DEL-RECURSO',NULL,'1','2025-09-26 14:39:57','DEL RECURSO: 3','N',NULL,NULL,NULL),
(1526563,'RECURSOS','DEL-RECURSO',NULL,'1','2025-09-26 14:42:40','DEL RECURSO: 2','N',NULL,NULL,NULL);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pases_acceso`
--

DROP TABLE IF EXISTS `pases_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pases_acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `subcontrato_id` int(11) DEFAULT NULL,
  `areas_acceso` text DEFAULT NULL,
  `fecha_generacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vigente` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  KEY `subcontrato_id` (`subcontrato_id`),
  CONSTRAINT `pases_acceso_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
  CONSTRAINT `pases_acceso_ibfk_2` FOREIGN KEY (`subcontrato_id`) REFERENCES `subcontratos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pases_acceso`
--

LOCK TABLES `pases_acceso` WRITE;
/*!40000 ALTER TABLE `pases_acceso` DISABLE KEYS */;
INSERT INTO `pases_acceso` VALUES
(2,1,NULL,'Desarrollo','2025-09-18 18:14:05',1);
/*!40000 ALTER TABLE `pases_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_vacaciones`
--

DROP TABLE IF EXISTS `plan_vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_vacaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `anno` int(11) DEFAULT NULL,
  `meses` varchar(100) DEFAULT NULL,
  `dias_autorizados` int(11) DEFAULT NULL,
  `fecha_aprobacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `plan_vacaciones_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_vacaciones`
--

LOCK TABLES `plan_vacaciones` WRITE;
/*!40000 ALTER TABLE `plan_vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_vacaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas_capacitacion`
--

DROP TABLE IF EXISTS `programas_capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `programas_capacitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(255) NOT NULL,
  `dirigido_a` text DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL COMMENT 'Fecha en que se finalizó el programa de capacitación',
  `modalidad` varchar(50) DEFAULT NULL COMMENT 'Modalidad del programa (Presencial, Virtual, Mixta, En línea)',
  `horas` int(3) DEFAULT NULL COMMENT 'Número de horas de duración del programa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas_capacitacion`
--

LOCK TABLES `programas_capacitacion` WRITE;
/*!40000 ALTER TABLE `programas_capacitacion` DISABLE KEYS */;
INSERT INTO `programas_capacitacion` VALUES
(1,'Capacitacion de Lenguas Extranjeras','Personal operativo','Rowder ','2025-10-31','2025-09-24',NULL,NULL),
(2,'Capacitacion de Lenguas Extranjeras','Personal operativo','Rowder ','2025-10-31',NULL,NULL,NULL),
(3,'Capacitacion de Lenguas Extranjeras','Personal operativo','Rowder ','2025-10-31','2025-09-24',NULL,NULL),
(4,'Capacitacion de Lenguas Extranjeras','Todos los trabajadores','Rowder ','2025-10-01',NULL,NULL,NULL),
(5,'Capacitacion de Lenguas Extranjeras','Todos los trabajadores','Rowder ','2025-10-01',NULL,NULL,NULL),
(6,'Capacitacion de Ruso','Todos los trabajadores','Rowder ','2025-11-05',NULL,NULL,NULL),
(7,'Capacitacion de Java 8','Todos los trabajadores','Rowder ','2025-10-02',NULL,'Presencial',234),
(8,'Capacitacion de Java 7','Personal operativo','Rowder ','2025-09-12',NULL,'Presencial',325),
(9,'Capacitacion de Java 7','Supervisores','Rowder ','2025-09-11',NULL,'Presencial',235),
(10,'Capacitacion de Java 7','Directivos','Rowder ','2025-09-12',NULL,'Virtual',65),
(11,'Capacitacion de Java 9','Personal operativo','Rowder ','2025-10-09',NULL,'Presencial',452),
(12,'Capacitacion de Java10','Personal administrativo','Rowder ','2025-09-10',NULL,'Presencial',345),
(13,'Capacitacion de Ruso','Directivos','Rowder ','2025-09-04',NULL,'Presencial',54),
(14,'Capacitacion de Java 12','Supervisores','Rowder ','2025-09-18',NULL,'Virtual',475),
(15,'Capacitacion de Java 13','Supervisores','Rowder ','2025-09-18',NULL,'Virtual',475),
(16,'Capacitacion de Java 12','Supervisores','Rowder ','2025-09-16',NULL,'Presencial',543),
(17,'Capacitacion de Java 7','Supervisores','Rowder ','2025-09-04',NULL,'Presencial',475),
(18,'Capacitacion de Java 7','Supervisores','Rowder ','2025-10-23',NULL,'Presencial',475),
(19,'Capacitacion de Java 7','Directivos','Rowder ','2025-09-03',NULL,'Presencial',123),
(20,'Capacitacion de Java 7','Directivos','Rowder ','2025-09-03','2025-09-24','Presencial',123),
(21,'Capacitacion de Java 7','Carlos Manuel','Rowder ','2025-09-25',NULL,'Presencial',90);
/*!40000 ALTER TABLE `programas_capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `nombre` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_entrega_a_t` date NOT NULL,
  `fecha_entrega_a_rh` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos`
--

LOCK TABLES `recursos` WRITE;
/*!40000 ALTER TABLE `recursos` DISABLE KEYS */;
INSERT INTO `recursos` VALUES
(6,5,'olla all novu',1,'2025-09-25',NULL),
(7,5,'iguana all novu',1,'2025-09-25',NULL),
(9,2,'ventilador 3000',1,'2025-09-25',NULL),
(11,1,'refrigerador solar',1,'2025-09-25',NULL),
(12,1,'celular petrolero',1,'2025-09-25',NULL),
(13,5,'cafetera all novu',1,'2025-09-25',NULL),
(14,2,'ranas ',0,'2025-09-25',NULL),
(15,5,'celular petrolero 7.0',1,'2025-09-15',NULL),
(16,5,' zapatillas all novu ',0,'2025-09-25',NULL),
(17,2,' ventilador',1,'2025-09-25',NULL),
(18,2,' ventilador ',0,'2025-09-25','2025-09-25'),
(19,2,' zapatillas all novu ',0,'2025-09-07','2025-09-25');
/*!40000 ALTER TABLE `recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_asistencia`
--

DROP TABLE IF EXISTS `registro_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_asistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `ausencia` tinyint(1) DEFAULT NULL,
  `tipo_ausencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `registro_asistencia_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_asistencia`
--

LOCK TABLES `registro_asistencia` WRITE;
/*!40000 ALTER TABLE `registro_asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_capacitacion`
--

DROP TABLE IF EXISTS `registro_capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_capacitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `fecha_realizacion` date DEFAULT NULL,
  `resultados` text DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  KEY `programa_id` (`programa_id`),
  CONSTRAINT `registro_capacitacion_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
  CONSTRAINT `registro_capacitacion_ibfk_2` FOREIGN KEY (`programa_id`) REFERENCES `programas_capacitacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_capacitacion`
--

LOCK TABLES `registro_capacitacion` WRITE;
/*!40000 ALTER TABLE `registro_capacitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_vacaciones`
--

DROP TABLE IF EXISTS `registro_vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_vacaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `dias_disfrutados` int(11) DEFAULT NULL,
  `anno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `registro_vacaciones_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_vacaciones`
--

LOCK TABLES `registro_vacaciones` WRITE;
/*!40000 ALTER TABLE `registro_vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_vacaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `xrol_id` tinyint(4) NOT NULL,
  `xrol` varchar(60) NOT NULL,
  PRIMARY KEY (`xrol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'ADMINISTRADOR'),
(2,'TRABAJADOR'),
(3,'DESARROLLO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcontratos`
--

DROP TABLE IF EXISTS `subcontratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcontratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(255) DEFAULT NULL,
  `carnet_identidad` varchar(11) DEFAULT NULL COMMENT 'Carnet de Identidad (11 dígitos)',
  `estatus` varchar(100) DEFAULT NULL,
  `entidad_representada` varchar(255) DEFAULT NULL,
  `servicio_objeto` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `areas_acceso` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_subcontratos_ci` (`carnet_identidad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcontratos`
--

LOCK TABLES `subcontratos` WRITE;
/*!40000 ALTER TABLE `subcontratos` DISABLE KEYS */;
INSERT INTO `subcontratos` VALUES
(1,'Ricardo Sanchez Molina',NULL,'TCP',NULL,'Es jardinero subcontratado de servicios comunales','2025-09-17','2025-09-23','jardin'),
(2,'Heylin Garcia Matos',NULL,'TCP',NULL,'Trabaja de Asistencia Técnica en Servicios WEB','2025-09-18','2025-09-24','jardin'),
(3,'Heylin Garcia Matos',NULL,'TCP',NULL,'Trabaja de Asistencia Técnica en Servicios WEB','2025-09-18','2025-09-24','jardin'),
(4,'Heylin Garcia Matos',NULL,'TCP',NULL,'Trabaja de Asistencia Técnica en Servicios WEB','2025-09-18',NULL,'jardin'),
(5,'Keyla Dias Lemus',NULL,'Trabajador','Etecsa','Reparación de Terminales Telefónicas','2025-09-26','2025-10-06','Oficina'),
(6,'Jose Manuel Garcia Rebustillo',NULL,'TCP',NULL,'Pintar las paredes de la oficina ','2025-10-08','2025-10-11','Oficina'),
(7,'Javier Alcaide Valdez',NULL,'Trabajador','Etecsa','Cableado interno para equipo de telecomunicaciones','2025-10-02','2025-09-24','jardin'),
(8,'Javier Alcaide Valdez',NULL,'Trabajador','Etecsa','Cableado interno para equipo de telecomunicaciones','2025-10-02',NULL,'jardin'),
(9,'Heylin Garcia Matos',NULL,'TCP',NULL,'asd asd asd','2025-09-23',NULL,'jardin'),
(10,'Heylin Garcia Matos',NULL,'TCP',NULL,'asdasd','2025-09-10',NULL,'jardin'),
(11,'Ricardo Sanchez','12345678911','Trabajador','Etecsa','servicios comerciales extra','2025-10-03',NULL,'Oficina Comercial'),
(12,'Helen Perez','98765432101','TCP',NULL,'asdasd','2025-10-10',NULL,'Oficina'),
(13,'Ricardo Sanchez Molina','85091212345','TCP',NULL,'asdasd','2025-10-03',NULL,'Oficina'),
(14,'Keyla Dias Lemus','12423423433','TCP',NULL,'asd','2025-10-07',NULL,'');
/*!40000 ALTER TABLE `subcontratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas_snc225`
--

DROP TABLE IF EXISTS `tarjetas_snc225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas_snc225` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador_id` int(11) DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `tiempo_trabajo` decimal(10,2) DEFAULT NULL,
  `salarios_devengados` decimal(10,2) DEFAULT NULL,
  `archivo_digital` varchar(255) DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `tarjetas_snc225_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas_snc225`
--

LOCK TABLES `tarjetas_snc225` WRITE;
/*!40000 ALTER TABLE `tarjetas_snc225` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetas_snc225` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargos_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `huella_dactilar` text DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `carnet_identidad` varchar(50) NOT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nivel_educacional` varchar(100) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `estatus` varchar(100) DEFAULT NULL,
  `bolsa_empleo_id` int(11) DEFAULT NULL,
  `trabajador_eliminado` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carnet_identidad` (`carnet_identidad`),
  KEY `cargos_id` (`cargos_id`),
  KEY `bolsa_empleo_id` (`bolsa_empleo_id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `fk_trabajador_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `trabajadores_ibfk_2` FOREIGN KEY (`bolsa_empleo_id`) REFERENCES `bolsa_empleo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES
(1,1,NULL,'uploads/trabajadores/foto_68d686d74e7ef_av3.png','','Pedro Antonio','Manduley Roca','85091212345','M',40,'Calle 23 #456, Vedado, La Habana','+53 5 1234567','pedro.mandulsy@example.com','Universitario','2020-03-15',NULL,'activo',10,0),
(2,1,NULL,'uploads/trabajadores/foto_68cc1f48221c9_vector-de-perfil-avatar-predeterminado-foto-usuario-medios-sociales-icono-183042379.webp',NULL,'Pablo','Sanchez','435345345','M',56,'calle 654 entre 3ra y 5ta','53453232','pablo@allnovu.net','Universitario','2025-09-17',NULL,'activo',1,0),
(5,1,NULL,'uploads/trabajadores/foto_68cc21fdbb7d5_vector-de-perfil-avatar-predeterminado-foto-usuario-medios-sociales-icono-183042379.webp',NULL,'Carlos','Manuel','3212554','M',32,'calle 455 43 3ser','5466447','pablo@allnovu.net','Universitario','2025-09-16',NULL,'activo',1,0),
(6,1,NULL,'uploads/trabajadores/foto_68cc228590399_vector-de-perfil-avatar-predeterminado-foto-usuario-medios-sociales-icono-183042379.webp',NULL,'Rafael','Garcia','5323432','M',34,'calle 222 entre 5ta y 7ma','533424234','rafael@allnovu.net','Universitario','2025-09-16',NULL,'activo',1,1),
(7,1,NULL,'uploads/trabajadores/foto_68cc28c1202c7_vector-de-perfil-avatar-predeterminado-foto-usuario-medios-sociales-icono-183042379.webp',NULL,'Jhonny','Rodry','45345345345','M',24,'345345345','3453453454','jhonny@asdas','Universitario','2025-09-15','2025-09-23','activo',1,1),
(8,1,NULL,'',NULL,'Luis ','p','01032963698','F',89,'lo','5588963214','lola@k.com','bajo','2025-09-23',NULL,'activo',2,1),
(9,1,NULL,'uploads/trabajadores/foto_68d2a88e3aa47_Screenshot 2025-09-18 100848.png',NULL,'Jorge','Ramirez','01022268102','M',24,'calle 654 entre 3ra y 5ta','7564454','jorge@gmail.com','Universitario','2025-09-12',NULL,'activo',3,1),
(10,1,NULL,'uploads/trabajadores/foto_68d2a8cae7df4_Screenshot 2025-09-18 100848.png',NULL,'Jorgea','Ramirez','01022268104','M',24,'calle 654 entre 3ra y 5ta','7564454','jorge@gmail.com','Universitario','2025-09-12',NULL,'activo',3,1),
(11,1,NULL,'uploads/trabajadores/foto_68d2a8dc2f12d_Screenshot 2025-09-18 100848.png',NULL,'Jorgea','Ramirez','01022268122','M',24,'calle 654 entre 3ra y 5ta','7564454','jorge@gmail.com','Universitario','2025-09-12',NULL,'activo',3,1),
(12,1,NULL,'uploads/trabajadores/foto_68d2a94aca02f_Screenshot 2025-09-18 100848.png',NULL,'Jorgeaaa','Ramirez','01022268141','M',24,'calle 654 entre 3ra y 5ta','7564454','jorge@gmail.com','Universitario','2025-09-12',NULL,'activo',3,1);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `xusuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `xusuario` varchar(120) DEFAULT NULL,
  `xemail` varchar(100) DEFAULT NULL,
  `xpwd` varchar(100) DEFAULT NULL,
  `xnif` varchar(20) DEFAULT NULL,
  `xmovil` varchar(20) DEFAULT NULL,
  `xtelefono` varchar(20) DEFAULT NULL,
  `xdomicilio` varchar(100) DEFAULT NULL,
  `xcod_postal` varchar(5) DEFAULT NULL,
  `xmunicipio_id` int(11) DEFAULT 0,
  `xmunicipio` varchar(70) DEFAULT NULL,
  `xprovincia_id` int(11) DEFAULT 0,
  `xpais_id` int(11) DEFAULT 0,
  `xobs` varchar(255) DEFAULT NULL,
  `xuseralta_id` int(11) DEFAULT NULL,
  `xusermodif_id` int(11) DEFAULT NULL,
  `xdatealta` datetime DEFAULT NULL,
  `xdatemodif` datetime DEFAULT NULL,
  `xactivo` varchar(1) DEFAULT 'S',
  `xult_acceso` datetime DEFAULT NULL,
  `xrol_id` tinyint(4) DEFAULT NULL,
  `xeliminado` tinyint(4) DEFAULT 0,
  `xhash` varchar(100) DEFAULT NULL,
  `xver_locales` varchar(1) DEFAULT 'N',
  `xver_trabajadores` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`xusuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Luis Ramón (dev)','luisr@allnovu.net','2025',NULL,'',NULL,NULL,NULL,0,NULL,0,0,'asd',6,1,'2025-08-26 09:32:57','0000-00-00 00:00:00','S','2025-09-26 18:14:48',1,0,'hUYlYTJEG325980tebYK39z26o1C4QM2oP72OMDiprWex7xoc6B2uNbLTAAYtHaujYUjxYEDcHROK7Toj3I2DbejHn7FuhQ6Ksu1','S','S'),
(76,'Pedro Antonio','pedrom@allnovu.net','$2y$10$6j1VVe27JH/vEHi7jfmveuop.Un88uPCwuPL/gXSL6GeKt6/BXhZO',NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,'asd',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','S',NULL,1,0,'zZj7a8gvq5uaTpKT5IFZWCpVRCn3Ydzi1ntdhskPDtzoeU0u9IMQj5AQsQbWCEHkPF0A250cKq6VJRzPAlsFPSVvSsf3OE3TXkrs','N','N'),
(85,'Prueba Desarrollador','desarrollo@allnovu.net','$2y$10$EAvrptfxfBTdwIsu0dwUNuplBCzVAsrTbb2VyKjB3GkKFbS.9J3n6',NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,'Este es un Usuario de Prueba Desarrollador',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','S','0000-00-00 00:00:00',3,0,'Lsy2sp20JMa4ISSOhWZcRcwtGq79H3XBW5ENPxV6GDhmNpaA1oDhASGj5JdbW4Rc6rcChXdSYO4bId0ce0UkubxtXaBTlrpKiTNa','N','N'),
(86,'Trabajador Prueba','trabajador@allnovu.net','$2y$10$m4bUkZMBBmk/7s5OgJnxIe1jSii6g0jtTYjXc6TzgFMFAaIM2D.je',NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,'prueba de trabajador',85,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','S','0000-00-00 00:00:00',2,0,'sYvDbd4uPpL5FRfMCM6Dtuc2eP99e5Y0idEGCcK8ViGptRdbsDMstMZBTvlSGTgMnQouuGS2G2fxTRY1Z5LakDWikSTM0poZqwJu','N','N');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mb_recursos_humanos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-26 12:21:58
