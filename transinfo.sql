-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (x86_64)
--
-- Host: localhost    Database: transinfo
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Action`
--

DROP TABLE IF EXISTS `Action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Action` (
  `ActionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Action`
--

LOCK TABLES `Action` WRITE;
/*!40000 ALTER TABLE `Action` DISABLE KEYS */;
INSERT INTO `Action` VALUES (1,'Seguir Derecho','Movements essentially straight ahead'),(2,'Tomando una curva','Negotiating a curve'),(3,'En retroceso','Backing'),(4,'Cambio de carril Izquierda','Changing lanes to the left'),(5,'Cambio de carril derecha','Changing lanes to the right'),(6,'Pasar por la izquierda','Passing on the left'),(7,'Pasar por la derecha','Passing on the right'),(8,'Cortes de pastelillo','Overtaking close to vehicles'),(9,'Virando Derecha','Turning right'),(10,'Virando Izquierda','Turning Left'),(11,'Viraje en U','Making a U-turn'),(12,'Saliendo del carril ','Leaving Traffic Lane'),(13,'Entrando al carril','Entering traffic lane'),(14,'Reduciendo la velocidad/parar','Slowing/stopping'),(15,'Estacionando el vehículo','Getting parked'),(16,'Detenido en carril','Stopped in Traffic'),(17,'Otro','Other'),(18,'Estacionado','Parked'),(19,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActionAtTimeOfCrash`
--

DROP TABLE IF EXISTS `ActionAtTimeOfCrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActionAtTimeOfCrash` (
  `ActionAtTimeOfCrashID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(80) DEFAULT NULL,
  `DescriptionEN` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ActionAtTimeOfCrashID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionAtTimeOfCrash`
--

LOCK TABLES `ActionAtTimeOfCrash` WRITE;
/*!40000 ALTER TABLE `ActionAtTimeOfCrash` DISABLE KEYS */;
INSERT INTO `ActionAtTimeOfCrash` VALUES (1,'Ninguna','No improper action'),(2,'Saliendo detrás de un Vehículo','Dart/Dash'),(3,'Ciclista parado','Standing cyclist'),(4,'Falló en Ceder el Derecho del Paso','Failure to yield right-of-way'),(5,'Caso Omiso a Señales de Tráfico, Rótulos o Policía','failure to obey traffic signs, signals, or officer'),(6,'Trabajando en la carretera','Working imroperly in roadway'),(7,'Acostado en la carretera','Lying in roadway'),(8,'Jugando en la carretera','Playing in roadway'),(9,'Indebidamente en la Carretera (parado, etc.)','In roadway improperly (standing, etc,)'),(10,'Relacionado con Vehículo Averiado (trabajando, empujando, dejando/regresando)','Disabled vehicle related (working on, pushing, leaving/approaching)'),(11,'Bajándose/Montándose del Vehículo Estacionado/Parado','Entering/Exiting parked/Standing vehicle'),(12,'Desatento (hablando, comiendo, etc.)','Inattentive (talking, eating, etc.)'),(13,'No Visible (Ropa Oscura, Sin Iluminación, etc.)','Not visible (dark clothing, no lighting, etc.)'),(14,'Viraje Indebido','Improper turn/merge'),(15,'Pasar Indebidamente','Improper passing'),(16,'Enganchado en vehículo','Hanging on vehicle'),(17,'Caminando/Manejando en Caminos Equivocados','Wrong-way riding or walking'),(18,'Otro','Other'),(19,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ActionAtTimeOfCrash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActionPriorToCrash`
--

DROP TABLE IF EXISTS `ActionPriorToCrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActionPriorToCrash` (
  `ActionPriorToCrashID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(80) DEFAULT NULL,
  `DescriptionEN` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ActionPriorToCrashID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionPriorToCrash`
--

LOCK TABLES `ActionPriorToCrash` WRITE;
/*!40000 ALTER TABLE `ActionPriorToCrash` DISABLE KEYS */;
INSERT INTO `ActionPriorToCrash` VALUES (1,'Cruzando la Carretera','Crossing Roadway'),(2,'Cruzando intersección - semáforo a favor','Crossing Intersection with traffic light '),(3,'Cruzando intersección - contra semáforo','Crossing Intersection disregarding traffic light'),(4,'Cruzando fuera de la intersección','Not crossing at an intersection'),(5,'Cruzando intersección sin semáforo','Crossing at an intersectionwithout traffic light'),(6,'Esperando para Cruzar la Carretera','Waiting to Cross Roadway'),(7,'Caminando/Manejando con el Tránsito','Walking/Cycling along roadway with traffic (in or adjacent to travel lane)'),(8,'Caminando/Manejando Contra el Tránsito','Walking/Cycling along roadway against traffic (in or adjacent to travel lane)'),(9,'Caminando/Manejando por la Acera','Walking/Cycling on sidewalk'),(10,'Otro en Carretera','In roadway - Other'),(11,'Parado en acera','Standing on sidewalk'),(12,'Parado fuera de las vías de rodaje (paseo, mediana)','Standing adjacent to roadway (e.g. shoulder, median)'),(13,'Trabajando en la Carretera','Working in trafficway (incident response)'),(14,'Otra acción del ciclista','Other cyclist action'),(15,'Otra acción del peatón','Other pedestrian action'),(16,'Ninguna','None'),(17,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ActionPriorToCrash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Agency`
--

DROP TABLE IF EXISTS `Agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agency` (
  `AgencyID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `AgencyTypeID` int(2) unsigned NOT NULL,
  `DescriptionES` varchar(100) NOT NULL DEFAULT '',
  `DescriptionEN` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`AgencyID`),
  KEY `AgencyTypeID` (`AgencyTypeID`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`AgencyTypeID`) REFERENCES `AgencyType` (`AgencyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agency`
--

LOCK TABLES `Agency` WRITE;
/*!40000 ALTER TABLE `Agency` DISABLE KEYS */;
INSERT INTO `Agency` VALUES (1,2,'Policía Municipal de Ponce','Ponce Municipal Police');
/*!40000 ALTER TABLE `Agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgencyType`
--

DROP TABLE IF EXISTS `AgencyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgencyType` (
  `AgencyTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(20) NOT NULL DEFAULT '',
  `DescriptionEN` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`AgencyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgencyType`
--

LOCK TABLES `AgencyType` WRITE;
/*!40000 ALTER TABLE `AgencyType` DISABLE KEYS */;
INSERT INTO `AgencyType` VALUES (1,'Policía Estatal','State Police'),(2,'Policía Municipal','Municipal Police');
/*!40000 ALTER TABLE `AgencyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AirbagDeployed`
--

DROP TABLE IF EXISTS `AirbagDeployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AirbagDeployed` (
  `AirbagDeployedID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`AirbagDeployedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AirbagDeployed`
--

LOCK TABLES `AirbagDeployed` WRITE;
/*!40000 ALTER TABLE `AirbagDeployed` DISABLE KEYS */;
INSERT INTO `AirbagDeployed` VALUES (1,'No Aplica','Not Applicable'),(2,'No Abrió Bolsa','Not Deployed'),(3,'Activado – Frente','Deployed - Front'),(4,'Activado – Lado','Deployed - Side'),(5,'Activado – Cortina','Deployed - Curtain'),(6,'Activado – Otro','Deployed - Other (knee, air belt, etc.)'),(7,'Activado – Combinación','Deployed - Combination'),(8,'Desactivado','Not Actived '),(9,'Se Desconoce','Deployment Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `AirbagDeployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlcoholTestResult`
--

DROP TABLE IF EXISTS `AlcoholTestResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlcoholTestResult` (
  `AlcoholTestResultID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(20) DEFAULT NULL,
  `DescriptionEN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AlcoholTestResultID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlcoholTestResult`
--

LOCK TABLES `AlcoholTestResult` WRITE;
/*!40000 ALTER TABLE `AlcoholTestResult` DISABLE KEYS */;
INSERT INTO `AlcoholTestResult` VALUES (1,'Nivel de Alcohol','Value'),(2,'Pendiente','Pending'),(3,'Se Desconoce','Unknown'),(4,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `AlcoholTestResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlcoholTestType`
--

DROP TABLE IF EXISTS `AlcoholTestType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlcoholTestType` (
  `AlcoholTestTypeID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`AlcoholTestTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlcoholTestType`
--

LOCK TABLES `AlcoholTestType` WRITE;
/*!40000 ALTER TABLE `AlcoholTestType` DISABLE KEYS */;
INSERT INTO `AlcoholTestType` VALUES (1,'Sangre','Blood'),(2,'Aliento','Breath'),(3,'Orina','Urine'),(4,'Otro','Other'),(5,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `AlcoholTestType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BaseOfInformation`
--

DROP TABLE IF EXISTS `BaseOfInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BaseOfInformation` (
  `BaseOfInformationID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BaseOfInformationID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BaseOfInformation`
--

LOCK TABLES `BaseOfInformation` WRITE;
/*!40000 ALTER TABLE `BaseOfInformation` DISABLE KEYS */;
INSERT INTO `BaseOfInformation` VALUES (1,'Documento de Embarque','Shipping Document'),(2,'Rotulación del Vehículo','Sign on Vehicle'),(3,'Información del Conductor','Information from Driver'),(4,'Bitácora','Binnacle');
/*!40000 ALTER TABLE `BaseOfInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BodyType`
--

DROP TABLE IF EXISTS `BodyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BodyType` (
  `BodyTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BodyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BodyType`
--

LOCK TABLES `BodyType` WRITE;
/*!40000 ALTER TABLE `BodyType` DISABLE KEYS */;
INSERT INTO `BodyType` VALUES (1,'Auto/Vehículo Pasajero','Passanger Car'),(2,'Camioneta (SUV)','Sports Utility Vehicle (SUV)'),(3,'“Pick-up”','Pick-up Truck'),(4,'Van de Carga','Cargo Van (10,000 lbs GVWR or less)'),(5,'Tractor (Caculo)','Tractor'),(6,'Camión Liviano','Other Light Trucks (10,000 lbs GVWR or Less)'),(7,'Camión','Medium/Heavy Trucks (More the 10,000 lbs GVWR)'),(8,'Transporte Publico','Transit Bus'),(9,'Ómnibus ','Motorcoach'),(10,'Ómnibus Escolar','School Bus'),(11,'Otro Ómnibus','Other Bus'),(12,'Grúa','Tow Truck'),(13,'Motocicleta','Motorcycle'),(14,'Bicicleta','Bicycle'),(15,'Ciclomoto (Vespa)','Moped'),(16,'Máquina Agrícola','Agricultural Equipment'),(17,'Equipo Carretera ó Construcción','Construction/Maintenace Equipment'),(18,'Arrastre','Towing trailer'),(19,'Casa Ambulante','Motor home/Recreational Vehicle'),(20,'Jeep','Jeep'),(21,'“Four track” (ATV)','All Terrain Vehicle (ATV)'),(22,'Vehículo de Baja Velocidad','Low Speed Vehicle'),(23,'Carrito de golf','Golf Cart'),(24,'\"Party Bus\"','Party Bus'),(25,'Equino (Caballo)','Horse'),(26,'Bicicleta con Motor','Motorized Bicycle'),(27,'Patineta con Motor','Motorized Scooter'),(28,'Motonieve','Snowmobile'),(29,'Otro Vehículo','Other Type of Vehicle'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `BodyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CargoBodyType`
--

DROP TABLE IF EXISTS `CargoBodyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CargoBodyType` (
  `CargoBodyTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(95) DEFAULT NULL,
  `DescriptionEN` varchar(95) DEFAULT '',
  PRIMARY KEY (`CargoBodyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CargoBodyType`
--

LOCK TABLES `CargoBodyType` WRITE;
/*!40000 ALTER TABLE `CargoBodyType` DISABLE KEYS */;
INSERT INTO `CargoBodyType` VALUES (1,'Chasis No para Carga (Caculo, Remolcador, Vehículo Pasajero con Material Peligroso, etc.)','No Cargo Body (Bobtail, Light Motor Vehicle with Hazardous Materials [HM] Placard, etc.)'),(2,'Ómnibus/Van (9-15 Ocupantes, Incluye Conductor)','Bus/Van (Seats for 9-15 Occupant, Including Driver)'),(3,'Ómnibus (16 + Pasajeros)','Bus (Seats for More than 15 Occupants, Including Driver)'),(4,'Vagón/Furgón Cerrado/Van','Van/Enclosed Box'),(5,'Tanque Alimentador (Granos, Gravilla, Material Triturado, etc.)','Grain/Chips/Gravel (Feeder Tank)'),(6,'Pole Trailer','Pole-Trailer'),(7,'Tanque de Carga','Cargo Tank'),(8,'Log Trailer','Log'),(9,'Intermodal','Intermodal Container Chassis'),(10,'Grúa/Vehículo Remolcando Otro Vehículo','Towing Truck/Vehicle Towing Vehicle'),(11,'Plataforma','Flatbed'),(12,'Camión de Volteo','Dump'),(13,'Mezcladora de Concreto','Concrete Mixer'),(14,'Transporte de Vehículos','Auto Transporter'),(15,'Transporte de Basura','Garbage/Refuse'),(16,'Otro','Other'),(17,'No Aplica','Not Applicable (Motor Vehicle 10,000 lbs or Less Not Displaying HM Placard)'),(18,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `CargoBodyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `CityID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(100) DEFAULT NULL,
  `DescriptionEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (72,'Puerto Rico','Puerto Rico'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Condition`
--

DROP TABLE IF EXISTS `Condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Condition` (
  `ConditionID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Condition`
--

LOCK TABLES `Condition` WRITE;
/*!40000 ALTER TABLE `Condition` DISABLE KEYS */;
INSERT INTO `Condition` VALUES (1,'Normal','Apparently normal'),(2,'Físicamente incapacitado','Physically impared'),(3,'Conductor inexperto','Inexperienced driver '),(4,'Emocional (Deprimido, Enojado, Perturbado, etc.)','Emotional (depressed, angry, disturbed, etc.)'),(5,'Enfermo o Desmayado','III (sick), fainted'),(6,'Condición médica','Medical condition'),(7,'Soñoliento','Sleepy'),(8,'Fatigado','Fatigued'),(9,'Distraido','Distracted'),(10,'Bajo Influencias de Medicamentos/Drogas/Alcohol','Under the influence of medication/Drugs/Alcohol'),(11,'Otro (Favor de mencionar)','Other'),(12,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Configuration`
--

DROP TABLE IF EXISTS `Configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Configuration` (
  `ConfigurationID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(90) DEFAULT NULL,
  `DescriptionEN` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`ConfigurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Configuration`
--

LOCK TABLES `Configuration` WRITE;
/*!40000 ALTER TABLE `Configuration` DISABLE KEYS */;
INSERT INTO `Configuration` VALUES (1,'Vehículo con 10,000 lbs o Menos con Placa de Material Peligroso','Vehicle with 10,000 lbs. or More Placarded for Hazardous Materials'),(2,'Vehículo Pasajero con Placa de Material Peligroso','Passanger Vehicle Placarded for Hazardous Materials'),(3,'Camioneta/”Pick-up” con Material Peligroso','SUV/Pick-up Vehicle Placarded for Hazardous Materials'),(4,'Camión (2-Ejes y Más de 10,000 lbs)','Single-Unit Truck (2-Axle and GVWR More Than 10,000 lbs)'),(5,'Camión (2-Ejes y 6 o Más Llantas)','Single-Unit Truck (2 Axles and 6 or More Tires)'),(6,'Camión (3-Ejes o Más)','Single-Unit Truck (3 or More Axles)'),(7,'Camión con Remolque(s)','Truck Pulling Trailer'),(8,'Camión Remolcador Solo (Caculo)','Truck Tractor (Bobtail)'),(9,'Remolcador con un Semi-Arrastre','Truck Tractor/Semi-Trailer'),(10,'Remolcador con un Doble ','Truck Tractor/Double'),(11,'Remolcador con Triple ','Truck Tractor/Triple'),(12,'Configuración de Vehículo Desconocido, Más de 10,000 lbs.','Truck More Than 10,000 lbs., Cannot Classify its Configuration'),(13,'Vehículo Comercial (9 a 15 Ocupantes, Incluye Conductor)','Bus/Large Van/Commercial Vehicle (Seats for 9-15 Occupants, Including Driver)'),(14,'Vehículo Comercial (16 o Más Ocupantes, Incluye Conductor)','Bus/Large Van/Commercial Vehicle (Seats for More Than 15 Occupants, Including Driver)'),(15,'Desconocido','Unknown'),(16,'Otro','Other'),(17,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContribActionsCircumstance`
--

DROP TABLE IF EXISTS `ContribActionsCircumstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContribActionsCircumstance` (
  `ContribActionsCircumstanceID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(110) DEFAULT NULL,
  `DescriptionEN` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`ContribActionsCircumstanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContribActionsCircumstance`
--

LOCK TABLES `ContribActionsCircumstance` WRITE;
/*!40000 ALTER TABLE `ContribActionsCircumstance` DISABLE KEYS */;
INSERT INTO `ContribActionsCircumstance` VALUES (1,'Ninguna','None'),(2,'Abandono lugar del choque','Abandoned the crash site'),(3,'Se Salió de la Carretera','Ran off road'),(4,'No ceder el paso','Failed to yield right-of-way'),(5,'Caso Omiso al Semáforo en Rojo','Ran red light'),(6,'Caso Omiso al Semáforo en Amarillo','Ran yellow light'),(7,'Caso Omiso al rotulo de pare','Ran stop sign'),(8,'Caso Omiso a controles de tránsito','Disregarded any traffic control devices'),(9,'Caso Omiso a Otros Controles/Señales de Tránsito','Disregarded other traffic signs/Control devices'),(10,'Caso Omiso a Otras Marcas en el Pavimento','Disregarded other road markings'),(11,'Visión Obstruida','Visual Obstruction(s)'),(12,'Viraje Indebido','Improper turn'),(13,'Retroceso Indebido','Improper backing'),(14,'Pasar Indebidamente','Improper passing'),(15,'Carretera defectuosa','Flawed roadway'),(16,'Condición del conductor','Driver\'s condition'),(17,'Vehículo a la izquierda','Vehicle to the left'),(18,'Violación del peatón','Pedestrian violation'),(19,'Peso/ancho/altura del vehiculo ','Weight/length/height of the vehicle'),(20,'Amarre o pérdida de carga','Mooring or cargo loss'),(21,'Carril Contrario','Wrong way or wrong side'),(22,'No Guardar Distancia','Followed too closely'),(23,'Cambio de Carril Indebido','Improper change of lanes'),(24,'Conductor Agresivo/negligencia temeraria','Operated motor vehicle in reckless or aggressive manner'),(25,'Conductor Desatenta, Descuidada, Negligente o de Manera Errática','Operated motor vehicle in inattentive, careless, negligent, or erratic manner'),(26,'Evitar Objeto/Persona','Avoided objects or non-motorist in roadway'),(27,'Evitar o desvió por condiciones del pavimento/Vehículos','Swerved or avoided due to win, slippery surface, motor vehicle, object, non-motorist in roadway, etc.'),(28,'Defecto mecánico','Mechanical failure'),(29,'Viraje Brusco, Patinó','Over-correcting/over-steering'),(30,'Conductor Fuera de Control','Out-of-control driver'),(31,'Otras Circunstancias','Other contributing actions'),(32,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ContribActionsCircumstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `County`
--

DROP TABLE IF EXISTS `County`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `County` (
  `CountyID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `CityID` int(2) unsigned DEFAULT NULL,
  `DescriptionES` varchar(100) DEFAULT NULL,
  `DescriptionEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CountyID`),
  KEY `CityID` (`CityID`),
  CONSTRAINT `county_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `City` (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `County`
--

LOCK TABLES `County` WRITE;
/*!40000 ALTER TABLE `County` DISABLE KEYS */;
INSERT INTO `County` VALUES (1,72,'Adjuntas','Adjuntas'),(3,72,'Aguada','Aguada'),(5,72,'Aguadilla','Aguadilla'),(7,72,'Aguas Buenas','Aguas Buenas'),(9,72,'Aibonito','Aibonito'),(11,72,'Anasco','Anasco'),(13,72,'Arecibo','Arecibo'),(15,72,'Arroyo','Arroyo'),(17,72,'Barceloneta','Barceloneta'),(19,72,'Barranquitas','Barranquitas'),(21,72,'Bayamon','Bayamon'),(23,72,'Cabo Rojo','Cabo Rojo'),(25,72,'Caguas','Caguas'),(27,72,'Camuy','Camuy'),(29,72,'Canovanas','Canovanas'),(31,72,'Carolina','Carolina'),(33,72,'Catano','Catano'),(35,72,'Cayey','Cayey'),(37,72,'Ceiba','Ceiba'),(39,72,'Ciales','Ciales'),(41,72,'Cidra','Cidra'),(43,72,'Coamo','Coamo'),(45,72,'Comerio','Comerio'),(47,72,'Corozal','Corozal'),(49,72,'Culebra','Culebra'),(51,72,'Dorado','Dorado'),(53,72,'Fajardo','Fajardo'),(54,72,'Florida','Florida'),(55,72,'Guanica','Guanica'),(57,72,'Guayama','Guayama'),(59,72,'Guayanilla','Guayanilla'),(61,72,'Guaynabo','Guaynabo'),(63,72,'Gurabo','Gurabo'),(65,72,'Hatillo','Hatillo'),(67,72,'Hormigueros','Hormigueros'),(69,72,'Humacao','Humacao'),(71,72,'Isabela','Isabela'),(73,72,'Jayuya','Jayuya'),(75,72,'Juana Diaz','Juana Diaz'),(77,72,'Juncos','Juncos'),(79,72,'Lajas','Lajas'),(81,72,'Lares','Lares'),(83,72,'Las Marias','Las Marias'),(85,72,'Las Piedras','Las Piedras'),(87,72,'Loiza','Loiza'),(89,72,'Luquillo','Luquillo'),(91,72,'Manati','Manati'),(93,72,'Maricao','Maricao'),(95,72,'Maunabo','Maunabo'),(97,72,'Mayaguez','Mayaguez'),(99,72,'Moca','Moca'),(101,72,'Morovis','Morovis'),(103,72,'Naguabo','Naguabo'),(105,72,'Naranjito','Naranjito'),(107,72,'Orocovis','Orocovis'),(109,72,'Patillas','Patillas'),(111,72,'Penuelas','Penuelas'),(113,72,'Ponce','Ponce'),(115,72,'Quebradillas','Quebradillas'),(117,72,'Rincon','Rincon'),(119,72,'Rio Grande','Rio Grande'),(121,72,'Sabana Grande','Sabana Grande'),(123,72,'Salinas','Salinas'),(125,72,'San German','San German'),(127,72,'San Juan','San Juan'),(129,72,'San Lorenzo','San Lorenzo'),(131,72,'San Sebastian','San Sebastian'),(133,72,'Santa Isabel','Santa Isabel'),(135,72,'Toa Alta','Toa Alta'),(137,72,'Toa Baja','Toa Baja'),(139,72,'Trujillo Alto','Trujillo Alto'),(141,72,'Utuado','Utuado'),(143,72,'Vega Alta','Vega Alta'),(145,72,'Vega Baja','Vega Baja'),(147,72,'Vieques','Vieques'),(149,72,'Villalba','Villalba'),(151,72,'Yabucoa','Yabucoa'),(153,72,'Yauco','Yauco'),(999,999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `County` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DamagedArea`
--

DROP TABLE IF EXISTS `DamagedArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DamagedArea` (
  `DamagedAreaID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DamagedAreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DamagedArea`
--

LOCK TABLES `DamagedArea` WRITE;
/*!40000 ALTER TABLE `DamagedArea` DISABLE KEYS */;
INSERT INTO `DamagedArea` VALUES (1,'1','1'),(2,'2','2'),(3,'3','3'),(4,'4','4'),(5,'5','5'),(6,'6','6'),(7,'7','7'),(8,'8','8'),(9,'9','9'),(10,'10','10'),(11,'11','11'),(12,'12','12'),(13,'Capota','Top'),(14,'Chasis inferior','Undercarriage'),(15,'Todas las áreas','All areas'),(16,'No daños','No Damage'),(17,'Desconocidos','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DamagedArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direction`
--

DROP TABLE IF EXISTS `Direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Direction` (
  `DirectionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DirectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direction`
--

LOCK TABLES `Direction` WRITE;
/*!40000 ALTER TABLE `Direction` DISABLE KEYS */;
INSERT INTO `Direction` VALUES (1,'Norte','North'),(2,'Este','East'),(3,'Sur','South'),(4,'Oeste','West'),(5,'Noreste','Northeast'),(6,'Noroeste','Northwest'),(7,'Sureste','Southeast'),(8,'Suroeste','Southwest'),(97,'No Aplica','Not Applicable'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DirectionOfTravel`
--

DROP TABLE IF EXISTS `DirectionOfTravel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DirectionOfTravel` (
  `DirectionOfTravelID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(25) DEFAULT NULL,
  `DescriptionEN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`DirectionOfTravelID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectionOfTravel`
--

LOCK TABLES `DirectionOfTravel` WRITE;
/*!40000 ALTER TABLE `DirectionOfTravel` DISABLE KEYS */;
INSERT INTO `DirectionOfTravel` VALUES (1,'Hacia el Norte','Northbound'),(2,'Hacia el Sur','Southbound'),(3,'Hacia el Este','Eastbound'),(4,'Hacia el Oeste','Westbound'),(5,'Fuera de la carretera','Not on roadway'),(6,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DirectionOfTravel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistractedBy`
--

DROP TABLE IF EXISTS `DistractedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistractedBy` (
  `DistractedByID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(100) DEFAULT NULL,
  `DescriptionEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DistractedByID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistractedBy`
--

LOCK TABLES `DistractedBy` WRITE;
/*!40000 ALTER TABLE `DistractedBy` DISABLE KEYS */;
INSERT INTO `DistractedBy` VALUES (1,'Operando Manualmente Algún Dispositivo Electrónico de Comunicación (Realizando Llamadas, Textiando, ','Manually Operating an Electronic Communication Device (Texting, Typing, Dialing, DVD, GPS)'),(2,'Hablando por Celular Utilizando Equipo “Hands-free”','Talking on Hands-Free Electronic Device'),(3,'Hablando por Celular Sin Equipo “Hands-free”','Talking on Hand-Held Electronic Device'),(4,'Otra Actividad con Dispositivos Electrónicos','Other Activity, Electronic Device'),(5,'Pasajero','Passanger'),(6,'Otra Distracción Dentro de Vehículo (Comiendo, Mascota, etc.)','Other Inside the Vehicle (Eating, Personal Hygiene, Pet, etc.)'),(7,'Distracción Fuera del Vehículo (Mencionar la Distracción)','Outside the Vehicle (Includes Unspecified External Distraction)'),(8,'Desconocido','Unknown'),(10,'No Distraído','Not Distracted'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DistractedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DriverIsAuthorized`
--

DROP TABLE IF EXISTS `DriverIsAuthorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DriverIsAuthorized` (
  `DriverIsAuthorizedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DriverIsAuthorizedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DriverIsAuthorized`
--

LOCK TABLES `DriverIsAuthorized` WRITE;
/*!40000 ALTER TABLE `DriverIsAuthorized` DISABLE KEYS */;
INSERT INTO `DriverIsAuthorized` VALUES (1,'Sí','Yes'),(2,'No','No'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DriverIsAuthorized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DriverLicenseType`
--

DROP TABLE IF EXISTS `DriverLicenseType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DriverLicenseType` (
  `DriverLicenseTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DriverLicenseTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DriverLicenseType`
--

LOCK TABLES `DriverLicenseType` WRITE;
/*!40000 ALTER TABLE `DriverLicenseType` DISABLE KEYS */;
INSERT INTO `DriverLicenseType` VALUES (1,'Aprendizaje','Learner\'s Permit'),(2,'Aprendizaje Motociclista','Learner\'s Permit Motorcycle'),(3,'Conductor','Conductor'),(4,'Chofer','Chofer'),(5,'Vehículo Pesado Tipo 1','Class A'),(6,'Vehículo Pesado Tipo 2','Class B'),(7,'Vehículo Pesado Tipo 3','Class C'),(8,'Tractor/Remolcador/Grúa','Tractor/Tow Truck'),(9,'Conductor Motociclista','Motorcyclist'),(10,'Ninguna','None'),(11,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DriverLicenseType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DrugTestResult`
--

DROP TABLE IF EXISTS `DrugTestResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugTestResult` (
  `DrugTestResultID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DrugTestResultID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DrugTestResult`
--

LOCK TABLES `DrugTestResult` WRITE;
/*!40000 ALTER TABLE `DrugTestResult` DISABLE KEYS */;
INSERT INTO `DrugTestResult` VALUES (1,'Positivo','Positive'),(2,'Negativo','Negative'),(3,'Se Desconoce','Unknown '),(4,'Pendiente','Pending'),(5,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DrugTestResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DrugTestType`
--

DROP TABLE IF EXISTS `DrugTestType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrugTestType` (
  `DrugTestTypeID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`DrugTestTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DrugTestType`
--

LOCK TABLES `DrugTestType` WRITE;
/*!40000 ALTER TABLE `DrugTestType` DISABLE KEYS */;
INSERT INTO `DrugTestType` VALUES (1,'Sangre','Blood'),(2,'Orina','Urine'),(3,'Otro','Other'),(4,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `DrugTestType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejection`
--

DROP TABLE IF EXISTS `Ejection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ejection` (
  `EjectionID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(20) DEFAULT NULL,
  `DescriptionEN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EjectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejection`
--

LOCK TABLES `Ejection` WRITE;
/*!40000 ALTER TABLE `Ejection` DISABLE KEYS */;
INSERT INTO `Ejection` VALUES (1,'Atrapado','Trapped in vehicle'),(2,'Parcial','Ejected, Partially'),(3,'Completa','Ejected, Totally'),(4,'No Aplica','Not Applicable'),(5,'Desconocido','Unknown'),(6,'Ninguna','None'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Ejection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmergencyUse`
--

DROP TABLE IF EXISTS `EmergencyUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmergencyUse` (
  `EmergencyUseID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(70) DEFAULT NULL,
  `DescriptionEN` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`EmergencyUseID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyUse`
--

LOCK TABLES `EmergencyUse` WRITE;
/*!40000 ALTER TABLE `EmergencyUse` DISABLE KEYS */;
INSERT INTO `EmergencyUse` VALUES (1,'No aplica','Not applicable'),(2,'No de transporte ni emergencia','Non-Emergency, Non-transport'),(3,'De transporte no de emergencia','Non-Emergency transport'),(4,'Operación de emergencia sin uso de avisos de equipo de emergencia','Emergency operation, Emergency Warning Equipment Not in Use'),(5,'Operación de emergencia con uso de avisos de equipo de emergencia','Emergency operation, Emergency Warning Equipment in Use'),(6,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `EmergencyUse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnvironmentCondition`
--

DROP TABLE IF EXISTS `EnvironmentCondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnvironmentCondition` (
  `EnvironmentConditionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`EnvironmentConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnvironmentCondition`
--

LOCK TABLES `EnvironmentCondition` WRITE;
/*!40000 ALTER TABLE `EnvironmentCondition` DISABLE KEYS */;
INSERT INTO `EnvironmentCondition` VALUES (1,'Ninguna','None '),(2,'Condiciones Climáticas','Weather Conditions '),(3,'Cegado por Luces','Blinded By Opposite Vehicle Lighting '),(4,'Cegado del Sol','Blinded By Direct Sunlight'),(5,'Visión No Obstruida','No Visual Obstruction'),(6,'Animal(es) en la Carretera','Animal(s) in Roadway '),(7,'Edificios','Buildings'),(8,'Árbol','Tree'),(9,'Resplandor en la Superficie/Cristal','Glare'),(10,'Colinas, Loma o Talud','Slope or Hill'),(11,'Vehículos','Vehicles'),(12,'Curva en la Carretera','Curve on the Roadway'),(96,'Otra Obstrucción Visual','Other Visual Obstruction'),(97,'Otro Condición Ambiental','Other Environmental Condition'),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `EnvironmentCondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExtentOfDamage`
--

DROP TABLE IF EXISTS `ExtentOfDamage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExtentOfDamage` (
  `ExtentOfDamageID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(20) DEFAULT NULL,
  `DescriptionEN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ExtentOfDamageID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExtentOfDamage`
--

LOCK TABLES `ExtentOfDamage` WRITE;
/*!40000 ALTER TABLE `ExtentOfDamage` DISABLE KEYS */;
INSERT INTO `ExtentOfDamage` VALUES (1,'No daños','No Damage'),(2,'Daños menores','Minor Damage'),(3,'Daño funcional','Functional Damage'),(4,'Daño incapacitante','Disabling Damage'),(5,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ExtentOfDamage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Extrication`
--

DROP TABLE IF EXISTS `Extrication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Extrication` (
  `ExtricationID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ExtricationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Extrication`
--

LOCK TABLES `Extrication` WRITE;
/*!40000 ALTER TABLE `Extrication` DISABLE KEYS */;
INSERT INTO `Extrication` VALUES (1,'No aplica','Not Applicable'),(2,'Extraído','Extracted'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Extrication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GVWRGCWR`
--

DROP TABLE IF EXISTS `GVWRGCWR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GVWRGCWR` (
  `GVWRGCWRID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GVWRGCWRID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GVWRGCWR`
--

LOCK TABLES `GVWRGCWR` WRITE;
/*!40000 ALTER TABLE `GVWRGCWR` DISABLE KEYS */;
INSERT INTO `GVWRGCWR` VALUES (1,'10,000 lbs o Menos','10,000 lbs or Less'),(2,'10,001 lbs a 26,000 lbs','10,001 lbs to 26,000 lbs'),(3,'Más de 26,001 lbs','More than 26,001 lbs'),(4,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `GVWRGCWR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HarmfulEvent`
--

DROP TABLE IF EXISTS `HarmfulEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HarmfulEvent` (
  `HarmfulEventID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `HarmfulEventCatID` int(1) unsigned NOT NULL,
  `DescriptionES` varchar(150) DEFAULT NULL,
  `DescriptionEN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`HarmfulEventID`),
  KEY `HarmfulEventCatID` (`HarmfulEventCatID`),
  CONSTRAINT `HarmfulEvent_ibfk_1` FOREIGN KEY (`HarmfulEventCatID`) REFERENCES `HarmfulEventCategory` (`HarmfulEventCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HarmfulEvent`
--

LOCK TABLES `HarmfulEvent` WRITE;
/*!40000 ALTER TABLE `HarmfulEvent` DISABLE KEYS */;
INSERT INTO `HarmfulEvent` VALUES (1,1,'Caída de Carga','Cargo/Equipment Loss or Shift '),(2,1,'Caída de Persona','Fell/Jumped from Motor Vehicle '),(3,1,'Derrame','Spilled Material'),(4,1,'Derrumbe','Land Slide'),(5,1,'Fuego/Explosión','Fire / Explosion '),(6,1,'Herido en Vehículo','Injured in Vehicle'),(7,1,'Inhalación de Gas','Gas Inhalation'),(8,1,'Inmersión (Agua), Completa o Parcial','Immersion, Full or Partial '),(9,1,'\"Jackknife\"','Jackknife '),(10,1,'Superficie Irregular','Irregular Surface'),(11,1,'Vagón Virado','Wagon/Trailer Hauling'),(12,1,'Vuelco','Overturn/Rollover '),(13,1,'Vuelco Motorcicleta','Overturn/Rollover Motorcycle'),(14,1,'Otro Sin Colisión ','Other Non-Collision '),(15,2,'Peatón','Pedestrian '),(16,2,'Ciclista','Pedalcycle '),(17,2,'Motociclista','Motorcyclist'),(18,2,'Otro No-Motorizado','Other Non-motorist '),(19,2,'Vehículo Tren','Railway Vehicle (Train, Engine) '),(20,2,'Animal (No Caballo)','Animal (Not a Horse) '),(21,2,'Caballo','Horse'),(22,2,'Vehículos (2)','Two Motor Vehicles in Transport'),(23,2,'Vehículos (3 o más)','Three or More Motor Vehicles in Transport'),(24,2,'\"Hit & Run\" ','Hit & Run '),(25,2,'\"Hit & Run\" Peatón','Hit & Run Pedestrian'),(26,2,'\"Hit & Run\" Ciclista','Hit & Run Pedalcyclist'),(27,2,'Vehículo Estacionado','Parked Motor Vehicle '),(28,2,'Vehículo Todoterreno (ATV)','All Terrain Vehicle (ATV)'),(29,2,'Equipo Agrícola','Agricultural Equipment'),(30,2,'Equipo de Construcción/Mantenimiento','Work Zone/Maintenance Equipment '),(31,2,'Objetos que Caen','Struck by Falling, Shifting Cargo or Anything Set in Motion by Motor Vehicle '),(32,2,'Otro Objeto No-Fijo ','Other Non-Fixed Object '),(33,3,'Atenuador de Impacto','Impact Attenuator/Crash Cushion '),(34,3,'Puente (Estructura)','Bridge Overhead Structure '),(35,3,'Puente (Soportes)','Bridge Pier or Support '),(36,3,'Puente (Baranda)','Bridge Rail '),(37,3,'Barrera de Cable','Cable Barrier '),(38,3,'Reg. Alcantarillado','Culvert '),(39,3,'Encintado','Curb '),(40,3,'Cuneta','Ditch '),(41,3,'Talud','Embankment '),(42,3,'Barrera Metal','Guardrail Face '),(43,3,'Terminal Barrera','Guardrail End '),(44,3,'Barrera de Hormigón','Concrete Traffic Barrier '),(45,3,'Otro Barrera de Trafico','Other Traffic Barrier '),(46,3,'Árbol','Tree (Standing) '),(47,3,'Postes','Utility Pole/Light Support '),(48,3,'Rótulo Tránsito','Traffic Sign Support '),(49,3,'Soporte del Semaforo','Traffic Signal Support '),(50,3,'Otro Poste o Soporte','Other Post, Pole or Support '),(51,3,'Verja','Fence '),(52,3,'Buzón Correo','Mailbox '),(53,3,'Otro Objeto Fijo','Other Fixed Object (Wall, Tunnel, etc.) '),(54,3,'Motora Objeto Fijo','Motorized Fixed Object'),(55,3,'Drones','Barrels or Trashcan'),(56,3,'Boca incendio','Fire Hydrant'),(57,3,'Edificio','Building'),(58,4,'Hoyo','Hole '),(59,4,'Falla Mecánica','Mechanical Failure'),(60,4,'Separación Vagón o Arrastre','Wagon/Trailer Separation'),(61,4,'Se Salió de la Carretera','Ran-Off Roadway'),(62,4,'Cruzó Mediana','Crossed Median'),(63,4,'Cuesta Sin Freno','Downhill with No Brakes'),(64,4,'Golpe de Objeto en Movimiento','Thrown or Falling Object '),(65,4,'Acumulación de Agua','Puddle, Water Accumulation'),(99,4,'Desconocido','Unknown '),(999,999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `HarmfulEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HarmfulEventCategory`
--

DROP TABLE IF EXISTS `HarmfulEventCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HarmfulEventCategory` (
  `HarmfulEventCatID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(150) DEFAULT NULL,
  `DescriptionEN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`HarmfulEventCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HarmfulEventCategory`
--

LOCK TABLES `HarmfulEventCategory` WRITE;
/*!40000 ALTER TABLE `HarmfulEventCategory` DISABLE KEYS */;
INSERT INTO `HarmfulEventCategory` VALUES (1,'Sin Colisión','Non-Collision'),(2,'Colisión con Peatón, Vehículo de Motor o Objetos No-Fijos','Collision with Person, Motor Vehicle, or Non-Fixed Object'),(3,'Colisión con Objeto Fijo','Collision with Fixed Object'),(4,'Otros Eventos','Other Events'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `HarmfulEventCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HazMatInvolved`
--

DROP TABLE IF EXISTS `HazMatInvolved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HazMatInvolved` (
  `HazMatInvolvedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`HazMatInvolvedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HazMatInvolved`
--

LOCK TABLES `HazMatInvolved` WRITE;
/*!40000 ALTER TABLE `HazMatInvolved` DISABLE KEYS */;
INSERT INTO `HazMatInvolved` VALUES (1,'Si','Yes'),(2,'No','No'),(3,'No Aplica','Not applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `HazMatInvolved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HazMatReleased`
--

DROP TABLE IF EXISTS `HazMatReleased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HazMatReleased` (
  `HazMatReleasedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`HazMatReleasedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HazMatReleased`
--

LOCK TABLES `HazMatReleased` WRITE;
/*!40000 ALTER TABLE `HazMatReleased` DISABLE KEYS */;
INSERT INTO `HazMatReleased` VALUES (1,'Si','Yes'),(2,'No','No'),(3,'No aplica','Not applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `HazMatReleased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HelmetUse`
--

DROP TABLE IF EXISTS `HelmetUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HelmetUse` (
  `HelmetUseID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(55) DEFAULT NULL,
  `DescriptionEN` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`HelmetUseID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HelmetUse`
--

LOCK TABLES `HelmetUse` WRITE;
/*!40000 ALTER TABLE `HelmetUse` DISABLE KEYS */;
INSERT INTO `HelmetUse` VALUES (1,'Casco Certificado por DOT','DOT - Compliant Motorcycle Helmet'),(2,'Casco, No Certificado por DOT','Helmet, Other than DOT-Compliant Motorcycle Helmet'),(3,'Casco, Se Desconoce si es Certificado por DOT','Helmet, Unknown if DOT-Compliant'),(4,'No Uso Casco','No Helmet'),(5,'Se Desconoce el Uso de Casco','Unknown if Helmet Worn'),(999,'VACIO','EMPTY'),(1000,'No Aplica','Does Not Apply');
/*!40000 ALTER TABLE `HelmetUse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HitAndRun`
--

DROP TABLE IF EXISTS `HitAndRun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HitAndRun` (
  `HitAndRunID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`HitAndRunID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HitAndRun`
--

LOCK TABLES `HitAndRun` WRITE;
/*!40000 ALTER TABLE `HitAndRun` DISABLE KEYS */;
INSERT INTO `HitAndRun` VALUES (1,'No','No'),(2,'Si','Yes'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `HitAndRun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InitialContactPoint`
--

DROP TABLE IF EXISTS `InitialContactPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InitialContactPoint` (
  `InitialContactPointID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`InitialContactPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InitialContactPoint`
--

LOCK TABLES `InitialContactPoint` WRITE;
/*!40000 ALTER TABLE `InitialContactPoint` DISABLE KEYS */;
INSERT INTO `InitialContactPoint` VALUES (1,'Sin colisión','Non-collision'),(2,'1','1'),(3,'2','2'),(4,'3','3'),(5,'4','4'),(6,'5','5'),(7,'6','6'),(8,'7','7'),(9,'8','8'),(10,'9','9'),(11,'10','10'),(12,'11','11'),(13,'12','12'),(14,'Capota','Top'),(15,'Chasis inferior','Undercarriage'),(16,'Perdida de carga','Cargo loss'),(17,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `InitialContactPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InspectionUpToDate`
--

DROP TABLE IF EXISTS `InspectionUpToDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InspectionUpToDate` (
  `InspectionUpToDateID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`InspectionUpToDateID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InspectionUpToDate`
--

LOCK TABLES `InspectionUpToDate` WRITE;
/*!40000 ALTER TABLE `InspectionUpToDate` DISABLE KEYS */;
INSERT INTO `InspectionUpToDate` VALUES (1,'Sí','Yes'),(2,'No','No'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `InspectionUpToDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IntersectionType`
--

DROP TABLE IF EXISTS `IntersectionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IntersectionType` (
  `IntersectionTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IntersectionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IntersectionType`
--

LOCK TABLES `IntersectionType` WRITE;
/*!40000 ALTER TABLE `IntersectionType` DISABLE KEYS */;
INSERT INTO `IntersectionType` VALUES (1,'No es una Intersección','Not an Intersection '),(2,'Intersección de Cuatro Vías de Acceso','Four-Way Intersection '),(3,'Intersección en T','T-Intersection '),(4,'Intersección en Y','Y-Intersection '),(5,'Intersección en L','L-Intersection '),(6,'Intersección Circular','Traffic Circle '),(7,'Intersección de Rampa','Ramp Intersection'),(8,'Rotonda','Roundabout '),(9,'Cinco o más Accesos','Five-Point, or More '),(99,'Desconocida','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `IntersectionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Junction`
--

DROP TABLE IF EXISTS `Junction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Junction` (
  `JunctionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(100) DEFAULT NULL,
  `DescriptionEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JunctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Junction`
--

LOCK TABLES `Junction` WRITE;
/*!40000 ALTER TABLE `Junction` DISABLE KEYS */;
INSERT INTO `Junction` VALUES (1,'No en intersección','Non-Junction '),(2,'Dentro de intersección','Intersection '),(3,'Relacionado a intersección','Intersection-Related '),(4,'Rampa de expreso (entrada/salida)','Entrance / Exit Ramp '),(5,'Relacionada con rampa de acceso','Entrance / Exit Ramp-Related '),(6,'En un acceso ','Driveway Access '),(7,'Relacionado a un acceso','Driveway Access-Related '),(8,'En \"Crossover\"','Crossover-Related '),(9,'Carril de ciclista','Bicycle Lane'),(10,'Carril de solo a la izquierda','Protected Left Lane'),(11,'Carril de solo a la derecha','Protected Right Lane'),(12,'Carril entre rampa','Gore'),(13,'Marginal','Frontage Roadway'),(14,'Paso a nivel de ferrocarril','Railway Grade Crossing '),(15,'Camino o sendero compartido','Shared-Use Path or Trail '),(16,'Carril de aceleración','Acceleration Lane '),(17,'Carril de deceleración','Deceleration Lane'),(18,'A través de la carretera','Through Roadway '),(97,'Otro Relacionado','Other Location Not Listed Above Within an Interchange Area (median, shoulder and roadside) '),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Junction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LawEnforcementPresent`
--

DROP TABLE IF EXISTS `LawEnforcementPresent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LawEnforcementPresent` (
  `LawEnforcementPresentID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LawEnforcementPresentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LawEnforcementPresent`
--

LOCK TABLES `LawEnforcementPresent` WRITE;
/*!40000 ALTER TABLE `LawEnforcementPresent` DISABLE KEYS */;
INSERT INTO `LawEnforcementPresent` VALUES (1,'No ','No '),(2,'Oficial o Agente Presente','Officer Present '),(3,'Vehículo de la Policía Solamente Presente','Law Enforcement Vehicle Only Present '),(97,'No Aplica','Does Not Apply'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `LawEnforcementPresent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lighting`
--

DROP TABLE IF EXISTS `Lighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lighting` (
  `LightingID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(35) DEFAULT NULL,
  `DescriptionEN` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`LightingID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lighting`
--

LOCK TABLES `Lighting` WRITE;
/*!40000 ALTER TABLE `Lighting` DISABLE KEYS */;
INSERT INTO `Lighting` VALUES (1,'De Día','Daylight '),(2,'Amanecer','Dawn '),(3,'Atardecer','Dusk '),(4,'Oscuro no alumbrado','Dark- Lighted '),(5,'Oscuro alumbrado','Dark- Not Lighted '),(6,'Oscuro, desconoce alumbrado','Dark Unknown Lighting'),(97,'Otro','Other '),(99,'Desconocido ','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Lighting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `LocationID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Camino del Tráfico, en la Carretera','Trafficway, On Road'),(2,'Camino del Tráfico, Fuera de la Carretera','Trafficway, Not on Road'),(3,'Fuera del Camino del Tráfico','Non-trafficway'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MannerOfCollision`
--

DROP TABLE IF EXISTS `MannerOfCollision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MannerOfCollision` (
  `MannerOfCollisionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(75) DEFAULT NULL,
  `DescriptionEN` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`MannerOfCollisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MannerOfCollision`
--

LOCK TABLES `MannerOfCollision` WRITE;
/*!40000 ALTER TABLE `MannerOfCollision` DISABLE KEYS */;
INSERT INTO `MannerOfCollision` VALUES (1,'No húbo colisión','Not a Collision with a Motor Vehicle in-Transport'),(2,'Delantera con posterior','Front-to-Rear'),(3,'Delantero con delantero','Front-to-Front'),(4,'En ángulo','Angle'),(5,'Misma dirección- Lateral','Sideswipe-Same Direction'),(6,'Dirección opuesta - Lateral','Sideswipe-Opposite Direction'),(7,'Posterior con lateral','Rear-to-Side'),(8,'Posterior con trasera','Rear-to-Rear'),(97,'Otro','Other'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `MannerOfCollision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Measurement`
--

DROP TABLE IF EXISTS `Measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Measurement` (
  `MeasurementID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MeasurementID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Measurement`
--

LOCK TABLES `Measurement` WRITE;
/*!40000 ALTER TABLE `Measurement` DISABLE KEYS */;
INSERT INTO `Measurement` VALUES (1,'Pies','Feet'),(2,'Millas','Miles'),(3,'Kilometros','Kilometers'),(4,'En la Intersección','At Junction'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MotorCarrierType`
--

DROP TABLE IF EXISTS `MotorCarrierType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MotorCarrierType` (
  `MotorCarrierTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MotorCarrierTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MotorCarrierType`
--

LOCK TABLES `MotorCarrierType` WRITE;
/*!40000 ALTER TABLE `MotorCarrierType` DISABLE KEYS */;
INSERT INTO `MotorCarrierType` VALUES (1,'Portador de un Estado a Otro','Interstate Carrier'),(2,'Portador Dentro del Mismo Estado','Intrastate Carrier'),(3,'Gobierno, No en Uso Comercial','Not in Commerce/Government'),(4,'Otro Camion, No en UsoComercial','Not in Commerce/Other Truck'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `MotorCarrierType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NearTo`
--

DROP TABLE IF EXISTS `NearTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NearTo` (
  `NearToID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NearToID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NearTo`
--

LOCK TABLES `NearTo` WRITE;
/*!40000 ALTER TABLE `NearTo` DISABLE KEYS */;
INSERT INTO `NearTo` VALUES (1,'Intersección','Junction'),(2,'Calle','Street'),(3,'Puente','Bridge'),(4,'Otro','Other'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `NearTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NonMotoristLocation`
--

DROP TABLE IF EXISTS `NonMotoristLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NonMotoristLocation` (
  `NonMotoristLocationID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NonMotoristLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NonMotoristLocation`
--

LOCK TABLES `NonMotoristLocation` WRITE;
/*!40000 ALTER TABLE `NonMotoristLocation` DISABLE KEYS */;
INSERT INTO `NonMotoristLocation` VALUES (1,'Cruce peatonal en intersección','Intersection - Marked crosswalk'),(2,'Cruce peatonal en intersección no marcado','Intersection - Unmarked crosswalk'),(3,'Intersección fuera de cruce','Intersection - Away from crosswalk'),(4,'Intersección – Otro','Intersection - Other'),(5,'Cruce fuera de intersección ','Crosswalk away from intersection'),(6,'Cruce en zona escolar','Crosswalk within school zone'),(7,'Cruce Peatonal al Centro del Bloque','Midblock - Marked crosswalk'),(8,'Carril del Tránsito – Otro Lugar','Travel lane - Other Location'),(9,'Carril de Bicicletas','Bicycle lane'),(10,'Paseo/Borde de la Carretera','Shoulder/Roadside'),(11,'Acera','Sidewalk'),(12,'Mediana/Isleta como refugio peatonal','Median/Crossing island'),(13,'Entrada de Acceso','Driveway access'),(14,'Camino con dirección compartida','Shared-use path or trail'),(15,'Área no transitada','Non-trafficway area'),(16,'Otro','Other'),(17,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `NonMotoristLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Officer`
--

DROP TABLE IF EXISTS `Officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Officer` (
  `OfficerID` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `AgencyID` int(4) unsigned NOT NULL,
  `PlateNumber` int(5) NOT NULL,
  `FirstName` varchar(35) NOT NULL DEFAULT '',
  `LastName` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`OfficerID`),
  KEY `AgencyID` (`AgencyID`),
  CONSTRAINT `Officer_ibfk_1` FOREIGN KEY (`AgencyID`) REFERENCES `Agency` (`AgencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Officer`
--

LOCK TABLES `Officer` WRITE;
/*!40000 ALTER TABLE `Officer` DISABLE KEYS */;
INSERT INTO `Officer` VALUES (1,1,500,'Omar','Soto Fortuño'),(2,1,7,'Ivette','Cruzado'),(3,1,939,'José','González');
/*!40000 ALTER TABLE `Officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganDonor`
--

DROP TABLE IF EXISTS `OrganDonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganDonor` (
  `OrganDonorID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrganDonorID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganDonor`
--

LOCK TABLES `OrganDonor` WRITE;
/*!40000 ALTER TABLE `OrganDonor` DISABLE KEYS */;
INSERT INTO `OrganDonor` VALUES (1,'Sí','Yes'),(2,'No','No'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `OrganDonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonType`
--

DROP TABLE IF EXISTS `PersonType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonType` (
  `PersonTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `PersonTypeCategoryID` int(2) unsigned NOT NULL,
  `DescriptionES` varchar(125) DEFAULT NULL,
  `DescriptionEN` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`PersonTypeID`),
  KEY `PersonTypeCategoryID` (`PersonTypeCategoryID`),
  CONSTRAINT `PersonType_ibfk_1` FOREIGN KEY (`PersonTypeCategoryID`) REFERENCES `PersonTypeCategory` (`PersonTypeCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonType`
--

LOCK TABLES `PersonType` WRITE;
/*!40000 ALTER TABLE `PersonType` DISABLE KEYS */;
INSERT INTO `PersonType` VALUES (1,1,'Conductor','Driver'),(2,1,'Pasajero','Passenger'),(3,2,'Peaton','Pedestrian'),(4,2,'Ciclista','Bicyclist'),(5,2,'Otro Tipo de Ciclista','Other Cyclist'),(6,1,'Desconocido','Unknown'),(7,2,'Otro Tipo de Peatón (en Silla de Ruedas, Persona en Edificio, en Patineta/Patines, Transporte Personal, etc.)','Other Pedestrian (Wheelchair, Person in a Building, Skater,Pedestrian Conveyance)'),(8,2,'Ocupante Dentro del Vehículo No en Movimiento (Estacionado, etc.)','Occupant of Motor Vehicle Not in Transport (Parked, etc.)'),(9,2,'Ocupante de un Vehículo Sin Motor en Uso como Dispositivo de Transporte','Occupant of a Non-Motor Vehicle Transportation Device'),(10,2,'Desconocido el tipo de no en vehículo de motor','Unknown Type of Non-Motorist'),(11,2,'Testigo','Witness'),(12,2,'Jinete','Horseback Rider'),(999,999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `PersonType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonTypeCategory`
--

DROP TABLE IF EXISTS `PersonTypeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonTypeCategory` (
  `PersonTypeCategoryID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PersonTypeCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonTypeCategory`
--

LOCK TABLES `PersonTypeCategory` WRITE;
/*!40000 ALTER TABLE `PersonTypeCategory` DISABLE KEYS */;
INSERT INTO `PersonTypeCategory` VALUES (1,'Vehículo de Motor','Motorist'),(2,'No en Vehículo de Motor en Transporte','Non-Motorist'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `PersonTypeCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlacardDisplayed`
--

DROP TABLE IF EXISTS `PlacardDisplayed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlacardDisplayed` (
  `PlacardDisplayedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PlacardDisplayedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlacardDisplayed`
--

LOCK TABLES `PlacardDisplayed` WRITE;
/*!40000 ALTER TABLE `PlacardDisplayed` DISABLE KEYS */;
INSERT INTO `PlacardDisplayed` VALUES (1,'1    Explosivo','1    Explosive'),(2,'2    Gas','2    Gas'),(3,'2.3 Gas Venenoso','2.3 Poisonous Gas'),(4,'3    Combustible','3    Combustible'),(5,'4    Solido Inflamable','4    Flammable Solids'),(6,'5    Oxidantes/Peróxido','5    Oxidants/Peroxides'),(7,'6    Veneno','6    Poison'),(8,'7    Material Radioactivo','7    Radioactive Material'),(9,'8    Material Corrosivo','8    Corrosive Material'),(10,'9    Misceláneo','9    Miscellaneous'),(11,'Otro','Other'),(12,'Ninguno','None'),(13,'No Aplica (no tiene rotulo)','Not applicable (vehicle with no placard)'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `PlacardDisplayed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostedSpeed`
--

DROP TABLE IF EXISTS `PostedSpeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostedSpeed` (
  `PostedSpeedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(55) DEFAULT NULL,
  `DescriptionEN` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`PostedSpeedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostedSpeed`
--

LOCK TABLES `PostedSpeed` WRITE;
/*!40000 ALTER TABLE `PostedSpeed` DISABLE KEYS */;
INSERT INTO `PostedSpeed` VALUES (1,'Valor de la Velocidad Límite/Velocidad del Vehículo','Posted/Statutory Value (miles per hour)'),(2,'No Aplica','Not applicable'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `PostedSpeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Property`
--

DROP TABLE IF EXISTS `Property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Property` (
  `PropertyID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PropertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Property`
--

LOCK TABLES `Property` WRITE;
/*!40000 ALTER TABLE `Property` DISABLE KEYS */;
INSERT INTO `Property` VALUES (1,'Propiedad Privada','Private Property'),(2,'Propiedad Pública','Public Property'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelativeToTrafficway`
--

DROP TABLE IF EXISTS `RelativeToTrafficway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelativeToTrafficway` (
  `RelToTrafficwayID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(150) DEFAULT NULL,
  `DescriptionEN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`RelToTrafficwayID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelativeToTrafficway`
--

LOCK TABLES `RelativeToTrafficway` WRITE;
/*!40000 ALTER TABLE `RelativeToTrafficway` DISABLE KEYS */;
INSERT INTO `RelativeToTrafficway` VALUES (1,'En la carretera','On Roadway '),(2,'Paseo','Shoulder '),(3,'Mediana','Median '),(4,'Fuera del paseo','Roadside '),(5,'Separador de calles','Separator '),(6,'Zona/Área de estacionamiento','In Parking Lane or Zone '),(7,'Zona de Confluencia','Gore '),(8,'Fuera de la carretera','Off-Roadway Location Unknown '),(9,'Fuera del derecho de paso','Outside Right-of-Way (trafficway) '),(10,'Puente','Bridge'),(11,'Isleta central de concreto','Central Concrete Island'),(12,'Isleta a la derecha de concreto','Concrete Island on the Right'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RelativeToTrafficway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `ReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportTypeID` int(2) unsigned NOT NULL,
  `CaseNumber` varchar(100) DEFAULT NULL,
  `OfficerUserID` int(7) unsigned NOT NULL,
  `CrashDate` date DEFAULT NULL,
  `CrashTime` time DEFAULT NULL,
  `PropertyID` int(2) unsigned NOT NULL,
  `LocationID` int(2) unsigned NOT NULL,
  `ZoneTypeID` int(2) unsigned NOT NULL,
  `CreatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReportID`),
  KEY `ReportTypeID` (`ReportTypeID`),
  KEY `OfficerUserID` (`OfficerUserID`),
  KEY `PropertyID` (`PropertyID`),
  KEY `LocationID` (`LocationID`),
  KEY `ZoneTypeID` (`ZoneTypeID`),
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`ReportTypeID`) REFERENCES `ReportType` (`ReportTypeID`),
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`OfficerUserID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`PropertyID`) REFERENCES `Property` (`PropertyID`),
  CONSTRAINT `Report_ibfk_4` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`),
  CONSTRAINT `Report_ibfk_5` FOREIGN KEY (`ZoneTypeID`) REFERENCES `ZoneType` (`ZoneTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportCondition`
--

DROP TABLE IF EXISTS `ReportCondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportCondition` (
  `ReportConditionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportID` int(11) DEFAULT NULL,
  `FirstHarmfulEventTypeID` int(1) DEFAULT NULL,
  `FirstHarmfulEventID` int(2) DEFAULT NULL,
  `RelToTrafficwayID` int(2) DEFAULT NULL,
  `MannerOfCollisionID` int(2) DEFAULT NULL,
  `Narrative` text,
  PRIMARY KEY (`ReportConditionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportCondition`
--

LOCK TABLES `ReportCondition` WRITE;
/*!40000 ALTER TABLE `ReportCondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportCondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportInvolvedUnit`
--

DROP TABLE IF EXISTS `ReportInvolvedUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportInvolvedUnit` (
  `ReportInvolvedUnitID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportID` int(11) unsigned NOT NULL,
  `VehicleQuantity` int(2) DEFAULT NULL,
  `MotoristQuantity` int(2) DEFAULT NULL,
  `PedestrianQuantity` int(2) DEFAULT NULL,
  `InjuredQuantity` int(2) DEFAULT NULL,
  `FatalitiesQuantity` int(2) DEFAULT NULL,
  PRIMARY KEY (`ReportInvolvedUnitID`),
  KEY `ReportID` (`ReportID`),
  CONSTRAINT `reportinvolvedunit_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `Report` (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportInvolvedUnit`
--

LOCK TABLES `ReportInvolvedUnit` WRITE;
/*!40000 ALTER TABLE `ReportInvolvedUnit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportInvolvedUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportJunction`
--

DROP TABLE IF EXISTS `ReportJunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportJunction` (
  `ReportJunctionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportID` int(11) DEFAULT NULL,
  `WithinInterchangeID` int(2) DEFAULT NULL,
  `JunctionID` int(2) DEFAULT NULL,
  `IntersectionTypeID` int(2) DEFAULT NULL,
  `SchoolBusRelatedID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ReportJunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportJunction`
--

LOCK TABLES `ReportJunction` WRITE;
/*!40000 ALTER TABLE `ReportJunction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportJunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportLocation`
--

DROP TABLE IF EXISTS `ReportLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportLocation` (
  `ReportLocationID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportID` int(11) DEFAULT NULL,
  `Latitude` float(10,6) DEFAULT NULL,
  `Longitude` float(10,6) DEFAULT NULL,
  `CityID` int(2) DEFAULT NULL,
  `CountyID` int(3) DEFAULT NULL,
  `StreetHighway` text,
  `Distance` decimal(10,2) DEFAULT NULL,
  `MeasurementID` int(2) DEFAULT NULL,
  `DirectionID` int(2) DEFAULT NULL,
  `NearToID` int(2) DEFAULT NULL,
  `IntersectingStreet` text,
  PRIMARY KEY (`ReportLocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportLocation`
--

LOCK TABLES `ReportLocation` WRITE;
/*!40000 ALTER TABLE `ReportLocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportType`
--

DROP TABLE IF EXISTS `ReportType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportType` (
  `ReportTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ReportTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportType`
--

LOCK TABLES `ReportType` WRITE;
/*!40000 ALTER TABLE `ReportType` DISABLE KEYS */;
INSERT INTO `ReportType` VALUES (1,'Fatal ','Fatal Injury (K)'),(2,'Herido Grave','Serious Injury (A)'),(3,'Herido Leve','Minor Injury (B)'),(4,'Posible Herido','Possible Injured (C)'),(5,'Daño a la Propiedad','Property Damage Only (O)'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ReportType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportWorkzone`
--

DROP TABLE IF EXISTS `ReportWorkzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportWorkzone` (
  `ReportWorkzoneID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ReportID` int(11) DEFAULT NULL,
  `WorkzoneRelatedID` int(2) DEFAULT NULL,
  `WorkzoneLocationID` int(2) DEFAULT NULL,
  `WorkzoneTypeID` int(2) DEFAULT NULL,
  `WorkersPresentID` int(2) DEFAULT NULL,
  `LawEnforcementPresentID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ReportWorkzoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportWorkzone`
--

LOCK TABLES `ReportWorkzone` WRITE;
/*!40000 ALTER TABLE `ReportWorkzone` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportWorkzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestraintSystem`
--

DROP TABLE IF EXISTS `RestraintSystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RestraintSystem` (
  `RestraintSystemID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(60) DEFAULT NULL,
  `DescriptionEN` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`RestraintSystemID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestraintSystem`
--

LOCK TABLES `RestraintSystem` WRITE;
/*!40000 ALTER TABLE `RestraintSystem` DISABLE KEYS */;
INSERT INTO `RestraintSystem` VALUES (1,'No Aplica','Not Applicable'),(2,'Ninguno en Uso','None Used - Motor Vehicle Occupant'),(3,'Cinturón de Hombro y Falda','Shoulder and Lap Belt Used'),(4,'Cinturón de Hombre Solamente','Shoulder Belt Only Used'),(5,'Cinturón de Falda Solamente','Lap Belt Only Used'),(6,'Equipo de Seguridad Utilizado – Tipo de Equipo Desconocido','Restraint Used - Type Unknown'),(7,'Sistema de Retención Infantil – Orientado Hacia Delante','Child Restraint System - Forward Facing'),(8,'Sistema de Retención Infantil – Orientado Hacia Atrás','Child Restraint System - Rear Facing'),(9,'Asiento “Booster”','Booster Seat'),(10,'Sistema de Retención Infantil – Tipo Desconocido','Child Restraint - Type Unknown'),(11,'Otro','Other'),(12,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RestraintSystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoadCircumstance`
--

DROP TABLE IF EXISTS `RoadCircumstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoadCircumstance` (
  `RoadCircumstanceID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(75) DEFAULT NULL,
  `DescriptionEN` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`RoadCircumstanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoadCircumstance`
--

LOCK TABLES `RoadCircumstance` WRITE;
/*!40000 ALTER TABLE `RoadCircumstance` DISABLE KEYS */;
INSERT INTO `RoadCircumstance` VALUES (1,'Ninguna','None '),(2,'Retrocediendo debido a un choque previo','Backup Due to Prior Crash '),(3,'Retrocediendo debido a un incidente previo','Backup Due to Prior Non-Recurring Incident '),(4,'Retrocediendo debido a congestion regular','Backup Due to Regular Congestion '),(5,'Relacionado al peaje o plaza','Toll Booth/Plaza Related '),(6,'Condición de la Superficie de la Carretera','Road Surface Condition (wet, icy, snow, slush, etc.) '),(7,'Escombros','Debris '),(8,'Hoyo, bache, chichón','Ruts, Holes, Bumps '),(9,'Área de Trabajo (Construcción/Mantenimiento)','Work Zone (construction/maintenance/utility) '),(10,'Superficie Resbaladiza','Travel-Polished Surface '),(11,'Obstrucción en la Carretera ','Obstruction in Roadway '),(12,'Dispositivo de control del tránsito (no opera, falta o poco favorable)','Traffic Control Device Inoperative, Missing, or Obscured '),(13,'Paseo','Shoulder'),(14,'Paseo/cuneta-bajo','High Shoulder '),(15,'Paseo/cuneta-alta','Low Shoulder'),(16,'Superficie deteriorada','Worn Surface'),(17,'Trabajo no relacionada a la autopista','Non-Highway Work'),(18,'Construcción fuera de la Carretera','Roadside Work '),(97,'Otros Defectos','Other '),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RoadCircumstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoadSurface`
--

DROP TABLE IF EXISTS `RoadSurface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoadSurface` (
  `RoadSurfaceID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(25) DEFAULT NULL,
  `DescriptionEN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RoadSurfaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoadSurface`
--

LOCK TABLES `RoadSurface` WRITE;
/*!40000 ALTER TABLE `RoadSurface` DISABLE KEYS */;
INSERT INTO `RoadSurface` VALUES (1,'Seco','Dry '),(2,'Mojado','Wet '),(3,'Nieve','Snow '),(4,'Granizo','Slush '),(5,'Congelado','Ice/Frost '),(6,'Agua-flujo o estancada','Water (standing, moving) '),(7,'Arena','Sand '),(8,'Fango','Mud'),(9,'Aceite','Oil '),(10,'Tierra','Dirt'),(11,'Gravilla','Gravel'),(97,'Otro ','Other '),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RoadSurface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoadwayGrade`
--

DROP TABLE IF EXISTS `RoadwayGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoadwayGrade` (
  `RoadwayGradeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(25) DEFAULT NULL,
  `DescriptionEN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RoadwayGradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoadwayGrade`
--

LOCK TABLES `RoadwayGrade` WRITE;
/*!40000 ALTER TABLE `RoadwayGrade` DISABLE KEYS */;
INSERT INTO `RoadwayGrade` VALUES (1,'Llana','Level'),(2,'Tope de colina (cresta)','Hillcrest'),(3,'Cuesta arriba','Uphill'),(4,'Cuesta abajo','Downhill'),(5,'Sagita','Sag (bottom)'),(6,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RoadwayGrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoadwayHorizontalAlignment`
--

DROP TABLE IF EXISTS `RoadwayHorizontalAlignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoadwayHorizontalAlignment` (
  `RoadwayHorizontalAlignmentID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`RoadwayHorizontalAlignmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoadwayHorizontalAlignment`
--

LOCK TABLES `RoadwayHorizontalAlignment` WRITE;
/*!40000 ALTER TABLE `RoadwayHorizontalAlignment` DISABLE KEYS */;
INSERT INTO `RoadwayHorizontalAlignment` VALUES (1,'Recto','Straight'),(2,'Curva Izquierda','Curve Left'),(3,'Curva Derecha','Curve Right'),(4,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `RoadwayHorizontalAlignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Row`
--

DROP TABLE IF EXISTS `Row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Row` (
  `RowID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(55) DEFAULT NULL,
  `DescriptionEN` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Row`
--

LOCK TABLES `Row` WRITE;
/*!40000 ALTER TABLE `Row` DISABLE KEYS */;
INSERT INTO `Row` VALUES (1,'Fila del Frente',' Front Row'),(2,'Segunda Fila','Second Row'),(3,'Tercera Fila','Third Row'),(4,'Cuarta Fila',' Fourth Row'),(5,'Otras Filas (Para Ómnibus, Camioneta Pasajera, etc.)','Other Row(Bus, 15 Passenger Van, etc.)'),(6,'Desconocido','Unknown'),(7,'No aplica','Not applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SafetyEquipment`
--

DROP TABLE IF EXISTS `SafetyEquipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SafetyEquipment` (
  `SafetyEquipmentID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(55) DEFAULT NULL,
  `DescriptionEN` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`SafetyEquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SafetyEquipment`
--

LOCK TABLES `SafetyEquipment` WRITE;
/*!40000 ALTER TABLE `SafetyEquipment` DISABLE KEYS */;
INSERT INTO `SafetyEquipment` VALUES (1,'Ninguna','None'),(2,'Casco Certificado por DOT','DOT - Compliant Motorcycle Helmet'),(3,'Casco, No Certificado por DOT','Helmet, Other than DOT-Compliant Motorcycle Helmet'),(4,'Casco, Se Desconoce si es Certificado por DOT','Helmet, Unknown if DOT-Compliant'),(5,'Se Desconoce el Uso de Casco','Unknown if Helmet Worn'),(6,'Uso de Protectores (Rodilla, Codos, Espinillas, etc.)','Protective Pads Used (Elbows, Knees, Shins, etc.)'),(7,'Chaleco o Dispositivo Reflectante (Bulto, etc.)','Reflective Clothing'),(8,'Alumbramiento','Lighting'),(9,'Amarre para el Casco de Motociclista ','Mooring for Motorcycle Helmets'),(10,'Pantalones Largo','Long Jeans/Pants'),(11,'Calzado Hasta los Tobillos','Footware Covering the Ankles'),(12,'Guantes','Gloves'),(13,'Gafas Protectoras','Safety Glasses'),(14,'Otros','Other'),(15,'No Aplica','Not Applicable'),(16,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SafetyEquipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolBusRelated`
--

DROP TABLE IF EXISTS `SchoolBusRelated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolBusRelated` (
  `SchoolBusRelatedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SchoolBusRelatedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolBusRelated`
--

LOCK TABLES `SchoolBusRelated` WRITE;
/*!40000 ALTER TABLE `SchoolBusRelated` DISABLE KEYS */;
INSERT INTO `SchoolBusRelated` VALUES (1,'Ómnibus Escolar Envuelto Directamente','Shuttle Bus'),(2,'Ómnibus Escolar Envuelto Indirectamente','School Bus Indirectly Involved '),(3,'Transporte Colectivo','Public Transit/Commuter Bus'),(4,'Transporte Regional (Líneas)','Regional Bus'),(5,'Excursión/Fletado','Coach/Charter/Tour Bus'),(6,'\"Party Bus\"','Party Bus'),(7,'No Aplica','Not a Bus'),(8,'Interurbano','Intercity'),(9,'\"Shuttle Bus\"','Shuttle Bus'),(97,'Otro (Machina, etc.)','Other (Machine, etc.)'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SchoolBusRelated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seat` (
  `SeatID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(110) DEFAULT NULL,
  `DescriptionEN` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`SeatID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES (1,'Izquierda','Left (Usually the Motor Vehicle or Motorcycle Driver Except for Postal Vehicles and Some Foreign Vehicles)'),(2,'Medio','Middle'),(3,'Derecha','Right'),(4,'Otro','Other'),(5,'Desconocido','Unknown'),(6,'No Aplica','Not Applicable'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeatingOther`
--

DROP TABLE IF EXISTS `SeatingOther`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeatingOther` (
  `SeatingOtherID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(65) DEFAULT NULL,
  `DescriptionEN` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`SeatingOtherID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeatingOther`
--

LOCK TABLES `SeatingOther` WRITE;
/*!40000 ALTER TABLE `SeatingOther` DISABLE KEYS */;
INSERT INTO `SeatingOther` VALUES (1,'No Aplica','Not Applicable'),(2,'Cabina de Camión','Sleeper Section of Cab (Truck)'),(3,'Otra Área de Cargamento Cerrado','Other Enclosed Cargo Area'),(4,'Área de Carga Descubierta','Unenclosed Cargo Area'),(5,'Unidad de Remolque','Trailing Unit'),(6,'Paseando en el Exterior del Vehículo de Motor (No en Remolque)','Riding on Motor Vehicle Exterior (Non-Trailing Unit)'),(7,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SeatingOther` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sex`
--

DROP TABLE IF EXISTS `Sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sex` (
  `SexID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SexID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sex`
--

LOCK TABLES `Sex` WRITE;
/*!40000 ALTER TABLE `Sex` DISABLE KEYS */;
INSERT INTO `Sex` VALUES (1,'Masculino','Male'),(2,'Femenino','Female'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `Sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialFunction`
--

DROP TABLE IF EXISTS `SpecialFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecialFunction` (
  `SpecialFunctionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SpecialFunctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialFunction`
--

LOCK TABLES `SpecialFunction` WRITE;
/*!40000 ALTER TABLE `SpecialFunction` DISABLE KEYS */;
INSERT INTO `SpecialFunction` VALUES (1,'Uso Personal','No Special Function'),(2,'Vehículo Público','Taxi'),(3,'Ómnibus escolar','Vehicle used as school bus'),(4,'Transporte Público','Vehicle used as other bus'),(5,'Militar','Military'),(6,'Policía Municipal','County Police'),(7,'Policía Estatal','State Police'),(8,'Entrenamiento chofer','Driving school vehicle'),(9,'Construcción','Construction'),(10,'Transporte de Propiedad','Property Transport Service'),(11,'Agricultura','Agricultural'),(12,'Otro trabajo','Other work function'),(13,'Ambulancia/paramédico','Ambulance'),(14,'Combatir Fuego','Fire Truck'),(15,'Levantamiento/Grúa','Towing Truck'),(16,'Vehículo en uso comercial','Commercial vehicle'),(17,'Vehículo Gobierno, no-comercial','Government Issued Vehicle'),(18,'Vehículo pesado en uso no-comercial','Medium/Heavy truck in non-commercial use'),(19,'Veh. de Servicios de emergencia (no transporte)','Non-transport Emergency Service Vehicle'),(20,'Respuesta de incidente','Incident Response'),(21,'Otro uso de vehículo involucrado','Other use of vehicle involved'),(22,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SpecialFunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialPermit`
--

DROP TABLE IF EXISTS `SpecialPermit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecialPermit` (
  `SpecialPermitID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SpecialPermitID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialPermit`
--

LOCK TABLES `SpecialPermit` WRITE;
/*!40000 ALTER TABLE `SpecialPermit` DISABLE KEYS */;
INSERT INTO `SpecialPermit` VALUES (1,'Sí','Yes'),(2,'No','No'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SpecialPermit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpeedingSuspected`
--

DROP TABLE IF EXISTS `SpeedingSuspected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpeedingSuspected` (
  `SpeedingSuspectedID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SpeedingSuspectedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpeedingSuspected`
--

LOCK TABLES `SpeedingSuspected` WRITE;
/*!40000 ALTER TABLE `SpeedingSuspected` DISABLE KEYS */;
INSERT INTO `SpeedingSuspected` VALUES (1,'No','No'),(2,'Carrera/Regateo','Racing'),(3,'Sobre Límite de Velocidad','Exceeded Speed Limit'),(4,'Demasiado Rápido dado a la Condición','Too Fast for Conditions'),(5,'Se Desconoce','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SpeedingSuspected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubstanceSuspected`
--

DROP TABLE IF EXISTS `SubstanceSuspected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubstanceSuspected` (
  `SubstanceSuspectedID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SubstanceSuspectedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubstanceSuspected`
--

LOCK TABLES `SubstanceSuspected` WRITE;
/*!40000 ALTER TABLE `SubstanceSuspected` DISABLE KEYS */;
INSERT INTO `SubstanceSuspected` VALUES (1,'No','No'),(2,'Si','Yes'),(3,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `SubstanceSuspected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TCDType`
--

DROP TABLE IF EXISTS `TCDType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TCDType` (
  `TCDTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(60) DEFAULT NULL,
  `DescriptionEN` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`TCDTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TCDType`
--

LOCK TABLES `TCDType` WRITE;
/*!40000 ALTER TABLE `TCDType` DISABLE KEYS */;
INSERT INTO `TCDType` VALUES (1,'Ninguna','No controls'),(2,'Policia / abanderado','Person (flagger, law enforcement, crossing guard, etc.)'),(3,'Semáforo','Traffic Control Signal'),(4,'Semáforo intermitente','Flashing Traffic Control Signal'),(5,'Control Peatonal','Pedestrian Crossing Device'),(6,'Dispositivo de zona escolar','School Zone Device'),(7,'Pare','Stop sign'),(8,'Ceda','Yield sign'),(9,'Zona de no pasar','Do not enter zone'),(10,'Rotulo de advertencia','Warning sign'),(11,'Dispositivo de cruce de tren','Railway Crossing device'),(12,'Rotulo de zona escolar','School Zone Sign'),(97,'Otro','Other'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TCDType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TCDWorking`
--

DROP TABLE IF EXISTS `TCDWorking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TCDWorking` (
  `TCDWorkingID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TCDWorkingID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TCDWorking`
--

LOCK TABLES `TCDWorking` WRITE;
/*!40000 ALTER TABLE `TCDWorking` DISABLE KEYS */;
INSERT INTO `TCDWorking` VALUES (1,'Sí','Yes'),(2,'No','No'),(3,'Desconocido','Unknown'),(4,'No Aplica','Does Not Apply'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TCDWorking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestStatus`
--

DROP TABLE IF EXISTS `TestStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestStatus` (
  `TestStatusID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(20) DEFAULT NULL,
  `DescriptionEN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TestStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestStatus`
--

LOCK TABLES `TestStatus` WRITE;
/*!40000 ALTER TABLE `TestStatus` DISABLE KEYS */;
INSERT INTO `TestStatus` VALUES (1,'No se hizo Prueba','Test not given'),(2,'Rechazo Prueba','Test refused'),(3,'Se hizo la Prueba','Test given'),(4,'Se Desconoce','Unknown if tested'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TestStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ToFromSchool`
--

DROP TABLE IF EXISTS `ToFromSchool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ToFromSchool` (
  `ToFromSchoolID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ToFromSchoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ToFromSchool`
--

LOCK TABLES `ToFromSchool` WRITE;
/*!40000 ALTER TABLE `ToFromSchool` DISABLE KEYS */;
INSERT INTO `ToFromSchool` VALUES (1,'No','No'),(2,'Si','Yes'),(3,'Se Desconoce','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ToFromSchool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TotalLanes`
--

DROP TABLE IF EXISTS `TotalLanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TotalLanes` (
  `TotalLanesID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `TotalLanesCategoryID` int(2) unsigned DEFAULT NULL,
  `DescriptionES` varchar(110) DEFAULT NULL,
  `DescriptionEN` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`TotalLanesID`),
  KEY `TotalLanesCategoryID` (`TotalLanesCategoryID`),
  CONSTRAINT `TotalLanes_ibfk_1` FOREIGN KEY (`TotalLanesCategoryID`) REFERENCES `TotalLanesCategory` (`TotalLanesCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TotalLanes`
--

LOCK TABLES `TotalLanes` WRITE;
/*!40000 ALTER TABLE `TotalLanes` DISABLE KEYS */;
INSERT INTO `TotalLanes` VALUES (1,1,'Cantidad de carriles de la carretera sin incluir carriles de virajes a la izquierda','Enter total through lanes in both directions, excluding designated turn lanes'),(2,2,'Cantidad de carriles total en la dirección del vehículo (sin incluir paseos)','Enter the total through lanes for the roadway on which the motor vehicle under conditions was traveling.'),(3,2,'Paseo en el carril del accidente','Shoulder at travelway of the vehicle'),(4,2,'Paseo en el carril contrario del accidente','Shoulder at the opposite direction of the vehicle'),(5,2,'Paseo en ambas direcciones','Shoulder at both directions'),(6,2,'No hay paseo','No shoulder lane'),(999,999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TotalLanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TotalLanesCategory`
--

DROP TABLE IF EXISTS `TotalLanesCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TotalLanesCategory` (
  `TotalLanesCategoryID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TotalLanesCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TotalLanesCategory`
--

LOCK TABLES `TotalLanesCategory` WRITE;
/*!40000 ALTER TABLE `TotalLanesCategory` DISABLE KEYS */;
INSERT INTO `TotalLanesCategory` VALUES (1,'Para carriles sin división','For undivided highways'),(2,'Para carriles con división','For divided highways'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TotalLanesCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TowedBy`
--

DROP TABLE IF EXISTS `TowedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TowedBy` (
  `TowedByID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`TowedByID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TowedBy`
--

LOCK TABLES `TowedBy` WRITE;
/*!40000 ALTER TABLE `TowedBy` DISABLE KEYS */;
INSERT INTO `TowedBy` VALUES (1,'Remolcado por Daños Incapacitante','Towed Due to Disabling Damage'),(2,'Remolcado No por Daños Incapacitantes','Towed, But Not Due to Disabling Damage'),(3,'No Fue Remolcado','Not Towed'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TowedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrafficwayDescription`
--

DROP TABLE IF EXISTS `TrafficwayDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrafficwayDescription` (
  `TrafficwayDescriptionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(90) DEFAULT NULL,
  `DescriptionEN` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`TrafficwayDescriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrafficwayDescription`
--

LOCK TABLES `TrafficwayDescription` WRITE;
/*!40000 ALTER TABLE `TrafficwayDescription` DISABLE KEYS */;
INSERT INTO `TrafficwayDescription` VALUES (1,'Ambas direcciones, sin división','Two-way, not divided'),(2,'Ambas direcciones, sin división y con carril continuo para virajes hacia la izquierda','Two-way, not divided, with a continuous left turn lane'),(3,'Ambas direcciones, divididas sin protección de mediana (pintada menor de 4 pies)','Two-way, divided, unprotected (painted >4 feet) Median'),(4,'Ambas direcciones, divididas con barreras en la mediana','Two-way, divided, positive median barrier'),(5,'Carril de una dirección','One-way Trafficway'),(6,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TrafficwayDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransportedBy`
--

DROP TABLE IF EXISTS `TransportedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransportedBy` (
  `TransportedByID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(30) DEFAULT NULL,
  `DescriptionEN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TransportedByID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransportedBy`
--

LOCK TABLES `TransportedBy` WRITE;
/*!40000 ALTER TABLE `TransportedBy` DISABLE KEYS */;
INSERT INTO `TransportedBy` VALUES (1,'Emergencias Médicas por Aire','EMS Air'),(2,'Emergencias Médicas por Tierra','EMS Ground'),(3,'Law Enforcement','Law Enforcement'),(4,'Otro','Other'),(5,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TransportedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelWaySeparation`
--

DROP TABLE IF EXISTS `TravelWaySeparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelWaySeparation` (
  `TravelWaySeparationID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(150) DEFAULT NULL,
  `DescriptionEN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TravelWaySeparationID`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelWaySeparation`
--

LOCK TABLES `TravelWaySeparation` WRITE;
/*!40000 ALTER TABLE `TravelWaySeparation` DISABLE KEYS */;
INSERT INTO `TravelWaySeparation` VALUES (1,'Isleta','Concrete Island'),(2,'Línea Sencilla','Dashed Centerline'),(3,'Línea Doble','Double Solid Centerline (No Passing Zone)'),(4,'Barrera de Hormigón','Concrete Barrier'),(5,'Barrera de Metal','Metal Barrier'),(6,'Verja','Fence'),(7,'Carril para Doblar a la Derecha para Ambas Direcciones ','Two-way Left Turn Lane'),(97,'Otro Tipo de Separación','Other Type of Separation'),(98,'No Aplica','Does Not Apply'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `TravelWaySeparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserID` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `OfficerID` int(7) unsigned NOT NULL,
  `Username` varchar(30) NOT NULL DEFAULT '',
  `Password` varchar(32) NOT NULL DEFAULT '',
  `CreationDate` date NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `OfficerID` (`OfficerID`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`OfficerID`) REFERENCES `Officer` (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,1,'omarpr','c893bad68927b457dbed39460e6afd62','2014-07-18'),(2,2,'icruzado','c893bad68927b457dbed39460e6afd62','2014-10-20'),(3,3,'jgonzalez','c893bad68927b457dbed39460e6afd62','2014-10-20');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSession`
--

DROP TABLE IF EXISTS `UserSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSession` (
  `UserSessionUUID` char(36) NOT NULL DEFAULT '',
  `UserID` int(7) unsigned NOT NULL,
  `UserAgent` varchar(1000) NOT NULL DEFAULT '',
  `UserIP` varchar(17) NOT NULL DEFAULT '',
  `CreationDate` datetime NOT NULL,
  `ExpirationDate` datetime NOT NULL,
  PRIMARY KEY (`UserSessionUUID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `UserSession_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSession`
--

LOCK TABLES `UserSession` WRITE;
/*!40000 ALTER TABLE `UserSession` DISABLE KEYS */;
INSERT INTO `UserSession` VALUES ('038b5c5c-2a2b-11e4-9358-5b07103af621',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36','136.145.116.94','2014-08-22 14:34:55','2014-08-22 14:36:55'),('04730d70-3e13-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-08 17:18:30','2015-08-09 01:18:30'),('052990ae-41f1-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-08-13 15:25:13','2015-08-13 23:25:13'),('0718e3fe-354b-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-28 13:06:46','2015-07-28 21:06:46'),('077d2fd0-4d61-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:59:46','2014-10-06 17:59:46'),('08380ae6-39f4-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-03 11:26:37','2015-08-03 19:26:37'),('0b40522e-2a29-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:20:49','2014-08-22 14:22:49'),('0ba90606-39d9-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-11 13:28:29','2014-09-11 21:28:29'),('0f11ffc2-f7da-11e4-b74c-d284201402ce',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.3.0','0.0.0.0','2015-05-11 08:34:25','2015-05-11 16:34:25'),('11ed36b6-47eb-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/13.4.0','0.0.0.0','2014-09-29 11:12:47','2014-09-29 19:12:47'),('126f5fcc-35fe-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 10:28:25','2015-07-29 18:28:25'),('12bb26d4-2c88-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 09:31:04','2015-07-17 17:31:04'),('1337ea9e-2a2b-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:35:22','2014-08-22 14:37:22'),('136a14e2-412c-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-12 15:55:26','2015-08-12 23:55:26'),('14f156d0-362e-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 16:12:05','2015-07-30 00:12:05'),('16180c38-2a28-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:13:58','2014-08-22 14:15:58'),('16c25752-aad8-11e4-b95d-507d8113d700',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-02 08:36:19','2015-02-02 16:36:19'),('16ece8a8-dec9-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.1.0','0.0.0.0','2015-04-09 10:59:58','2015-04-09 18:59:58'),('170f7876-469a-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-19 13:45:33','2015-08-19 21:45:33'),('1a6448a4-c0d4-11e4-a677-58c9e62813e9',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-03-02 08:03:13','2015-03-02 16:03:13'),('1be92c2a-3d0d-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-07 10:03:41','2015-08-07 18:03:41'),('1c9fbf02-2f8b-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-29 10:45:25','2014-08-29 18:45:25'),('201bde72-2c88-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 09:31:27','2015-07-17 17:31:27'),('2096f580-2c57-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 08:55:44','2014-08-25 16:55:44'),('21aa2124-c377-11e4-aca9-6ada0487965d',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-03-05 16:35:16','2015-03-06 00:35:16'),('23beb838-2c6b-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.21.52.97','2014-08-25 11:19:00','2014-08-25 19:19:00'),('24f11200-f8da-11e4-b74c-d284201402ce',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.3.0','0.0.0.0','2015-05-12 15:07:33','2015-05-12 23:07:33'),('25e2e508-337d-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.21.52.97','2014-09-03 11:15:32','2014-09-03 19:15:32'),('26d94aea-3690-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-07 09:09:08','2014-09-07 17:09:08'),('2b9e9b70-3b26-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-04 23:58:03','2015-08-05 07:58:03'),('2c73524a-3689-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-07 08:19:11','2014-09-07 16:19:11'),('2c8843b0-38f2-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-10 09:55:50','2014-09-10 17:55:50'),('2d9a8d0e-5aed-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-23 15:45:44','2014-10-23 23:45:44'),('2e78bf12-10d1-11e5-abe3-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-06-12 03:03:51','2015-06-12 11:03:51'),('2eaed9de-2c70-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 06:40:03','2015-07-17 14:40:03'),('2ef5370a-4203-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-13 17:35:14','2015-08-14 01:35:14'),('30b432fc-2c88-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 09:31:54','2015-07-17 17:31:54'),('31205f86-4d5e-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:39:27','2014-10-06 17:39:27'),('32f97914-2c7e-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 08:20:23','2015-07-17 16:20:23'),('35720b28-351e-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-09-05 13:00:58','2014-09-05 21:00:58'),('35e19e9c-5892-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 15:49:32','2014-10-20 23:49:32'),('3fecef72-b477-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-14 14:28:19','2015-02-14 22:28:19'),('409c9f98-2c7d-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 08:13:37','2015-07-17 16:13:37'),('474ab0be-362d-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 16:06:20','2015-07-30 00:06:20'),('4ac6838e-10d1-11e5-abe3-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-06-12 03:04:39','2015-06-12 11:04:39'),('4bff957a-d200-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.2.23 Darwin/14.1.0','0.0.0.0','2015-03-24 04:32:24','2015-03-24 12:32:24'),('4dd7bfe4-3cf0-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.13 Darwin/13.3.0','0.0.0.0','2014-09-15 11:52:32','2014-09-15 19:52:32'),('4dfef520-2cb2-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 14:33:22','2015-07-17 22:33:22'),('4e468c0a-4d51-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 08:07:12','2014-10-06 16:07:12'),('50e83536-41b5-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-13 08:17:50','2015-08-13 16:17:50'),('518a56a2-3b22-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-08-04 23:30:28','2015-08-05 07:30:28'),('52949a6a-10d1-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-06-12 03:04:52','2015-06-12 11:04:52'),('530fb308-36bf-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-30 09:31:46','2015-07-30 17:31:46'),('54bf5802-a538-11e4-9b9b-01e37087540e',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-01-26 04:50:08','2015-01-26 12:50:08'),('57960fce-481f-11e4-b71c-c5d4d4abdb47',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 17:26:57','2014-09-30 01:26:57'),('58a12d44-5aef-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-23 16:01:15','2014-10-24 00:01:15'),('59170fd0-362e-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 16:13:59','2015-07-30 00:13:59'),('59a04bcc-44be-11e4-a561-484ba0426740',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-25 10:15:06','2014-09-25 18:15:06'),('59d480d6-47d9-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 09:05:56','2014-09-29 17:05:56'),('5a86451e-39f5-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-08-03 11:36:05','2015-08-03 19:36:05'),('5afa3d02-35f9-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 09:54:39','2015-07-29 17:54:39'),('5d81d140-15db-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-18 12:59:21','2015-06-18 20:59:21'),('646db25c-47e7-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 10:46:27','2014-09-29 18:46:27'),('6608806a-5ae8-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-23 15:11:31','2014-10-23 23:11:31'),('667badfe-2c50-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 08:07:35','2014-08-25 08:09:35'),('66c950e2-41a6-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-08-13 06:31:04','2015-08-13 14:31:04'),('695af80a-49db-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.5.0','0.0.0.0','2015-08-23 17:10:41','2015-08-24 01:10:41'),('6a482f46-15db-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-18 12:59:42','2015-06-18 20:59:42'),('6a6ad892-39af-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-11 08:30:29','2014-09-11 16:30:29'),('6a7ee242-2c94-11e4-9358-5b07103af621',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36','10.31.22.185','2014-08-25 16:14:28','2014-08-26 00:14:28'),('6c169348-5868-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 10:50:24','2014-10-20 18:50:24'),('6e0a07ae-3c72-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-06 15:36:27','2015-08-06 23:36:27'),('6f02dc1a-0dcb-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-08 06:45:09','2015-06-08 14:45:09'),('7274786e-3534-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-28 10:25:07','2015-07-28 18:25:07'),('758dbee0-b062-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-09 09:49:25','2015-02-09 17:49:25'),('7812dcf8-0e4b-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-08 22:01:40','2015-06-09 06:01:40'),('7835c004-0e52-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-08 22:51:47','2015-06-09 06:51:47'),('78b9b51c-468d-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-19 12:15:13','2015-08-19 20:15:13'),('7d46a576-c65a-11e4-aca9-6ada0487965d',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-03-09 08:47:47','2015-03-09 16:47:47'),('7fe3544a-cbd3-11e4-b9d5-33088daec1ba',1,'transinfo/1.0 CFNetwork/711.2.23 Darwin/14.1.0','0.0.0.0','2015-03-16 07:56:37','2015-03-16 15:56:37'),('800b1460-65b9-11e4-a9ed-8545ca245643',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-11-06 09:33:31','2014-11-06 17:33:31'),('81ff17e0-487b-11e4-b71c-c5d4d4abdb47',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/13.4.0','0.0.0.0','2014-09-30 04:26:42','2014-09-30 12:26:42'),('8282da40-5af4-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-23 16:38:13','2014-10-24 00:38:13'),('829b47f6-41c1-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-13 09:45:08','2015-08-13 17:45:08'),('8336a89c-b79a-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-18 14:18:18','2015-02-18 22:18:18'),('84113b2a-2c6b-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.21.52.97','2014-08-25 11:21:41','2014-08-25 19:21:41'),('84f88de0-10d1-11e5-abe3-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-06-12 03:06:16','2015-06-12 11:06:16'),('854b5a66-337d-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.21.52.97','2014-09-03 11:18:12','2014-09-03 19:18:12'),('855ba63a-3ba3-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-05 14:55:20','2015-08-05 22:55:20'),('8609758c-2c93-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 16:08:04','2014-08-26 00:08:04'),('8775e108-2a27-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:09:59','2014-08-22 14:11:59'),('8856e004-a57e-11e4-9b9b-01e37087540e',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2015-01-26 13:12:39','2015-01-26 21:12:39'),('88a4cdfe-4d5f-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:49:03','2014-10-06 17:49:03'),('8a8f994a-3686-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','192.168.0.105','2014-09-07 08:00:20','2014-09-07 16:00:20'),('8abfa1fa-3485-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-07-27 13:33:06','2015-07-27 21:33:06'),('8c1c12ee-2a28-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:17:16','2014-08-22 14:19:16'),('8cf9897c-0e92-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-09 06:30:29','2015-06-09 14:30:29'),('8e4bb3a0-2921-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-13 01:39:40','2015-07-13 09:39:40'),('8f0171b2-3b24-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-04 23:46:30','2015-08-05 07:46:30'),('8f3e84b0-4206-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-13 17:59:24','2015-08-14 01:59:24'),('923e34e4-4d60-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:56:29','2014-10-06 17:56:29'),('925c8868-2c5e-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 09:49:02','2014-08-25 17:49:02'),('929ad0dc-2974-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-13 11:33:55','2015-07-13 19:33:55'),('929e89b8-3601-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 10:53:28','2015-07-29 18:53:28'),('9936f1f2-2c93-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 16:08:37','2014-08-26 00:08:37'),('9ba802bc-5df0-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 11:47:51','2014-10-27 19:47:51'),('9c19d6d8-39e3-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-03 09:29:04','2015-08-03 17:29:04'),('9ddb7af6-45cf-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-18 13:36:11','2015-08-18 21:36:11'),('9e842dd8-cda5-11e4-b9d5-33088daec1ba',1,'transinfo/1.0 CFNetwork/711.2.23 Darwin/14.1.0','0.0.0.0','2015-03-18 15:33:14','2015-03-18 23:33:14'),('9f2feeba-5de9-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 10:57:50','2014-10-27 18:57:50'),('9f95257e-41a4-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-13 06:18:21','2015-08-13 14:18:21'),('a13f6a5e-4697-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-19 13:27:56','2015-08-19 21:27:56'),('a275f290-2a27-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:10:44','2014-08-22 14:12:44'),('a3c980c6-586c-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:20:35','2014-10-20 19:20:35'),('a4e6cafe-586c-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:20:37','2014-10-20 19:20:37'),('a4f540c8-2c5e-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 09:49:33','2014-08-25 17:49:33'),('a848d8bc-2a28-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:18:03','2014-08-22 14:20:03'),('a9113ae8-394e-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-10 20:57:53','2014-09-11 04:57:53'),('ab5dc2ee-37a9-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-31 13:29:16','2015-07-31 21:29:16'),('ac25e77c-c082-11e4-a3fc-ed1fd1bb37df',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-03-01 22:20:19','2015-03-02 06:20:19'),('accc1cfa-35f3-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 09:13:59','2015-07-29 17:13:59'),('acdbbe7a-35f9-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 09:56:56','2015-07-29 17:56:56'),('af09d8c4-47db-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 09:22:38','2014-09-29 17:22:38'),('afa875d6-2bd5-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-16 12:14:07','2015-07-16 20:14:07'),('b0b1aa88-39f4-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-03 11:31:20','2015-08-03 19:31:20'),('b1b599dc-586b-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:13:49','2014-10-20 19:13:49'),('b2f673b6-586b-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:13:51','2014-10-20 19:13:51'),('b3fbb390-2c5e-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-25 09:49:58','2014-08-25 17:49:58'),('b486e040-deca-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.1.0','0.0.0.0','2015-04-09 11:11:32','2015-04-09 19:11:32'),('b4f7390a-39f4-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-03 11:31:27','2015-08-03 19:31:27'),('b67ae0a4-346f-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.4.0','0.0.0.0','2015-07-27 10:56:51','2015-07-27 18:56:51'),('b6c0e5ce-0e48-11e5-abe3-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-06-08 21:41:57','2015-06-09 05:41:57'),('b80dd584-4d52-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 08:17:19','2014-10-06 16:17:19'),('b98c7b78-d22b-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.2.23 Darwin/14.1.0','0.0.0.0','2015-03-24 09:43:16','2015-03-24 17:43:16'),('bb21fd4c-4805-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 14:23:37','2014-09-29 22:23:37'),('bca905b6-4697-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-19 13:28:42','2015-08-19 21:28:42'),('c05ee26a-bb5b-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-23 08:59:07','2015-02-23 16:59:07'),('c05f3bf0-47db-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 09:23:07','2014-09-29 17:23:07'),('c06bbd44-4d5d-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:36:18','2014-10-06 17:36:18'),('c2868318-2a29-11e4-9358-5b07103af621',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36','136.145.116.94','2014-08-22 14:25:57','2014-08-22 14:27:57'),('c289ed40-deca-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.1.0','0.0.0.0','2015-04-09 11:11:55','2015-04-09 19:11:55'),('c57bfb18-337d-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.21.52.97','2014-09-03 11:20:00','2014-09-03 19:20:00'),('c666914c-3600-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 10:47:46','2015-07-29 18:47:46'),('c6787b54-2a27-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-08-22 14:11:44','2014-08-22 14:13:44'),('c688ee58-decc-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.1.0','0.0.0.0','2015-04-09 11:26:21','2015-04-09 19:26:21'),('c886636a-3cde-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','0.0.0.0','2014-09-15 09:47:07','2014-09-15 17:47:07'),('c8d35c62-4821-11e4-b71c-c5d4d4abdb47',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 17:44:26','2014-09-30 01:44:26'),('cf24a3a2-5deb-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 11:13:30','2014-10-27 19:13:30'),('cf92db38-3ba3-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-05 14:57:25','2015-08-05 22:57:25'),('d0ddcc76-4d5d-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 09:36:45','2014-10-06 17:36:45'),('d20eb4d0-4d52-11e4-a739-3643b0aa424c',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-06 08:18:03','2014-10-06 16:18:03'),('d48d481c-b845-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-19 10:44:38','2015-02-19 18:44:38'),('d74ff872-5de3-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 10:16:27','2014-10-27 18:16:27'),('dec12244-2c6d-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 06:23:30','2015-07-17 14:23:30'),('df5adc78-5df0-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 11:49:44','2014-10-27 19:49:44'),('e061ab2c-5dde-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.0.0','0.0.0.0','2014-10-27 09:40:55','2014-10-27 17:40:55'),('e2703548-3b7b-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-05 10:11:37','2015-08-05 18:11:37'),('e46cd45a-3559-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-28 14:53:10','2015-07-28 22:53:10'),('e4bffcb8-4d95-11e4-a739-3643b0aa424c',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36','0.0.0.0','2014-10-06 16:18:11','2014-10-07 00:18:11'),('e6e700c0-3559-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-28 14:53:14','2015-07-28 22:53:14'),('e707d194-2977-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.0.0','0.0.0.0','2015-07-13 11:57:45','2015-07-13 19:57:45'),('e75e2abe-2c68-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-17 05:47:57','2015-07-17 13:47:57'),('eaa19192-36be-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-30 09:28:51','2015-07-30 17:28:51'),('eb4fdfa6-336b-11e4-9358-5b07103af621',1,'transinfo/1.0 CFNetwork/672.1.15 Darwin/14.0.0','10.31.33.12','2014-09-03 09:12:13','2014-09-03 17:12:13'),('ecdc6158-4821-11e4-b71c-c5d4d4abdb47',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 17:45:27','2014-09-30 01:45:27'),('ed0dac92-3559-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-28 14:53:25','2015-07-28 22:53:25'),('ed797dae-47df-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 09:53:01','2014-09-29 17:53:01'),('edb20f7e-3d30-11e5-ae12-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-07 14:20:06','2015-08-07 22:20:06'),('ee6934ec-df75-11e4-b804-b0bda3f7ecba',1,'transinfo/1.0 CFNetwork/711.3.18 Darwin/14.1.0','0.0.0.0','2015-04-10 07:37:13','2015-04-10 15:37:13'),('f043009a-360a-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 12:00:31','2015-07-29 20:00:31'),('f1a132fa-49d7-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.5.0','0.0.0.0','2015-08-23 16:45:52','2015-08-24 00:45:52'),('f1d2b492-c29b-11e4-aca9-6ada0487965d',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-03-04 14:26:16','2015-03-04 22:26:16'),('f218366c-36c6-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-30 10:26:19','2015-07-30 18:26:19'),('f709efc4-362d-11e5-8165-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 16:11:15','2015-07-30 00:11:15'),('f7cfdc72-b390-11e4-ab9a-d8d39574853c',1,'transinfo/1.0 CFNetwork/711.1.12 Darwin/14.1.0','0.0.0.0','2015-02-13 10:59:54','2015-02-13 18:59:54'),('fb8d4392-47eb-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 11:19:19','2014-09-29 19:19:19'),('fbf79b1a-3e45-11e5-ae12-525400ddfd15',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-08-08 23:23:20','2015-08-09 07:23:20'),('fc157c58-3601-11e5-b5df-717a10e13c85',1,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-29 10:56:25','2015-07-29 18:56:25'),('fc661068-586d-11e4-a51f-1fa6e178b420',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:30:13','2014-10-20 19:30:13'),('fc6b5efa-586e-11e4-a51f-1fa6e178b420',2,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-10-20 11:37:23','2014-10-20 19:37:23'),('fdba9de2-2a2a-11e4-9358-5b07103af621',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36','136.145.116.94','2014-08-22 14:34:46','2014-08-22 14:36:46'),('fe0984bc-47de-11e4-a94b-c2fa9b1dbe62',1,'transinfo/1.0 CFNetwork/711.0.6 Darwin/14.0.0','0.0.0.0','2014-09-29 09:46:19','2014-09-29 17:46:19'),('fed8bdcc-36c6-11e5-8165-525400ddfd15',3,'transinfo/1.0 CFNetwork/711.4.6 Darwin/14.0.0','0.0.0.0','2015-07-30 10:26:41','2015-07-30 18:26:41');
/*!40000 ALTER TABLE `UserSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleCircumstance`
--

DROP TABLE IF EXISTS `VehicleCircumstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleCircumstance` (
  `VehicleCircumstanceID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VehicleCircumstanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleCircumstance`
--

LOCK TABLES `VehicleCircumstance` WRITE;
/*!40000 ALTER TABLE `VehicleCircumstance` DISABLE KEYS */;
INSERT INTO `VehicleCircumstance` VALUES (1,'Ninguna','None'),(2,'Frenos','Brakes'),(3,'Sistema de Escape','Exhaust System'),(4,'Chasis, Puertas','Body, Doors'),(5,'Guía/Volante','Steering'),(6,'Sistema de Cambios y/o Transmisión','Power Train'),(7,'Suspensión','Suspension'),(8,'Gomas','Tires'),(9,'Cinturones de Seguridad','Safety Seat Belts'),(10,'Aros y/o Ruedas','Wheels'),(11,'Luces (Delanteras, Traseras y de Señales)','Lights'),(12,'Ventanas/Parabrisas','Windows/Windshield'),(13,'Retrovisores','Mirros'),(14,'“Wipers”','Wipers'),(15,'Enganche de Arrastre','Truck Coupling/Trailer Hitch/Safety Chains'),(16,'Otro Defecto','Other'),(17,'Desconocidos','Unknown'),(18,'No Aplica','Does Not Apply'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `VehicleCircumstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleJurisdiction`
--

DROP TABLE IF EXISTS `VehicleJurisdiction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleJurisdiction` (
  `VehicleJurisdictionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(75) DEFAULT NULL,
  `DescriptionEN` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`VehicleJurisdictionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleJurisdiction`
--

LOCK TABLES `VehicleJurisdiction` WRITE;
/*!40000 ALTER TABLE `VehicleJurisdiction` DISABLE KEYS */;
INSERT INTO `VehicleJurisdiction` VALUES (1,'Estado','State Identifier'),(2,'Gobernamental','US Government'),(3,'Federal','US Federal'),(4,'Canadiense','Canadian Providence'),(5,'Mejicano','Mexican States'),(6,'Nación India','Indian Nation'),(7,'País Extranjero','Foreign Country'),(8,'Otra Jurisdicción','Other Jurisdiction'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `VehicleJurisdiction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleModelYear`
--

DROP TABLE IF EXISTS `VehicleModelYear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleModelYear` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(4) unsigned NOT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_VehicleModelYear_year_make_model` (`year`,`make`,`model`),
  KEY `I_VehicleModelYear_year` (`year`),
  KEY `I_VehicleModelYear_make` (`make`),
  KEY `I_VehicleModelYear_model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleModelYear`
--

LOCK TABLES `VehicleModelYear` WRITE;
/*!40000 ALTER TABLE `VehicleModelYear` DISABLE KEYS */;
INSERT INTO `VehicleModelYear` VALUES (1,1909,'Ford','Model T'),(2,1926,'Chrysler','Imperial'),(3,1948,'Citroën','2CV'),(4,1950,'Hillman','Minx Magnificent'),(5,1953,'Chevrolet','Corvette'),(7,1954,'Cadillac','Fleetwood'),(6,1954,'Chevrolet','Corvette'),(8,1955,'Chevrolet','Corvette'),(9,1955,'Ford','Thunderbird'),(10,1956,'Chevrolet','Corvette'),(12,1957,'BMW','600'),(11,1957,'Chevrolet','Corvette'),(14,1958,'BMW','600'),(13,1958,'Chevrolet','Corvette'),(15,1958,'Ford','Thunderbird'),(16,1959,'Austin','Mini'),(18,1959,'BMW','600'),(17,1959,'Chevrolet','Corvette'),(19,1960,'Chevrolet','Corvair'),(20,1960,'Chevrolet','Corvette'),(22,1960,'Fairthorpe','Rockette'),(21,1960,'Fillmore','Fillmore'),(23,1961,'Austin','Mini Cooper'),(26,1961,'Chevrolet','Corvette'),(25,1961,'Pontiac','Tempest'),(24,1961,'Studebaker','Avanti'),(30,1962,'Buick','Special'),(28,1962,'Chevrolet','Corvette'),(27,1962,'Pontiac','Grand Prix'),(29,1962,'Studebaker','Avanti'),(31,1963,'Austin','Mini'),(32,1963,'Austin','Mini Cooper S'),(37,1963,'Chevrolet','Corvair 500'),(38,1963,'Chevrolet','Corvette'),(34,1963,'Ford','E-Series'),(36,1963,'Pontiac','Grand Prix'),(33,1963,'Rambler','Classic'),(35,1963,'Studebaker','Avanti'),(48,1964,'Austin','Mini Cooper'),(39,1964,'Chevrolet','Corvette'),(41,1964,'Ford','Galaxie'),(40,1964,'Ford','Mustang'),(46,1964,'Plymouth','Fury'),(44,1964,'Pontiac','Bonneville'),(45,1964,'Pontiac','Grand Prix'),(42,1964,'Pontiac','GTO'),(43,1964,'Pontiac','LeMans'),(47,1964,'Studebaker','Avanti'),(58,1965,'Chevrolet','Corvette'),(49,1965,'Ford','Fairlane'),(50,1965,'Ford','Mustang'),(51,1965,'Ford','Thunderbird'),(55,1965,'Pontiac','Bonneville'),(53,1965,'Pontiac','Grand Prix'),(52,1965,'Pontiac','GTO'),(54,1965,'Pontiac','LeMans'),(56,1965,'Pontiac','Tempest'),(57,1965,'Volkswagen','Beetle'),(69,1966,'Chevrolet','Corvette'),(62,1966,'Ford','Fairlane'),(61,1966,'Ford','Falcon'),(59,1966,'Ford','Galaxie'),(60,1966,'Ford','Mustang'),(63,1966,'Jensen','Interceptor'),(70,1966,'Oldsmobile','Toronado'),(64,1966,'Pontiac','Bonneville'),(65,1966,'Pontiac','Grand Prix'),(66,1966,'Pontiac','GTO'),(67,1966,'Pontiac','LeMans'),(68,1966,'Pontiac','Tempest'),(79,1967,'Chevrolet','Bel Air'),(78,1967,'Chevrolet','Camaro'),(80,1967,'Chevrolet','Corvette'),(81,1967,'Ford','Country'),(85,1967,'Ford','Fairlane'),(82,1967,'Ford','Falcon'),(83,1967,'Ford','Mustang'),(84,1967,'Ford','Thunderbird'),(87,1967,'Jensen','Interceptor'),(86,1967,'Mercury','Cougar'),(77,1967,'Pontiac','Bonneville'),(73,1967,'Pontiac','Firebird'),(74,1967,'Pontiac','Grand Prix'),(75,1967,'Pontiac','GTO'),(76,1967,'Pontiac','LeMans'),(72,1967,'Pontiac','Tempest'),(71,1967,'Volkswagen','Beetle'),(97,1968,'Chevrolet','Camaro'),(98,1968,'Chevrolet','Corvette'),(94,1968,'Dodge','Charger'),(96,1968,'Ford','Mustang'),(95,1968,'Mercury','Cougar'),(91,1968,'Pontiac','Bonneville'),(88,1968,'Pontiac','Firebird'),(92,1968,'Pontiac','Grand Prix'),(90,1968,'Pontiac','GTO'),(89,1968,'Pontiac','Lemans'),(93,1968,'Shelby','GT500'),(103,1969,'Chevrolet','Camaro'),(104,1969,'Chevrolet','Corvette'),(105,1969,'Dodge','Charger'),(107,1969,'Ford','Mustang'),(102,1969,'Mercury','Cougar'),(108,1969,'Plymouth','Roadrunner'),(99,1969,'Pontiac','Firebird'),(100,1969,'Pontiac','Grand Prix'),(101,1969,'Pontiac','GTO'),(106,1969,'Shelby','GT350'),(109,1970,'Chevrolet','Camaro'),(110,1970,'Chevrolet','Corvette'),(117,1970,'Dodge','Charger'),(114,1970,'Ford','Mustang'),(115,1970,'Ford','Torino'),(113,1970,'Mercury','Cougar'),(112,1970,'Pontiac','Grand Prix'),(111,1970,'Pontiac','GTO'),(116,1970,'Porsche','914'),(120,1971,'Chevrolet','Camaro'),(119,1971,'Chevrolet','Vega'),(118,1971,'Ford','Mustang'),(122,1971,'Pontiac','Grand Prix'),(121,1971,'Pontiac','GTO'),(124,1972,'Chevrolet','Camaro'),(123,1972,'Chevrolet','Corvette'),(125,1972,'Citroën','SM'),(129,1972,'Ford','Mustang'),(128,1972,'Ford','Thunderbird'),(127,1972,'Pontiac','Grand Prix'),(126,1972,'Pontiac','GTO'),(133,1973,'Chevrolet','Camaro'),(135,1973,'Chevrolet','Corvette'),(134,1973,'Chevrolet','Monte Carlo'),(132,1973,'Ford','Mustang'),(130,1973,'Pontiac','Grand Prix'),(131,1973,'Pontiac','GTO'),(136,1974,'Chevrolet','Camaro'),(138,1974,'Citroën','CX'),(137,1974,'Ford','Mustang'),(140,1974,'Pontiac','Grand Prix'),(139,1974,'Pontiac','GTO'),(141,1975,'Chevrolet','Camaro'),(142,1975,'Chevrolet','Corvette'),(143,1975,'Chevrolet','Monza'),(144,1975,'Pontiac','Grand Prix'),(147,1976,'Chevrolet','Camaro'),(150,1976,'Dodge','Aspen'),(149,1976,'Plymouth','Volare'),(146,1976,'Pontiac','Grand Prix'),(148,1976,'Toyota','Celica'),(145,1976,'Volkswagen','Golf'),(151,1977,'Chevrolet','Camaro'),(152,1977,'Chevrolet','Caprice'),(156,1977,'Ford','Thunderbird'),(153,1977,'Mercedes-Benz','W123'),(154,1977,'MG','MGB'),(155,1977,'Pontiac','Grand Prix'),(158,1978,'Chevrolet','Camaro'),(157,1978,'Chevrolet','Corvette'),(161,1978,'Dodge','Omni'),(160,1978,'Plymouth','Horizon'),(162,1978,'Pontiac','Grand Prix'),(159,1978,'Toyota','Celica'),(167,1979,'Buick','Riviera'),(165,1979,'Chevrolet','Camaro'),(164,1979,'Chevrolet','LUV'),(166,1979,'Ford','Mustang'),(163,1979,'Nissan','280ZX'),(168,1979,'Pontiac','Grand Prix'),(172,1980,'Chevrolet','Camaro'),(171,1980,'Chevrolet','Citation'),(169,1980,'Ford','Mustang'),(170,1980,'Ford','Thunderbird'),(173,1980,'Honda','Civic'),(174,1980,'Pontiac','Grand Prix'),(177,1981,'Chevrolet','Camaro'),(176,1981,'Dodge','Aries'),(179,1981,'Mercedes-Benz','W126'),(175,1981,'Plymouth','Reliant'),(178,1981,'Pontiac','Grand Prix'),(181,1982,'Chevrolet','Camaro'),(180,1982,'Pontiac','Grand Prix'),(182,1982,'Toyota','Celica'),(190,1983,'Chevrolet','Caprice'),(184,1983,'Ford','Mustang'),(183,1983,'Ford','Thunderbird'),(191,1983,'Honda','Accord'),(193,1983,'Mazda','626'),(194,1983,'Mazda','RX-7'),(185,1983,'Mercedes-Benz','W126'),(186,1983,'Pontiac','6000'),(188,1983,'Pontiac','Grand Prix'),(187,1983,'Pontiac','Sunbird'),(196,1983,'Porsche','944'),(192,1983,'Renault','Alliance'),(189,1983,'Toyota','Celica'),(195,1983,'Volkswagen','Golf'),(254,1984,'Audi','5000S'),(246,1984,'Buick','Century'),(245,1984,'Buick','Electra'),(247,1984,'Buick','Skyhawk'),(265,1984,'Chevrolet','Corvette'),(259,1984,'Dodge','Daytona'),(218,1984,'Ford','Bronco'),(206,1984,'Ford','Bronco II'),(219,1984,'Ford','E150'),(216,1984,'Ford','E250'),(211,1984,'Ford','Escort'),(209,1984,'Ford','EXP'),(215,1984,'Ford','F150'),(214,1984,'Ford','F250'),(207,1984,'Ford','Laser'),(213,1984,'Ford','LTD'),(217,1984,'Ford','LTD Crown Victoria'),(220,1984,'Ford','Mustang'),(210,1984,'Ford','Ranger'),(212,1984,'Ford','Tempo'),(208,1984,'Ford','Thunderbird'),(255,1984,'Honda','Accord'),(256,1984,'Honda','CR-X'),(257,1984,'Honda','Prelude'),(249,1984,'Lincoln','Continental'),(250,1984,'Lincoln','Mark VII'),(248,1984,'Lincoln','Town Car'),(239,1984,'Lotus','Esprit Turbo'),(252,1984,'Maserati','Biturbo'),(251,1984,'Maserati','Quattroporte'),(261,1984,'Mazda','626'),(262,1984,'Mazda','GLC'),(263,1984,'Mazda','RX-7'),(230,1984,'Mercedes-Benz','E-Class'),(229,1984,'Mercedes-Benz','S-Class'),(232,1984,'Mercedes-Benz','SL-Class'),(231,1984,'Mercedes-Benz','W201'),(236,1984,'Mercury','Capri'),(237,1984,'Mercury','Cougar'),(234,1984,'Mercury','Grand Marquis'),(235,1984,'Mercury','Lynx'),(238,1984,'Mercury','Marquis'),(233,1984,'Mercury','Topaz'),(226,1984,'Mitsubishi','Cordia'),(222,1984,'Mitsubishi','Galant'),(223,1984,'Mitsubishi','Mirage'),(225,1984,'Mitsubishi','Pajero'),(221,1984,'Mitsubishi','Space'),(224,1984,'Mitsubishi','Starion'),(227,1984,'Mitsubishi','Tredia'),(197,1984,'Pontiac','1000'),(198,1984,'Pontiac','6000'),(200,1984,'Pontiac','Bonneville'),(204,1984,'Pontiac','Fiero'),(201,1984,'Pontiac','Firebird'),(205,1984,'Pontiac','Firefly'),(203,1984,'Pontiac','Grand Prix'),(202,1984,'Pontiac','Parisienne'),(199,1984,'Pontiac','Sunbird'),(258,1984,'Porsche','944'),(253,1984,'Saab','900'),(228,1984,'Subaru','Brat'),(260,1984,'Suzuki','SJ 410'),(264,1984,'Toyota','Celica'),(241,1984,'Volkswagen','Golf'),(240,1984,'Volkswagen','Jetta'),(244,1984,'Volkswagen','Quantum'),(243,1984,'Volkswagen','Scirocco'),(242,1984,'Volkswagen','Vanagon'),(308,1985,'Audi','4000s'),(310,1985,'Audi','5000S'),(311,1985,'Audi','Coupe GT'),(309,1985,'Audi','Quattro'),(268,1985,'Buick','Century'),(267,1985,'Buick','Electra'),(269,1985,'Buick','LeSabre'),(272,1985,'Buick','Regal'),(270,1985,'Buick','Riviera'),(271,1985,'Buick','Skyhawk'),(273,1985,'Buick','Skylark'),(266,1985,'Buick','Somerset'),(305,1985,'Chevrolet','Camaro'),(306,1985,'Chevrolet','Corvette'),(355,1985,'Dodge','Caravan'),(276,1985,'Ford','Bronco'),(275,1985,'Ford','Bronco II'),(274,1985,'Ford','E-Series'),(284,1985,'Ford','Escort'),(285,1985,'Ford','EXP'),(278,1985,'Ford','F-Series'),(279,1985,'Ford','Laser'),(283,1985,'Ford','LTD'),(280,1985,'Ford','LTD Crown Victoria'),(282,1985,'Ford','Mustang'),(281,1985,'Ford','Ranger'),(277,1985,'Ford','Tempo'),(286,1985,'Ford','Thunderbird'),(340,1985,'Honda','Accord'),(339,1985,'Honda','Civic'),(338,1985,'Honda','CR-X'),(341,1985,'Honda','Prelude'),(312,1985,'Lamborghini','Countach'),(345,1985,'Lincoln','Continental'),(346,1985,'Lincoln','Continental Mark VII'),(344,1985,'Lincoln','Town Car'),(354,1985,'Lotus','Esprit'),(342,1985,'Maserati','Biturbo'),(343,1985,'Maserati','Quattroporte'),(319,1985,'Mazda','626'),(322,1985,'Mazda','B2000'),(321,1985,'Mazda','Familia'),(320,1985,'Mazda','RX-7'),(303,1985,'Mercedes-Benz','E-Class'),(302,1985,'Mercedes-Benz','S-Class'),(304,1985,'Mercedes-Benz','SL-Class'),(301,1985,'Mercedes-Benz','W201'),(318,1985,'Mercury','Capri'),(317,1985,'Mercury','Cougar'),(315,1985,'Mercury','Grand Marquis'),(316,1985,'Mercury','Lynx'),(314,1985,'Mercury','Marquis'),(313,1985,'Mercury','Topaz'),(336,1985,'Merkur','XR4Ti'),(290,1985,'Mitsubishi','Chariot'),(292,1985,'Mitsubishi','Cordia'),(337,1985,'Mitsubishi','Galant'),(288,1985,'Mitsubishi','Mirage'),(293,1985,'Mitsubishi','Pajero'),(287,1985,'Mitsubishi','Starion'),(291,1985,'Mitsubishi','Tredia'),(289,1985,'Mitsubishi','Truck'),(347,1985,'Plymouth','Voyager'),(323,1985,'Pontiac','1000'),(324,1985,'Pontiac','6000'),(325,1985,'Pontiac','Bonneville'),(328,1985,'Pontiac','Fiero'),(330,1985,'Pontiac','Firebird'),(332,1985,'Pontiac','Firefly'),(329,1985,'Pontiac','Grand Am'),(331,1985,'Pontiac','Grand Prix'),(326,1985,'Pontiac','Parisienne'),(327,1985,'Pontiac','Sunbird'),(348,1985,'Porsche','911'),(349,1985,'Porsche','928'),(350,1985,'Porsche','944'),(307,1985,'Saab','900'),(334,1985,'Subaru','BRAT'),(335,1985,'Subaru','Leone'),(333,1985,'Subaru','XT'),(351,1985,'Suzuki','Cultus'),(352,1985,'Suzuki','SJ'),(353,1985,'Toyota','MR2'),(296,1985,'Volkswagen','Cabriolet'),(297,1985,'Volkswagen','Golf'),(295,1985,'Volkswagen','GTI'),(294,1985,'Volkswagen','Jetta'),(298,1985,'Volkswagen','Passat'),(299,1985,'Volkswagen','Scirocco'),(300,1985,'Volkswagen','Type 2'),(409,1986,'Audi','4000CS Quattro'),(406,1986,'Audi','4000s'),(408,1986,'Audi','4000s Quattro'),(407,1986,'Audi','5000CS Quattro'),(405,1986,'Audi','5000S'),(404,1986,'Audi','Coupe GT'),(437,1986,'Buick','Century'),(438,1986,'Buick','Electra'),(433,1986,'Buick','LeSabre'),(434,1986,'Buick','Regal'),(432,1986,'Buick','Riviera'),(436,1986,'Buick','Skyhawk'),(435,1986,'Buick','Skylark'),(439,1986,'Buick','Somerset'),(361,1986,'Chevrolet','Corvette'),(373,1986,'Ford','Aerostar'),(377,1986,'Ford','Bronco'),(364,1986,'Ford','Bronco II'),(376,1986,'Ford','Courier'),(366,1986,'Ford','E-Series'),(371,1986,'Ford','Escort'),(369,1986,'Ford','EXP'),(363,1986,'Ford','F-Series'),(372,1986,'Ford','Laser'),(374,1986,'Ford','LTD'),(370,1986,'Ford','LTD Crown Victoria'),(375,1986,'Ford','Mustang'),(365,1986,'Ford','Ranger'),(367,1986,'Ford','Taurus'),(368,1986,'Ford','Tempo'),(362,1986,'Ford','Thunderbird'),(445,1986,'Honda','Accord'),(444,1986,'Honda','Prelude'),(452,1986,'Lamborghini','Countach'),(451,1986,'Land Rover','Range Rover'),(440,1986,'Lincoln','Continental'),(442,1986,'Lincoln','Continental Mark VII'),(441,1986,'Lincoln','Town Car'),(450,1986,'Lotus','Esprit'),(356,1986,'Maserati','Biturbo'),(357,1986,'Maserati','Quattroporte'),(428,1986,'Mazda','626'),(430,1986,'Mazda','B-Series'),(429,1986,'Mazda','Familia'),(431,1986,'Mazda','RX-7'),(411,1986,'Mercedes-Benz','E-Class'),(410,1986,'Mercedes-Benz','S-Class'),(413,1986,'Mercedes-Benz','SL-Class'),(412,1986,'Mercedes-Benz','W201'),(415,1986,'Mercury','Capri'),(419,1986,'Mercury','Cougar'),(416,1986,'Mercury','Grand Marquis'),(417,1986,'Mercury','Lynx'),(418,1986,'Mercury','Marquis'),(420,1986,'Mercury','Sable'),(414,1986,'Mercury','Topaz'),(385,1986,'Mitsubishi','Chariot'),(384,1986,'Mitsubishi','Cordia'),(378,1986,'Mitsubishi','Galant'),(380,1986,'Mitsubishi','Mighty Max'),(382,1986,'Mitsubishi','Mirage'),(383,1986,'Mitsubishi','Pajero'),(381,1986,'Mitsubishi','Precis'),(387,1986,'Mitsubishi','Starion'),(386,1986,'Mitsubishi','Tredia'),(379,1986,'Mitsubishi','Truck'),(388,1986,'Pontiac','1000'),(389,1986,'Pontiac','6000'),(400,1986,'Pontiac','Bonneville'),(390,1986,'Pontiac','Fiero'),(391,1986,'Pontiac','Firebird'),(399,1986,'Pontiac','Firebird Trans Am'),(397,1986,'Pontiac','Firefly'),(398,1986,'Pontiac','Gemini'),(396,1986,'Pontiac','Grand Am'),(395,1986,'Pontiac','Grand Prix'),(394,1986,'Pontiac','Parisienne'),(392,1986,'Pontiac','Safari'),(393,1986,'Pontiac','Sunbird'),(401,1986,'Porsche','911'),(402,1986,'Porsche','928'),(403,1986,'Porsche','944'),(448,1986,'Saab','900'),(449,1986,'Saab','9000'),(360,1986,'Subaru','BRAT'),(359,1986,'Subaru','Leone'),(358,1986,'Subaru','XT'),(447,1986,'Suzuki','SJ'),(446,1986,'Suzuki','SJ 410'),(443,1986,'Toyota','MR2'),(427,1986,'Volkswagen','Cabriolet'),(425,1986,'Volkswagen','Golf'),(421,1986,'Volkswagen','GTI'),(426,1986,'Volkswagen','Jetta'),(423,1986,'Volkswagen','Passat'),(424,1986,'Volkswagen','Scirocco'),(422,1986,'Volkswagen','Type 2'),(547,1987,'Acura','Legend'),(473,1987,'Audi','4000'),(475,1987,'Audi','4000CS Quattro'),(474,1987,'Audi','5000CS'),(476,1987,'Audi','5000S'),(477,1987,'Audi','Coupe GT'),(502,1987,'Buick','Century'),(499,1987,'Buick','Electra'),(503,1987,'Buick','LeSabre'),(500,1987,'Buick','Regal'),(506,1987,'Buick','Riviera'),(501,1987,'Buick','Skyhawk'),(505,1987,'Buick','Skylark'),(504,1987,'Buick','Somerset'),(543,1987,'Chevrolet','Corvette'),(463,1987,'Ford','Aerostar'),(470,1987,'Ford','Bronco'),(467,1987,'Ford','Bronco II'),(459,1987,'Ford','Courier'),(465,1987,'Ford','E-Series'),(461,1987,'Ford','Escort'),(472,1987,'Ford','EXP'),(466,1987,'Ford','F-Series'),(460,1987,'Ford','Laser'),(469,1987,'Ford','LTD Crown Victoria'),(458,1987,'Ford','Mustang'),(471,1987,'Ford','Ranger'),(468,1987,'Ford','Taurus'),(462,1987,'Ford','Tempo'),(464,1987,'Ford','Thunderbird'),(453,1987,'Honda','Accord'),(484,1987,'Lamborghini','Countach'),(544,1987,'Land Rover','Range Rover'),(538,1987,'Lincoln','Continental'),(539,1987,'Lincoln','Continental Mark VII'),(540,1987,'Lincoln','Town Car'),(546,1987,'Lotus','Esprit'),(537,1987,'Maserati','Biturbo'),(478,1987,'Mazda','626'),(479,1987,'Mazda','929'),(482,1987,'Mazda','B-Series'),(483,1987,'Mazda','B2600'),(480,1987,'Mazda','Familia'),(481,1987,'Mazda','RX-7'),(454,1987,'Mercedes-Benz','E-Class'),(455,1987,'Mercedes-Benz','S-Class'),(457,1987,'Mercedes-Benz','SL-Class'),(456,1987,'Mercedes-Benz','W201'),(536,1987,'Mercury','Cougar'),(534,1987,'Mercury','Grand Marquis'),(532,1987,'Mercury','Lynx'),(535,1987,'Mercury','Sable'),(533,1987,'Mercury','Topaz'),(528,1987,'Mitsubishi','Chariot'),(526,1987,'Mitsubishi','Cordia'),(524,1987,'Mitsubishi','Excel'),(529,1987,'Mitsubishi','Galant'),(525,1987,'Mitsubishi','L300'),(527,1987,'Mitsubishi','Mirage'),(530,1987,'Mitsubishi','Pajero'),(523,1987,'Mitsubishi','Starion'),(531,1987,'Mitsubishi','Tredia'),(522,1987,'Mitsubishi','Truck'),(511,1987,'Pontiac','6000'),(517,1987,'Pontiac','Bonneville'),(513,1987,'Pontiac','Chevette'),(515,1987,'Pontiac','Fiero'),(520,1987,'Pontiac','Firebird'),(521,1987,'Pontiac','Firefly'),(514,1987,'Pontiac','Gemini'),(512,1987,'Pontiac','Grand Am'),(519,1987,'Pontiac','Grand Prix'),(518,1987,'Pontiac','Safari'),(516,1987,'Pontiac','Sunbird'),(507,1987,'Porsche','911'),(510,1987,'Porsche','924 S'),(508,1987,'Porsche','928'),(509,1987,'Porsche','944'),(541,1987,'Saab','900'),(542,1987,'Saab','9000'),(497,1987,'Subaru','BRAT'),(498,1987,'Subaru','Justy'),(495,1987,'Subaru','Leone'),(496,1987,'Subaru','XT'),(494,1987,'Suzuki','SJ'),(493,1987,'Suzuki','Swift'),(545,1987,'Toyota','MR2'),(485,1987,'Volkswagen','Cabriolet'),(487,1987,'Volkswagen','Fox'),(490,1987,'Volkswagen','Golf'),(492,1987,'Volkswagen','GTI'),(488,1987,'Volkswagen','Jetta'),(491,1987,'Volkswagen','Passat'),(486,1987,'Volkswagen','Scirocco'),(489,1987,'Volkswagen','Type 2'),(548,1988,'Acura','Integra'),(549,1988,'Acura','Legend'),(633,1988,'Audi','5000CS'),(632,1988,'Audi','5000S'),(634,1988,'Audi','80/90'),(631,1988,'Audi','90'),(581,1988,'Buick','Century'),(579,1988,'Buick','Electra'),(586,1988,'Buick','LeSabre'),(585,1988,'Buick','Reatta'),(583,1988,'Buick','Regal'),(582,1988,'Buick','Riviera'),(580,1988,'Buick','Skyhawk'),(584,1988,'Buick','Skylark'),(640,1988,'Chevrolet','Corvette'),(594,1988,'Ford','Aerostar'),(606,1988,'Ford','Bronco'),(598,1988,'Ford','Bronco II'),(607,1988,'Ford','Courier'),(601,1988,'Ford','E-Series'),(595,1988,'Ford','Escort'),(608,1988,'Ford','EXP'),(603,1988,'Ford','F-Series'),(605,1988,'Ford','Festiva'),(599,1988,'Ford','Laser'),(602,1988,'Ford','LTD Crown Victoria'),(596,1988,'Ford','Mustang'),(604,1988,'Ford','Ranger'),(597,1988,'Ford','Taurus'),(600,1988,'Ford','Tempo'),(593,1988,'Ford','Thunderbird'),(592,1988,'Honda','Accord'),(591,1988,'Honda','Civic'),(590,1988,'Honda','CR-X'),(635,1988,'Lamborghini','Countach'),(643,1988,'Land Rover','Range Rover'),(637,1988,'Lincoln','Continental'),(638,1988,'Lincoln','Continental Mark VII'),(636,1988,'Lincoln','Town Car'),(639,1988,'Lotus','Esprit'),(619,1988,'Mazda','626'),(620,1988,'Mazda','929'),(622,1988,'Mazda','B-Series'),(621,1988,'Mazda','Familia'),(624,1988,'Mazda','MX-6'),(623,1988,'Mazda','RX-7'),(625,1988,'Mercedes-Benz','E-Class'),(626,1988,'Mercedes-Benz','S-Class'),(628,1988,'Mercedes-Benz','SL-Class'),(627,1988,'Mercedes-Benz','W201'),(577,1988,'Mercury','Cougar'),(576,1988,'Mercury','Grand Marquis'),(574,1988,'Mercury','Sable'),(575,1988,'Mercury','Topaz'),(578,1988,'Mercury','Tracer'),(617,1988,'Mitsubishi','Chariot'),(618,1988,'Mitsubishi','Cordia'),(615,1988,'Mitsubishi','Excel'),(611,1988,'Mitsubishi','Galant'),(609,1988,'Mitsubishi','L300'),(612,1988,'Mitsubishi','Mirage'),(614,1988,'Mitsubishi','Pajero'),(616,1988,'Mitsubishi','Starion'),(610,1988,'Mitsubishi','Tredia'),(613,1988,'Mitsubishi','Truck'),(554,1988,'Pontiac','6000'),(556,1988,'Pontiac','Bonneville'),(561,1988,'Pontiac','Fiero'),(555,1988,'Pontiac','Firebird'),(563,1988,'Pontiac','Firefly'),(558,1988,'Pontiac','Gemini'),(559,1988,'Pontiac','Grand Am'),(560,1988,'Pontiac','Grand Prix'),(564,1988,'Pontiac','LeMans'),(562,1988,'Pontiac','Safari'),(557,1988,'Pontiac','Sunbird'),(565,1988,'Pontiac','Turbo Firefly'),(550,1988,'Porsche','911'),(551,1988,'Porsche','924'),(552,1988,'Porsche','928'),(553,1988,'Porsche','944'),(641,1988,'Saab','900'),(642,1988,'Saab','9000'),(589,1988,'Subaru','Justy'),(587,1988,'Subaru','Leone'),(588,1988,'Subaru','XT'),(630,1988,'Suzuki','SJ'),(629,1988,'Suzuki','Swift'),(573,1988,'Volkswagen','Cabriolet'),(569,1988,'Volkswagen','Fox'),(571,1988,'Volkswagen','Golf'),(567,1988,'Volkswagen','GTI'),(568,1988,'Volkswagen','Jetta'),(566,1988,'Volkswagen','Passat'),(572,1988,'Volkswagen','Scirocco'),(570,1988,'Volkswagen','Type 2'),(742,1989,'Acura','Legend'),(736,1989,'Audi','100'),(737,1989,'Audi','200'),(734,1989,'Audi','80'),(735,1989,'Audi','90'),(745,1989,'BMW','6 Series'),(646,1989,'Buick','Century'),(644,1989,'Buick','Electra'),(651,1989,'Buick','Estate'),(652,1989,'Buick','LeSabre'),(649,1989,'Buick','Reatta'),(647,1989,'Buick','Regal'),(650,1989,'Buick','Riviera'),(645,1989,'Buick','Skyhawk'),(648,1989,'Buick','Skylark'),(702,1989,'Chevrolet','Corvette'),(741,1989,'Citroën','CX'),(747,1989,'Dodge','Colt'),(661,1989,'Ford','Aerostar'),(666,1989,'Ford','Bronco'),(664,1989,'Ford','Bronco II'),(663,1989,'Ford','Courier'),(653,1989,'Ford','E-Series'),(659,1989,'Ford','Escort'),(654,1989,'Ford','F-Series'),(662,1989,'Ford','Festiva'),(657,1989,'Ford','Laser'),(665,1989,'Ford','LTD Crown Victoria'),(656,1989,'Ford','Mustang'),(658,1989,'Ford','Probe'),(667,1989,'Ford','Ranger'),(655,1989,'Ford','Taurus'),(660,1989,'Ford','Tempo'),(668,1989,'Ford','Thunderbird'),(744,1989,'Honda','Accord'),(743,1989,'Honda','Civic'),(746,1989,'Lamborghini','Countach'),(739,1989,'Land Rover','Range Rover'),(725,1989,'Lexus','ES'),(724,1989,'Lexus','LS'),(705,1989,'Lincoln','Continental'),(703,1989,'Lincoln','Continental Mark VII'),(704,1989,'Lincoln','Town Car'),(740,1989,'Lotus','Esprit'),(730,1989,'Maserati','228'),(731,1989,'Maserati','430'),(733,1989,'Maserati','Karif'),(732,1989,'Maserati','Spyder'),(681,1989,'Mazda','626'),(682,1989,'Mazda','929'),(684,1989,'Mazda','B-Series'),(685,1989,'Mazda','B2600'),(683,1989,'Mazda','Familia'),(687,1989,'Mazda','MPV'),(688,1989,'Mazda','MX-6'),(686,1989,'Mazda','RX-7'),(727,1989,'Mercedes-Benz','E-Class'),(726,1989,'Mercedes-Benz','S-Class'),(729,1989,'Mercedes-Benz','SL-Class'),(728,1989,'Mercedes-Benz','W201'),(707,1989,'Mercury','Cougar'),(708,1989,'Mercury','Grand Marquis'),(706,1989,'Mercury','Sable'),(709,1989,'Mercury','Topaz'),(710,1989,'Mercury','Tracer'),(695,1989,'Mitsubishi','Chariot'),(701,1989,'Mitsubishi','Eclipse'),(694,1989,'Mitsubishi','Excel'),(696,1989,'Mitsubishi','Galant'),(699,1989,'Mitsubishi','L300'),(693,1989,'Mitsubishi','Mirage'),(697,1989,'Mitsubishi','Pajero'),(700,1989,'Mitsubishi','Sigma'),(698,1989,'Mitsubishi','Starion'),(692,1989,'Mitsubishi','Truck'),(748,1989,'Plymouth','Laser'),(671,1989,'Pontiac','6000'),(680,1989,'Pontiac','Bonneville'),(679,1989,'Pontiac','Firebird'),(674,1989,'Pontiac','Firefly'),(675,1989,'Pontiac','Gemini'),(677,1989,'Pontiac','Grand Am'),(672,1989,'Pontiac','Grand Prix'),(678,1989,'Pontiac','LeMans'),(673,1989,'Pontiac','Safari'),(676,1989,'Pontiac','Sunbird'),(689,1989,'Porsche','911'),(690,1989,'Porsche','928'),(691,1989,'Porsche','944'),(669,1989,'Saab','900'),(670,1989,'Saab','9000'),(719,1989,'Subaru','Justy'),(718,1989,'Subaru','Legacy'),(717,1989,'Subaru','Leone'),(720,1989,'Subaru','XT'),(722,1989,'Suzuki','Sidekick'),(721,1989,'Suzuki','SJ'),(723,1989,'Suzuki','Swift'),(738,1989,'Toyota','Truck Xtracab SR5'),(714,1989,'Volkswagen','Cabriolet'),(712,1989,'Volkswagen','Fox'),(716,1989,'Volkswagen','Golf'),(713,1989,'Volkswagen','GTI'),(711,1989,'Volkswagen','Jetta'),(715,1989,'Volkswagen','Type 2'),(839,1990,'Acura','Legend'),(815,1990,'Audi','100'),(816,1990,'Audi','200'),(813,1990,'Audi','80'),(814,1990,'Audi','90'),(818,1990,'Audi','Coupe Quattro'),(817,1990,'Audi','V8'),(772,1990,'Buick','Century'),(775,1990,'Buick','Coachbuilder'),(777,1990,'Buick','Electra'),(776,1990,'Buick','Estate'),(770,1990,'Buick','LeSabre'),(778,1990,'Buick','Reatta'),(771,1990,'Buick','Regal'),(773,1990,'Buick','Riviera'),(774,1990,'Buick','Skylark'),(854,1990,'Eagle','Talon'),(754,1990,'Ford','Aerostar'),(761,1990,'Ford','Bronco'),(760,1990,'Ford','Bronco II'),(757,1990,'Ford','E-Series'),(755,1990,'Ford','Escort'),(750,1990,'Ford','F-Series'),(762,1990,'Ford','Festiva'),(759,1990,'Ford','LTD Crown Victoria'),(751,1990,'Ford','Mustang'),(758,1990,'Ford','Probe'),(756,1990,'Ford','Ranger'),(749,1990,'Ford','Taurus'),(753,1990,'Ford','Tempo'),(752,1990,'Ford','Thunderbird'),(849,1990,'Honda','Accord'),(848,1990,'Honda','Civic'),(851,1990,'Lamborghini','Countach'),(850,1990,'Lamborghini','Diablo'),(855,1990,'Land Rover','Range Rover'),(853,1990,'Lexus','ES'),(852,1990,'Lexus','LS'),(845,1990,'Lincoln','Continental'),(846,1990,'Lincoln','Continental Mark VII'),(847,1990,'Lincoln','Town Car'),(819,1990,'Lotus','Elan'),(820,1990,'Lotus','Esprit'),(798,1990,'Maserati','228'),(799,1990,'Maserati','430'),(800,1990,'Maserati','Karif'),(801,1990,'Maserati','Spyder'),(790,1990,'Mazda','626'),(791,1990,'Mazda','929'),(792,1990,'Mazda','B-Series'),(794,1990,'Mazda','Familia'),(796,1990,'Mazda','MPV'),(795,1990,'Mazda','MX-5'),(793,1990,'Mazda','MX-6'),(797,1990,'Mazda','RX-7'),(764,1990,'Mercedes-Benz','E-Class'),(763,1990,'Mercedes-Benz','S-Class'),(765,1990,'Mercedes-Benz','SL-Class'),(766,1990,'Mercedes-Benz','W201'),(785,1990,'Mercury','Cougar'),(784,1990,'Mercury','Grand Marquis'),(782,1990,'Mercury','Sable'),(783,1990,'Mercury','Topaz'),(838,1990,'Mitsubishi','Chariot'),(835,1990,'Mitsubishi','Eclipse'),(832,1990,'Mitsubishi','Galant'),(836,1990,'Mitsubishi','GTO'),(831,1990,'Mitsubishi','L300'),(830,1990,'Mitsubishi','Mirage'),(834,1990,'Mitsubishi','Pajero'),(833,1990,'Mitsubishi','Precis'),(837,1990,'Mitsubishi','Sigma'),(829,1990,'Mitsubishi','Truck'),(841,1990,'Nissan','Datsun/Nissan Z-car'),(840,1990,'Nissan','Maxima'),(844,1990,'Plymouth','Laser'),(802,1990,'Pontiac','6000'),(812,1990,'Pontiac','Bonneville'),(808,1990,'Pontiac','Firebird'),(806,1990,'Pontiac','Firefly'),(807,1990,'Pontiac','Grand Am'),(810,1990,'Pontiac','Grand Prix'),(811,1990,'Pontiac','Grand Prix Turbo'),(805,1990,'Pontiac','LeMans'),(804,1990,'Pontiac','Sunbird'),(803,1990,'Pontiac','Trans Sport'),(809,1990,'Pontiac','Turbo Firefly'),(767,1990,'Porsche','911'),(768,1990,'Porsche','928'),(769,1990,'Porsche','944'),(842,1990,'Saab','900'),(843,1990,'Saab','9000'),(787,1990,'Subaru','Justy'),(786,1990,'Subaru','Legacy'),(788,1990,'Subaru','Loyale'),(789,1990,'Subaru','XT'),(779,1990,'Suzuki','Sidekick'),(781,1990,'Suzuki','SJ'),(780,1990,'Suzuki','Swift'),(824,1990,'Volkswagen','Cabriolet'),(827,1990,'Volkswagen','Corrado'),(822,1990,'Volkswagen','Fox'),(828,1990,'Volkswagen','Golf'),(825,1990,'Volkswagen','GTI'),(826,1990,'Volkswagen','Jetta'),(821,1990,'Volkswagen','Passat'),(823,1990,'Volkswagen','Type 2'),(884,1991,'Audi','100'),(885,1991,'Audi','200'),(882,1991,'Audi','80'),(883,1991,'Audi','90'),(886,1991,'Audi','Coupe Quattro'),(887,1991,'Audi','V8'),(901,1991,'Buick','Century'),(899,1991,'Buick','Coachbuilder'),(902,1991,'Buick','LeSabre'),(903,1991,'Buick','Park Avenue'),(898,1991,'Buick','Reatta'),(906,1991,'Buick','Regal'),(900,1991,'Buick','Riviera'),(905,1991,'Buick','Roadmaster'),(904,1991,'Buick','Skylark'),(942,1991,'Chevrolet','Caprice'),(954,1991,'Eagle','Talon'),(875,1991,'Ford','Aerostar'),(873,1991,'Ford','Bronco'),(870,1991,'Ford','E-Series'),(874,1991,'Ford','Escort'),(880,1991,'Ford','Explorer'),(871,1991,'Ford','F-Series'),(869,1991,'Ford','Festiva'),(876,1991,'Ford','LTD Crown Victoria'),(868,1991,'Ford','Mustang'),(881,1991,'Ford','Probe'),(878,1991,'Ford','Ranger'),(879,1991,'Ford','Taurus'),(872,1991,'Ford','Tempo'),(877,1991,'Ford','Thunderbird'),(938,1991,'Honda','Accord'),(937,1991,'Honda','Civic'),(939,1991,'Lamborghini','Diablo'),(957,1991,'Land Rover','Range Rover'),(958,1991,'Land Rover','Sterling'),(912,1991,'Lexus','ES'),(911,1991,'Lexus','LS'),(927,1991,'Lincoln','Continental'),(928,1991,'Lincoln','Continental Mark VII'),(926,1991,'Lincoln','Town Car'),(925,1991,'Lotus','Elan'),(924,1991,'Lotus','Esprit'),(943,1991,'Maserati','430'),(944,1991,'Maserati','Spyder'),(913,1991,'Mazda','626'),(914,1991,'Mazda','929'),(920,1991,'Mazda','B-Series'),(916,1991,'Mazda','Familia'),(919,1991,'Mazda','MPV'),(915,1991,'Mazda','MX-5'),(955,1991,'Mazda','MX-6'),(917,1991,'Mazda','Navajo'),(918,1991,'Mazda','RX-7'),(908,1991,'Mercedes-Benz','E-Class'),(907,1991,'Mercedes-Benz','S-Class'),(910,1991,'Mercedes-Benz','SL-Class'),(909,1991,'Mercedes-Benz','W201'),(896,1991,'Mercury','Capri'),(897,1991,'Mercury','Cougar'),(893,1991,'Mercury','Grand Marquis'),(895,1991,'Mercury','Sable'),(892,1991,'Mercury','Topaz'),(894,1991,'Mercury','Tracer'),(945,1991,'Mitsubishi','Chariot'),(950,1991,'Mitsubishi','Eclipse'),(949,1991,'Mitsubishi','Galant'),(947,1991,'Mitsubishi','GTO'),(951,1991,'Mitsubishi','Mirage'),(948,1991,'Mitsubishi','Pajero'),(946,1991,'Mitsubishi','Truck'),(952,1991,'Nissan','300ZX'),(953,1991,'Nissan','Sentra'),(956,1991,'Plymouth','Laser'),(856,1991,'Pontiac','6000'),(864,1991,'Pontiac','Bonneville'),(858,1991,'Pontiac','Firebird'),(861,1991,'Pontiac','Firefly'),(859,1991,'Pontiac','Grand Am'),(860,1991,'Pontiac','Grand Prix'),(857,1991,'Pontiac','LeMans'),(863,1991,'Pontiac','Sunbird'),(862,1991,'Pontiac','Trans Sport'),(865,1991,'Porsche','911'),(866,1991,'Porsche','928'),(867,1991,'Porsche','944'),(940,1991,'Saab','900'),(941,1991,'Saab','9000'),(889,1991,'Subaru','Justy'),(890,1991,'Subaru','Legacy'),(888,1991,'Subaru','Loyale'),(891,1991,'Subaru','XT'),(923,1991,'Suzuki','Sidekick'),(922,1991,'Suzuki','SJ'),(921,1991,'Suzuki','Swift'),(959,1991,'Toyota','Previa'),(934,1991,'Volkswagen','Cabriolet'),(932,1991,'Volkswagen','Corrado'),(935,1991,'Volkswagen','Fox'),(931,1991,'Volkswagen','Golf'),(936,1991,'Volkswagen','GTI'),(933,1991,'Volkswagen','Jetta'),(930,1991,'Volkswagen','Passat'),(929,1991,'Volkswagen','Type 2'),(1159,1992,'Acura','Integra'),(1160,1992,'Acura','Legend'),(1161,1992,'Acura','NSX'),(1162,1992,'Acura','Vigor'),(1163,1992,'Alfa Romeo','164'),(1164,1992,'Alfa Romeo','Spider'),(1055,1992,'Audi','100'),(1054,1992,'Audi','80'),(1058,1992,'Audi','Quattro'),(1057,1992,'Audi','S4'),(1056,1992,'Audi','V8'),(1067,1992,'BMW','3 Series'),(1068,1992,'BMW','5 Series'),(1069,1992,'BMW','7 Series'),(1070,1992,'BMW','8 Series'),(1071,1992,'BMW','M5'),(1063,1992,'Buick','Century'),(1066,1992,'Buick','Coachbuilder'),(1059,1992,'Buick','LeSabre'),(1065,1992,'Buick','Park Avenue'),(1061,1992,'Buick','Regal'),(1060,1992,'Buick','Riviera'),(1064,1992,'Buick','Roadmaster'),(1062,1992,'Buick','Skylark'),(1122,1992,'Cadillac','Allante'),(1123,1992,'Cadillac','Brougham'),(1124,1992,'Cadillac','DeVille'),(1125,1992,'Cadillac','Eldorado'),(1126,1992,'Cadillac','Fleetwood'),(1121,1992,'Cadillac','Seville'),(1165,1992,'Chevrolet','1500'),(1166,1992,'Chevrolet','2500'),(1167,1992,'Chevrolet','3500'),(1168,1992,'Chevrolet','APV'),(1169,1992,'Chevrolet','Astro'),(1170,1992,'Chevrolet','Beretta'),(1171,1992,'Chevrolet','Blazer'),(1172,1992,'Chevrolet','Camaro'),(1173,1992,'Chevrolet','Caprice'),(1174,1992,'Chevrolet','Cavalier'),(1175,1992,'Chevrolet','Corsica'),(1176,1992,'Chevrolet','Corvette'),(1177,1992,'Chevrolet','G-Series G10'),(1178,1992,'Chevrolet','G-Series G20'),(1179,1992,'Chevrolet','G-Series G30'),(1180,1992,'Chevrolet','Lumina'),(1181,1992,'Chevrolet','Lumina APV'),(1183,1992,'Chevrolet','S10'),(1182,1992,'Chevrolet','S10 Blazer'),(1184,1992,'Chevrolet','Sportvan G10'),(1185,1992,'Chevrolet','Sportvan G20'),(1186,1992,'Chevrolet','Sportvan G30'),(1187,1992,'Chevrolet','Suburban 1500'),(1188,1992,'Chevrolet','Suburban 2500'),(1189,1992,'Chrysler','Fifth Ave'),(1190,1992,'Chrysler','Imperial'),(1191,1992,'Chrysler','LeBaron'),(1192,1992,'Chrysler','New Yorker'),(1193,1992,'Chrysler','Town & Country'),(1194,1992,'Daihatsu','Charade'),(1195,1992,'Daihatsu','Rocky'),(1087,1992,'Dodge','Caravan'),(1088,1992,'Dodge','Colt'),(1090,1992,'Dodge','D150'),(1089,1992,'Dodge','D150 Club'),(1092,1992,'Dodge','D250'),(1091,1992,'Dodge','D250 Club'),(1094,1992,'Dodge','D350'),(1093,1992,'Dodge','D350 Club'),(1096,1992,'Dodge','Dakota'),(1095,1992,'Dodge','Dakota Club'),(1097,1992,'Dodge','Daytona'),(1098,1992,'Dodge','Dynasty'),(1099,1992,'Dodge','Grand Caravan'),(1100,1992,'Dodge','Monaco'),(1101,1992,'Dodge','Ram 50'),(1102,1992,'Dodge','Ram Van B150'),(1103,1992,'Dodge','Ram Van B250'),(1104,1992,'Dodge','Ram Van B350'),(1105,1992,'Dodge','Ram Wagon B150'),(1106,1992,'Dodge','Ram Wagon B250'),(1107,1992,'Dodge','Ram Wagon B350'),(1108,1992,'Dodge','Ramcharger'),(1109,1992,'Dodge','Shadow'),(1110,1992,'Dodge','Spirit'),(1111,1992,'Dodge','Stealth'),(1086,1992,'Dodge','Viper'),(1157,1992,'Eagle','Premier'),(1158,1992,'Eagle','Summit'),(1156,1992,'Eagle','Talon'),(974,1992,'Ford','Aerostar'),(982,1992,'Ford','Bronco'),(985,1992,'Ford','Club Wagon'),(971,1992,'Ford','Crown Victoria'),(976,1992,'Ford','E-Series'),(986,1992,'Ford','Econoline E150'),(987,1992,'Ford','Econoline E250'),(988,1992,'Ford','Econoline E350'),(980,1992,'Ford','Escort'),(983,1992,'Ford','Explorer'),(975,1992,'Ford','F-Series'),(989,1992,'Ford','F150'),(990,1992,'Ford','F250'),(991,1992,'Ford','F350'),(972,1992,'Ford','Festiva'),(984,1992,'Ford','Mustang'),(981,1992,'Ford','Probe'),(973,1992,'Ford','Ranger'),(977,1992,'Ford','Taurus'),(978,1992,'Ford','Tempo'),(979,1992,'Ford','Thunderbird'),(1196,1992,'Geo','Metro'),(1197,1992,'Geo','Prizm'),(1198,1992,'Geo','Storm'),(1199,1992,'Geo','Tracker'),(1200,1992,'GMC','1500'),(1203,1992,'GMC','1500 Club Coupe'),(1201,1992,'GMC','2500'),(1204,1992,'GMC','2500 Club Coupe'),(1202,1992,'GMC','3500'),(1205,1992,'GMC','3500 Club Coupe'),(1206,1992,'GMC','Jimmy'),(1207,1992,'GMC','Rally Wagon 1500'),(1208,1992,'GMC','Rally Wagon 2500'),(1209,1992,'GMC','Rally Wagon 3500'),(1210,1992,'GMC','Safari'),(1212,1992,'GMC','Sonoma'),(1211,1992,'GMC','Sonoma Club'),(1213,1992,'GMC','Suburban 1500'),(1214,1992,'GMC','Suburban 2500'),(1215,1992,'GMC','Vandura 1500'),(1216,1992,'GMC','Vandura 2500'),(1217,1992,'GMC','Vandura 3500'),(1218,1992,'GMC','Yukon'),(1154,1992,'Honda','Accord'),(1155,1992,'Honda','Civic'),(1153,1992,'Honda','Prelude'),(1219,1992,'Hyundai','Elantra'),(1220,1992,'Hyundai','Excel'),(1221,1992,'Hyundai','Scoupe'),(1222,1992,'Hyundai','Sonata'),(1223,1992,'Infiniti','G'),(1224,1992,'Infiniti','M'),(1225,1992,'Infiniti','Q'),(1226,1992,'Isuzu','Amigo'),(1227,1992,'Isuzu','Impulse'),(1228,1992,'Isuzu','Rodeo'),(1229,1992,'Isuzu','Space'),(1230,1992,'Isuzu','Stylus'),(1231,1992,'Isuzu','Trooper'),(1232,1992,'Jaguar','XJ Series'),(1233,1992,'Jeep','Cherokee'),(1234,1992,'Jeep','Comanche'),(1235,1992,'Jeep','Wrangler'),(1118,1992,'Lamborghini','Diablo'),(1082,1992,'Land Rover','Defender'),(1081,1992,'Land Rover','Range Rover'),(1085,1992,'Lexus','ES'),(1083,1992,'Lexus','LS'),(1084,1992,'Lexus','SC'),(1114,1992,'Lincoln','Continental'),(1113,1992,'Lincoln','Continental Mark VII'),(1115,1992,'Lincoln','Mark VII'),(1112,1992,'Lincoln','Town Car'),(1116,1992,'Lotus','Elan'),(1117,1992,'Lotus','Esprit'),(1034,1992,'Mazda','323'),(1035,1992,'Mazda','626'),(1036,1992,'Mazda','929'),(1041,1992,'Mazda','B-Series'),(1046,1992,'Mazda','B-Series Plus'),(1042,1992,'Mazda','Familia'),(1047,1992,'Mazda','Miata MX-5'),(1037,1992,'Mazda','MPV'),(1044,1992,'Mazda','MX-3'),(1040,1992,'Mazda','MX-5'),(1038,1992,'Mazda','MX-6'),(1043,1992,'Mazda','Navajo'),(1039,1992,'Mazda','Protege'),(1045,1992,'Mazda','RX-7'),(1000,1992,'Mercedes-Benz','190E'),(1001,1992,'Mercedes-Benz','300CE'),(1002,1992,'Mercedes-Benz','300D'),(1003,1992,'Mercedes-Benz','300E'),(1004,1992,'Mercedes-Benz','300SD'),(1005,1992,'Mercedes-Benz','300SE'),(1006,1992,'Mercedes-Benz','300SL'),(1007,1992,'Mercedes-Benz','300TE'),(1008,1992,'Mercedes-Benz','400E'),(1009,1992,'Mercedes-Benz','400SE'),(1010,1992,'Mercedes-Benz','500E'),(1011,1992,'Mercedes-Benz','500SEL'),(1012,1992,'Mercedes-Benz','500SL'),(1013,1992,'Mercedes-Benz','600SEL'),(996,1992,'Mercedes-Benz','E-Class'),(997,1992,'Mercedes-Benz','S-Class'),(998,1992,'Mercedes-Benz','SL-Class'),(999,1992,'Mercedes-Benz','W201'),(1053,1992,'Mercury','Capri'),(1052,1992,'Mercury','Cougar'),(1050,1992,'Mercury','Grand Marquis'),(1049,1992,'Mercury','Sable'),(1051,1992,'Mercury','Topaz'),(1048,1992,'Mercury','Tracer'),(1028,1992,'Mitsubishi','3000GT'),(1023,1992,'Mitsubishi','Chariot'),(1019,1992,'Mitsubishi','Diamante'),(1024,1992,'Mitsubishi','Eclipse'),(1029,1992,'Mitsubishi','Expo'),(1020,1992,'Mitsubishi','Galant'),(1022,1992,'Mitsubishi','GTO'),(1031,1992,'Mitsubishi','Mighty Max'),(1030,1992,'Mitsubishi','Mighty Max Macro'),(1026,1992,'Mitsubishi','Mirage'),(1032,1992,'Mitsubishi','Montero'),(1025,1992,'Mitsubishi','Pajero'),(1033,1992,'Mitsubishi','Precis'),(1021,1992,'Mitsubishi','RVR'),(1027,1992,'Mitsubishi','Truck'),(1141,1992,'Nissan','240SX'),(1139,1992,'Nissan','300ZX'),(1142,1992,'Nissan','Maxima'),(1143,1992,'Nissan','NX'),(1144,1992,'Nissan','Pathfinder'),(1140,1992,'Nissan','Sentra'),(1145,1992,'Nissan','Stanza'),(1236,1992,'Oldsmobile','88'),(1237,1992,'Oldsmobile','98'),(1238,1992,'Oldsmobile','Achieva'),(1239,1992,'Oldsmobile','Bravada'),(1240,1992,'Oldsmobile','Ciera'),(1241,1992,'Oldsmobile','Custom Cruiser'),(1242,1992,'Oldsmobile','Cutlass Supreme'),(1243,1992,'Oldsmobile','Silhouette'),(1244,1992,'Oldsmobile','Toronado'),(1147,1992,'Plymouth','Acclaim'),(1148,1992,'Plymouth','Colt'),(1149,1992,'Plymouth','Colt Vista'),(1150,1992,'Plymouth','Grand Voyager'),(1146,1992,'Plymouth','Laser'),(1151,1992,'Plymouth','Sundance'),(1152,1992,'Plymouth','Voyager'),(1079,1992,'Pontiac','Bonneville'),(1072,1992,'Pontiac','Firebird'),(1077,1992,'Pontiac','Firebird Formula'),(1078,1992,'Pontiac','Firefly'),(1075,1992,'Pontiac','Grand Am'),(1074,1992,'Pontiac','Grand Prix'),(1076,1992,'Pontiac','LeMans'),(1073,1992,'Pontiac','Sunbird'),(1080,1992,'Pontiac','Trans Sport'),(1119,1992,'Porsche','911'),(1120,1992,'Porsche','968'),(960,1992,'Saab','900'),(961,1992,'Saab','9000'),(1245,1992,'Saturn','S-Series'),(1016,1992,'Subaru','Alcyone SVX'),(1017,1992,'Subaru','Justy'),(1014,1992,'Subaru','Legacy'),(1015,1992,'Subaru','Loyale'),(1018,1992,'Subaru','SVX'),(995,1992,'Suzuki','Samurai'),(993,1992,'Suzuki','Sidekick'),(994,1992,'Suzuki','SJ'),(992,1992,'Suzuki','Swift'),(1128,1992,'Toyota','4Runner'),(1127,1992,'Toyota','Camry'),(1129,1992,'Toyota','Celica'),(1130,1992,'Toyota','Corolla'),(1131,1992,'Toyota','Cressida'),(1132,1992,'Toyota','Land Cruiser'),(1133,1992,'Toyota','MR2'),(1134,1992,'Toyota','Paseo'),(1135,1992,'Toyota','Previa'),(1136,1992,'Toyota','Supra'),(1137,1992,'Toyota','Tercel'),(1138,1992,'Toyota','Xtra'),(967,1992,'Volkswagen','Cabriolet'),(962,1992,'Volkswagen','Corrado'),(968,1992,'Volkswagen','Eurovan'),(965,1992,'Volkswagen','Fox'),(966,1992,'Volkswagen','Golf'),(964,1992,'Volkswagen','GTI'),(963,1992,'Volkswagen','Jetta'),(969,1992,'Volkswagen','Passat'),(970,1992,'Volkswagen','riolet'),(1246,1992,'Volvo','240'),(1247,1992,'Volvo','740'),(1248,1992,'Volvo','940'),(1249,1992,'Volvo','960'),(1453,1993,'Acura','Integra'),(1454,1993,'Acura','Legend'),(1455,1993,'Acura','NSX'),(1456,1993,'Acura','Vigor'),(1457,1993,'Alfa Romeo','164'),(1458,1993,'Alfa Romeo','Spider'),(1358,1993,'Audi','100'),(1357,1993,'Audi','90'),(1360,1993,'Audi','Quattro'),(1359,1993,'Audi','S4'),(1404,1993,'BMW','3 Series'),(1405,1993,'BMW','5 Series'),(1406,1993,'BMW','7 Series'),(1407,1993,'BMW','8 Series'),(1408,1993,'BMW','M5'),(1327,1993,'Buick','Century'),(1328,1993,'Buick','Coachbuilder'),(1331,1993,'Buick','LeSabre'),(1324,1993,'Buick','Park Avenue'),(1330,1993,'Buick','Regal'),(1329,1993,'Buick','Riviera'),(1326,1993,'Buick','Roadmaster'),(1325,1993,'Buick','Skylark'),(1459,1993,'Cadillac','Allante'),(1460,1993,'Cadillac','DeVille'),(1461,1993,'Cadillac','Eldorado'),(1462,1993,'Cadillac','Fleetwood'),(1463,1993,'Cadillac','Seville'),(1464,1993,'Cadillac','Sixty Special'),(1465,1993,'Chevrolet','1500'),(1466,1993,'Chevrolet','2500'),(1467,1993,'Chevrolet','3500'),(1468,1993,'Chevrolet','APV'),(1469,1993,'Chevrolet','Astro'),(1470,1993,'Chevrolet','Beretta'),(1471,1993,'Chevrolet','Blazer'),(1472,1993,'Chevrolet','Camaro'),(1473,1993,'Chevrolet','Caprice Classic'),(1474,1993,'Chevrolet','Cavalier'),(1475,1993,'Chevrolet','Corsica'),(1476,1993,'Chevrolet','Corvette'),(1477,1993,'Chevrolet','G-Series G10'),(1478,1993,'Chevrolet','G-Series G20'),(1479,1993,'Chevrolet','G-Series G30'),(1480,1993,'Chevrolet','Lumina'),(1481,1993,'Chevrolet','Lumina APV'),(1483,1993,'Chevrolet','S10'),(1482,1993,'Chevrolet','S10 Blazer'),(1484,1993,'Chevrolet','Sportvan G10'),(1485,1993,'Chevrolet','Sportvan G20'),(1486,1993,'Chevrolet','Sportvan G30'),(1487,1993,'Chevrolet','Suburban 1500'),(1488,1993,'Chevrolet','Suburban 2500'),(1428,1993,'Chrysler','Concorde'),(1429,1993,'Chrysler','Fifth Ave'),(1430,1993,'Chrysler','Imperial'),(1431,1993,'Chrysler','LeBaron'),(1432,1993,'Chrysler','New Yorker'),(1433,1993,'Chrysler','Town & Country'),(1363,1993,'Dodge','Caravan'),(1364,1993,'Dodge','Colt'),(1366,1993,'Dodge','D150'),(1365,1993,'Dodge','D150 Club'),(1368,1993,'Dodge','D250'),(1367,1993,'Dodge','D250 Club'),(1370,1993,'Dodge','D350'),(1369,1993,'Dodge','D350 Club'),(1372,1993,'Dodge','Dakota'),(1371,1993,'Dodge','Dakota Club'),(1373,1993,'Dodge','Daytona'),(1374,1993,'Dodge','Dynasty'),(1375,1993,'Dodge','Grand Caravan'),(1362,1993,'Dodge','Intrepid'),(1376,1993,'Dodge','Ram 50'),(1377,1993,'Dodge','Ram Van B150'),(1378,1993,'Dodge','Ram Van B250'),(1379,1993,'Dodge','Ram Van B350'),(1380,1993,'Dodge','Ram Wagon B150'),(1381,1993,'Dodge','Ram Wagon B250'),(1382,1993,'Dodge','Ram Wagon B350'),(1383,1993,'Dodge','Ramcharger'),(1384,1993,'Dodge','Shadow'),(1385,1993,'Dodge','Spirit'),(1386,1993,'Dodge','Stealth'),(1387,1993,'Dodge','Viper'),(1361,1993,'Dodge','Viper RT/10'),(1489,1993,'Eagle','Summit'),(1490,1993,'Eagle','Talon'),(1491,1993,'Eagle','Vision'),(1284,1993,'Ford','Aerostar'),(1292,1993,'Ford','Bronco'),(1296,1993,'Ford','Club Wagon'),(1297,1993,'Ford','Crown Victoria'),(1287,1993,'Ford','E-Series'),(1298,1993,'Ford','Econoline E150'),(1299,1993,'Ford','Econoline E250'),(1300,1993,'Ford','Econoline E350'),(1288,1993,'Ford','Escort'),(1290,1993,'Ford','Explorer'),(1291,1993,'Ford','F-Series'),(1301,1993,'Ford','F150'),(1302,1993,'Ford','F250'),(1303,1993,'Ford','F350'),(1285,1993,'Ford','Festiva'),(1295,1993,'Ford','LTD Crown Victoria'),(1289,1993,'Ford','Mustang'),(1294,1993,'Ford','Probe'),(1286,1993,'Ford','Ranger'),(1283,1993,'Ford','Taurus'),(1282,1993,'Ford','Tempo'),(1293,1993,'Ford','Thunderbird'),(1492,1993,'Geo','Metro'),(1493,1993,'Geo','Prizm'),(1494,1993,'Geo','Storm'),(1495,1993,'Geo','Tracker'),(1496,1993,'GMC','1500'),(1499,1993,'GMC','1500 Club Coupe'),(1497,1993,'GMC','2500'),(1500,1993,'GMC','2500 Club Coupe'),(1498,1993,'GMC','3500'),(1501,1993,'GMC','3500 Club Coupe'),(1502,1993,'GMC','Jimmy'),(1503,1993,'GMC','Rally Wagon 1500'),(1504,1993,'GMC','Rally Wagon 2500'),(1505,1993,'GMC','Rally Wagon 3500'),(1506,1993,'GMC','Safari'),(1508,1993,'GMC','Sonoma'),(1507,1993,'GMC','Sonoma Club Coupe'),(1509,1993,'GMC','Suburban 1500'),(1510,1993,'GMC','Suburban 2500'),(1511,1993,'GMC','Vandura 1500'),(1512,1993,'GMC','Vandura 2500'),(1513,1993,'GMC','Vandura 3500'),(1514,1993,'GMC','Yukon'),(1435,1993,'Honda','Accord'),(1436,1993,'Honda','Civic'),(1437,1993,'Honda','del Sol'),(1434,1993,'Honda','Prelude'),(1515,1993,'HUMMER','H1'),(1516,1993,'Hyundai','Elantra'),(1517,1993,'Hyundai','Excel'),(1518,1993,'Hyundai','Scoupe'),(1519,1993,'Hyundai','Sonata'),(1520,1993,'Infiniti','G'),(1521,1993,'Infiniti','J'),(1522,1993,'Infiniti','Q'),(1523,1993,'Isuzu','Amigo'),(1524,1993,'Isuzu','Rodeo'),(1525,1993,'Isuzu','Space'),(1526,1993,'Isuzu','Stylus'),(1527,1993,'Isuzu','Trooper'),(1528,1993,'Jaguar','XJ Series'),(1451,1993,'Jeep','Cherokee'),(1450,1993,'Jeep','Grand Cherokee'),(1452,1993,'Jeep','Wrangler'),(1390,1993,'Lamborghini','Diablo'),(1409,1993,'Land Rover','Defender'),(1411,1993,'Land Rover','Defender 110'),(1412,1993,'Land Rover','Range Rover'),(1410,1993,'Land Rover','Range Rover Classic'),(1427,1993,'Lexus','ES'),(1425,1993,'Lexus','GS'),(1426,1993,'Lexus','LS'),(1424,1993,'Lexus','SC'),(1422,1993,'Lincoln','Continental'),(1423,1993,'Lincoln','Mark VIII'),(1421,1993,'Lincoln','Town Car'),(1389,1993,'Lotus','Elan'),(1388,1993,'Lotus','Esprit'),(1304,1993,'Mazda','323'),(1305,1993,'Mazda','626'),(1306,1993,'Mazda','929'),(1308,1993,'Mazda','B-Series'),(1315,1993,'Mazda','B-Series Plus'),(1316,1993,'Mazda','Miata MX-5'),(1313,1993,'Mazda','MPV'),(1310,1993,'Mazda','MX-3'),(1314,1993,'Mazda','MX-5'),(1311,1993,'Mazda','MX-6'),(1309,1993,'Mazda','Navajo'),(1312,1993,'Mazda','Protege'),(1307,1993,'Mazda','RX-7'),(1337,1993,'Mercedes-Benz','190E'),(1338,1993,'Mercedes-Benz','300CE'),(1339,1993,'Mercedes-Benz','300D'),(1340,1993,'Mercedes-Benz','300E'),(1341,1993,'Mercedes-Benz','300SD'),(1342,1993,'Mercedes-Benz','300SE'),(1343,1993,'Mercedes-Benz','300SL'),(1344,1993,'Mercedes-Benz','300TE'),(1345,1993,'Mercedes-Benz','400E'),(1346,1993,'Mercedes-Benz','400SEL'),(1347,1993,'Mercedes-Benz','500E'),(1348,1993,'Mercedes-Benz','500SEC'),(1349,1993,'Mercedes-Benz','500SEL'),(1350,1993,'Mercedes-Benz','500SL'),(1351,1993,'Mercedes-Benz','600SEC'),(1352,1993,'Mercedes-Benz','600SEL'),(1353,1993,'Mercedes-Benz','600SL'),(1334,1993,'Mercedes-Benz','C-Class'),(1336,1993,'Mercedes-Benz','E-Class'),(1333,1993,'Mercedes-Benz','S-Class'),(1335,1993,'Mercedes-Benz','SL-Class'),(1332,1993,'Mercedes-Benz','W201'),(1318,1993,'Mercury','Capri'),(1320,1993,'Mercury','Cougar'),(1323,1993,'Mercury','Grand Marquis'),(1317,1993,'Mercury','Sable'),(1322,1993,'Mercury','Topaz'),(1321,1993,'Mercury','Tracer'),(1319,1993,'Mercury','Villager'),(1276,1993,'Mitsubishi','3000GT'),(1272,1993,'Mitsubishi','Chariot'),(1271,1993,'Mitsubishi','Diamante'),(1274,1993,'Mitsubishi','Eclipse'),(1277,1993,'Mitsubishi','Expo'),(1269,1993,'Mitsubishi','Galant'),(1267,1993,'Mitsubishi','GTO'),(1279,1993,'Mitsubishi','Mighty Max'),(1278,1993,'Mitsubishi','Mighty Max Macro'),(1273,1993,'Mitsubishi','Mirage'),(1280,1993,'Mitsubishi','Montero'),(1275,1993,'Mitsubishi','Pajero'),(1281,1993,'Mitsubishi','Precis'),(1270,1993,'Mitsubishi','RVR'),(1268,1993,'Mitsubishi','Truck'),(1415,1993,'Nissan','240SX'),(1414,1993,'Nissan','300ZX'),(1416,1993,'Nissan','Altima'),(1417,1993,'Nissan','Maxima'),(1418,1993,'Nissan','NX'),(1419,1993,'Nissan','Pathfinder'),(1420,1993,'Nissan','Quest'),(1413,1993,'Nissan','Sentra'),(1529,1993,'Oldsmobile','88'),(1530,1993,'Oldsmobile','98'),(1531,1993,'Oldsmobile','Achieva'),(1532,1993,'Oldsmobile','Bravada'),(1533,1993,'Oldsmobile','Ciera'),(1534,1993,'Oldsmobile','Cutlass Cruiser'),(1535,1993,'Oldsmobile','Cutlass Supreme'),(1536,1993,'Oldsmobile','Silhouette'),(1537,1993,'Plymouth','Acclaim'),(1538,1993,'Plymouth','Colt'),(1539,1993,'Plymouth','Colt Vista'),(1540,1993,'Plymouth','Grand Voyager'),(1541,1993,'Plymouth','Laser'),(1542,1993,'Plymouth','Sundance'),(1543,1993,'Plymouth','Voyager'),(1265,1993,'Pontiac','Bonneville'),(1261,1993,'Pontiac','Firebird'),(1263,1993,'Pontiac','Grand Am'),(1260,1993,'Pontiac','Grand Prix'),(1264,1993,'Pontiac','LeMans'),(1262,1993,'Pontiac','Sunbird'),(1266,1993,'Pontiac','Trans Sport'),(1354,1993,'Porsche','911'),(1355,1993,'Porsche','928'),(1356,1993,'Porsche','968'),(1391,1993,'Saab','900'),(1392,1993,'Saab','9000'),(1544,1993,'Saturn','S-Series'),(1251,1993,'Subaru','Alcyone SVX'),(1254,1993,'Subaru','Impreza'),(1253,1993,'Subaru','Justy'),(1252,1993,'Subaru','Legacy'),(1250,1993,'Subaru','Loyale'),(1255,1993,'Subaru','SVX'),(1259,1993,'Suzuki','Samurai'),(1256,1993,'Suzuki','Sidekick'),(1258,1993,'Suzuki','SJ'),(1257,1993,'Suzuki','Swift'),(1439,1993,'Toyota','4Runner'),(1438,1993,'Toyota','Camry'),(1440,1993,'Toyota','Celica'),(1441,1993,'Toyota','Corolla'),(1442,1993,'Toyota','Land Cruiser'),(1443,1993,'Toyota','MR2'),(1444,1993,'Toyota','Paseo'),(1445,1993,'Toyota','Previa'),(1446,1993,'Toyota','Supra'),(1447,1993,'Toyota','T100'),(1448,1993,'Toyota','Tercel'),(1449,1993,'Toyota','Xtra'),(1398,1993,'Volkswagen','Cabriolet'),(1397,1993,'Volkswagen','Corrado'),(1399,1993,'Volkswagen','Eurovan'),(1393,1993,'Volkswagen','Fox'),(1396,1993,'Volkswagen','Golf'),(1402,1993,'Volkswagen','Golf III'),(1395,1993,'Volkswagen','GTI'),(1400,1993,'Volkswagen','Jetta'),(1403,1993,'Volkswagen','Jetta III'),(1394,1993,'Volkswagen','Passat'),(1401,1993,'Volkswagen','riolet'),(1545,1993,'Volvo','240'),(1546,1993,'Volvo','850'),(1547,1993,'Volvo','940'),(1548,1993,'Volvo','960'),(1728,1994,'Acura','Integra'),(1729,1994,'Acura','Legend'),(1730,1994,'Acura','NSX'),(1731,1994,'Acura','Vigor'),(1741,1994,'Alfa Romeo','164'),(1742,1994,'Alfa Romeo','Spider'),(1668,1994,'Audi','100'),(1667,1994,'Audi','90'),(1670,1994,'Audi','Cabriolet'),(1673,1994,'Audi','Quattro'),(1672,1994,'Audi','riolet'),(1671,1994,'Audi','S4'),(1669,1994,'Audi','V8'),(1732,1994,'BMW','3 Series'),(1733,1994,'BMW','5 Series'),(1734,1994,'BMW','7 Series'),(1735,1994,'BMW','8 Series'),(1578,1994,'Buick','Century'),(1582,1994,'Buick','Coachbuilder'),(1579,1994,'Buick','LeSabre'),(1577,1994,'Buick','Park Avenue'),(1581,1994,'Buick','Regal'),(1576,1994,'Buick','Roadmaster'),(1580,1994,'Buick','Skylark'),(1743,1994,'Cadillac','DeVille'),(1744,1994,'Cadillac','Eldorado'),(1745,1994,'Cadillac','Fleetwood'),(1746,1994,'Cadillac','Seville'),(1640,1994,'Chevrolet','1500'),(1641,1994,'Chevrolet','2500'),(1642,1994,'Chevrolet','3500'),(1645,1994,'Chevrolet','Astro'),(1646,1994,'Chevrolet','Beretta'),(1647,1994,'Chevrolet','Blazer'),(1648,1994,'Chevrolet','Camaro'),(1644,1994,'Chevrolet','Caprice'),(1649,1994,'Chevrolet','Caprice Classic'),(1650,1994,'Chevrolet','Cavalier'),(1651,1994,'Chevrolet','Corsica'),(1652,1994,'Chevrolet','Corvette'),(1653,1994,'Chevrolet','G-Series G10'),(1654,1994,'Chevrolet','G-Series G20'),(1655,1994,'Chevrolet','G-Series G30'),(1656,1994,'Chevrolet','Impala'),(1643,1994,'Chevrolet','Impala SS'),(1657,1994,'Chevrolet','Lumina'),(1659,1994,'Chevrolet','S10'),(1658,1994,'Chevrolet','S10 Blazer'),(1660,1994,'Chevrolet','Sportvan G20'),(1661,1994,'Chevrolet','Sportvan G30'),(1662,1994,'Chevrolet','Suburban 1500'),(1663,1994,'Chevrolet','Suburban 2500'),(1736,1994,'Chrysler','Concorde'),(1737,1994,'Chrysler','LeBaron'),(1738,1994,'Chrysler','LHS'),(1739,1994,'Chrysler','New Yorker'),(1740,1994,'Chrysler','Town & Country'),(1622,1994,'Dodge','Caravan'),(1623,1994,'Dodge','Colt'),(1625,1994,'Dodge','Dakota'),(1624,1994,'Dodge','Dakota Club'),(1626,1994,'Dodge','Grand Caravan'),(1619,1994,'Dodge','Intrepid'),(1620,1994,'Dodge','Ram'),(1627,1994,'Dodge','Ram 1500'),(1628,1994,'Dodge','Ram 2500'),(1629,1994,'Dodge','Ram 3500'),(1630,1994,'Dodge','Ram Van B150'),(1631,1994,'Dodge','Ram Van B250'),(1632,1994,'Dodge','Ram Van B350'),(1633,1994,'Dodge','Ram Wagon B150'),(1634,1994,'Dodge','Ram Wagon B250'),(1635,1994,'Dodge','Ram Wagon B350'),(1636,1994,'Dodge','Shadow'),(1637,1994,'Dodge','Spirit'),(1638,1994,'Dodge','Stealth'),(1639,1994,'Dodge','Viper'),(1621,1994,'Dodge','Viper RT/10'),(1606,1994,'Eagle','Summit'),(1607,1994,'Eagle','Talon'),(1605,1994,'Eagle','Vision'),(1550,1994,'Ford','Aerostar'),(1560,1994,'Ford','Aspire'),(1562,1994,'Ford','Bronco'),(1564,1994,'Ford','Club Wagon'),(1563,1994,'Ford','Crown Victoria'),(1553,1994,'Ford','E-Series'),(1565,1994,'Ford','Econoline E150'),(1566,1994,'Ford','Econoline E250'),(1567,1994,'Ford','Econoline E350'),(1551,1994,'Ford','Escort'),(1558,1994,'Ford','Explorer'),(1557,1994,'Ford','F-Series'),(1568,1994,'Ford','F150'),(1569,1994,'Ford','F250'),(1570,1994,'Ford','F350'),(1559,1994,'Ford','Lightning'),(1552,1994,'Ford','Mustang'),(1554,1994,'Ford','Probe'),(1561,1994,'Ford','Ranger'),(1549,1994,'Ford','Taurus'),(1556,1994,'Ford','Tempo'),(1555,1994,'Ford','Thunderbird'),(1747,1994,'Geo','Metro'),(1748,1994,'Geo','Prizm'),(1749,1994,'Geo','Tracker'),(1750,1994,'GMC','1500'),(1753,1994,'GMC','1500 Club Coupe'),(1751,1994,'GMC','2500'),(1754,1994,'GMC','2500 Club Coupe'),(1752,1994,'GMC','3500'),(1755,1994,'GMC','3500 Club Coupe'),(1756,1994,'GMC','Jimmy'),(1757,1994,'GMC','Rally Wagon 2500'),(1758,1994,'GMC','Rally Wagon 3500'),(1759,1994,'GMC','Safari'),(1761,1994,'GMC','Sonoma'),(1760,1994,'GMC','Sonoma Club Coupe'),(1762,1994,'GMC','Suburban 1500'),(1763,1994,'GMC','Suburban 2500'),(1764,1994,'GMC','Vandura 1500'),(1765,1994,'GMC','Vandura 2500'),(1766,1994,'GMC','Vandura 3500'),(1767,1994,'GMC','Yukon'),(1707,1994,'Honda','Accord'),(1708,1994,'Honda','Civic'),(1709,1994,'Honda','del Sol'),(1710,1994,'Honda','Passport'),(1706,1994,'Honda','Prelude'),(1768,1994,'HUMMER','H1'),(1769,1994,'Hyundai','Elantra'),(1770,1994,'Hyundai','Excel'),(1771,1994,'Hyundai','Scoupe'),(1772,1994,'Hyundai','Sonata'),(1773,1994,'Infiniti','G'),(1774,1994,'Infiniti','J'),(1775,1994,'Infiniti','Q'),(1776,1994,'Isuzu','Amigo'),(1777,1994,'Isuzu','Rodeo'),(1778,1994,'Isuzu','Space'),(1779,1994,'Isuzu','Trooper'),(1780,1994,'Jaguar','XJ Series'),(1781,1994,'Jeep','Cherokee'),(1782,1994,'Jeep','Grand Cherokee'),(1783,1994,'Jeep','Wrangler'),(1575,1994,'Kia','Sephia'),(1718,1994,'Lamborghini','Diablo'),(1697,1994,'Land Rover','Defender'),(1698,1994,'Land Rover','Defender 90'),(1695,1994,'Land Rover','Discovery'),(1696,1994,'Land Rover','Range Rover'),(1618,1994,'Lexus','ES'),(1617,1994,'Lexus','GS'),(1616,1994,'Lexus','LS'),(1615,1994,'Lexus','SC'),(1666,1994,'Lincoln','Continental'),(1664,1994,'Lincoln','Mark VIII'),(1665,1994,'Lincoln','Town Car'),(1724,1994,'Lotus','Elan'),(1723,1994,'Lotus','Esprit'),(1676,1994,'Mazda','323'),(1677,1994,'Mazda','626'),(1678,1994,'Mazda','929'),(1679,1994,'Mazda','B-Series'),(1687,1994,'Mazda','B-Series Plus'),(1688,1994,'Mazda','Miata MX-5'),(1680,1994,'Mazda','MPV'),(1681,1994,'Mazda','MX-3'),(1685,1994,'Mazda','MX-5'),(1686,1994,'Mazda','MX-6'),(1683,1994,'Mazda','Navajo'),(1682,1994,'Mazda','Protege'),(1684,1994,'Mazda','RX-7'),(1571,1994,'Mercedes-Benz','C-Class'),(1573,1994,'Mercedes-Benz','E-Class'),(1574,1994,'Mercedes-Benz','S-Class'),(1572,1994,'Mercedes-Benz','SL-Class'),(1585,1994,'Mercury','Capri'),(1588,1994,'Mercury','Cougar'),(1589,1994,'Mercury','Grand Marquis'),(1583,1994,'Mercury','Sable'),(1584,1994,'Mercury','Topaz'),(1587,1994,'Mercury','Tracer'),(1586,1994,'Mercury','Villager'),(1599,1994,'Mitsubishi','3000GT'),(1595,1994,'Mitsubishi','Chariot'),(1592,1994,'Mitsubishi','Diamante'),(1590,1994,'Mitsubishi','Eclipse'),(1600,1994,'Mitsubishi','Expo'),(1593,1994,'Mitsubishi','Galant'),(1597,1994,'Mitsubishi','GTO'),(1602,1994,'Mitsubishi','Mighty Max'),(1601,1994,'Mitsubishi','Mighty Max Macro'),(1591,1994,'Mitsubishi','Mirage'),(1603,1994,'Mitsubishi','Montero'),(1598,1994,'Mitsubishi','Pajero'),(1604,1994,'Mitsubishi','Precis'),(1596,1994,'Mitsubishi','RVR'),(1594,1994,'Mitsubishi','Truck'),(1701,1994,'Nissan','240SX'),(1699,1994,'Nissan','300ZX'),(1702,1994,'Nissan','Altima'),(1703,1994,'Nissan','Maxima'),(1704,1994,'Nissan','Pathfinder'),(1705,1994,'Nissan','Quest'),(1700,1994,'Nissan','Sentra'),(1784,1994,'Oldsmobile','88'),(1785,1994,'Oldsmobile','98'),(1786,1994,'Oldsmobile','Achieva'),(1787,1994,'Oldsmobile','Bravada'),(1788,1994,'Oldsmobile','Ciera'),(1789,1994,'Oldsmobile','Cutlass Cruiser'),(1790,1994,'Oldsmobile','Cutlass Supreme'),(1791,1994,'Oldsmobile','Silhouette'),(1792,1994,'Plymouth','Acclaim'),(1793,1994,'Plymouth','Colt'),(1794,1994,'Plymouth','Colt Vista'),(1795,1994,'Plymouth','Grand Voyager'),(1796,1994,'Plymouth','Laser'),(1797,1994,'Plymouth','Sundance'),(1798,1994,'Plymouth','Voyager'),(1713,1994,'Pontiac','Bonneville'),(1711,1994,'Pontiac','Firebird'),(1717,1994,'Pontiac','Firefly'),(1716,1994,'Pontiac','Grand Am'),(1712,1994,'Pontiac','Grand Prix'),(1715,1994,'Pontiac','Sunbird'),(1714,1994,'Pontiac','Trans Sport'),(1725,1994,'Porsche','911'),(1726,1994,'Porsche','928'),(1727,1994,'Porsche','968'),(1674,1994,'Saab','900'),(1675,1994,'Saab','9000'),(1799,1994,'Saturn','S-Series'),(1691,1994,'Subaru','Alcyone SVX'),(1693,1994,'Subaru','Impreza'),(1689,1994,'Subaru','Justy'),(1690,1994,'Subaru','Legacy'),(1692,1994,'Subaru','Loyale'),(1694,1994,'Subaru','SVX'),(1722,1994,'Suzuki','Samurai'),(1720,1994,'Suzuki','Sidekick'),(1721,1994,'Suzuki','SJ'),(1719,1994,'Suzuki','Swift'),(1800,1994,'Toyota','4Runner'),(1801,1994,'Toyota','Camry'),(1802,1994,'Toyota','Celica'),(1803,1994,'Toyota','Corolla'),(1804,1994,'Toyota','Land Cruiser'),(1805,1994,'Toyota','MR2'),(1806,1994,'Toyota','Paseo'),(1807,1994,'Toyota','Previa'),(1808,1994,'Toyota','Supra'),(1809,1994,'Toyota','T100'),(1810,1994,'Toyota','Tercel'),(1811,1994,'Toyota','Xtra'),(1611,1994,'Volkswagen','Corrado'),(1612,1994,'Volkswagen','Eurovan'),(1610,1994,'Volkswagen','Golf'),(1613,1994,'Volkswagen','Golf III'),(1609,1994,'Volkswagen','Jetta'),(1614,1994,'Volkswagen','Jetta III'),(1608,1994,'Volkswagen','Passat'),(1812,1994,'Volvo','850'),(1813,1994,'Volvo','940'),(1814,1994,'Volvo','960'),(1919,1995,'Acura','Integra'),(1920,1995,'Acura','Legend'),(1921,1995,'Acura','NSX'),(1922,1995,'Acura','TL'),(2012,1995,'Alfa Romeo','164'),(1914,1995,'Audi','90'),(1917,1995,'Audi','A6'),(1916,1995,'Audi','Cabriolet'),(1918,1995,'Audi','riolet'),(1915,1995,'Audi','S6'),(1927,1995,'BMW','3 Series'),(1928,1995,'BMW','5 Series'),(1929,1995,'BMW','7 Series'),(1930,1995,'BMW','8 Series'),(1931,1995,'BMW','M3'),(1880,1995,'Buick','Century'),(1886,1995,'Buick','Coachbuilder'),(1885,1995,'Buick','LeSabre'),(1882,1995,'Buick','Park Avenue'),(1884,1995,'Buick','Regal'),(1887,1995,'Buick','Riviera'),(1883,1995,'Buick','Roadmaster'),(1881,1995,'Buick','Skylark'),(2013,1995,'Cadillac','DeVille'),(2014,1995,'Cadillac','Eldorado'),(2015,1995,'Cadillac','Fleetwood'),(2016,1995,'Cadillac','Seville'),(1967,1995,'Chevrolet','1500'),(1968,1995,'Chevrolet','2500'),(1969,1995,'Chevrolet','3500'),(1973,1995,'Chevrolet','Astro'),(1974,1995,'Chevrolet','Beretta'),(1975,1995,'Chevrolet','Blazer'),(1976,1995,'Chevrolet','Camaro'),(1972,1995,'Chevrolet','Caprice'),(1977,1995,'Chevrolet','Caprice Classic'),(1978,1995,'Chevrolet','Cavalier'),(1979,1995,'Chevrolet','Corsica'),(1980,1995,'Chevrolet','Corvette'),(1981,1995,'Chevrolet','G-Series G10'),(1982,1995,'Chevrolet','G-Series G20'),(1983,1995,'Chevrolet','G-Series G30'),(1984,1995,'Chevrolet','Impala'),(1971,1995,'Chevrolet','Impala SS'),(1970,1995,'Chevrolet','K5 Blazer'),(1985,1995,'Chevrolet','Lumina'),(1986,1995,'Chevrolet','Monte Carlo'),(1987,1995,'Chevrolet','S10'),(1988,1995,'Chevrolet','Sportvan G20'),(1989,1995,'Chevrolet','Sportvan G30'),(1990,1995,'Chevrolet','Suburban 1500'),(1991,1995,'Chevrolet','Suburban 2500'),(1992,1995,'Chevrolet','Tahoe'),(1999,1995,'Chrysler','Cirrus'),(2000,1995,'Chrysler','Concorde'),(2001,1995,'Chrysler','LeBaron'),(2002,1995,'Chrysler','LHS'),(2003,1995,'Chrysler','New Yorker'),(2004,1995,'Chrysler','Sebring'),(2005,1995,'Chrysler','Town & Country'),(1937,1995,'Dodge','Avenger'),(1938,1995,'Dodge','Caravan'),(1940,1995,'Dodge','Dakota'),(1939,1995,'Dodge','Dakota Club'),(1941,1995,'Dodge','Grand Caravan'),(1942,1995,'Dodge','Intrepid'),(1943,1995,'Dodge','Neon'),(1945,1995,'Dodge','Ram 1500'),(1944,1995,'Dodge','Ram 1500 Club'),(1947,1995,'Dodge','Ram 2500'),(1946,1995,'Dodge','Ram 2500 Club'),(1949,1995,'Dodge','Ram 3500'),(1948,1995,'Dodge','Ram 3500 Club'),(1950,1995,'Dodge','Ram Van 1500'),(1951,1995,'Dodge','Ram Van 2500'),(1952,1995,'Dodge','Ram Van 3500'),(1953,1995,'Dodge','Spirit'),(1954,1995,'Dodge','Stealth'),(1955,1995,'Dodge','Stratus'),(1956,1995,'Dodge','Viper'),(1936,1995,'Dodge','Viper RT/10'),(2017,1995,'Eagle','Summit'),(2018,1995,'Eagle','Talon'),(2019,1995,'Eagle','Vision'),(1828,1995,'Ford','Aerostar'),(1838,1995,'Ford','Aspire'),(1831,1995,'Ford','Bronco'),(1839,1995,'Ford','Club Wagon'),(1826,1995,'Ford','Contour'),(1829,1995,'Ford','Crown Victoria'),(1830,1995,'Ford','E-Series'),(1840,1995,'Ford','Econoline E150'),(1841,1995,'Ford','Econoline E250'),(1842,1995,'Ford','Econoline E350'),(1827,1995,'Ford','Escort'),(1833,1995,'Ford','Explorer'),(1824,1995,'Ford','F-Series'),(1843,1995,'Ford','F150'),(1844,1995,'Ford','F250'),(1845,1995,'Ford','F350'),(1835,1995,'Ford','Mustang'),(1834,1995,'Ford','Probe'),(1832,1995,'Ford','Ranger'),(1837,1995,'Ford','Taurus'),(1836,1995,'Ford','Thunderbird'),(1825,1995,'Ford','Windstar'),(2020,1995,'Geo','Metro'),(2021,1995,'Geo','Prizm'),(2022,1995,'Geo','Tracker'),(2023,1995,'GMC','1500'),(2026,1995,'GMC','1500 Club Coupe'),(2024,1995,'GMC','2500'),(2027,1995,'GMC','2500 Club Coupe'),(2025,1995,'GMC','3500'),(2028,1995,'GMC','3500 Club Coupe'),(2029,1995,'GMC','Jimmy'),(2030,1995,'GMC','Rally Wagon G2500'),(2031,1995,'GMC','Rally Wagon G3500'),(2032,1995,'GMC','Safari'),(2034,1995,'GMC','Sonoma'),(2033,1995,'GMC','Sonoma Club Coupe'),(2035,1995,'GMC','Suburban 1500'),(2036,1995,'GMC','Suburban 2500'),(2037,1995,'GMC','Vandura G1500'),(2038,1995,'GMC','Vandura G2500'),(2039,1995,'GMC','Vandura G3500'),(2040,1995,'GMC','Yukon'),(2010,1995,'Holden','VS Commodore'),(1994,1995,'Honda','Accord'),(1995,1995,'Honda','Civic'),(1996,1995,'Honda','del Sol'),(1997,1995,'Honda','Odyssey'),(1998,1995,'Honda','Passport'),(1993,1995,'Honda','Prelude'),(2041,1995,'HUMMER','H1'),(2042,1995,'Hyundai','Accent'),(2043,1995,'Hyundai','Elantra'),(2044,1995,'Hyundai','Scoupe'),(2045,1995,'Hyundai','Sonata'),(2046,1995,'Infiniti','G'),(2047,1995,'Infiniti','J'),(2048,1995,'Infiniti','Q'),(2049,1995,'Isuzu','Rodeo'),(2050,1995,'Isuzu','Trooper'),(2051,1995,'Jaguar','XJ Series'),(2007,1995,'Jeep','Cherokee'),(2006,1995,'Jeep','Grand Cherokee'),(2008,1995,'Jeep','Wrangler'),(1815,1995,'Kia','Sephia'),(1816,1995,'Kia','Sportage'),(2009,1995,'Lamborghini','Diablo'),(1932,1995,'Land Rover','Defender'),(1935,1995,'Land Rover','Defender 90'),(1934,1995,'Land Rover','Discovery'),(1933,1995,'Land Rover','Range Rover'),(1926,1995,'Lexus','ES'),(1925,1995,'Lexus','GS'),(1924,1995,'Lexus','LS'),(1923,1995,'Lexus','SC'),(1874,1995,'Lincoln','Continental'),(1873,1995,'Lincoln','Mark VIII'),(1872,1995,'Lincoln','Town Car'),(2011,1995,'Lotus','Esprit'),(1888,1995,'Mazda','323'),(1889,1995,'Mazda','626'),(1890,1995,'Mazda','929'),(1893,1995,'Mazda','B-Series'),(1899,1995,'Mazda','B-Series Plus'),(1900,1995,'Mazda','Miata MX-5'),(1892,1995,'Mazda','Millenia'),(1894,1995,'Mazda','MPV'),(1895,1995,'Mazda','MX-3'),(1896,1995,'Mazda','MX-5'),(1898,1995,'Mazda','MX-6'),(1897,1995,'Mazda','Protege'),(1891,1995,'Mazda','RX-7'),(1848,1995,'Mercedes-Benz','C-Class'),(1849,1995,'Mercedes-Benz','E-Class'),(1846,1995,'Mercedes-Benz','S-Class'),(1847,1995,'Mercedes-Benz','SL-Class'),(1868,1995,'Mercury','Cougar'),(1871,1995,'Mercury','Grand Marquis'),(1870,1995,'Mercury','Mystique'),(1866,1995,'Mercury','Sable'),(1869,1995,'Mercury','Tracer'),(1867,1995,'Mercury','Villager'),(1910,1995,'Mitsubishi','3000GT'),(1908,1995,'Mitsubishi','Chariot'),(1909,1995,'Mitsubishi','Diamante'),(1905,1995,'Mitsubishi','Eclipse'),(1911,1995,'Mitsubishi','Expo'),(1901,1995,'Mitsubishi','Galant'),(1907,1995,'Mitsubishi','GTO'),(1912,1995,'Mitsubishi','Mighty Max'),(1902,1995,'Mitsubishi','Mirage'),(1913,1995,'Mitsubishi','Montero'),(1906,1995,'Mitsubishi','Pajero'),(1903,1995,'Mitsubishi','RVR'),(1904,1995,'Mitsubishi','Truck'),(1961,1995,'Nissan','200SX'),(1962,1995,'Nissan','240SX'),(1959,1995,'Nissan','300ZX'),(1963,1995,'Nissan','Altima'),(1960,1995,'Nissan','Maxima'),(1964,1995,'Nissan','Pathfinder'),(1965,1995,'Nissan','Quest'),(1966,1995,'Nissan','Sentra'),(2052,1995,'Oldsmobile','88'),(2053,1995,'Oldsmobile','98'),(2054,1995,'Oldsmobile','Achieva'),(2055,1995,'Oldsmobile','Aurora'),(2056,1995,'Oldsmobile','Ciera'),(2057,1995,'Oldsmobile','Cutlass Supreme'),(2058,1995,'Oldsmobile','Silhouette'),(2059,1995,'Plymouth','Acclaim'),(2060,1995,'Plymouth','Grand Voyager'),(2061,1995,'Plymouth','Neon'),(2062,1995,'Plymouth','Voyager'),(1823,1995,'Pontiac','Bonneville'),(1817,1995,'Pontiac','Firebird'),(1819,1995,'Pontiac','Firefly'),(1820,1995,'Pontiac','Grand Am'),(1821,1995,'Pontiac','Grand Prix'),(1818,1995,'Pontiac','Sunfire'),(1822,1995,'Pontiac','Trans Sport'),(1850,1995,'Porsche','911'),(1851,1995,'Porsche','928'),(1852,1995,'Porsche','968'),(1957,1995,'Saab','900'),(1958,1995,'Saab','9000'),(2063,1995,'Saturn','S-Series'),(1864,1995,'Subaru','Alcyone SVX'),(1863,1995,'Subaru','Impreza'),(1862,1995,'Subaru','Legacy'),(1865,1995,'Subaru','SVX'),(1878,1995,'Suzuki','Esteem'),(1879,1995,'Suzuki','Samurai'),(1877,1995,'Suzuki','Sidekick'),(1875,1995,'Suzuki','SJ'),(1876,1995,'Suzuki','Swift'),(2064,1995,'Toyota','4Runner'),(2065,1995,'Toyota','Avalon'),(2066,1995,'Toyota','Camry'),(2067,1995,'Toyota','Celica'),(2068,1995,'Toyota','Corolla'),(2069,1995,'Toyota','Land Cruiser'),(2070,1995,'Toyota','MR2'),(2071,1995,'Toyota','Paseo'),(2072,1995,'Toyota','Previa'),(2073,1995,'Toyota','Supra'),(2074,1995,'Toyota','T100'),(2075,1995,'Toyota','T100 Xtra'),(2076,1995,'Toyota','Tacoma'),(2077,1995,'Toyota','Tacoma Xtra'),(2078,1995,'Toyota','Tercel'),(2079,1995,'Toyota','Xtra'),(1855,1995,'Volkswagen','Cabriolet'),(1854,1995,'Volkswagen','Eurovan'),(1858,1995,'Volkswagen','Golf'),(1860,1995,'Volkswagen','Golf III'),(1857,1995,'Volkswagen','GTI'),(1856,1995,'Volkswagen','Jetta'),(1861,1995,'Volkswagen','Jetta III'),(1853,1995,'Volkswagen','Passat'),(1859,1995,'Volkswagen','rio'),(2080,1995,'Volvo','850'),(2081,1995,'Volvo','940'),(2082,1995,'Volvo','960'),(2263,1996,'Acura','Integra'),(2264,1996,'Acura','NSX'),(2265,1996,'Acura','RL'),(2266,1996,'Acura','SLX'),(2267,1996,'Acura','TL'),(2147,1996,'Audi','A4'),(2145,1996,'Audi','A6'),(2146,1996,'Audi','Cabriolet'),(2148,1996,'Audi','riolet'),(2257,1996,'BMW','3 Series'),(2258,1996,'BMW','7 Series'),(2259,1996,'BMW','8 Series'),(2260,1996,'BMW','M3'),(2261,1996,'BMW','Z3'),(2137,1996,'Buick','Century'),(2140,1996,'Buick','Hearse'),(2144,1996,'Buick','LeSabre'),(2141,1996,'Buick','Park Avenue'),(2139,1996,'Buick','Regal'),(2142,1996,'Buick','Riviera'),(2138,1996,'Buick','Roadmaster'),(2143,1996,'Buick','Skylark'),(2268,1996,'Cadillac','DeVille'),(2269,1996,'Cadillac','Eldorado'),(2270,1996,'Cadillac','Fleetwood'),(2271,1996,'Cadillac','Seville'),(2195,1996,'Chevrolet','1500'),(2196,1996,'Chevrolet','2500'),(2197,1996,'Chevrolet','3500'),(2199,1996,'Chevrolet','Astro'),(2201,1996,'Chevrolet','Beretta'),(2203,1996,'Chevrolet','Blazer'),(2204,1996,'Chevrolet','Camaro'),(2202,1996,'Chevrolet','Caprice'),(2205,1996,'Chevrolet','Caprice Classic'),(2206,1996,'Chevrolet','Cavalier'),(2207,1996,'Chevrolet','Corsica'),(2208,1996,'Chevrolet','Corvette'),(2209,1996,'Chevrolet','Express 1500'),(2210,1996,'Chevrolet','Express 2500'),(2211,1996,'Chevrolet','Express 3500'),(2212,1996,'Chevrolet','G-Series 1500'),(2213,1996,'Chevrolet','G-Series 2500'),(2214,1996,'Chevrolet','G-Series G30'),(2200,1996,'Chevrolet','Impala'),(2215,1996,'Chevrolet','Lumina'),(2216,1996,'Chevrolet','Monte Carlo'),(2217,1996,'Chevrolet','S10'),(2218,1996,'Chevrolet','Sportvan G30'),(2219,1996,'Chevrolet','Suburban 1500'),(2220,1996,'Chevrolet','Suburban 2500'),(2198,1996,'Chevrolet','Tahoe'),(2251,1996,'Chrysler','Cirrus'),(2252,1996,'Chrysler','Concorde'),(2253,1996,'Chrysler','LHS'),(2254,1996,'Chrysler','New Yorker'),(2255,1996,'Chrysler','Sebring'),(2250,1996,'Chrysler','Town & Country'),(2085,1996,'Dodge','Avenger'),(2083,1996,'Dodge','Caravan'),(2087,1996,'Dodge','Dakota'),(2086,1996,'Dodge','Dakota Club'),(2088,1996,'Dodge','Grand Caravan'),(2089,1996,'Dodge','Intrepid'),(2090,1996,'Dodge','Neon'),(2092,1996,'Dodge','Ram 1500'),(2091,1996,'Dodge','Ram 1500 Club'),(2094,1996,'Dodge','Ram 2500'),(2093,1996,'Dodge','Ram 2500 Club'),(2096,1996,'Dodge','Ram 3500'),(2095,1996,'Dodge','Ram 3500 Club'),(2097,1996,'Dodge','Ram Van 1500'),(2098,1996,'Dodge','Ram Van 2500'),(2099,1996,'Dodge','Ram Van 3500'),(2100,1996,'Dodge','Stealth'),(2084,1996,'Dodge','Stratus'),(2101,1996,'Dodge','Viper'),(2272,1996,'Eagle','Summit'),(2273,1996,'Eagle','Talon'),(2274,1996,'Eagle','Vision'),(2114,1996,'Ford','Aerostar'),(2116,1996,'Ford','Aspire'),(2103,1996,'Ford','Bronco'),(2117,1996,'Ford','Club Wagon'),(2105,1996,'Ford','Contour'),(2107,1996,'Ford','Crown Victoria'),(2111,1996,'Ford','E-Series'),(2118,1996,'Ford','Econoline E150'),(2119,1996,'Ford','Econoline E250'),(2120,1996,'Ford','Econoline E350'),(2109,1996,'Ford','Escort'),(2112,1996,'Ford','Explorer'),(2115,1996,'Ford','F-Series'),(2121,1996,'Ford','F150'),(2122,1996,'Ford','F250'),(2123,1996,'Ford','F350'),(2104,1996,'Ford','Mustang'),(2108,1996,'Ford','Probe'),(2102,1996,'Ford','Ranger'),(2110,1996,'Ford','Taurus'),(2113,1996,'Ford','Thunderbird'),(2106,1996,'Ford','Windstar'),(2275,1996,'Geo','Metro'),(2276,1996,'Geo','Prizm'),(2277,1996,'Geo','Tracker'),(2278,1996,'GMC','1500'),(2281,1996,'GMC','1500 Club Coupe'),(2279,1996,'GMC','2500'),(2282,1996,'GMC','2500 Club Coupe'),(2280,1996,'GMC','3500'),(2283,1996,'GMC','3500 Club Coupe'),(2284,1996,'GMC','Jimmy'),(2285,1996,'GMC','Rally Wagon G3500'),(2286,1996,'GMC','Safari'),(2287,1996,'GMC','Savana 1500'),(2288,1996,'GMC','Savana 2500'),(2289,1996,'GMC','Savana 3500'),(2291,1996,'GMC','Sonoma'),(2290,1996,'GMC','Sonoma Club Coupe'),(2292,1996,'GMC','Suburban 1500'),(2293,1996,'GMC','Suburban 2500'),(2294,1996,'GMC','Vandura G3500'),(2295,1996,'GMC','Yukon'),(2189,1996,'Holden','VS Commodore'),(2247,1996,'Honda','Accord'),(2248,1996,'Honda','Civic'),(2249,1996,'Honda','del Sol'),(2245,1996,'Honda','Odyssey'),(2244,1996,'Honda','Passport'),(2246,1996,'Honda','Prelude'),(2296,1996,'HUMMER','H1'),(2297,1996,'Hyundai','Accent'),(2298,1996,'Hyundai','Elantra'),(2299,1996,'Hyundai','Sonata'),(2300,1996,'Infiniti','G'),(2301,1996,'Infiniti','I'),(2302,1996,'Infiniti','J'),(2303,1996,'Infiniti','Q'),(2304,1996,'Isuzu','Hombre'),(2305,1996,'Isuzu','Oasis'),(2306,1996,'Isuzu','Rodeo'),(2307,1996,'Isuzu','Trooper'),(2308,1996,'Jaguar','XJ Series'),(2232,1996,'Jeep','Cherokee'),(2231,1996,'Jeep','Grand Cherokee'),(2234,1996,'Kia','Sephia'),(2233,1996,'Kia','Sportage'),(2262,1996,'Lamborghini','Diablo'),(2221,1996,'Land Rover','Discovery'),(2222,1996,'Land Rover','Range Rover'),(2238,1996,'Lexus','ES'),(2235,1996,'Lexus','GS'),(2239,1996,'Lexus','LS'),(2237,1996,'Lexus','LX'),(2236,1996,'Lexus','SC'),(2129,1996,'Lincoln','Continental'),(2130,1996,'Lincoln','Mark VIII'),(2128,1996,'Lincoln','Town Car'),(2256,1996,'Lotus','Esprit'),(2149,1996,'Mazda','626'),(2153,1996,'Mazda','B-Series'),(2157,1996,'Mazda','B-Series Plus'),(2158,1996,'Mazda','Miata MX-5'),(2156,1996,'Mazda','Millenia'),(2155,1996,'Mazda','MPV'),(2154,1996,'Mazda','MX-3'),(2152,1996,'Mazda','MX-5'),(2150,1996,'Mazda','MX-6'),(2151,1996,'Mazda','Protege'),(2127,1996,'Mercedes-Benz','C-Class'),(2126,1996,'Mercedes-Benz','E-Class'),(2124,1996,'Mercedes-Benz','S-Class'),(2125,1996,'Mercedes-Benz','SL-Class'),(2136,1996,'Mercury','Cougar'),(2133,1996,'Mercury','Grand Marquis'),(2132,1996,'Mercury','Mystique'),(2131,1996,'Mercury','Sable'),(2134,1996,'Mercury','Tracer'),(2135,1996,'Mercury','Villager'),(2174,1996,'Mitsubishi','3000GT'),(2166,1996,'Mitsubishi','Chariot'),(2172,1996,'Mitsubishi','Diamante'),(2170,1996,'Mitsubishi','Eclipse'),(2173,1996,'Mitsubishi','Expo LRV'),(2165,1996,'Mitsubishi','Galant'),(2171,1996,'Mitsubishi','GTO'),(2175,1996,'Mitsubishi','Mighty Max'),(2168,1996,'Mitsubishi','Mirage'),(2176,1996,'Mitsubishi','Montero'),(2167,1996,'Mitsubishi','Pajero'),(2169,1996,'Mitsubishi','Truck'),(2224,1996,'Nissan','200SX'),(2225,1996,'Nissan','240SX'),(2223,1996,'Nissan','300ZX'),(2226,1996,'Nissan','Altima'),(2227,1996,'Nissan','Maxima'),(2228,1996,'Nissan','Pathfinder'),(2229,1996,'Nissan','Quest'),(2230,1996,'Nissan','Sentra'),(2309,1996,'Oldsmobile','88'),(2310,1996,'Oldsmobile','98'),(2311,1996,'Oldsmobile','Achieva'),(2312,1996,'Oldsmobile','Aurora'),(2313,1996,'Oldsmobile','Bravada'),(2314,1996,'Oldsmobile','Ciera'),(2315,1996,'Oldsmobile','Cutlass Supreme'),(2316,1996,'Oldsmobile','Silhouette'),(2192,1996,'Plymouth','Breeze'),(2193,1996,'Plymouth','Grand Voyager'),(2194,1996,'Plymouth','Neon'),(2191,1996,'Plymouth','Voyager'),(2182,1996,'Pontiac','Bonneville'),(2178,1996,'Pontiac','Firebird'),(2181,1996,'Pontiac','Grand Am'),(2177,1996,'Pontiac','Grand Prix'),(2180,1996,'Pontiac','Sunfire'),(2179,1996,'Pontiac','Trans Sport'),(2190,1996,'Porsche','911'),(2187,1996,'Saab','900'),(2188,1996,'Saab','9000'),(2317,1996,'Saturn','S-Series'),(2241,1996,'Subaru','Alcyone SVX'),(2240,1996,'Subaru','Impreza'),(2242,1996,'Subaru','Legacy'),(2243,1996,'Subaru','SVX'),(2184,1996,'Suzuki','Esteem'),(2185,1996,'Suzuki','Sidekick'),(2186,1996,'Suzuki','Swift'),(2183,1996,'Suzuki','X-90'),(2318,1996,'Toyota','4Runner'),(2319,1996,'Toyota','Avalon'),(2320,1996,'Toyota','Camry'),(2321,1996,'Toyota','Celica'),(2322,1996,'Toyota','Corolla'),(2323,1996,'Toyota','Land Cruiser'),(2324,1996,'Toyota','Paseo'),(2325,1996,'Toyota','Previa'),(2326,1996,'Toyota','RAV4'),(2327,1996,'Toyota','Supra'),(2328,1996,'Toyota','T100'),(2329,1996,'Toyota','T100 Xtra'),(2330,1996,'Toyota','Tacoma'),(2331,1996,'Toyota','Tacoma Xtra'),(2332,1996,'Toyota','Tercel'),(2159,1996,'Volkswagen','Cabriolet'),(2161,1996,'Volkswagen','Golf'),(2163,1996,'Volkswagen','GTI'),(2162,1996,'Volkswagen','Jetta'),(2160,1996,'Volkswagen','Passat'),(2164,1996,'Volkswagen','rio'),(2333,1996,'Volvo','850'),(2334,1996,'Volvo','960'),(2520,1997,'Acura','CL'),(2519,1997,'Acura','Integra'),(2521,1997,'Acura','NSX'),(2522,1997,'Acura','RL'),(2523,1997,'Acura','SLX'),(2524,1997,'Acura','TL'),(2388,1997,'Audi','A4'),(2387,1997,'Audi','A6'),(2390,1997,'Audi','A8'),(2389,1997,'Audi','Cabriolet'),(2391,1997,'Audi','riolet'),(2366,1997,'BMW','3 Series'),(2367,1997,'BMW','5 Series'),(2368,1997,'BMW','7 Series'),(2369,1997,'BMW','8 Series'),(2370,1997,'BMW','M3'),(2371,1997,'BMW','Z3'),(2481,1997,'Buick','Century'),(2478,1997,'Buick','LeSabre'),(2479,1997,'Buick','Park Avenue'),(2483,1997,'Buick','Regal'),(2480,1997,'Buick','Riviera'),(2482,1997,'Buick','Skylark'),(2525,1997,'Cadillac','Catera'),(2526,1997,'Cadillac','DeVille'),(2527,1997,'Cadillac','Eldorado'),(2528,1997,'Cadillac','Seville'),(2451,1997,'Chevrolet','1500'),(2452,1997,'Chevrolet','2500'),(2453,1997,'Chevrolet','3500'),(2455,1997,'Chevrolet','Astro'),(2456,1997,'Chevrolet','Blazer'),(2457,1997,'Chevrolet','Camaro'),(2458,1997,'Chevrolet','Cavalier'),(2459,1997,'Chevrolet','Corvette'),(2460,1997,'Chevrolet','Express 1500'),(2461,1997,'Chevrolet','Express 2500'),(2462,1997,'Chevrolet','Express 3500'),(2463,1997,'Chevrolet','G-Series 1500'),(2464,1997,'Chevrolet','G-Series 2500'),(2465,1997,'Chevrolet','G-Series 3500'),(2466,1997,'Chevrolet','Lumina'),(2454,1997,'Chevrolet','Malibu'),(2467,1997,'Chevrolet','Monte Carlo'),(2468,1997,'Chevrolet','S10'),(2469,1997,'Chevrolet','Suburban 1500'),(2470,1997,'Chevrolet','Suburban 2500'),(2471,1997,'Chevrolet','Tahoe'),(2472,1997,'Chevrolet','Venture'),(2414,1997,'Chrysler','Cirrus'),(2415,1997,'Chrysler','Concorde'),(2416,1997,'Chrysler','LHS'),(2417,1997,'Chrysler','Sebring'),(2413,1997,'Chrysler','Town & Country'),(2486,1997,'Dodge','Avenger'),(2487,1997,'Dodge','Caravan'),(2489,1997,'Dodge','Dakota'),(2488,1997,'Dodge','Dakota Club'),(2490,1997,'Dodge','Grand Caravan'),(2491,1997,'Dodge','Intrepid'),(2492,1997,'Dodge','Neon'),(2494,1997,'Dodge','Ram 1500'),(2493,1997,'Dodge','Ram 1500 Club'),(2496,1997,'Dodge','Ram 2500'),(2495,1997,'Dodge','Ram 2500 Club'),(2498,1997,'Dodge','Ram 3500'),(2497,1997,'Dodge','Ram 3500 Club'),(2499,1997,'Dodge','Ram Van 1500'),(2500,1997,'Dodge','Ram Van 2500'),(2501,1997,'Dodge','Ram Van 3500'),(2485,1997,'Dodge','Stratus'),(2502,1997,'Dodge','Viper'),(2529,1997,'Eagle','Talon'),(2530,1997,'Eagle','Vision'),(2419,1997,'Ford','Aerostar'),(2420,1997,'Ford','Aspire'),(2421,1997,'Ford','Club Wagon'),(2422,1997,'Ford','Contour'),(2423,1997,'Ford','Crown Victoria'),(2424,1997,'Ford','Econoline E150'),(2425,1997,'Ford','Econoline E250'),(2426,1997,'Ford','Econoline E350'),(2427,1997,'Ford','Escort'),(2428,1997,'Ford','Expedition'),(2429,1997,'Ford','Explorer'),(2418,1997,'Ford','F-Series'),(2430,1997,'Ford','F150'),(2431,1997,'Ford','F250'),(2432,1997,'Ford','F350'),(2433,1997,'Ford','Mustang'),(2434,1997,'Ford','Probe'),(2435,1997,'Ford','Ranger'),(2436,1997,'Ford','Taurus'),(2437,1997,'Ford','Thunderbird'),(2438,1997,'Ford','Windstar'),(2531,1997,'Geo','Metro'),(2532,1997,'Geo','Prizm'),(2533,1997,'Geo','Tracker'),(2534,1997,'GMC','1500'),(2537,1997,'GMC','1500 Club Coupe'),(2535,1997,'GMC','2500'),(2538,1997,'GMC','2500 Club Coupe'),(2536,1997,'GMC','3500'),(2539,1997,'GMC','3500 Club Coupe'),(2540,1997,'GMC','Jimmy'),(2541,1997,'GMC','Safari'),(2542,1997,'GMC','Savana 1500'),(2543,1997,'GMC','Savana 2500'),(2544,1997,'GMC','Savana 3500'),(2546,1997,'GMC','Sonoma'),(2545,1997,'GMC','Sonoma Club Coupe'),(2547,1997,'GMC','Suburban 1500'),(2548,1997,'GMC','Suburban 2500'),(2549,1997,'GMC','Yukon'),(2484,1997,'Holden','VS Commodore'),(2380,1997,'Honda','Accord'),(2381,1997,'Honda','Civic'),(2383,1997,'Honda','CR-V'),(2386,1997,'Honda','Del Sol'),(2384,1997,'Honda','Odyssey'),(2385,1997,'Honda','Passport'),(2382,1997,'Honda','Prelude'),(2550,1997,'HUMMER','H1'),(2551,1997,'Hyundai','Accent'),(2552,1997,'Hyundai','Elantra'),(2553,1997,'Hyundai','Sonata'),(2554,1997,'Hyundai','Tiburon'),(2555,1997,'Infiniti','I'),(2556,1997,'Infiniti','J'),(2557,1997,'Infiniti','Q'),(2558,1997,'Infiniti','QX'),(2559,1997,'Isuzu','Hombre'),(2560,1997,'Isuzu','Hombre Space'),(2561,1997,'Isuzu','Oasis'),(2562,1997,'Isuzu','Rodeo'),(2563,1997,'Isuzu','Trooper'),(2564,1997,'Jaguar','XJ Series'),(2565,1997,'Jaguar','XK Series'),(2566,1997,'Jeep','Cherokee'),(2567,1997,'Jeep','Grand Cherokee'),(2568,1997,'Jeep','Wrangler'),(2356,1997,'Kia','Mentor'),(2354,1997,'Kia','Sephia'),(2355,1997,'Kia','Sportage'),(2379,1997,'Lamborghini','Diablo'),(2410,1997,'Land Rover','Defender'),(2412,1997,'Land Rover','Defender 90'),(2411,1997,'Land Rover','Discovery'),(2409,1997,'Land Rover','Range Rover'),(2353,1997,'Lexus','ES'),(2350,1997,'Lexus','GS'),(2349,1997,'Lexus','LS'),(2351,1997,'Lexus','LX'),(2352,1997,'Lexus','SC'),(2448,1997,'Lincoln','Continental'),(2449,1997,'Lincoln','Mark VIII'),(2450,1997,'Lincoln','Town Car'),(2518,1997,'Lotus','Esprit'),(2357,1997,'Mazda','626'),(2358,1997,'Mazda','B-Series'),(2364,1997,'Mazda','B-Series Plus'),(2365,1997,'Mazda','Miata MX-5'),(2363,1997,'Mazda','Millenia'),(2360,1997,'Mazda','MPV'),(2359,1997,'Mazda','MX-5'),(2362,1997,'Mazda','MX-6'),(2361,1997,'Mazda','Protege'),(2405,1997,'Mercedes-Benz','C-Class'),(2406,1997,'Mercedes-Benz','E-Class'),(2404,1997,'Mercedes-Benz','S-Class'),(2407,1997,'Mercedes-Benz','SL-Class'),(2408,1997,'Mercedes-Benz','SLK-Class'),(2374,1997,'Mercury','Cougar'),(2378,1997,'Mercury','Grand Marquis'),(2372,1997,'Mercury','Mountaineer'),(2376,1997,'Mercury','Mystique'),(2373,1997,'Mercury','Sable'),(2377,1997,'Mercury','Tracer'),(2375,1997,'Mercury','Villager'),(2399,1997,'Mitsubishi','3000GT'),(2397,1997,'Mitsubishi','Challenger'),(2393,1997,'Mitsubishi','Diamante'),(2396,1997,'Mitsubishi','Eclipse'),(2398,1997,'Mitsubishi','Galant'),(2394,1997,'Mitsubishi','GTO'),(2392,1997,'Mitsubishi','Mirage'),(2400,1997,'Mitsubishi','Montero'),(2401,1997,'Mitsubishi','Montero Sport'),(2395,1997,'Mitsubishi','Pajero'),(2569,1997,'Nissan','200SX'),(2570,1997,'Nissan','240SX'),(2571,1997,'Nissan','Altima'),(2572,1997,'Nissan','Maxima'),(2573,1997,'Nissan','Pathfinder'),(2574,1997,'Nissan','Quest'),(2575,1997,'Nissan','Sentra'),(2576,1997,'Oldsmobile','88'),(2577,1997,'Oldsmobile','Achieva'),(2578,1997,'Oldsmobile','Aurora'),(2579,1997,'Oldsmobile','Bravada'),(2580,1997,'Oldsmobile','Cutlass'),(2581,1997,'Oldsmobile','Cutlass Supreme'),(2582,1997,'Oldsmobile','LSS'),(2583,1997,'Oldsmobile','Regency'),(2584,1997,'Oldsmobile','Silhouette'),(2473,1997,'Plymouth','Breeze'),(2475,1997,'Plymouth','Grand Voyager'),(2476,1997,'Plymouth','Neon'),(2477,1997,'Plymouth','Prowler'),(2474,1997,'Plymouth','Voyager'),(2338,1997,'Pontiac','Bonneville'),(2337,1997,'Pontiac','Firebird'),(2335,1997,'Pontiac','Grand Am'),(2340,1997,'Pontiac','Grand Prix'),(2336,1997,'Pontiac','Sunfire'),(2339,1997,'Pontiac','Trans Sport'),(2402,1997,'Porsche','911'),(2403,1997,'Porsche','Boxster'),(2439,1997,'Saab','900'),(2440,1997,'Saab','9000'),(2585,1997,'Saturn','S-Series'),(2342,1997,'Subaru','Alcyone SVX'),(2343,1997,'Subaru','Impreza'),(2341,1997,'Subaru','Legacy'),(2344,1997,'Subaru','SVX'),(2348,1997,'Suzuki','Esteem'),(2345,1997,'Suzuki','Sidekick'),(2347,1997,'Suzuki','Swift'),(2346,1997,'Suzuki','X-90'),(2504,1997,'Toyota','4Runner'),(2505,1997,'Toyota','Avalon'),(2503,1997,'Toyota','Camry'),(2506,1997,'Toyota','Celica'),(2507,1997,'Toyota','Corolla'),(2508,1997,'Toyota','Land Cruiser'),(2509,1997,'Toyota','Paseo'),(2510,1997,'Toyota','Previa'),(2511,1997,'Toyota','RAV4'),(2512,1997,'Toyota','Supra'),(2513,1997,'Toyota','T100'),(2514,1997,'Toyota','T100 Xtra'),(2515,1997,'Toyota','Tacoma'),(2516,1997,'Toyota','Tacoma Xtra'),(2517,1997,'Toyota','Tercel'),(2443,1997,'Volkswagen','Cabriolet'),(2444,1997,'Volkswagen','Eurovan'),(2442,1997,'Volkswagen','Golf'),(2445,1997,'Volkswagen','GTI'),(2441,1997,'Volkswagen','Jetta'),(2446,1997,'Volkswagen','Passat'),(2447,1997,'Volkswagen','rio'),(2586,1997,'Volvo','850'),(2587,1997,'Volvo','960'),(2588,1997,'Volvo','S90'),(2589,1997,'Volvo','V90'),(2725,1998,'Acura','CL'),(2726,1998,'Acura','Integra'),(2727,1998,'Acura','NSX'),(2728,1998,'Acura','RL'),(2729,1998,'Acura','SLX'),(2730,1998,'Acura','TL'),(2697,1998,'Audi','A4'),(2699,1998,'Audi','A6'),(2700,1998,'Audi','A8'),(2698,1998,'Audi','Cabriolet'),(2701,1998,'Audi','riolet'),(2648,1998,'BMW','3 Series'),(2649,1998,'BMW','5 Series'),(2650,1998,'BMW','7 Series'),(2651,1998,'BMW','M3'),(2652,1998,'BMW','Z3'),(2687,1998,'Buick','Century'),(2689,1998,'Buick','LeSabre'),(2686,1998,'Buick','Park Avenue'),(2685,1998,'Buick','Regal'),(2688,1998,'Buick','Riviera'),(2684,1998,'Buick','Skylark'),(2731,1998,'Cadillac','Catera'),(2732,1998,'Cadillac','DeVille'),(2733,1998,'Cadillac','Eldorado'),(2734,1998,'Cadillac','Seville'),(2590,1998,'Chevrolet','1500'),(2591,1998,'Chevrolet','2500'),(2592,1998,'Chevrolet','3500'),(2594,1998,'Chevrolet','Astro'),(2595,1998,'Chevrolet','Blazer'),(2596,1998,'Chevrolet','Camaro'),(2597,1998,'Chevrolet','Cavalier'),(2593,1998,'Chevrolet','Corvette'),(2598,1998,'Chevrolet','Express 1500'),(2599,1998,'Chevrolet','Express 2500'),(2600,1998,'Chevrolet','Express 3500'),(2601,1998,'Chevrolet','G-Series 1500'),(2602,1998,'Chevrolet','G-Series 2500'),(2603,1998,'Chevrolet','G-Series 3500'),(2604,1998,'Chevrolet','Lumina'),(2605,1998,'Chevrolet','Malibu'),(2606,1998,'Chevrolet','Metro'),(2607,1998,'Chevrolet','Monte Carlo'),(2608,1998,'Chevrolet','Prizm'),(2609,1998,'Chevrolet','S10'),(2610,1998,'Chevrolet','Suburban 1500'),(2611,1998,'Chevrolet','Suburban 2500'),(2612,1998,'Chevrolet','Tahoe'),(2613,1998,'Chevrolet','Tracker'),(2614,1998,'Chevrolet','Venture'),(2735,1998,'Chrysler','Cirrus'),(2736,1998,'Chrysler','Concorde'),(2737,1998,'Chrysler','Sebring'),(2738,1998,'Chrysler','Town & Country'),(2708,1998,'Dodge','Avenger'),(2709,1998,'Dodge','Caravan'),(2711,1998,'Dodge','Dakota'),(2710,1998,'Dodge','Dakota Club'),(2712,1998,'Dodge','Durango'),(2713,1998,'Dodge','Grand Caravan'),(2707,1998,'Dodge','Intrepid'),(2714,1998,'Dodge','Neon'),(2716,1998,'Dodge','Ram 1500'),(2715,1998,'Dodge','Ram 1500 Club'),(2718,1998,'Dodge','Ram 2500'),(2717,1998,'Dodge','Ram 2500 Club'),(2719,1998,'Dodge','Ram 3500'),(2720,1998,'Dodge','Ram Van 1500'),(2721,1998,'Dodge','Ram Van 2500'),(2722,1998,'Dodge','Ram Van 3500'),(2723,1998,'Dodge','Stratus'),(2724,1998,'Dodge','Viper'),(2739,1998,'Eagle','Talon'),(2740,1998,'Ford','Club Wagon'),(2741,1998,'Ford','Contour'),(2742,1998,'Ford','Crown Victoria'),(2743,1998,'Ford','Econoline E150'),(2744,1998,'Ford','Econoline E250'),(2745,1998,'Ford','Econoline E350'),(2746,1998,'Ford','Escort'),(2747,1998,'Ford','Expedition'),(2748,1998,'Ford','Explorer'),(2749,1998,'Ford','F150'),(2750,1998,'Ford','F250'),(2751,1998,'Ford','Mustang'),(2752,1998,'Ford','Ranger'),(2753,1998,'Ford','Taurus'),(2754,1998,'Ford','Windstar'),(2755,1998,'GMC','1500'),(2758,1998,'GMC','1500 Club Coupe'),(2756,1998,'GMC','2500'),(2759,1998,'GMC','2500 Club Coupe'),(2757,1998,'GMC','3500'),(2760,1998,'GMC','3500 Club Coupe'),(2761,1998,'GMC','Envoy'),(2762,1998,'GMC','Jimmy'),(2763,1998,'GMC','Safari'),(2764,1998,'GMC','Savana 1500'),(2765,1998,'GMC','Savana 2500'),(2766,1998,'GMC','Savana 3500'),(2768,1998,'GMC','Sonoma'),(2767,1998,'GMC','Sonoma Club Coupe'),(2769,1998,'GMC','Suburban 1500'),(2770,1998,'GMC','Suburban 2500'),(2771,1998,'GMC','Yukon'),(2619,1998,'Honda','Accord'),(2618,1998,'Honda','Civic'),(2617,1998,'Honda','CR-V'),(2620,1998,'Honda','Odyssey'),(2621,1998,'Honda','Passport'),(2622,1998,'Honda','Prelude'),(2772,1998,'HUMMER','H1'),(2773,1998,'Hyundai','Accent'),(2774,1998,'Hyundai','Elantra'),(2775,1998,'Hyundai','Sonata'),(2776,1998,'Hyundai','Tiburon'),(2777,1998,'Infiniti','I'),(2778,1998,'Infiniti','Q'),(2779,1998,'Infiniti','QX'),(2780,1998,'Isuzu','Amigo'),(2781,1998,'Isuzu','Hombre'),(2782,1998,'Isuzu','Hombre Space'),(2783,1998,'Isuzu','Oasis'),(2784,1998,'Isuzu','Rodeo'),(2785,1998,'Isuzu','Trooper'),(2786,1998,'Jaguar','XJ Series'),(2787,1998,'Jaguar','XK Series'),(2788,1998,'Jeep','Cherokee'),(2789,1998,'Jeep','Grand Cherokee'),(2790,1998,'Jeep','Wrangler'),(2702,1998,'Kia','Sephia'),(2703,1998,'Kia','Sportage'),(2696,1998,'Lamborghini','Diablo'),(2705,1998,'Land Rover','Discovery'),(2706,1998,'Land Rover','Range Rover'),(2643,1998,'Lexus','ES'),(2644,1998,'Lexus','GS'),(2647,1998,'Lexus','LS'),(2646,1998,'Lexus','LX'),(2645,1998,'Lexus','SC'),(2663,1998,'Lincoln','Continental'),(2662,1998,'Lincoln','Mark VIII'),(2661,1998,'Lincoln','Navigator'),(2660,1998,'Lincoln','Town Car'),(2704,1998,'Lotus','Esprit'),(2626,1998,'Mazda','626'),(2627,1998,'Mazda','B-Series'),(2632,1998,'Mazda','B-Series Plus'),(2628,1998,'Mazda','Millenia'),(2629,1998,'Mazda','MPV'),(2631,1998,'Mazda','MX-5'),(2630,1998,'Mazda','Protege'),(2671,1998,'Mercedes-Benz','C-Class'),(2670,1998,'Mercedes-Benz','CL-Class'),(2675,1998,'Mercedes-Benz','CLK-Class'),(2672,1998,'Mercedes-Benz','E-Class'),(2668,1998,'Mercedes-Benz','M-Class'),(2669,1998,'Mercedes-Benz','S-Class'),(2673,1998,'Mercedes-Benz','SL-Class'),(2674,1998,'Mercedes-Benz','SLK-Class'),(2677,1998,'Mercury','Grand Marquis'),(2679,1998,'Mercury','Mountaineer'),(2681,1998,'Mercury','Mystique'),(2680,1998,'Mercury','Sable'),(2678,1998,'Mercury','Tracer'),(2676,1998,'Mercury','Villager'),(2640,1998,'Mitsubishi','3000GT'),(2635,1998,'Mitsubishi','Challenger'),(2636,1998,'Mitsubishi','Diamante'),(2638,1998,'Mitsubishi','Eclipse'),(2634,1998,'Mitsubishi','Galant'),(2639,1998,'Mitsubishi','GTO'),(2633,1998,'Mitsubishi','Mirage'),(2641,1998,'Mitsubishi','Montero'),(2642,1998,'Mitsubishi','Montero Sport'),(2637,1998,'Mitsubishi','Pajero'),(2791,1998,'Nissan','200SX'),(2792,1998,'Nissan','240SX'),(2793,1998,'Nissan','Altima'),(2794,1998,'Nissan','Frontier'),(2795,1998,'Nissan','Maxima'),(2796,1998,'Nissan','Pathfinder'),(2797,1998,'Nissan','Quest'),(2798,1998,'Nissan','Sentra'),(2799,1998,'Oldsmobile','88'),(2800,1998,'Oldsmobile','Achieva'),(2801,1998,'Oldsmobile','Aurora'),(2802,1998,'Oldsmobile','Bravada'),(2803,1998,'Oldsmobile','Cutlass'),(2804,1998,'Oldsmobile','Intrigue'),(2805,1998,'Oldsmobile','LSS'),(2806,1998,'Oldsmobile','Regency'),(2807,1998,'Oldsmobile','Silhouette'),(2808,1998,'Plymouth','Breeze'),(2809,1998,'Plymouth','Grand Voyager'),(2810,1998,'Plymouth','Neon'),(2811,1998,'Plymouth','Voyager'),(2695,1998,'Pontiac','Bonneville'),(2692,1998,'Pontiac','Firebird'),(2690,1998,'Pontiac','Grand Am'),(2691,1998,'Pontiac','Grand Prix'),(2693,1998,'Pontiac','Sunfire'),(2694,1998,'Pontiac','Trans Sport'),(2615,1998,'Porsche','911'),(2616,1998,'Porsche','Boxster'),(2682,1998,'Saab','900'),(2683,1998,'Saab','9000'),(2812,1998,'Saturn','S-Series'),(2623,1998,'Subaru','Forester'),(2625,1998,'Subaru','Impreza'),(2624,1998,'Subaru','Legacy'),(2665,1998,'Suzuki','Esteem'),(2666,1998,'Suzuki','Sidekick'),(2667,1998,'Suzuki','Swift'),(2664,1998,'Suzuki','X-90'),(2813,1998,'Toyota','4Runner'),(2814,1998,'Toyota','Avalon'),(2815,1998,'Toyota','Camry'),(2816,1998,'Toyota','Celica'),(2817,1998,'Toyota','Corolla'),(2818,1998,'Toyota','Land Cruiser'),(2819,1998,'Toyota','RAV4'),(2820,1998,'Toyota','Sienna'),(2821,1998,'Toyota','Supra'),(2822,1998,'Toyota','T100'),(2823,1998,'Toyota','T100 Xtra'),(2824,1998,'Toyota','Tacoma'),(2825,1998,'Toyota','Tacoma Xtra'),(2826,1998,'Toyota','Tercel'),(2657,1998,'Volkswagen','Cabriolet'),(2653,1998,'Volkswagen','Golf'),(2655,1998,'Volkswagen','GTI'),(2656,1998,'Volkswagen','Jetta'),(2658,1998,'Volkswagen','New Beetle'),(2654,1998,'Volkswagen','Passat'),(2659,1998,'Volkswagen','rio'),(2827,1998,'Volvo','C70'),(2828,1998,'Volvo','S70'),(2829,1998,'Volvo','S90'),(2830,1998,'Volvo','V70'),(2831,1998,'Volvo','V90'),(2993,1999,'Acura','CL'),(2994,1999,'Acura','Integra'),(2995,1999,'Acura','NSX'),(2996,1999,'Acura','RL'),(2997,1999,'Acura','SLX'),(2998,1999,'Acura','TL'),(2936,1999,'Audi','A4'),(2938,1999,'Audi','A6'),(2937,1999,'Audi','A8'),(2939,1999,'BMW','3 Series'),(2940,1999,'BMW','5 Series'),(2941,1999,'BMW','7 Series'),(2943,1999,'BMW','M3'),(2942,1999,'BMW','Z3'),(2966,1999,'Buick','Century'),(2964,1999,'Buick','LeSabre'),(2968,1999,'Buick','Park Avenue'),(2967,1999,'Buick','Regal'),(2965,1999,'Buick','Riviera'),(2999,1999,'Cadillac','Catera'),(3000,1999,'Cadillac','DeVille'),(3001,1999,'Cadillac','Eldorado'),(3002,1999,'Cadillac','Escalade'),(3003,1999,'Cadillac','Seville'),(2832,1999,'Chevrolet','1500'),(2833,1999,'Chevrolet','2500'),(2834,1999,'Chevrolet','3500'),(2836,1999,'Chevrolet','Astro'),(2838,1999,'Chevrolet','Blazer'),(2839,1999,'Chevrolet','Camaro'),(2840,1999,'Chevrolet','Cavalier'),(2835,1999,'Chevrolet','Corvette'),(2841,1999,'Chevrolet','Express 1500'),(2842,1999,'Chevrolet','Express 2500'),(2843,1999,'Chevrolet','Express 3500'),(2844,1999,'Chevrolet','Lumina'),(2845,1999,'Chevrolet','Malibu'),(2846,1999,'Chevrolet','Metro'),(2847,1999,'Chevrolet','Monte Carlo'),(2848,1999,'Chevrolet','Prizm'),(2849,1999,'Chevrolet','S10'),(2837,1999,'Chevrolet','Silverado'),(2850,1999,'Chevrolet','Silverado 1500'),(2851,1999,'Chevrolet','Silverado 2500'),(2852,1999,'Chevrolet','Suburban 1500'),(2853,1999,'Chevrolet','Suburban 2500'),(2854,1999,'Chevrolet','Tahoe'),(2855,1999,'Chevrolet','Tracker'),(2856,1999,'Chevrolet','Venture'),(3004,1999,'Chrysler','300'),(2990,1999,'Chrysler','300M'),(3005,1999,'Chrysler','Cirrus'),(3006,1999,'Chrysler','Concorde'),(3007,1999,'Chrysler','LHS'),(3008,1999,'Chrysler','Sebring'),(3009,1999,'Chrysler','Town & Country'),(2992,1999,'Corbin','Sparrow'),(3010,1999,'Daewoo','Lanos'),(3011,1999,'Daewoo','Leganza'),(3012,1999,'Daewoo','Nubira'),(2919,1999,'Dodge','Avenger'),(2920,1999,'Dodge','Caravan'),(2917,1999,'Dodge','Charger'),(2922,1999,'Dodge','Dakota'),(2921,1999,'Dodge','Dakota Club'),(2923,1999,'Dodge','Durango'),(2924,1999,'Dodge','Grand Caravan'),(2918,1999,'Dodge','Intrepid'),(2925,1999,'Dodge','Neon'),(2927,1999,'Dodge','Ram 1500'),(2926,1999,'Dodge','Ram 1500 Club'),(2929,1999,'Dodge','Ram 2500'),(2928,1999,'Dodge','Ram 2500 Club'),(2930,1999,'Dodge','Ram 3500'),(2931,1999,'Dodge','Ram Van 1500'),(2932,1999,'Dodge','Ram Van 2500'),(2933,1999,'Dodge','Ram Van 3500'),(2934,1999,'Dodge','Stratus'),(2935,1999,'Dodge','Viper'),(3013,1999,'Ford','Contour'),(3014,1999,'Ford','Crown Victoria'),(3015,1999,'Ford','Econoline E150'),(3016,1999,'Ford','Econoline E250'),(3017,1999,'Ford','Econoline E350'),(3018,1999,'Ford','Escort'),(3019,1999,'Ford','Expedition'),(3020,1999,'Ford','Explorer'),(3021,1999,'Ford','F150'),(3022,1999,'Ford','F250'),(3023,1999,'Ford','F350'),(3024,1999,'Ford','Mustang'),(3025,1999,'Ford','Ranger'),(3026,1999,'Ford','Taurus'),(3027,1999,'Ford','Windstar'),(2972,1999,'GMC','1500 Club Coupe'),(2969,1999,'GMC','2500'),(2970,1999,'GMC','3500'),(2973,1999,'GMC','Envoy'),(2971,1999,'GMC','EV1'),(2974,1999,'GMC','Jimmy'),(2975,1999,'GMC','Safari'),(2976,1999,'GMC','Savana 1500'),(2977,1999,'GMC','Savana 2500'),(2978,1999,'GMC','Savana 3500'),(2979,1999,'GMC','Sierra 1500'),(2980,1999,'GMC','Sierra 2500'),(2981,1999,'GMC','Sonoma'),(2982,1999,'GMC','Suburban 1500'),(2983,1999,'GMC','Suburban 2500'),(2984,1999,'GMC','Yukon'),(2867,1999,'Honda','Accord'),(2868,1999,'Honda','Civic'),(2865,1999,'Honda','CR-V'),(2870,1999,'Honda','Odyssey'),(2866,1999,'Honda','Passport'),(2869,1999,'Honda','Prelude'),(3028,1999,'HUMMER','H1'),(3029,1999,'Hyundai','Accent'),(3030,1999,'Hyundai','Elantra'),(3031,1999,'Hyundai','Sonata'),(3032,1999,'Hyundai','Tiburon'),(3033,1999,'Infiniti','G'),(3034,1999,'Infiniti','I'),(3035,1999,'Infiniti','Q'),(3036,1999,'Infiniti','QX'),(3037,1999,'Isuzu','Amigo'),(3038,1999,'Isuzu','Hombre'),(3039,1999,'Isuzu','Hombre Space'),(3040,1999,'Isuzu','Oasis'),(3041,1999,'Isuzu','Rodeo'),(3042,1999,'Isuzu','Trooper'),(3043,1999,'Isuzu','VehiCROSS'),(3044,1999,'Jaguar','XJ Series'),(3045,1999,'Jaguar','XK Series'),(2988,1999,'Jeep','Cherokee'),(2987,1999,'Jeep','Grand Cherokee'),(2989,1999,'Jeep','Wrangler'),(2986,1999,'Kia','Sephia'),(2985,1999,'Kia','Sportage'),(2906,1999,'Lamborghini','Diablo'),(2908,1999,'Land Rover','Discovery'),(2909,1999,'Land Rover','Discovery Series II'),(2907,1999,'Land Rover','Range Rover'),(2946,1999,'Lexus','ES'),(2948,1999,'Lexus','GS'),(2944,1999,'Lexus','LS'),(2949,1999,'Lexus','LX'),(2947,1999,'Lexus','RX'),(2945,1999,'Lexus','SC'),(2911,1999,'Lincoln','Continental'),(2912,1999,'Lincoln','Navigator'),(2910,1999,'Lincoln','Town Car'),(2991,1999,'Lotus','Esprit'),(2957,1999,'Mazda','626'),(2959,1999,'Mazda','B-Series'),(2962,1999,'Mazda','B-Series Plus'),(2963,1999,'Mazda','Miata MX-5'),(2961,1999,'Mazda','Millenia'),(2958,1999,'Mazda','MX-5'),(2960,1999,'Mazda','Protege'),(2897,1999,'Mercedes-Benz','C-Class'),(2898,1999,'Mercedes-Benz','CL-Class'),(2894,1999,'Mercedes-Benz','CLK-Class'),(2896,1999,'Mercedes-Benz','E-Class'),(2895,1999,'Mercedes-Benz','M-Class'),(2900,1999,'Mercedes-Benz','S-Class'),(2899,1999,'Mercedes-Benz','SL-Class'),(2901,1999,'Mercedes-Benz','SLK-Class'),(2956,1999,'Mercury','Cougar'),(2955,1999,'Mercury','Grand Marquis'),(2952,1999,'Mercury','Mountaineer'),(2950,1999,'Mercury','Mystique'),(2951,1999,'Mercury','Sable'),(2953,1999,'Mercury','Tracer'),(2954,1999,'Mercury','Villager'),(2878,1999,'Mitsubishi','3000GT'),(2873,1999,'Mitsubishi','Challenger'),(2877,1999,'Mitsubishi','Diamante'),(2872,1999,'Mitsubishi','Eclipse'),(2875,1999,'Mitsubishi','Galant'),(2876,1999,'Mitsubishi','GTO'),(2871,1999,'Mitsubishi','Mirage'),(2879,1999,'Mitsubishi','Montero'),(2880,1999,'Mitsubishi','Montero Sport'),(2874,1999,'Mitsubishi','Pajero'),(3046,1999,'Nissan','Altima'),(3047,1999,'Nissan','Frontier'),(3048,1999,'Nissan','Maxima'),(3049,1999,'Nissan','Pathfinder'),(3050,1999,'Nissan','Quest'),(3051,1999,'Nissan','Sentra'),(3052,1999,'Oldsmobile','88'),(3053,1999,'Oldsmobile','Alero'),(3054,1999,'Oldsmobile','Aurora'),(3055,1999,'Oldsmobile','Bravada'),(3056,1999,'Oldsmobile','Cutlass'),(3057,1999,'Oldsmobile','Intrigue'),(3058,1999,'Oldsmobile','LSS'),(3059,1999,'Oldsmobile','Silhouette'),(3060,1999,'Plymouth','Breeze'),(3061,1999,'Plymouth','Grand Voyager'),(3062,1999,'Plymouth','Neon'),(3063,1999,'Plymouth','Prowler'),(3064,1999,'Plymouth','Voyager'),(2892,1999,'Pontiac','Bonneville'),(2888,1999,'Pontiac','Firebird'),(2891,1999,'Pontiac','Firebird Formula'),(2890,1999,'Pontiac','Grand Am'),(2887,1999,'Pontiac','Grand Prix'),(2893,1999,'Pontiac','Montana'),(2886,1999,'Pontiac','Sunfire'),(2889,1999,'Pontiac','Trans Sport'),(2884,1999,'Porsche','911'),(2885,1999,'Porsche','Boxster'),(2915,1999,'Saab','9-3'),(2916,1999,'Saab','9-5'),(2913,1999,'Saab','900'),(2914,1999,'Saab','9000'),(3065,1999,'Saturn','S-Series'),(2883,1999,'Subaru','Forester'),(2882,1999,'Subaru','Impreza'),(2881,1999,'Subaru','Legacy'),(2903,1999,'Suzuki','Esteem'),(2904,1999,'Suzuki','Grand Vitara'),(2905,1999,'Suzuki','Swift'),(2902,1999,'Suzuki','Vitara'),(3066,1999,'Toyota','4Runner'),(3067,1999,'Toyota','Avalon'),(3068,1999,'Toyota','Camry'),(3069,1999,'Toyota','Celica'),(3070,1999,'Toyota','Corolla'),(3071,1999,'Toyota','Land Cruiser'),(3072,1999,'Toyota','RAV4'),(3073,1999,'Toyota','Sienna'),(3074,1999,'Toyota','Solara'),(3075,1999,'Toyota','Tacoma'),(3076,1999,'Toyota','Tacoma Xtra'),(2860,1999,'Volkswagen','Cabriolet'),(2861,1999,'Volkswagen','Eurovan'),(2858,1999,'Volkswagen','Golf'),(2863,1999,'Volkswagen','GTI'),(2862,1999,'Volkswagen','Jetta'),(2857,1999,'Volkswagen','New Beetle'),(2859,1999,'Volkswagen','Passat'),(2864,1999,'Volkswagen','rio'),(3077,1999,'Volvo','C70'),(3078,1999,'Volvo','S70'),(3079,1999,'Volvo','S80'),(3080,1999,'Volvo','V70'),(3231,2000,'Acura','Integra'),(3232,2000,'Acura','NSX'),(3233,2000,'Acura','RL'),(3234,2000,'Acura','TL'),(3194,2000,'Audi','A4'),(3195,2000,'Audi','A6'),(3197,2000,'Audi','A8'),(3196,2000,'Audi','S4'),(3193,2000,'Audi','TT'),(3117,2000,'BMW','3 Series'),(3118,2000,'BMW','5 Series'),(3119,2000,'BMW','7 Series'),(3121,2000,'BMW','M'),(3122,2000,'BMW','M5'),(3120,2000,'BMW','X5'),(3123,2000,'BMW','Z3'),(3124,2000,'BMW','Z8'),(3161,2000,'Buick','Century'),(3159,2000,'Buick','LeSabre'),(3158,2000,'Buick','Park Avenue'),(3160,2000,'Buick','Regal'),(3235,2000,'Cadillac','Catera'),(3236,2000,'Cadillac','DeVille'),(3237,2000,'Cadillac','Eldorado'),(3238,2000,'Cadillac','Escalade'),(3239,2000,'Cadillac','Seville'),(3240,2000,'Chevrolet','2500'),(3241,2000,'Chevrolet','3500'),(3242,2000,'Chevrolet','Astro'),(3243,2000,'Chevrolet','Blazer'),(3244,2000,'Chevrolet','Camaro'),(3245,2000,'Chevrolet','Cavalier'),(3246,2000,'Chevrolet','Corvette'),(3247,2000,'Chevrolet','Express 1500'),(3248,2000,'Chevrolet','Express 2500'),(3249,2000,'Chevrolet','Express 3500'),(3250,2000,'Chevrolet','Impala'),(3251,2000,'Chevrolet','Lumina'),(3252,2000,'Chevrolet','Malibu'),(3253,2000,'Chevrolet','Metro'),(3254,2000,'Chevrolet','Monte Carlo'),(3255,2000,'Chevrolet','Prizm'),(3256,2000,'Chevrolet','S10'),(3257,2000,'Chevrolet','Silverado 1500'),(3258,2000,'Chevrolet','Silverado 2500'),(3259,2000,'Chevrolet','Suburban 1500'),(3260,2000,'Chevrolet','Suburban 2500'),(3261,2000,'Chevrolet','Tahoe'),(3262,2000,'Chevrolet','Tracker'),(3263,2000,'Chevrolet','Venture'),(3220,2000,'Chrysler','300M'),(3221,2000,'Chrysler','Cirrus'),(3222,2000,'Chrysler','Concorde'),(3223,2000,'Chrysler','Grand Voyager'),(3224,2000,'Chrysler','LHS'),(3225,2000,'Chrysler','Sebring'),(3226,2000,'Chrysler','Town & Country'),(3227,2000,'Chrysler','Voyager'),(3264,2000,'Daewoo','Lanos'),(3265,2000,'Daewoo','Leganza'),(3266,2000,'Daewoo','Nubira'),(3267,2000,'Dodge','Avenger'),(3268,2000,'Dodge','Caravan'),(3270,2000,'Dodge','Dakota'),(3269,2000,'Dodge','Dakota Club'),(3271,2000,'Dodge','Durango'),(3272,2000,'Dodge','Grand Caravan'),(3273,2000,'Dodge','Intrepid'),(3274,2000,'Dodge','Neon'),(3276,2000,'Dodge','Ram 1500'),(3275,2000,'Dodge','Ram 1500 Club'),(3277,2000,'Dodge','Ram 2500'),(3278,2000,'Dodge','Ram 3500'),(3279,2000,'Dodge','Ram Van 1500'),(3280,2000,'Dodge','Ram Van 2500'),(3281,2000,'Dodge','Ram Van 3500'),(3282,2000,'Dodge','Stratus'),(3283,2000,'Dodge','Viper'),(3173,2000,'Ford','Contour'),(3176,2000,'Ford','Crown Victoria'),(3177,2000,'Ford','Econoline E150'),(3178,2000,'Ford','Econoline E250'),(3179,2000,'Ford','Econoline E350'),(3175,2000,'Ford','Escape'),(3180,2000,'Ford','Escort'),(3181,2000,'Ford','Excursion'),(3182,2000,'Ford','Expedition'),(3183,2000,'Ford','Explorer'),(3184,2000,'Ford','Explorer Sport'),(3174,2000,'Ford','Explorer Sport Trac'),(3185,2000,'Ford','F150'),(3186,2000,'Ford','F250'),(3187,2000,'Ford','F350'),(3188,2000,'Ford','Focus'),(3189,2000,'Ford','Mustang'),(3190,2000,'Ford','Ranger'),(3191,2000,'Ford','Taurus'),(3172,2000,'Ford','Th!nk'),(3192,2000,'Ford','Windstar'),(3284,2000,'GMC','Envoy'),(3285,2000,'GMC','Jimmy'),(3286,2000,'GMC','Safari'),(3287,2000,'GMC','Savana 1500'),(3288,2000,'GMC','Savana 2500'),(3289,2000,'GMC','Savana 3500'),(3292,2000,'GMC','Sierra 1500'),(3290,2000,'GMC','Sierra 2500'),(3291,2000,'GMC','Sierra 3500'),(3293,2000,'GMC','Sonoma'),(3294,2000,'GMC','Yukon'),(3295,2000,'GMC','Yukon Denali'),(3296,2000,'GMC','Yukon XL 1500'),(3297,2000,'GMC','Yukon XL 2500'),(3090,2000,'Honda','Accord'),(3086,2000,'Honda','Civic'),(3087,2000,'Honda','CR-V'),(3085,2000,'Honda','Insight'),(3088,2000,'Honda','Odyssey'),(3089,2000,'Honda','Passport'),(3091,2000,'Honda','Prelude'),(3092,2000,'Honda','S2000'),(3298,2000,'HUMMER','H1'),(3299,2000,'Hyundai','Accent'),(3300,2000,'Hyundai','Elantra'),(3301,2000,'Hyundai','Sonata'),(3302,2000,'Hyundai','Tiburon'),(3303,2000,'Infiniti','G'),(3304,2000,'Infiniti','I'),(3305,2000,'Infiniti','Q'),(3306,2000,'Infiniti','QX'),(3307,2000,'Isuzu','Amigo'),(3308,2000,'Isuzu','Hombre'),(3309,2000,'Isuzu','Hombre Space'),(3310,2000,'Isuzu','Rodeo'),(3311,2000,'Isuzu','Trooper'),(3312,2000,'Isuzu','VehiCROSS'),(3313,2000,'Jaguar','S-Type'),(3314,2000,'Jaguar','XJ Series'),(3315,2000,'Jaguar','XK Series'),(3316,2000,'Jeep','Cherokee'),(3317,2000,'Jeep','Grand Cherokee'),(3318,2000,'Jeep','Wrangler'),(3141,2000,'Kia','Sephia'),(3142,2000,'Kia','Spectra'),(3140,2000,'Kia','Sportage'),(3139,2000,'Lamborghini','Diablo'),(3229,2000,'Land Rover','Discovery'),(3230,2000,'Land Rover','Discovery Series II'),(3228,2000,'Land Rover','Range Rover'),(3156,2000,'Lexus','ES'),(3155,2000,'Lexus','GS'),(3153,2000,'Lexus','LS'),(3154,2000,'Lexus','LX'),(3152,2000,'Lexus','RX'),(3157,2000,'Lexus','SC'),(3162,2000,'Lincoln','Continental'),(3163,2000,'Lincoln','LS'),(3164,2000,'Lincoln','Navigator'),(3165,2000,'Lincoln','Town Car'),(3143,2000,'Lotus','Esprit'),(3097,2000,'Mazda','626'),(3099,2000,'Mazda','B-Series'),(3103,2000,'Mazda','B-Series Plus'),(3104,2000,'Mazda','Miata MX-5'),(3102,2000,'Mazda','Millenia'),(3098,2000,'Mazda','MPV'),(3101,2000,'Mazda','MX-5'),(3100,2000,'Mazda','Protege'),(3105,2000,'Mercedes-Benz','C-Class'),(3112,2000,'Mercedes-Benz','CL-Class'),(3107,2000,'Mercedes-Benz','CLK-Class'),(3108,2000,'Mercedes-Benz','E-Class'),(3109,2000,'Mercedes-Benz','M-Class'),(3110,2000,'Mercedes-Benz','S-Class'),(3106,2000,'Mercedes-Benz','SL-Class'),(3111,2000,'Mercedes-Benz','SLK-Class'),(3129,2000,'Mercury','Cougar'),(3128,2000,'Mercury','Grand Marquis'),(3126,2000,'Mercury','Mountaineer'),(3130,2000,'Mercury','Mystique'),(3125,2000,'Mercury','Sable'),(3127,2000,'Mercury','Villager'),(3144,2000,'Mitsubishi','Challenger'),(3148,2000,'Mitsubishi','Diamante'),(3146,2000,'Mitsubishi','Eclipse'),(3149,2000,'Mitsubishi','Galant'),(3145,2000,'Mitsubishi','Mirage'),(3150,2000,'Mitsubishi','Montero'),(3151,2000,'Mitsubishi','Montero Sport'),(3147,2000,'Mitsubishi','Pajero'),(3214,2000,'Nissan','Altima'),(3215,2000,'Nissan','Frontier'),(3216,2000,'Nissan','Maxima'),(3217,2000,'Nissan','Pathfinder'),(3218,2000,'Nissan','Quest'),(3219,2000,'Nissan','Sentra'),(3213,2000,'Nissan','Xterra'),(3319,2000,'Oldsmobile','Alero'),(3320,2000,'Oldsmobile','Bravada'),(3321,2000,'Oldsmobile','Intrigue'),(3322,2000,'Oldsmobile','Silhouette'),(3323,2000,'Plymouth','Breeze'),(3324,2000,'Plymouth','Grand Voyager'),(3325,2000,'Plymouth','Neon'),(3326,2000,'Plymouth','Prowler'),(3327,2000,'Plymouth','Voyager'),(3171,2000,'Pontiac','Bonneville'),(3168,2000,'Pontiac','Firebird'),(3170,2000,'Pontiac','Grand Am'),(3166,2000,'Pontiac','Grand Prix'),(3169,2000,'Pontiac','Montana'),(3167,2000,'Pontiac','Sunfire'),(3093,2000,'Porsche','911'),(3094,2000,'Porsche','Boxster'),(3095,2000,'Saab','9-3'),(3096,2000,'Saab','9-5'),(3328,2000,'Saturn','L-Series'),(3329,2000,'Saturn','S-Series'),(3081,2000,'Subaru','Forester'),(3082,2000,'Subaru','Impreza'),(3083,2000,'Subaru','Legacy'),(3084,2000,'Subaru','Outback'),(3113,2000,'Suzuki','Esteem'),(3116,2000,'Suzuki','Grand Vitara'),(3115,2000,'Suzuki','Swift'),(3114,2000,'Suzuki','Vitara'),(3200,2000,'Toyota','4Runner'),(3201,2000,'Toyota','Avalon'),(3202,2000,'Toyota','Camry'),(3203,2000,'Toyota','Celica'),(3204,2000,'Toyota','Corolla'),(3205,2000,'Toyota','Echo'),(3199,2000,'Toyota','Ipsum'),(3206,2000,'Toyota','Land Cruiser'),(3207,2000,'Toyota','MR2'),(3208,2000,'Toyota','RAV4'),(3209,2000,'Toyota','Sienna'),(3210,2000,'Toyota','Solara'),(3211,2000,'Toyota','Tacoma'),(3212,2000,'Toyota','Tacoma Xtra'),(3198,2000,'Toyota','Tundra'),(3137,2000,'Volkswagen','Cabriolet'),(3133,2000,'Volkswagen','Eurovan'),(3131,2000,'Volkswagen','Golf'),(3135,2000,'Volkswagen','GTI'),(3132,2000,'Volkswagen','Jetta'),(3136,2000,'Volkswagen','New Beetle'),(3134,2000,'Volkswagen','Passat'),(3138,2000,'Volkswagen','rio'),(3330,2000,'Volvo','C70'),(3331,2000,'Volvo','S40'),(3332,2000,'Volvo','S70'),(3333,2000,'Volvo','S80'),(3334,2000,'Volvo','V40'),(3335,2000,'Volvo','V70'),(3508,2001,'Acura','CL'),(3509,2001,'Acura','Integra'),(3507,2001,'Acura','MDX'),(3510,2001,'Acura','NSX'),(3511,2001,'Acura','RL'),(3512,2001,'Acura','TL'),(3390,2001,'Audi','A4'),(3385,2001,'Audi','A6'),(3389,2001,'Audi','A8'),(3388,2001,'Audi','Allroad'),(3386,2001,'Audi','S4'),(3384,2001,'Audi','S8'),(3387,2001,'Audi','TT'),(3437,2001,'BMW','3 Series'),(3438,2001,'BMW','5 Series'),(3440,2001,'BMW','525'),(3441,2001,'BMW','530'),(3439,2001,'BMW','7 Series'),(3443,2001,'BMW','M'),(3444,2001,'BMW','M3'),(3445,2001,'BMW','M5'),(3442,2001,'BMW','X5'),(3446,2001,'BMW','Z3'),(3447,2001,'BMW','Z8'),(3523,2001,'Buick','Century'),(3525,2001,'Buick','LeSabre'),(3522,2001,'Buick','Park Avenue'),(3524,2001,'Buick','Regal'),(3526,2001,'Cadillac','Catera'),(3527,2001,'Cadillac','DeVille'),(3528,2001,'Cadillac','Eldorado'),(3529,2001,'Cadillac','Seville'),(3484,2001,'Chevrolet','Astro'),(3485,2001,'Chevrolet','Blazer'),(3486,2001,'Chevrolet','Camaro'),(3487,2001,'Chevrolet','Cavalier'),(3488,2001,'Chevrolet','Corvette'),(3489,2001,'Chevrolet','Express 1500'),(3490,2001,'Chevrolet','Express 2500'),(3491,2001,'Chevrolet','Express 3500'),(3492,2001,'Chevrolet','Impala'),(3493,2001,'Chevrolet','Lumina'),(3494,2001,'Chevrolet','Malibu'),(3495,2001,'Chevrolet','Metro'),(3496,2001,'Chevrolet','Monte Carlo'),(3497,2001,'Chevrolet','Prizm'),(3498,2001,'Chevrolet','S10'),(3483,2001,'Chevrolet','Silverado'),(3499,2001,'Chevrolet','Silverado 1500'),(3500,2001,'Chevrolet','Silverado 2500'),(3501,2001,'Chevrolet','Silverado 3500'),(3502,2001,'Chevrolet','Suburban 1500'),(3503,2001,'Chevrolet','Suburban 2500'),(3504,2001,'Chevrolet','Tahoe'),(3505,2001,'Chevrolet','Tracker'),(3506,2001,'Chevrolet','Venture'),(3514,2001,'Chrysler','300M'),(3515,2001,'Chrysler','Concorde'),(3516,2001,'Chrysler','LHS'),(3517,2001,'Chrysler','Prowler'),(3513,2001,'Chrysler','PT Cruiser'),(3518,2001,'Chrysler','Sebring'),(3519,2001,'Chrysler','Town & Country'),(3520,2001,'Chrysler','Voyager'),(3530,2001,'Daewoo','Lanos'),(3531,2001,'Daewoo','Leganza'),(3532,2001,'Daewoo','Nubira'),(3533,2001,'Dodge','Caravan'),(3535,2001,'Dodge','Dakota'),(3534,2001,'Dodge','Dakota Club'),(3536,2001,'Dodge','Durango'),(3537,2001,'Dodge','Grand Caravan'),(3538,2001,'Dodge','Intrepid'),(3539,2001,'Dodge','Neon'),(3541,2001,'Dodge','Ram 1500'),(3540,2001,'Dodge','Ram 1500 Club'),(3542,2001,'Dodge','Ram 2500'),(3543,2001,'Dodge','Ram 3500'),(3544,2001,'Dodge','Ram Van 1500'),(3545,2001,'Dodge','Ram Van 2500'),(3546,2001,'Dodge','Ram Van 3500'),(3547,2001,'Dodge','Stratus'),(3548,2001,'Dodge','Viper'),(3358,2001,'Ford','Crown Victoria'),(3346,2001,'Ford','E-Series'),(3359,2001,'Ford','Econoline E150'),(3360,2001,'Ford','Econoline E250'),(3361,2001,'Ford','Econoline E350'),(3348,2001,'Ford','Escape'),(3352,2001,'Ford','Escort'),(3362,2001,'Ford','Excursion'),(3353,2001,'Ford','Expedition'),(3344,2001,'Ford','Explorer'),(3363,2001,'Ford','Explorer Sport'),(3355,2001,'Ford','Explorer Sport Trac'),(3345,2001,'Ford','F-Series'),(3364,2001,'Ford','F150'),(3365,2001,'Ford','F250'),(3366,2001,'Ford','F350'),(3357,2001,'Ford','Fiesta'),(3351,2001,'Ford','Focus'),(3354,2001,'Ford','Mustang'),(3350,2001,'Ford','Ranger'),(3349,2001,'Ford','Taurus'),(3356,2001,'Ford','TH!NK'),(3347,2001,'Ford','Windstar'),(3367,2001,'Ford','ZX2'),(3549,2001,'GMC','Jimmy'),(3550,2001,'GMC','Safari'),(3551,2001,'GMC','Savana 1500'),(3552,2001,'GMC','Savana 2500'),(3553,2001,'GMC','Savana 3500'),(3554,2001,'GMC','Sierra 1500'),(3555,2001,'GMC','Sierra 2500'),(3556,2001,'GMC','Sierra 3500'),(3557,2001,'GMC','Sonoma'),(3558,2001,'GMC','Yukon'),(3559,2001,'GMC','Yukon XL 1500'),(3560,2001,'GMC','Yukon XL 2500'),(3471,2001,'Honda','Accord'),(3476,2001,'Honda','Civic'),(3472,2001,'Honda','CR-V'),(3475,2001,'Honda','Insight'),(3474,2001,'Honda','Odyssey'),(3470,2001,'Honda','Passport'),(3473,2001,'Honda','Prelude'),(3477,2001,'Honda','S2000'),(3561,2001,'HUMMER','H1'),(3562,2001,'Hyundai','Accent'),(3563,2001,'Hyundai','Elantra'),(3564,2001,'Hyundai','Santa Fe'),(3565,2001,'Hyundai','Sonata'),(3566,2001,'Hyundai','Tiburon'),(3567,2001,'Hyundai','XG300'),(3568,2001,'Infiniti','G'),(3569,2001,'Infiniti','I'),(3570,2001,'Infiniti','Q'),(3571,2001,'Infiniti','QX'),(3572,2001,'Isuzu','Rodeo'),(3573,2001,'Isuzu','Rodeo Sport'),(3574,2001,'Isuzu','Trooper'),(3575,2001,'Isuzu','VehiCROSS'),(3576,2001,'Jaguar','S-Type'),(3577,2001,'Jaguar','XJ Series'),(3578,2001,'Jaguar','XK Series'),(3579,2001,'Jeep','Cherokee'),(3580,2001,'Jeep','Grand Cherokee'),(3581,2001,'Jeep','Wrangler'),(3481,2001,'Kia','Optima'),(3480,2001,'Kia','Rio'),(3478,2001,'Kia','Sephia'),(3482,2001,'Kia','Spectra'),(3479,2001,'Kia','Sportage'),(3368,2001,'Lamborghini','Diablo'),(3433,2001,'Land Rover','Discovery'),(3436,2001,'Land Rover','Discovery Series II'),(3435,2001,'Land Rover','Freelander'),(3434,2001,'Land Rover','Range Rover'),(3430,2001,'Lexus','ES'),(3432,2001,'Lexus','GS'),(3431,2001,'Lexus','IS'),(3429,2001,'Lexus','LS'),(3427,2001,'Lexus','LX'),(3428,2001,'Lexus','RX'),(3424,2001,'Lincoln','Continental'),(3425,2001,'Lincoln','LS'),(3423,2001,'Lincoln','Navigator'),(3426,2001,'Lincoln','Town Car'),(3521,2001,'Lotus','Esprit'),(3374,2001,'Mazda','626'),(3376,2001,'Mazda','B-Series'),(3382,2001,'Mazda','B-Series Plus'),(3375,2001,'Mazda','B2500'),(3383,2001,'Mazda','Miata MX-5'),(3379,2001,'Mazda','Millenia'),(3380,2001,'Mazda','MPV'),(3378,2001,'Mazda','MX-5'),(3381,2001,'Mazda','Protege'),(3377,2001,'Mazda','Tribute'),(3409,2001,'Mercedes-Benz','C-Class'),(3411,2001,'Mercedes-Benz','CL-Class'),(3406,2001,'Mercedes-Benz','CLK-Class'),(3407,2001,'Mercedes-Benz','E-Class'),(3408,2001,'Mercedes-Benz','M-Class'),(3412,2001,'Mercedes-Benz','S-Class'),(3410,2001,'Mercedes-Benz','SL-Class'),(3413,2001,'Mercedes-Benz','SLK-Class'),(3451,2001,'Mercury','Cougar'),(3450,2001,'Mercury','Grand Marquis'),(3449,2001,'Mercury','Mountaineer'),(3448,2001,'Mercury','Sable'),(3452,2001,'Mercury','Villager'),(3417,2001,'Mitsubishi','Challenger'),(3419,2001,'Mitsubishi','Diamante'),(3416,2001,'Mitsubishi','Eclipse'),(3415,2001,'Mitsubishi','Galant'),(3418,2001,'Mitsubishi','Lancer'),(3414,2001,'Mitsubishi','Mirage'),(3421,2001,'Mitsubishi','Montero'),(3422,2001,'Mitsubishi','Montero Sport'),(3420,2001,'Mitsubishi','Pajero'),(3582,2001,'Nissan','Altima'),(3583,2001,'Nissan','Frontier'),(3584,2001,'Nissan','Maxima'),(3585,2001,'Nissan','Pathfinder'),(3586,2001,'Nissan','Quest'),(3587,2001,'Nissan','Sentra'),(3588,2001,'Nissan','Xterra'),(3589,2001,'Oldsmobile','Alero'),(3590,2001,'Oldsmobile','Aurora'),(3591,2001,'Oldsmobile','Bravada'),(3592,2001,'Oldsmobile','Intrigue'),(3593,2001,'Oldsmobile','Silhouette'),(3594,2001,'Plymouth','Neon'),(3397,2001,'Pontiac','Aztek'),(3399,2001,'Pontiac','Bonneville'),(3400,2001,'Pontiac','Firebird'),(3398,2001,'Pontiac','Grand Am'),(3401,2001,'Pontiac','Grand Prix'),(3395,2001,'Pontiac','Montana'),(3396,2001,'Pontiac','Sunfire'),(3391,2001,'Porsche','911'),(3392,2001,'Porsche','Boxster'),(3393,2001,'Saab','9-3'),(3394,2001,'Saab','9-5'),(3595,2001,'Saturn','L-Series'),(3596,2001,'Saturn','S-Series'),(3405,2001,'Subaru','Forester'),(3402,2001,'Subaru','Impreza'),(3404,2001,'Subaru','Legacy'),(3403,2001,'Subaru','Outback'),(3370,2001,'Suzuki','Esteem'),(3372,2001,'Suzuki','Grand Vitara'),(3371,2001,'Suzuki','Swift'),(3369,2001,'Suzuki','Vitara'),(3373,2001,'Suzuki','XL-7'),(3454,2001,'Toyota','4Runner'),(3455,2001,'Toyota','Avalon'),(3456,2001,'Toyota','Camry'),(3457,2001,'Toyota','Celica'),(3458,2001,'Toyota','Corolla'),(3459,2001,'Toyota','Echo'),(3453,2001,'Toyota','Highlander'),(3460,2001,'Toyota','Land Cruiser'),(3461,2001,'Toyota','MR2'),(3462,2001,'Toyota','Prius'),(3463,2001,'Toyota','RAV4'),(3464,2001,'Toyota','Sequoia'),(3465,2001,'Toyota','Sienna'),(3466,2001,'Toyota','Solara'),(3467,2001,'Toyota','Tacoma'),(3468,2001,'Toyota','Tacoma Xtra'),(3469,2001,'Toyota','Tundra'),(3340,2001,'Volkswagen','Cabriolet'),(3338,2001,'Volkswagen','Eurovan'),(3339,2001,'Volkswagen','Golf'),(3342,2001,'Volkswagen','GTI'),(3337,2001,'Volkswagen','Jetta'),(3341,2001,'Volkswagen','New Beetle'),(3336,2001,'Volkswagen','Passat'),(3343,2001,'Volkswagen','rio'),(3597,2001,'Volvo','C70'),(3598,2001,'Volvo','S40'),(3599,2001,'Volvo','S60'),(3600,2001,'Volvo','S80'),(3601,2001,'Volvo','V40'),(3602,2001,'Volvo','V70'),(3795,2002,'Acura','CL'),(3796,2002,'Acura','MDX'),(3797,2002,'Acura','NSX'),(3798,2002,'Acura','RL'),(3794,2002,'Acura','RSX'),(3799,2002,'Acura','TL'),(3708,2002,'Audi','A4'),(3705,2002,'Audi','A6'),(3706,2002,'Audi','A8'),(3710,2002,'Audi','Allroad'),(3707,2002,'Audi','S4'),(3711,2002,'Audi','S6'),(3709,2002,'Audi','S8'),(3704,2002,'Audi','TT'),(3714,2002,'BMW','3 Series'),(3715,2002,'BMW','5 Series'),(3717,2002,'BMW','525'),(3718,2002,'BMW','530'),(3716,2002,'BMW','7 Series'),(3719,2002,'BMW','745'),(3722,2002,'BMW','M'),(3720,2002,'BMW','M3'),(3723,2002,'BMW','M5'),(3721,2002,'BMW','X5'),(3724,2002,'BMW','Z3'),(3725,2002,'BMW','Z8'),(3703,2002,'Buick','Century'),(3700,2002,'Buick','LeSabre'),(3702,2002,'Buick','Park Avenue'),(3701,2002,'Buick','Regal'),(3699,2002,'Buick','Rendezvous'),(3801,2002,'Cadillac','DeVille'),(3802,2002,'Cadillac','Eldorado'),(3803,2002,'Cadillac','Escalade'),(3804,2002,'Cadillac','Escalade EXT'),(3805,2002,'Cadillac','Seville'),(3763,2002,'Chevrolet','Astro'),(3759,2002,'Chevrolet','Avalanche'),(3764,2002,'Chevrolet','Avalanche 1500'),(3765,2002,'Chevrolet','Avalanche 2500'),(3766,2002,'Chevrolet','Blazer'),(3767,2002,'Chevrolet','Camaro'),(3768,2002,'Chevrolet','Cavalier'),(3762,2002,'Chevrolet','Corvette'),(3769,2002,'Chevrolet','Express 1500'),(3770,2002,'Chevrolet','Express 2500'),(3771,2002,'Chevrolet','Express 3500'),(3772,2002,'Chevrolet','Impala'),(3773,2002,'Chevrolet','Malibu'),(3774,2002,'Chevrolet','Monte Carlo'),(3775,2002,'Chevrolet','Prizm'),(3776,2002,'Chevrolet','S10'),(3760,2002,'Chevrolet','Silverado'),(3777,2002,'Chevrolet','Silverado 1500'),(3778,2002,'Chevrolet','Silverado 2500'),(3779,2002,'Chevrolet','Silverado 3500'),(3780,2002,'Chevrolet','Suburban 1500'),(3781,2002,'Chevrolet','Suburban 2500'),(3782,2002,'Chevrolet','Tahoe'),(3783,2002,'Chevrolet','Tracker'),(3761,2002,'Chevrolet','Trailblazer'),(3784,2002,'Chevrolet','Venture'),(3806,2002,'Chrysler','300M'),(3807,2002,'Chrysler','Concorde'),(3808,2002,'Chrysler','Prowler'),(3809,2002,'Chrysler','PT Cruiser'),(3810,2002,'Chrysler','Sebring'),(3811,2002,'Chrysler','Town & Country'),(3812,2002,'Chrysler','Voyager'),(3813,2002,'Daewoo','Lanos'),(3814,2002,'Daewoo','Leganza'),(3815,2002,'Daewoo','Nubira'),(3816,2002,'Dodge','Caravan'),(3818,2002,'Dodge','Dakota'),(3817,2002,'Dodge','Dakota Club'),(3819,2002,'Dodge','Durango'),(3820,2002,'Dodge','Grand Caravan'),(3821,2002,'Dodge','Intrepid'),(3822,2002,'Dodge','Neon'),(3823,2002,'Dodge','Ram 1500'),(3824,2002,'Dodge','Ram 2500'),(3825,2002,'Dodge','Ram 3500'),(3826,2002,'Dodge','Ram Van 1500'),(3827,2002,'Dodge','Ram Van 2500'),(3828,2002,'Dodge','Ram Van 3500'),(3829,2002,'Dodge','Stratus'),(3830,2002,'Dodge','Viper'),(3657,2002,'Ford','Crown Victoria'),(3655,2002,'Ford','E-Series'),(3669,2002,'Ford','Econoline E150'),(3670,2002,'Ford','Econoline E250'),(3671,2002,'Ford','Econoline E350'),(3661,2002,'Ford','Escape'),(3658,2002,'Ford','Escort'),(3672,2002,'Ford','Excursion'),(3662,2002,'Ford','Expedition'),(3659,2002,'Ford','Explorer'),(3673,2002,'Ford','Explorer Sport'),(3654,2002,'Ford','Explorer Sport Trac'),(3665,2002,'Ford','F-Series'),(3674,2002,'Ford','F150'),(3675,2002,'Ford','F250'),(3676,2002,'Ford','F350'),(3663,2002,'Ford','Focus'),(3656,2002,'Ford','Mustang'),(3660,2002,'Ford','Ranger'),(3667,2002,'Ford','Taurus'),(3668,2002,'Ford','Th!nk'),(3664,2002,'Ford','Thunderbird'),(3666,2002,'Ford','Windstar'),(3677,2002,'Ford','ZX2'),(3746,2002,'GMC','Envoy'),(3747,2002,'GMC','Envoy XL'),(3748,2002,'GMC','Safari'),(3749,2002,'GMC','Savana 1500'),(3750,2002,'GMC','Savana 2500'),(3751,2002,'GMC','Savana 3500'),(3752,2002,'GMC','Sierra 1500'),(3753,2002,'GMC','Sierra 2500'),(3754,2002,'GMC','Sierra 3500'),(3755,2002,'GMC','Sonoma'),(3756,2002,'GMC','Yukon'),(3757,2002,'GMC','Yukon XL 1500'),(3758,2002,'GMC','Yukon XL 2500'),(3626,2002,'Honda','Accord'),(3625,2002,'Honda','Civic'),(3624,2002,'Honda','CR-V'),(3622,2002,'Honda','Insight'),(3629,2002,'Honda','Odyssey'),(3623,2002,'Honda','Passport'),(3628,2002,'Honda','Pilot'),(3627,2002,'Honda','S2000'),(3831,2002,'HUMMER','H1'),(3832,2002,'Hyundai','Accent'),(3833,2002,'Hyundai','Elantra'),(3834,2002,'Hyundai','Santa Fe'),(3835,2002,'Hyundai','Sonata'),(3836,2002,'Hyundai','XG350'),(3837,2002,'Infiniti','G'),(3838,2002,'Infiniti','I'),(3839,2002,'Infiniti','Q'),(3840,2002,'Infiniti','QX'),(3841,2002,'Isuzu','Axiom'),(3842,2002,'Isuzu','Rodeo'),(3843,2002,'Isuzu','Rodeo Sport'),(3844,2002,'Isuzu','Trooper'),(3845,2002,'Jaguar','S-Type'),(3848,2002,'Jaguar','X-Type'),(3846,2002,'Jaguar','XJ Series'),(3847,2002,'Jaguar','XK Series'),(3849,2002,'Jeep','Grand Cherokee'),(3850,2002,'Jeep','Liberty'),(3851,2002,'Jeep','Wrangler'),(3734,2002,'Kia','Optima'),(3736,2002,'Kia','Rio'),(3733,2002,'Kia','Sedona'),(3732,2002,'Kia','Spectra'),(3735,2002,'Kia','Sportage'),(3683,2002,'Lamborghini','Murciélago'),(3641,2002,'Land Rover','Discovery'),(3643,2002,'Land Rover','Discovery Series II'),(3642,2002,'Land Rover','Freelander'),(3640,2002,'Land Rover','Range Rover'),(3741,2002,'Lexus','ES'),(3743,2002,'Lexus','GS'),(3745,2002,'Lexus','IS'),(3744,2002,'Lexus','LS'),(3739,2002,'Lexus','LX'),(3742,2002,'Lexus','RX'),(3740,2002,'Lexus','SC'),(3728,2002,'Lincoln','Blackwood'),(3727,2002,'Lincoln','Continental'),(3731,2002,'Lincoln','LS'),(3729,2002,'Lincoln','Navigator'),(3730,2002,'Lincoln','Town Car'),(3800,2002,'Lotus','Esprit'),(3726,2002,'Maserati','Spyder'),(3630,2002,'Mazda','626'),(3631,2002,'Mazda','B-Series'),(3637,2002,'Mazda','B-Series Plus'),(3638,2002,'Mazda','Miata MX-5'),(3634,2002,'Mazda','Millenia'),(3635,2002,'Mazda','MPV'),(3636,2002,'Mazda','MX-5'),(3633,2002,'Mazda','Protege'),(3639,2002,'Mazda','Protege5'),(3632,2002,'Mazda','Tribute'),(3610,2002,'Mercedes-Benz','C-Class'),(3614,2002,'Mercedes-Benz','CL-Class'),(3608,2002,'Mercedes-Benz','CLK-Class'),(3612,2002,'Mercedes-Benz','E-Class'),(3615,2002,'Mercedes-Benz','G-Class'),(3616,2002,'Mercedes-Benz','M-Class'),(3609,2002,'Mercedes-Benz','S-Class'),(3611,2002,'Mercedes-Benz','SL-Class'),(3613,2002,'Mercedes-Benz','SLK-Class'),(3681,2002,'Mercury','Cougar'),(3682,2002,'Mercury','Grand Marquis'),(3678,2002,'Mercury','Mountaineer'),(3679,2002,'Mercury','Sable'),(3680,2002,'Mercury','Villager'),(3793,2002,'MINI','Cooper'),(3792,2002,'MINI','MINI'),(3644,2002,'Mitsubishi','Challenger'),(3650,2002,'Mitsubishi','Diamante'),(3647,2002,'Mitsubishi','Eclipse'),(3649,2002,'Mitsubishi','Galant'),(3646,2002,'Mitsubishi','Lancer'),(3645,2002,'Mitsubishi','Lancer Evolution'),(3648,2002,'Mitsubishi','Mirage'),(3652,2002,'Mitsubishi','Montero'),(3653,2002,'Mitsubishi','Montero Sport'),(3651,2002,'Mitsubishi','Pajero'),(3785,2002,'Nissan','Altima'),(3787,2002,'Nissan','Frontier'),(3788,2002,'Nissan','Maxima'),(3789,2002,'Nissan','Pathfinder'),(3790,2002,'Nissan','Quest'),(3791,2002,'Nissan','Sentra'),(3786,2002,'Nissan','Xterra'),(3852,2002,'Oldsmobile','Alero'),(3853,2002,'Oldsmobile','Aurora'),(3854,2002,'Oldsmobile','Bravada'),(3855,2002,'Oldsmobile','Intrigue'),(3856,2002,'Oldsmobile','Silhouette'),(3689,2002,'Pontiac','Aztek'),(3685,2002,'Pontiac','Bonneville'),(3687,2002,'Pontiac','Firebird'),(3688,2002,'Pontiac','Grand Am'),(3686,2002,'Pontiac','Grand Prix'),(3690,2002,'Pontiac','Montana'),(3684,2002,'Pontiac','Sunfire'),(3737,2002,'Porsche','911'),(3738,2002,'Porsche','Boxster'),(3712,2002,'Saab','9-3'),(3713,2002,'Saab','9-5'),(3857,2002,'Saturn','L-Series'),(3858,2002,'Saturn','S-Series'),(3859,2002,'Saturn','VUE'),(3621,2002,'Subaru','Forester'),(3619,2002,'Subaru','Impreza'),(3618,2002,'Subaru','Legacy'),(3617,2002,'Subaru','Outback'),(3620,2002,'Subaru','Outback Sport'),(3605,2002,'Suzuki','Aerio'),(3603,2002,'Suzuki','Esteem'),(3606,2002,'Suzuki','Grand Vitara'),(3604,2002,'Suzuki','Vitara'),(3607,2002,'Suzuki','XL-7'),(3860,2002,'Toyota','4Runner'),(3861,2002,'Toyota','Avalon'),(3862,2002,'Toyota','Camry'),(3863,2002,'Toyota','Celica'),(3864,2002,'Toyota','Corolla'),(3865,2002,'Toyota','Echo'),(3866,2002,'Toyota','Highlander'),(3867,2002,'Toyota','Land Cruiser'),(3868,2002,'Toyota','MR2'),(3869,2002,'Toyota','Prius'),(3870,2002,'Toyota','RAV4'),(3871,2002,'Toyota','Sequoia'),(3872,2002,'Toyota','Sienna'),(3873,2002,'Toyota','Solara'),(3874,2002,'Toyota','Tacoma'),(3875,2002,'Toyota','Tacoma Xtra'),(3876,2002,'Toyota','Tundra'),(3697,2002,'Volkswagen','Cabriolet'),(3694,2002,'Volkswagen','Eurovan'),(3693,2002,'Volkswagen','Golf'),(3696,2002,'Volkswagen','GTI'),(3692,2002,'Volkswagen','Jetta'),(3691,2002,'Volkswagen','New Beetle'),(3695,2002,'Volkswagen','Passat'),(3698,2002,'Volkswagen','rio'),(3877,2002,'Volvo','C70'),(3878,2002,'Volvo','S40'),(3879,2002,'Volvo','S60'),(3880,2002,'Volvo','S80'),(3881,2002,'Volvo','V40'),(3882,2002,'Volvo','V70'),(4095,2003,'Acura','CL'),(4096,2003,'Acura','MDX'),(4097,2003,'Acura','NSX'),(4098,2003,'Acura','RL'),(4094,2003,'Acura','RSX'),(4099,2003,'Acura','TL'),(3980,2003,'Audi','A4'),(3979,2003,'Audi','A6'),(3985,2003,'Audi','A8'),(3986,2003,'Audi','Allroad'),(3987,2003,'Audi','RS 6'),(3983,2003,'Audi','RS6'),(3981,2003,'Audi','S6'),(3984,2003,'Audi','S8'),(3982,2003,'Audi','TT'),(3887,2003,'BMW','3 Series'),(3888,2003,'BMW','5 Series'),(3890,2003,'BMW','525'),(3891,2003,'BMW','530'),(3889,2003,'BMW','7 Series'),(3892,2003,'BMW','745'),(3893,2003,'BMW','760'),(3896,2003,'BMW','M3'),(3897,2003,'BMW','M5'),(3895,2003,'BMW','X5'),(3894,2003,'BMW','Z4'),(3898,2003,'BMW','Z8'),(4013,2003,'Buick','Century'),(4010,2003,'Buick','LeSabre'),(4012,2003,'Buick','Park Avenue'),(4011,2003,'Buick','Regal'),(4014,2003,'Buick','Rendezvous'),(4100,2003,'Cadillac','CTS'),(4101,2003,'Cadillac','DeVille'),(4102,2003,'Cadillac','Escalade'),(4103,2003,'Cadillac','Escalade ESV'),(4104,2003,'Cadillac','Escalade EXT'),(4105,2003,'Cadillac','Seville'),(4039,2003,'Chevrolet','Astro'),(4040,2003,'Chevrolet','Avalanche 1500'),(4041,2003,'Chevrolet','Avalanche 2500'),(4042,2003,'Chevrolet','Blazer'),(4043,2003,'Chevrolet','Cavalier'),(4037,2003,'Chevrolet','Corvette'),(4044,2003,'Chevrolet','Express 1500'),(4045,2003,'Chevrolet','Express 2500'),(4046,2003,'Chevrolet','Express 3500'),(4047,2003,'Chevrolet','Impala'),(4048,2003,'Chevrolet','Malibu'),(4049,2003,'Chevrolet','Monte Carlo'),(4050,2003,'Chevrolet','S10'),(4038,2003,'Chevrolet','Silverado'),(4051,2003,'Chevrolet','Silverado 1500'),(4052,2003,'Chevrolet','Silverado 2500'),(4053,2003,'Chevrolet','Silverado 3500'),(4054,2003,'Chevrolet','SSR'),(4055,2003,'Chevrolet','Suburban 1500'),(4056,2003,'Chevrolet','Suburban 2500'),(4057,2003,'Chevrolet','Tahoe'),(4058,2003,'Chevrolet','Tracker'),(4059,2003,'Chevrolet','TrailBlazer'),(4060,2003,'Chevrolet','Venture'),(4106,2003,'Chrysler','300M'),(4107,2003,'Chrysler','Concorde'),(4108,2003,'Chrysler','PT Cruiser'),(4109,2003,'Chrysler','Sebring'),(4110,2003,'Chrysler','Town & Country'),(4111,2003,'Chrysler','Voyager'),(4062,2003,'Dodge','Caravan'),(4064,2003,'Dodge','Dakota'),(4063,2003,'Dodge','Dakota Club'),(4065,2003,'Dodge','Durango'),(4066,2003,'Dodge','Grand Caravan'),(4067,2003,'Dodge','Intrepid'),(4068,2003,'Dodge','Neon'),(4061,2003,'Dodge','Ram'),(4069,2003,'Dodge','Ram 1500'),(4070,2003,'Dodge','Ram 2500'),(4071,2003,'Dodge','Ram 3500'),(4072,2003,'Dodge','Ram Van 1500'),(4073,2003,'Dodge','Ram Van 2500'),(4074,2003,'Dodge','Ram Van 3500'),(4075,2003,'Dodge','Stratus'),(4076,2003,'Dodge','Viper'),(3911,2003,'Ford','Crown Victoria'),(3902,2003,'Ford','E-Series'),(3914,2003,'Ford','E150'),(3915,2003,'Ford','E250'),(3916,2003,'Ford','E350'),(3901,2003,'Ford','Escape'),(3907,2003,'Ford','Escort ZX2'),(3917,2003,'Ford','Excursion'),(3905,2003,'Ford','Expedition'),(3909,2003,'Ford','Explorer'),(3918,2003,'Ford','Explorer Sport'),(3900,2003,'Ford','Explorer Sport Trac'),(3906,2003,'Ford','F-Series'),(3919,2003,'Ford','F150'),(3920,2003,'Ford','F250'),(3921,2003,'Ford','F350'),(3910,2003,'Ford','Focus'),(3912,2003,'Ford','Freestar'),(3908,2003,'Ford','Mustang'),(3913,2003,'Ford','Ranger'),(3904,2003,'Ford','Taurus'),(3899,2003,'Ford','Thunderbird'),(3903,2003,'Ford','Windstar'),(3922,2003,'Ford','ZX2'),(4112,2003,'GMC','Envoy'),(4113,2003,'GMC','Envoy XL'),(4114,2003,'GMC','Safari'),(4115,2003,'GMC','Savana 1500'),(4116,2003,'GMC','Savana 2500'),(4117,2003,'GMC','Savana 3500'),(4118,2003,'GMC','Sierra 1500'),(4119,2003,'GMC','Sierra 2500'),(4120,2003,'GMC','Sierra 3500'),(4121,2003,'GMC','Sonoma'),(4122,2003,'GMC','Yukon'),(4123,2003,'GMC','Yukon XL 1500'),(4124,2003,'GMC','Yukon XL 2500'),(3935,2003,'Honda','Accord'),(3936,2003,'Honda','Civic'),(3941,2003,'Honda','Civic GX'),(3938,2003,'Honda','Civic Si'),(3939,2003,'Honda','CR-V'),(3937,2003,'Honda','Element'),(3944,2003,'Honda','Insight'),(3942,2003,'Honda','Odyssey'),(3940,2003,'Honda','Pilot'),(3943,2003,'Honda','S2000'),(4125,2003,'HUMMER','H1'),(4126,2003,'HUMMER','H2'),(4127,2003,'Hyundai','Accent'),(4128,2003,'Hyundai','Elantra'),(4129,2003,'Hyundai','Santa Fe'),(4130,2003,'Hyundai','Sonata'),(4131,2003,'Hyundai','Tiburon'),(4132,2003,'Hyundai','XG350'),(4078,2003,'Infiniti','FX'),(4079,2003,'Infiniti','G'),(4077,2003,'Infiniti','G35'),(4080,2003,'Infiniti','I'),(4081,2003,'Infiniti','M'),(4082,2003,'Infiniti','Q'),(4083,2003,'Infiniti','QX'),(4133,2003,'Isuzu','Ascender'),(4134,2003,'Isuzu','Axiom'),(4135,2003,'Isuzu','Rodeo'),(4136,2003,'Isuzu','Rodeo Sport'),(4137,2003,'Jaguar','S-Type'),(4140,2003,'Jaguar','X-Type'),(4138,2003,'Jaguar','XJ Series'),(4139,2003,'Jaguar','XK Series'),(4141,2003,'Jeep','Grand Cherokee'),(4142,2003,'Jeep','Liberty'),(4143,2003,'Jeep','Wrangler'),(4005,2003,'Kia','Optima'),(4008,2003,'Kia','Rio'),(4006,2003,'Kia','Sedona'),(4004,2003,'Kia','Sorento'),(4007,2003,'Kia','Spectra'),(4015,2003,'Lamborghini','Gallardo'),(4016,2003,'Lamborghini','Murciélago'),(4024,2003,'Land Rover','Discovery'),(4025,2003,'Land Rover','Freelander'),(4026,2003,'Land Rover','Range Rover'),(3928,2003,'Lexus','ES'),(3933,2003,'Lexus','GS'),(3932,2003,'Lexus','GX'),(3930,2003,'Lexus','IS'),(3929,2003,'Lexus','LS'),(3927,2003,'Lexus','LX'),(3931,2003,'Lexus','RX'),(3934,2003,'Lexus','SC'),(4019,2003,'Lincoln','Aviator'),(4020,2003,'Lincoln','Blackwood'),(4021,2003,'Lincoln','LS'),(4017,2003,'Lincoln','Navigator'),(4018,2003,'Lincoln','Town Car'),(4036,2003,'Lotus','Esprit'),(4009,2003,'Maserati','Spyder'),(4022,2003,'Maybach','57'),(4023,2003,'Maybach','62'),(3988,2003,'Mazda','B-Series'),(3994,2003,'Mazda','B-Series Plus'),(3991,2003,'Mazda','Mazda6'),(3995,2003,'Mazda','Miata MX-5'),(3989,2003,'Mazda','MPV'),(3992,2003,'Mazda','MX-5'),(3993,2003,'Mazda','Protege'),(3996,2003,'Mazda','Protege5'),(3990,2003,'Mazda','Tribute'),(3947,2003,'Mercedes-Benz','C-Class'),(3951,2003,'Mercedes-Benz','CL-Class'),(3945,2003,'Mercedes-Benz','CLK-Class'),(3946,2003,'Mercedes-Benz','E-Class'),(3953,2003,'Mercedes-Benz','G-Class'),(3949,2003,'Mercedes-Benz','M-Class'),(3948,2003,'Mercedes-Benz','S-Class'),(3950,2003,'Mercedes-Benz','SL-Class'),(3952,2003,'Mercedes-Benz','SLK-Class'),(3886,2003,'Mercury','Grand Marquis'),(3883,2003,'Mercury','Marauder'),(3884,2003,'Mercury','Mountaineer'),(3885,2003,'Mercury','Sable'),(4027,2003,'MINI','Cooper'),(3963,2003,'Mitsubishi','Challenger'),(3960,2003,'Mitsubishi','Diamante'),(3964,2003,'Mitsubishi','Eclipse'),(3959,2003,'Mitsubishi','Galant'),(3961,2003,'Mitsubishi','Lancer'),(3962,2003,'Mitsubishi','Lancer Evolution'),(3965,2003,'Mitsubishi','Montero'),(3966,2003,'Mitsubishi','Montero Sport'),(3958,2003,'Mitsubishi','Outlander'),(3957,2003,'Mitsubishi','Pajero'),(4086,2003,'Nissan','350Z'),(4087,2003,'Nissan','Altima'),(4088,2003,'Nissan','Frontier'),(4089,2003,'Nissan','Maxima'),(4090,2003,'Nissan','Murano'),(4091,2003,'Nissan','Pathfinder'),(4092,2003,'Nissan','Sentra'),(4093,2003,'Nissan','Xterra'),(4144,2003,'Oldsmobile','Alero'),(4145,2003,'Oldsmobile','Aurora'),(4146,2003,'Oldsmobile','Bravada'),(4147,2003,'Oldsmobile','Silhouette'),(3973,2003,'Pontiac','Aztek'),(3977,2003,'Pontiac','Bonneville'),(3972,2003,'Pontiac','Grand Am'),(3978,2003,'Pontiac','Grand Prix'),(3976,2003,'Pontiac','Montana'),(3974,2003,'Pontiac','Sunfire'),(3975,2003,'Pontiac','Vibe'),(3954,2003,'Porsche','911'),(3956,2003,'Porsche','Boxster'),(3955,2003,'Porsche','Cayenne'),(4084,2003,'Saab','9-3'),(4085,2003,'Saab','9-5'),(4148,2003,'Saturn','Ion'),(4149,2003,'Saturn','L-Series'),(4150,2003,'Saturn','VUE'),(3971,2003,'Subaru','Baja'),(3969,2003,'Subaru','Forester'),(3968,2003,'Subaru','Impreza'),(3967,2003,'Subaru','Legacy'),(3970,2003,'Subaru','Outback'),(3924,2003,'Suzuki','Aerio'),(3923,2003,'Suzuki','Grand Vitara'),(3925,2003,'Suzuki','Vitara'),(3926,2003,'Suzuki','XL-7'),(4151,2003,'Toyota','4Runner'),(4152,2003,'Toyota','Avalon'),(4153,2003,'Toyota','Camry'),(4154,2003,'Toyota','Celica'),(4155,2003,'Toyota','Corolla'),(4156,2003,'Toyota','Echo'),(4157,2003,'Toyota','Highlander'),(4158,2003,'Toyota','Land Cruiser'),(4159,2003,'Toyota','Matrix'),(4160,2003,'Toyota','MR2'),(4161,2003,'Toyota','Prius'),(4162,2003,'Toyota','RAV4'),(4163,2003,'Toyota','Sequoia'),(4164,2003,'Toyota','Sienna'),(4165,2003,'Toyota','Solara'),(4166,2003,'Toyota','Tacoma'),(4167,2003,'Toyota','Tacoma Xtra'),(4168,2003,'Toyota','Tundra'),(4002,2003,'Volkswagen','Eurovan'),(4000,2003,'Volkswagen','Golf'),(4003,2003,'Volkswagen','GTI'),(3999,2003,'Volkswagen','Jetta'),(4001,2003,'Volkswagen','New Beetle'),(3997,2003,'Volkswagen','Passat'),(3998,2003,'Volkswagen','Touareg'),(4029,2003,'Volvo','C70'),(4030,2003,'Volvo','S40'),(4031,2003,'Volvo','S60'),(4032,2003,'Volvo','S80'),(4033,2003,'Volvo','V40'),(4034,2003,'Volvo','V70'),(4035,2003,'Volvo','XC70'),(4028,2003,'Volvo','XC90'),(4403,2004,'Acura','MDX'),(4404,2004,'Acura','NSX'),(4405,2004,'Acura','RL'),(4406,2004,'Acura','RSX'),(4407,2004,'Acura','TL'),(4402,2004,'Acura','TSX'),(4209,2004,'Audi','A4'),(4214,2004,'Audi','A6'),(4210,2004,'Audi','A8'),(4212,2004,'Audi','Allroad'),(4211,2004,'Audi','S4'),(4213,2004,'Audi','TT'),(4248,2004,'BMW','3 Series'),(4252,2004,'BMW','325'),(4249,2004,'BMW','5 Series'),(4253,2004,'BMW','525'),(4254,2004,'BMW','530'),(4255,2004,'BMW','545'),(4250,2004,'BMW','6 Series'),(4256,2004,'BMW','645'),(4251,2004,'BMW','7 Series'),(4257,2004,'BMW','745'),(4258,2004,'BMW','760'),(4262,2004,'BMW','M3'),(4259,2004,'BMW','X3'),(4260,2004,'BMW','X5'),(4261,2004,'BMW','Z4'),(4265,2004,'Buick','Century'),(4268,2004,'Buick','LeSabre'),(4263,2004,'Buick','Park Avenue'),(4264,2004,'Buick','Rainier'),(4267,2004,'Buick','Regal'),(4266,2004,'Buick','Rendezvous'),(4375,2004,'Cadillac','CTS'),(4376,2004,'Cadillac','DeVille'),(4377,2004,'Cadillac','Escalade'),(4378,2004,'Cadillac','Escalade ESV'),(4379,2004,'Cadillac','Escalade EXT'),(4380,2004,'Cadillac','Seville'),(4374,2004,'Cadillac','SRX'),(4381,2004,'Cadillac','XLR'),(4330,2004,'Chevrolet','Astro'),(4331,2004,'Chevrolet','Avalanche 1500'),(4332,2004,'Chevrolet','Avalanche 2500'),(4333,2004,'Chevrolet','Aveo'),(4334,2004,'Chevrolet','Blazer'),(4335,2004,'Chevrolet','Cavalier'),(4336,2004,'Chevrolet','Classic'),(4337,2004,'Chevrolet','Colorado'),(4328,2004,'Chevrolet','Corvette'),(4338,2004,'Chevrolet','Express 1500'),(4339,2004,'Chevrolet','Express 2500'),(4340,2004,'Chevrolet','Express 3500'),(4341,2004,'Chevrolet','Impala'),(4342,2004,'Chevrolet','Malibu'),(4329,2004,'Chevrolet','Monte Carlo'),(4343,2004,'Chevrolet','S10'),(4344,2004,'Chevrolet','Silverado 1500'),(4345,2004,'Chevrolet','Silverado 2500'),(4346,2004,'Chevrolet','Silverado 3500'),(4347,2004,'Chevrolet','SSR'),(4348,2004,'Chevrolet','Suburban 1500'),(4349,2004,'Chevrolet','Suburban 2500'),(4350,2004,'Chevrolet','Tahoe'),(4351,2004,'Chevrolet','Tracker'),(4352,2004,'Chevrolet','TrailBlazer'),(4353,2004,'Chevrolet','Venture'),(4409,2004,'Chrysler','300M'),(4410,2004,'Chrysler','Concorde'),(4411,2004,'Chrysler','Crossfire'),(4412,2004,'Chrysler','Pacifica'),(4413,2004,'Chrysler','PT Cruiser'),(4414,2004,'Chrysler','Sebring'),(4415,2004,'Chrysler','Town & Country'),(4408,2004,'Corbin','Sparrow'),(4416,2004,'Dodge','Caravan'),(4418,2004,'Dodge','Dakota'),(4417,2004,'Dodge','Dakota Club'),(4419,2004,'Dodge','Durango'),(4420,2004,'Dodge','Grand Caravan'),(4421,2004,'Dodge','Intrepid'),(4422,2004,'Dodge','Neon'),(4423,2004,'Dodge','Ram 1500'),(4424,2004,'Dodge','Ram 2500'),(4425,2004,'Dodge','Ram 3500'),(4426,2004,'Dodge','Stratus'),(4427,2004,'Dodge','Viper'),(4197,2004,'Ford','Crown Victoria'),(4190,2004,'Ford','E-Series'),(4198,2004,'Ford','E150'),(4199,2004,'Ford','E250'),(4200,2004,'Ford','E350'),(4185,2004,'Ford','Escape'),(4184,2004,'Ford','Escort'),(4201,2004,'Ford','Excursion'),(4194,2004,'Ford','Expedition'),(4188,2004,'Ford','Explorer'),(4191,2004,'Ford','Explorer Sport Trac'),(4183,2004,'Ford','F-Series'),(4202,2004,'Ford','F150'),(4203,2004,'Ford','F250'),(4204,2004,'Ford','F350'),(4196,2004,'Ford','Focus'),(4186,2004,'Ford','Freestar'),(4195,2004,'Ford','Mustang'),(4189,2004,'Ford','Ranger'),(4192,2004,'Ford','Taurus'),(4187,2004,'Ford','Thunderbird'),(4193,2004,'Ford','Windstar'),(4428,2004,'GMC','Canyon'),(4429,2004,'GMC','Envoy'),(4430,2004,'GMC','Envoy XL'),(4431,2004,'GMC','Envoy XUV'),(4432,2004,'GMC','Safari'),(4433,2004,'GMC','Savana 1500'),(4434,2004,'GMC','Savana 2500'),(4435,2004,'GMC','Savana 3500'),(4436,2004,'GMC','Sierra 1500'),(4437,2004,'GMC','Sierra 2500'),(4438,2004,'GMC','Sierra 3500'),(4439,2004,'GMC','Sonoma'),(4440,2004,'GMC','Yukon'),(4441,2004,'GMC','Yukon XL 1500'),(4442,2004,'GMC','Yukon XL 2500'),(4269,2004,'Holden','Monaro'),(4297,2004,'Honda','Accord'),(4298,2004,'Honda','Civic'),(4299,2004,'Honda','CR-V'),(4296,2004,'Honda','Element'),(4302,2004,'Honda','Insight'),(4303,2004,'Honda','Odyssey'),(4301,2004,'Honda','Pilot'),(4300,2004,'Honda','S2000'),(4443,2004,'HUMMER','H1'),(4444,2004,'HUMMER','H2'),(4445,2004,'Hyundai','Accent'),(4446,2004,'Hyundai','Elantra'),(4447,2004,'Hyundai','Santa Fe'),(4448,2004,'Hyundai','Sonata'),(4449,2004,'Hyundai','Tiburon'),(4450,2004,'Hyundai','XG350'),(4310,2004,'Infiniti','FX'),(4311,2004,'Infiniti','G'),(4309,2004,'Infiniti','G35'),(4312,2004,'Infiniti','I'),(4313,2004,'Infiniti','M'),(4314,2004,'Infiniti','Q'),(4315,2004,'Infiniti','QX'),(4451,2004,'Isuzu','Ascender'),(4452,2004,'Isuzu','Axiom'),(4453,2004,'Isuzu','Rodeo'),(4454,2004,'Jaguar','S-Type'),(4457,2004,'Jaguar','X-Type'),(4455,2004,'Jaguar','XJ Series'),(4456,2004,'Jaguar','XK Series'),(4458,2004,'Jeep','Grand Cherokee'),(4459,2004,'Jeep','Liberty'),(4460,2004,'Jeep','Wrangler'),(4244,2004,'Kia','Amanti'),(4242,2004,'Kia','Optima'),(4245,2004,'Kia','Rio'),(4243,2004,'Kia','Sedona'),(4241,2004,'Kia','Sorento'),(4246,2004,'Kia','Spectra'),(4382,2004,'Lamborghini','Gallardo'),(4383,2004,'Lamborghini','Murciélago'),(4386,2004,'Land Rover','Discovery'),(4385,2004,'Land Rover','Freelander'),(4384,2004,'Land Rover','Range Rover'),(4215,2004,'Lexus','ES'),(4221,2004,'Lexus','GS'),(4217,2004,'Lexus','GX'),(4222,2004,'Lexus','IS'),(4220,2004,'Lexus','LS'),(4219,2004,'Lexus','LX'),(4218,2004,'Lexus','RX'),(4216,2004,'Lexus','SC'),(4316,2004,'Lincoln','Aviator'),(4319,2004,'Lincoln','LS'),(4317,2004,'Lincoln','Navigator'),(4318,2004,'Lincoln','Town Car'),(4181,2004,'Lotus','Elise'),(4182,2004,'Lotus','Esprit'),(4180,2004,'Lotus','Exige'),(4275,2004,'Maserati','Spyder'),(4400,2004,'Maybach','57'),(4401,2004,'Maybach','62'),(4223,2004,'Mazda','B-Series'),(4230,2004,'Mazda','B-Series Plus'),(4226,2004,'Mazda','Mazda3'),(4224,2004,'Mazda','Mazda6'),(4231,2004,'Mazda','Miata MX-5'),(4229,2004,'Mazda','MPV'),(4228,2004,'Mazda','MX-5'),(4227,2004,'Mazda','RX-8'),(4225,2004,'Mazda','Tribute'),(4232,2004,'Mercedes-Benz','C-Class'),(4238,2004,'Mercedes-Benz','CL-Class'),(4235,2004,'Mercedes-Benz','CLK-Class'),(4233,2004,'Mercedes-Benz','E-Class'),(4237,2004,'Mercedes-Benz','G-Class'),(4240,2004,'Mercedes-Benz','M-Class'),(4236,2004,'Mercedes-Benz','S-Class'),(4239,2004,'Mercedes-Benz','SL-Class'),(4234,2004,'Mercedes-Benz','SLK-Class'),(4272,2004,'Mercury','Grand Marquis'),(4271,2004,'Mercury','Marauder'),(4274,2004,'Mercury','Monterey'),(4270,2004,'Mercury','Mountaineer'),(4273,2004,'Mercury','Sable'),(4247,2004,'MINI','Cooper'),(4173,2004,'Mitsubishi','Challenger'),(4172,2004,'Mitsubishi','Diamante'),(4175,2004,'Mitsubishi','Eclipse'),(4177,2004,'Mitsubishi','Endeavor'),(4176,2004,'Mitsubishi','Galant'),(4174,2004,'Mitsubishi','Lancer'),(4170,2004,'Mitsubishi','Lancer Evolution'),(4178,2004,'Mitsubishi','Montero'),(4179,2004,'Mitsubishi','Montero Sport'),(4169,2004,'Mitsubishi','Outlander'),(4171,2004,'Mitsubishi','Pajero'),(4390,2004,'Nissan','350Z'),(4391,2004,'Nissan','Altima'),(4392,2004,'Nissan','Frontier'),(4393,2004,'Nissan','Maxima'),(4394,2004,'Nissan','Murano'),(4395,2004,'Nissan','Pathfinder'),(4396,2004,'Nissan','Pathfinder Armada'),(4397,2004,'Nissan','Quest'),(4398,2004,'Nissan','Sentra'),(4389,2004,'Nissan','Titan'),(4399,2004,'Nissan','Xterra'),(4461,2004,'Oldsmobile','Alero'),(4462,2004,'Oldsmobile','Bravada'),(4463,2004,'Oldsmobile','Silhouette'),(4285,2004,'Pontiac','Aztek'),(4284,2004,'Pontiac','Bonneville'),(4281,2004,'Pontiac','Grand Am'),(4286,2004,'Pontiac','Grand Prix'),(4283,2004,'Pontiac','GTO'),(4282,2004,'Pontiac','Montana'),(4279,2004,'Pontiac','Sunfire'),(4280,2004,'Pontiac','Vibe'),(4205,2004,'Porsche','911'),(4207,2004,'Porsche','Boxster'),(4208,2004,'Porsche','Carrera GT'),(4206,2004,'Porsche','Cayenne'),(4387,2004,'Saab','9-3'),(4388,2004,'Saab','9-5'),(4464,2004,'Saturn','Ion'),(4465,2004,'Saturn','L-Series'),(4466,2004,'Saturn','VUE'),(4354,2004,'Scion','xA'),(4355,2004,'Scion','xB'),(4278,2004,'Spyker','C8 Laviolette'),(4276,2004,'Spyker','C8 Spyder'),(4277,2004,'Spyker','C8 Spyder Wide Body'),(4304,2004,'Subaru','Baja'),(4305,2004,'Subaru','Forester'),(4308,2004,'Subaru','Impreza'),(4307,2004,'Subaru','Legacy'),(4306,2004,'Subaru','Outback'),(4291,2004,'Suzuki','Aerio'),(4287,2004,'Suzuki','Daewoo Lacetti'),(4289,2004,'Suzuki','Daewoo Magnus'),(4293,2004,'Suzuki','Forenza'),(4290,2004,'Suzuki','Grand Vitara'),(4292,2004,'Suzuki','Swift'),(4294,2004,'Suzuki','Verona'),(4288,2004,'Suzuki','Vitara'),(4295,2004,'Suzuki','XL-7'),(4358,2004,'Toyota','4Runner'),(4359,2004,'Toyota','Avalon'),(4360,2004,'Toyota','Camry'),(4361,2004,'Toyota','Celica'),(4362,2004,'Toyota','Corolla'),(4363,2004,'Toyota','Echo'),(4364,2004,'Toyota','Highlander'),(4365,2004,'Toyota','Land Cruiser'),(4366,2004,'Toyota','Matrix'),(4367,2004,'Toyota','MR2'),(4357,2004,'Toyota','Prius'),(4368,2004,'Toyota','RAV4'),(4369,2004,'Toyota','Sequoia'),(4356,2004,'Toyota','Sienna'),(4370,2004,'Toyota','Solara'),(4371,2004,'Toyota','Tacoma'),(4372,2004,'Toyota','Tacoma Xtra'),(4373,2004,'Toyota','Tundra'),(4322,2004,'Volkswagen','Golf'),(4320,2004,'Volkswagen','GTI'),(4326,2004,'Volkswagen','Jetta'),(4323,2004,'Volkswagen','New Beetle'),(4325,2004,'Volkswagen','Passat'),(4327,2004,'Volkswagen','Phaeton'),(4321,2004,'Volkswagen','R32'),(4324,2004,'Volkswagen','Touareg'),(4467,2004,'Volvo','C70'),(4468,2004,'Volvo','S40'),(4469,2004,'Volvo','S60'),(4470,2004,'Volvo','S80'),(4471,2004,'Volvo','V40'),(4472,2004,'Volvo','V70'),(4473,2004,'Volvo','XC70'),(4474,2004,'Volvo','XC90'),(4487,2005,'Acura','MDX'),(4488,2005,'Acura','NSX'),(4486,2005,'Acura','RL'),(4489,2005,'Acura','RSX'),(4490,2005,'Acura','TL'),(4485,2005,'Acura','TSX'),(4725,2005,'Aston Martin','DB9'),(4726,2005,'Aston Martin','Vanquish S'),(4591,2005,'Audi','A4'),(4595,2005,'Audi','A6'),(4593,2005,'Audi','A8'),(4594,2005,'Audi','Allroad'),(4592,2005,'Audi','S4'),(4590,2005,'Audi','TT'),(4727,2005,'Bentley','Arnage'),(4728,2005,'Bentley','Continental'),(4556,2005,'BMW','3 Series'),(4560,2005,'BMW','325'),(4561,2005,'BMW','330'),(4557,2005,'BMW','5 Series'),(4562,2005,'BMW','525'),(4563,2005,'BMW','530'),(4564,2005,'BMW','545'),(4558,2005,'BMW','6 Series'),(4565,2005,'BMW','645'),(4559,2005,'BMW','7 Series'),(4566,2005,'BMW','745'),(4567,2005,'BMW','760'),(4569,2005,'BMW','M3'),(4570,2005,'BMW','X3'),(4571,2005,'BMW','X5'),(4568,2005,'BMW','Z4'),(4532,2005,'Buick','Century'),(4526,2005,'Buick','LaCrosse'),(4531,2005,'Buick','LeSabre'),(4529,2005,'Buick','Park Avenue'),(4528,2005,'Buick','Rainier'),(4530,2005,'Buick','Rendezvous'),(4527,2005,'Buick','Terraza'),(4605,2005,'Cadillac','CTS'),(4606,2005,'Cadillac','DeVille'),(4607,2005,'Cadillac','Escalade'),(4608,2005,'Cadillac','Escalade ESV'),(4609,2005,'Cadillac','Escalade EXT'),(4604,2005,'Cadillac','SRX'),(4610,2005,'Cadillac','STS'),(4611,2005,'Cadillac','XLR'),(4644,2005,'Chevrolet','Astro'),(4645,2005,'Chevrolet','Avalanche 1500'),(4646,2005,'Chevrolet','Avalanche 2500'),(4647,2005,'Chevrolet','Aveo'),(4648,2005,'Chevrolet','Blazer'),(4649,2005,'Chevrolet','Cavalier'),(4650,2005,'Chevrolet','Classic'),(4651,2005,'Chevrolet','Cobalt'),(4652,2005,'Chevrolet','Colorado'),(4642,2005,'Chevrolet','Corvette'),(4653,2005,'Chevrolet','Equinox'),(4654,2005,'Chevrolet','Express 1500'),(4655,2005,'Chevrolet','Express 2500'),(4656,2005,'Chevrolet','Express 3500'),(4657,2005,'Chevrolet','Impala'),(4658,2005,'Chevrolet','Malibu'),(4643,2005,'Chevrolet','Monte Carlo'),(4659,2005,'Chevrolet','Silverado 1500'),(4660,2005,'Chevrolet','Silverado 2500'),(4661,2005,'Chevrolet','Silverado 3500'),(4662,2005,'Chevrolet','SSR'),(4663,2005,'Chevrolet','Suburban 1500'),(4664,2005,'Chevrolet','Suburban 2500'),(4665,2005,'Chevrolet','Tahoe'),(4666,2005,'Chevrolet','TrailBlazer'),(4667,2005,'Chevrolet','Uplander'),(4668,2005,'Chevrolet','Venture'),(4625,2005,'Chrysler','300'),(4626,2005,'Chrysler','300C'),(4627,2005,'Chrysler','Crossfire'),(4628,2005,'Chrysler','Pacifica'),(4629,2005,'Chrysler','PT Cruiser'),(4630,2005,'Chrysler','Sebring'),(4631,2005,'Chrysler','Town & Country'),(4697,2005,'Dodge','Caravan'),(4699,2005,'Dodge','Dakota'),(4698,2005,'Dodge','Dakota Club'),(4700,2005,'Dodge','Durango'),(4701,2005,'Dodge','Grand Caravan'),(4696,2005,'Dodge','Magnum'),(4702,2005,'Dodge','Neon'),(4703,2005,'Dodge','Ram 1500'),(4704,2005,'Dodge','Ram 2500'),(4705,2005,'Dodge','Ram 3500'),(4706,2005,'Dodge','Stratus'),(4707,2005,'Dodge','Viper'),(4510,2005,'Ford','Crown Victoria'),(4505,2005,'Ford','E-Series'),(4519,2005,'Ford','E150'),(4520,2005,'Ford','E250'),(4521,2005,'Ford','E350'),(4507,2005,'Ford','Escape'),(4522,2005,'Ford','Excursion'),(4518,2005,'Ford','Expedition'),(4514,2005,'Ford','Explorer'),(4516,2005,'Ford','Explorer Sport Trac'),(4504,2005,'Ford','F-Series'),(4523,2005,'Ford','F150'),(4524,2005,'Ford','F250'),(4525,2005,'Ford','F350'),(4515,2005,'Ford','Five Hundred'),(4508,2005,'Ford','Focus'),(4509,2005,'Ford','Freestar'),(4511,2005,'Ford','Freestyle'),(4503,2005,'Ford','GT'),(4517,2005,'Ford','Mustang'),(4512,2005,'Ford','Ranger'),(4513,2005,'Ford','Taurus'),(4506,2005,'Ford','Thunderbird'),(4729,2005,'GMC','Canyon'),(4730,2005,'GMC','Envoy'),(4731,2005,'GMC','Envoy XL'),(4732,2005,'GMC','Envoy XUV'),(4733,2005,'GMC','Safari'),(4734,2005,'GMC','Savana 1500'),(4735,2005,'GMC','Savana 2500'),(4736,2005,'GMC','Savana 3500'),(4737,2005,'GMC','Sierra 1500'),(4738,2005,'GMC','Sierra 2500'),(4739,2005,'GMC','Sierra 3500'),(4740,2005,'GMC','Yukon'),(4741,2005,'GMC','Yukon XL 1500'),(4742,2005,'GMC','Yukon XL 2500'),(4582,2005,'Honda','Accord'),(4581,2005,'Honda','Civic'),(4589,2005,'Honda','Civic Si'),(4584,2005,'Honda','CR-V'),(4586,2005,'Honda','Element'),(4585,2005,'Honda','Insight'),(4588,2005,'Honda','Odyssey'),(4587,2005,'Honda','Pilot'),(4583,2005,'Honda','S2000'),(4743,2005,'HUMMER','H2'),(4744,2005,'Hyundai','Accent'),(4745,2005,'Hyundai','Elantra'),(4746,2005,'Hyundai','Santa Fe'),(4747,2005,'Hyundai','Sonata'),(4748,2005,'Hyundai','Tiburon'),(4749,2005,'Hyundai','Tucson'),(4750,2005,'Hyundai','XG350'),(4751,2005,'Infiniti','FX'),(4752,2005,'Infiniti','G'),(4753,2005,'Infiniti','Q'),(4754,2005,'Infiniti','QX'),(4755,2005,'Isuzu','Ascender'),(4756,2005,'Jaguar','S-Type'),(4759,2005,'Jaguar','X-Type'),(4757,2005,'Jaguar','XJ Series'),(4758,2005,'Jaguar','XK Series'),(4760,2005,'Jeep','Grand Cherokee'),(4761,2005,'Jeep','Liberty'),(4762,2005,'Jeep','Wrangler'),(4682,2005,'Kia','Amanti'),(4683,2005,'Kia','Optima'),(4685,2005,'Kia','Rio'),(4679,2005,'Kia','Sedona'),(4684,2005,'Kia','Sorento'),(4680,2005,'Kia','Spectra'),(4681,2005,'Kia','Sportage'),(4687,2005,'Lamborghini','Gallardo'),(4686,2005,'Lamborghini','Murciélago'),(4674,2005,'Land Rover','Discovery'),(4675,2005,'Land Rover','Freelander'),(4677,2005,'Land Rover','LR3'),(4676,2005,'Land Rover','Range Rover'),(4623,2005,'Lexus','ES'),(4618,2005,'Lexus','GS'),(4621,2005,'Lexus','GX'),(4619,2005,'Lexus','IS'),(4622,2005,'Lexus','LS'),(4620,2005,'Lexus','LX'),(4617,2005,'Lexus','RX'),(4624,2005,'Lexus','SC'),(4638,2005,'Lincoln','Aviator'),(4641,2005,'Lincoln','LS'),(4640,2005,'Lincoln','Navigator'),(4639,2005,'Lincoln','Town Car'),(4763,2005,'Lotus','Elise'),(4764,2005,'Lotus','Exige'),(4615,2005,'Maserati','Coupe'),(4613,2005,'Maserati','Gran Sport'),(4616,2005,'Maserati','GranSport'),(4614,2005,'Maserati','Quattroporte'),(4612,2005,'Maserati','Spyder'),(4688,2005,'Maybach','57'),(4690,2005,'Maybach','57S'),(4689,2005,'Maybach','62'),(4598,2005,'Mazda','B-Series'),(4597,2005,'Mazda','Mazda3'),(4599,2005,'Mazda','Mazda6'),(4603,2005,'Mazda','Miata MX-5'),(4602,2005,'Mazda','MPV'),(4596,2005,'Mazda','MX-5'),(4601,2005,'Mazda','RX-8'),(4600,2005,'Mazda','Tribute'),(4549,2005,'Mercedes-Benz','C-Class'),(4548,2005,'Mercedes-Benz','CL-Class'),(4546,2005,'Mercedes-Benz','CLK-Class'),(4547,2005,'Mercedes-Benz','E-Class'),(4554,2005,'Mercedes-Benz','G-Class'),(4551,2005,'Mercedes-Benz','M-Class'),(4552,2005,'Mercedes-Benz','S-Class'),(4555,2005,'Mercedes-Benz','SL-Class'),(4550,2005,'Mercedes-Benz','SLK-Class'),(4553,2005,'Mercedes-Benz','SLR McLaren'),(4635,2005,'Mercury','Grand Marquis'),(4636,2005,'Mercury','Mariner'),(4634,2005,'Mercury','Montego'),(4637,2005,'Mercury','Monterey'),(4633,2005,'Mercury','Mountaineer'),(4632,2005,'Mercury','Sable'),(4691,2005,'MINI','Cooper'),(4573,2005,'Mitsubishi','Diamante'),(4578,2005,'Mitsubishi','Eclipse'),(4572,2005,'Mitsubishi','Endeavor'),(4579,2005,'Mitsubishi','Galant'),(4574,2005,'Mitsubishi','Lancer'),(4577,2005,'Mitsubishi','Lancer Evolution'),(4580,2005,'Mitsubishi','Montero'),(4576,2005,'Mitsubishi','Outlander'),(4575,2005,'Mitsubishi','Pajero'),(4765,2005,'Nissan','350Z'),(4766,2005,'Nissan','Altima'),(4767,2005,'Nissan','Armada'),(4768,2005,'Nissan','Frontier'),(4769,2005,'Nissan','Maxima'),(4770,2005,'Nissan','Murano'),(4771,2005,'Nissan','Pathfinder'),(4772,2005,'Nissan','Quest'),(4773,2005,'Nissan','Sentra'),(4774,2005,'Nissan','Titan'),(4775,2005,'Nissan','Xterra'),(4776,2005,'Panoz','Esperante'),(4491,2005,'Pontiac','Aztek'),(4497,2005,'Pontiac','Bonneville'),(4498,2005,'Pontiac','Daewoo Kalos'),(4496,2005,'Pontiac','G6'),(4492,2005,'Pontiac','Grand Am'),(4501,2005,'Pontiac','Grand Prix'),(4500,2005,'Pontiac','GTO'),(4493,2005,'Pontiac','Montana'),(4502,2005,'Pontiac','Montana SV6'),(4499,2005,'Pontiac','Monterey'),(4495,2005,'Pontiac','Sunfire'),(4494,2005,'Pontiac','Vibe'),(4533,2005,'Porsche','911'),(4535,2005,'Porsche','Boxster'),(4536,2005,'Porsche','Carrera GT'),(4534,2005,'Porsche','Cayenne'),(4777,2005,'Rolls-Royce','Phantom'),(4695,2005,'Saab','9-2X'),(4694,2005,'Saab','9-3'),(4693,2005,'Saab','9-5'),(4692,2005,'Saab','9-7X'),(4778,2005,'Saturn','Ion'),(4779,2005,'Saturn','L-Series'),(4780,2005,'Saturn','Relay'),(4781,2005,'Saturn','VUE'),(4476,2005,'Scion','tC'),(4477,2005,'Scion','xA'),(4475,2005,'Scion','xB'),(4678,2005,'Spyker Cars','C8'),(4670,2005,'Subaru','Baja'),(4673,2005,'Subaru','Forester'),(4672,2005,'Subaru','Impreza'),(4671,2005,'Subaru','Legacy'),(4669,2005,'Subaru','Outback'),(4537,2005,'Suzuki','Aerio'),(4541,2005,'Suzuki','Daewoo Lacetti'),(4539,2005,'Suzuki','Daewoo Magnus'),(4543,2005,'Suzuki','Forenza'),(4538,2005,'Suzuki','Grand Vitara'),(4542,2005,'Suzuki','Reno'),(4540,2005,'Suzuki','Swift'),(4544,2005,'Suzuki','Verona'),(4545,2005,'Suzuki','XL-7'),(4709,2005,'Toyota','4Runner'),(4710,2005,'Toyota','Avalon'),(4711,2005,'Toyota','Camry'),(4712,2005,'Toyota','Celica'),(4713,2005,'Toyota','Corolla'),(4714,2005,'Toyota','Echo'),(4715,2005,'Toyota','Highlander'),(4716,2005,'Toyota','Land Cruiser'),(4717,2005,'Toyota','Matrix'),(4718,2005,'Toyota','MR2'),(4719,2005,'Toyota','Prius'),(4720,2005,'Toyota','RAV4'),(4721,2005,'Toyota','Sequoia'),(4722,2005,'Toyota','Sienna'),(4723,2005,'Toyota','Solara'),(4708,2005,'Toyota','Tacoma'),(4724,2005,'Toyota','Tundra'),(4484,2005,'Volkswagen','Golf'),(4481,2005,'Volkswagen','GTI'),(4482,2005,'Volkswagen','Jetta'),(4483,2005,'Volkswagen','New Beetle'),(4479,2005,'Volkswagen','Passat'),(4478,2005,'Volkswagen','Phaeton'),(4480,2005,'Volkswagen','Touareg'),(4782,2005,'Volvo','S40'),(4783,2005,'Volvo','S60'),(4784,2005,'Volvo','S80'),(4785,2005,'Volvo','V50'),(4786,2005,'Volvo','V70'),(4787,2005,'Volvo','XC70'),(4788,2005,'Volvo','XC90'),(5115,2006,'Acura','MDX'),(5117,2006,'Acura','RL'),(5119,2006,'Acura','RSX'),(5116,2006,'Acura','TL'),(5118,2006,'Acura','TSX'),(5124,2006,'Aston Martin','DB9'),(5122,2006,'Aston Martin','DB9 Volante'),(5123,2006,'Aston Martin','V8 Vantage'),(5125,2006,'Aston Martin','Vanquish S'),(5126,2006,'Aston Martin','Vantage'),(5026,2006,'Audi','A3'),(5029,2006,'Audi','A4'),(5030,2006,'Audi','A6'),(5032,2006,'Audi','A8'),(5027,2006,'Audi','S4'),(5031,2006,'Audi','S8'),(5028,2006,'Audi','TT'),(4821,2006,'Bentley','Arnage'),(4822,2006,'Bentley','Azure'),(4825,2006,'Bentley','Continental'),(4824,2006,'Bentley','Continental Flying Spur'),(4823,2006,'Bentley','Continental GT'),(4826,2006,'BMW','3 Series'),(4830,2006,'BMW','325'),(4831,2006,'BMW','330'),(4827,2006,'BMW','5 Series'),(4832,2006,'BMW','525'),(4833,2006,'BMW','530'),(4834,2006,'BMW','550'),(4828,2006,'BMW','6 Series'),(4835,2006,'BMW','650'),(4829,2006,'BMW','7 Series'),(4836,2006,'BMW','750'),(4837,2006,'BMW','760'),(4844,2006,'BMW','M Roadster'),(4838,2006,'BMW','M3'),(4839,2006,'BMW','M5'),(4840,2006,'BMW','M6'),(4841,2006,'BMW','X3'),(4842,2006,'BMW','X5'),(4843,2006,'BMW','Z4'),(4845,2006,'BMW','Z4 M'),(4905,2006,'Buick','LaCrosse'),(4903,2006,'Buick','Lucerne'),(4904,2006,'Buick','Rainier'),(4902,2006,'Buick','Rendezvous'),(4906,2006,'Buick','Terraza'),(4875,2006,'Cadillac','CTS'),(4874,2006,'Cadillac','CTS-V'),(4870,2006,'Cadillac','DTS'),(4873,2006,'Cadillac','Escalade'),(4877,2006,'Cadillac','Escalade ESV'),(4872,2006,'Cadillac','Escalade EXT'),(4869,2006,'Cadillac','SRX'),(4868,2006,'Cadillac','STS'),(4876,2006,'Cadillac','STS-V'),(4867,2006,'Cadillac','XLR'),(4871,2006,'Cadillac','XLR-V'),(4988,2006,'Chevrolet','Avalanche'),(4989,2006,'Chevrolet','Avalanche 1500'),(4990,2006,'Chevrolet','Avalanche 2500'),(4983,2006,'Chevrolet','Aveo'),(4977,2006,'Chevrolet','Cobalt'),(4981,2006,'Chevrolet','Colorado'),(4976,2006,'Chevrolet','Corvette'),(4972,2006,'Chevrolet','Equinox'),(4987,2006,'Chevrolet','Express'),(4991,2006,'Chevrolet','Express 1500'),(4992,2006,'Chevrolet','Express 2500'),(4993,2006,'Chevrolet','Express 3500'),(4979,2006,'Chevrolet','HHR'),(4973,2006,'Chevrolet','HHR Panel'),(4968,2006,'Chevrolet','Impala'),(4978,2006,'Chevrolet','Malibu'),(4975,2006,'Chevrolet','Malibu Maxx'),(4970,2006,'Chevrolet','Monte Carlo'),(4985,2006,'Chevrolet','Silverado'),(4994,2006,'Chevrolet','Silverado 1500'),(4984,2006,'Chevrolet','Silverado 2500'),(4995,2006,'Chevrolet','Silverado 3500'),(4971,2006,'Chevrolet','Silverado 3500HD'),(4982,2006,'Chevrolet','Silverado Hybrid'),(4996,2006,'Chevrolet','SSR'),(4969,2006,'Chevrolet','Suburban'),(4997,2006,'Chevrolet','Suburban 1500'),(4998,2006,'Chevrolet','Suburban 2500'),(4986,2006,'Chevrolet','Tahoe'),(4980,2006,'Chevrolet','Trailblazer'),(4974,2006,'Chevrolet','Uplander'),(5087,2006,'Chrysler','300'),(5093,2006,'Chrysler','Crossfire'),(5092,2006,'Chrysler','Crossfire Roadster'),(5090,2006,'Chrysler','Pacifica'),(5088,2006,'Chrysler','PT Cruiser'),(5091,2006,'Chrysler','Sebring'),(5089,2006,'Chrysler','Town & Country'),(5109,2006,'Dodge','Caravan'),(5105,2006,'Dodge','Charger'),(5106,2006,'Dodge','Dakota'),(5112,2006,'Dodge','Dakota Club'),(5108,2006,'Dodge','Durango'),(5113,2006,'Dodge','Grand Caravan'),(5107,2006,'Dodge','Magnum'),(5111,2006,'Dodge','Ram 1500'),(5110,2006,'Dodge','Ram 2500'),(5102,2006,'Dodge','Ram 3500'),(5103,2006,'Dodge','Sprinter'),(5114,2006,'Dodge','Stratus'),(5104,2006,'Dodge','Viper'),(5135,2006,'Ferrari','612 Scaglietti'),(5134,2006,'Ferrari','F430'),(5136,2006,'Ferrari','F430 Spider'),(5018,2006,'Ford','Crown Victoria'),(5005,2006,'Ford','E-350 Super Duty'),(5015,2006,'Ford','E-350 Super Duty Van'),(5007,2006,'Ford','E-Series'),(5021,2006,'Ford','E150'),(5013,2006,'Ford','E250'),(5022,2006,'Ford','E350'),(5002,2006,'Ford','Escape'),(4999,2006,'Ford','Expedition'),(5008,2006,'Ford','Explorer'),(5020,2006,'Ford','Explorer Sport Trac'),(5001,2006,'Ford','F-250 Super Duty'),(5003,2006,'Ford','F-350 Super Duty'),(5004,2006,'Ford','F-Series'),(5023,2006,'Ford','F150'),(5024,2006,'Ford','F250'),(5025,2006,'Ford','F350'),(5010,2006,'Ford','Five Hundred'),(5012,2006,'Ford','Focus'),(5009,2006,'Ford','Freestar'),(5000,2006,'Ford','Freestyle'),(5019,2006,'Ford','Fusion'),(5016,2006,'Ford','GT'),(5011,2006,'Ford','Mustang'),(5017,2006,'Ford','Ranger'),(5014,2006,'Ford','Taurus'),(5006,2006,'Ford','Thunderbird'),(4796,2006,'GMC','Canyon'),(4795,2006,'GMC','Envoy'),(4801,2006,'GMC','Envoy XL'),(4800,2006,'GMC','Savana'),(4802,2006,'GMC','Savana 1500'),(4803,2006,'GMC','Savana 2500'),(4804,2006,'GMC','Savana 3500'),(4797,2006,'GMC','Savana Cargo Van'),(4792,2006,'GMC','Sierra 1500'),(4805,2006,'GMC','Sierra 2500'),(4793,2006,'GMC','Sierra 2500HD'),(4806,2006,'GMC','Sierra 3500'),(4791,2006,'GMC','Sierra 3500HD'),(4789,2006,'GMC','Sierra Denali'),(4798,2006,'GMC','Sierra Hybrid'),(4799,2006,'GMC','Yukon'),(4790,2006,'GMC','Yukon Denali'),(4794,2006,'GMC','Yukon XL'),(4807,2006,'GMC','Yukon XL 1500'),(4808,2006,'GMC','Yukon XL 2500'),(4889,2006,'Honda','Accord'),(4882,2006,'Honda','Civic'),(4891,2006,'Honda','Civic Si'),(4888,2006,'Honda','CR-V'),(4884,2006,'Honda','Element'),(4890,2006,'Honda','Insight'),(4887,2006,'Honda','Odyssey'),(4883,2006,'Honda','Pilot'),(4885,2006,'Honda','Ridgeline'),(4886,2006,'Honda','S2000'),(5073,2006,'HUMMER','H1'),(5074,2006,'HUMMER','H2'),(5070,2006,'Hummer','H2 SUT'),(5071,2006,'Hummer','H2 SUV'),(5072,2006,'Hummer','H3'),(4864,2006,'Hyundai','Accent'),(4861,2006,'Hyundai','Azera'),(4862,2006,'Hyundai','Elantra'),(4865,2006,'Hyundai','Santa Fe'),(4863,2006,'Hyundai','Sonata'),(4866,2006,'Hyundai','Tiburon'),(4860,2006,'Hyundai','Tucson'),(5033,2006,'Infiniti','FX'),(5036,2006,'Infiniti','G'),(5034,2006,'Infiniti','G35'),(5035,2006,'Infiniti','M'),(5037,2006,'Infiniti','Q'),(5038,2006,'Infiniti','QX'),(5147,2006,'Isuzu','Ascender'),(5148,2006,'Isuzu','i-280'),(5149,2006,'Isuzu','i-350'),(5146,2006,'Isuzu','i-Series'),(4944,2006,'Jaguar','S-Type'),(4942,2006,'Jaguar','X-Type'),(4943,2006,'Jaguar','XJ'),(4941,2006,'Jaguar','XK'),(4881,2006,'Jeep','Commander'),(4880,2006,'Jeep','Grand Cherokee'),(4878,2006,'Jeep','Liberty'),(4879,2006,'Jeep','Wrangler'),(4921,2006,'Kia','Amanti'),(4916,2006,'Kia','Optima'),(4919,2006,'Kia','Rio'),(4922,2006,'Kia','Sedona'),(4915,2006,'Kia','Sorento'),(4917,2006,'Kia','Spectra'),(4920,2006,'Kia','Spectra5'),(4918,2006,'Kia','Sportage'),(5127,2006,'Lamborghini','Gallardo'),(5128,2006,'Lamborghini','Murciélago'),(5040,2006,'Land Rover','Discovery'),(5042,2006,'Land Rover','LR3'),(5041,2006,'Land Rover','Range Rover'),(5039,2006,'Land Rover','Range Rover Sport'),(5047,2006,'Lexus','ES'),(5043,2006,'Lexus','GS'),(5049,2006,'Lexus','GX'),(5045,2006,'Lexus','IS'),(5051,2006,'Lexus','LS'),(5050,2006,'Lexus','LX'),(5044,2006,'Lexus','RX'),(5046,2006,'Lexus','RX Hybrid'),(5048,2006,'Lexus','SC'),(5098,2006,'Lincoln','LS'),(5097,2006,'Lincoln','Mark LT'),(5096,2006,'Lincoln','Navigator'),(5094,2006,'Lincoln','Town Car'),(5095,2006,'Lincoln','Zephyr'),(5154,2006,'Lotus','Elise'),(5155,2006,'Lotus','Exige'),(5139,2006,'Maserati','Coupe'),(5138,2006,'Maserati','Gran Sport'),(5140,2006,'Maserati','GranSport'),(5137,2006,'Maserati','Quattroporte'),(5120,2006,'Maybach','57'),(5121,2006,'Maybach','62'),(4809,2006,'Mazda','B-Series'),(4817,2006,'Mazda','Mazda3'),(4813,2006,'Mazda','Mazda5'),(4811,2006,'Mazda','Mazda6'),(4812,2006,'Mazda','Mazda6 5-Door'),(4815,2006,'Mazda','Mazda6 Sport'),(4818,2006,'Mazda','Mazdaspeed6'),(4820,2006,'Mazda','Miata MX-5'),(4816,2006,'Mazda','MPV'),(4819,2006,'Mazda','MX-5'),(4814,2006,'Mazda','RX-8'),(4810,2006,'Mazda','Tribute'),(4847,2006,'Mercedes-Benz','C-Class'),(4850,2006,'Mercedes-Benz','CL-Class'),(4856,2006,'Mercedes-Benz','CLK-Class'),(4848,2006,'Mercedes-Benz','CLS-Class'),(4849,2006,'Mercedes-Benz','E-Class'),(4855,2006,'Mercedes-Benz','G-Class'),(4854,2006,'Mercedes-Benz','G55 AMG'),(4853,2006,'Mercedes-Benz','M-Class'),(4859,2006,'Mercedes-Benz','R-Class'),(4852,2006,'Mercedes-Benz','S-Class'),(4846,2006,'Mercedes-Benz','SL-Class'),(4857,2006,'Mercedes-Benz','SL65 AMG'),(4851,2006,'Mercedes-Benz','SLK-Class'),(4858,2006,'Mercedes-Benz','SLR McLaren'),(5066,2006,'Mercury','Grand Marquis'),(5065,2006,'Mercury','Mariner'),(5069,2006,'Mercury','Milan'),(5068,2006,'Mercury','Montego'),(5067,2006,'Mercury','Monterey'),(5064,2006,'Mercury','Mountaineer'),(5142,2006,'MINI','Cooper'),(4936,2006,'Mitsubishi','Eclipse'),(4938,2006,'Mitsubishi','Endeavor'),(4932,2006,'Mitsubishi','Galant'),(4933,2006,'Mitsubishi','Lancer'),(4939,2006,'Mitsubishi','Lancer Evolution'),(4940,2006,'Mitsubishi','Montero'),(4934,2006,'Mitsubishi','Outlander'),(4935,2006,'Mitsubishi','Pajero'),(4937,2006,'Mitsubishi','Raider'),(5143,2006,'Morgan','Aero 8'),(5078,2006,'Nissan','350Z'),(5082,2006,'Nissan','350Z Roadster'),(5084,2006,'Nissan','Altima'),(5085,2006,'Nissan','Armada'),(5077,2006,'Nissan','Frontier'),(5076,2006,'Nissan','Maxima'),(5080,2006,'Nissan','Murano'),(5086,2006,'Nissan','Pathfinder'),(5075,2006,'Nissan','Quest'),(5081,2006,'Nissan','Sentra'),(5083,2006,'Nissan','Titan'),(5079,2006,'Nissan','Xterra'),(5145,2006,'Panoz','Esperante'),(5144,2006,'Peugeot','207'),(4929,2006,'Pontiac','Daewoo Kalos'),(4924,2006,'Pontiac','G6'),(4926,2006,'Pontiac','Grand Prix'),(4930,2006,'Pontiac','GTO'),(4923,2006,'Pontiac','Montana'),(4931,2006,'Pontiac','Montana SV6'),(4928,2006,'Pontiac','Solstice'),(4927,2006,'Pontiac','Torrent'),(4925,2006,'Pontiac','Vibe'),(5060,2006,'Porsche','911'),(5063,2006,'Porsche','Boxster'),(5061,2006,'Porsche','Cayenne'),(5062,2006,'Porsche','Cayman'),(5150,2006,'Rolls-Royce','Phantom'),(5130,2006,'Saab','9-2X'),(5132,2006,'Saab','9-3'),(5131,2006,'Saab','9-5'),(5133,2006,'Saab','9-7X'),(5152,2006,'Saturn','Ion'),(5153,2006,'Saturn','Relay'),(5151,2006,'Saturn','Vue'),(5101,2006,'Scion','tC'),(5099,2006,'Scion','xA'),(5100,2006,'Scion','xB'),(5129,2006,'Spyker','C8 Double 12 S'),(5141,2006,'Spyker Cars','C8'),(4967,2006,'Subaru','B9 Tribeca'),(4965,2006,'Subaru','Baja'),(4966,2006,'Subaru','Forester'),(4963,2006,'Subaru','Impreza'),(4962,2006,'Subaru','Legacy'),(4961,2006,'Subaru','Outback'),(4964,2006,'Subaru','Tribeca'),(4894,2006,'Suzuki','Aerio'),(4896,2006,'Suzuki','Daewoo Lacetti'),(4893,2006,'Suzuki','Daewoo Magnus'),(4899,2006,'Suzuki','Forenza'),(4895,2006,'Suzuki','Grand Vitara'),(4897,2006,'Suzuki','Reno'),(4898,2006,'Suzuki','Swift'),(4900,2006,'Suzuki','Verona'),(4901,2006,'Suzuki','XL-7'),(4892,2006,'Suzuki','XL7'),(4949,2006,'Toyota','4Runner'),(4953,2006,'Toyota','Avalon'),(4955,2006,'Toyota','Camry'),(4957,2006,'Toyota','Camry Solara'),(4946,2006,'Toyota','Corolla'),(4959,2006,'Toyota','Highlander'),(4948,2006,'Toyota','Land Cruiser'),(4956,2006,'Toyota','Matrix'),(4952,2006,'Toyota','Prius'),(4947,2006,'Toyota','RAV4'),(4945,2006,'Toyota','Sequoia'),(4958,2006,'Toyota','Sienna'),(4960,2006,'Toyota','Solara'),(4951,2006,'Toyota','Tacoma'),(4950,2006,'Toyota','Tundra'),(4954,2006,'Toyota','Yaris'),(4910,2006,'Volkswagen','Golf'),(4913,2006,'Volkswagen','GTI'),(4914,2006,'Volkswagen','Jetta'),(4908,2006,'Volkswagen','New Beetle'),(4912,2006,'Volkswagen','Passat'),(4911,2006,'Volkswagen','Phaeton'),(4909,2006,'Volkswagen','Rabbit'),(4907,2006,'Volkswagen','Touareg'),(5056,2006,'Volvo','C70'),(5055,2006,'Volvo','S40'),(5059,2006,'Volvo','S60'),(5058,2006,'Volvo','S80'),(5052,2006,'Volvo','V50'),(5057,2006,'Volvo','V70'),(5054,2006,'Volvo','XC70'),(5053,2006,'Volvo','XC90'),(5470,2007,'Acura','MDX'),(5468,2007,'Acura','RDX'),(5469,2007,'Acura','RL'),(5471,2007,'Acura','TL'),(5472,2007,'Acura','TSX'),(5326,2007,'Aston Martin','DB9'),(5325,2007,'Aston Martin','V8 Vantage'),(5327,2007,'Aston Martin','Vantage'),(5301,2007,'Audi','A3'),(5302,2007,'Audi','A4'),(5304,2007,'Audi','A6'),(5303,2007,'Audi','A8'),(5300,2007,'Audi','Q7'),(5309,2007,'Audi','RS 4'),(5305,2007,'Audi','RS4'),(5306,2007,'Audi','S4'),(5308,2007,'Audi','S6'),(5307,2007,'Audi','S8'),(5466,2007,'Bentley','Arnage'),(5463,2007,'Bentley','Azure'),(5467,2007,'Bentley','Continental'),(5465,2007,'Bentley','Continental Flying Spur'),(5462,2007,'Bentley','Continental GT'),(5464,2007,'Bentley','Continental GTC'),(5226,2007,'BMW','3 Series'),(5227,2007,'BMW','5 Series'),(5230,2007,'BMW','530'),(5228,2007,'BMW','6 Series'),(5229,2007,'BMW','7 Series'),(5236,2007,'BMW','Alpina B7'),(5232,2007,'BMW','M Roadster'),(5233,2007,'BMW','M5'),(5231,2007,'BMW','M6'),(5234,2007,'BMW','X3'),(5235,2007,'BMW','X5'),(5237,2007,'BMW','Z4 M'),(5320,2007,'Buick','LaCrosse'),(5324,2007,'Buick','Lucerne'),(5323,2007,'Buick','Rainier'),(5321,2007,'Buick','Rendezvous'),(5322,2007,'Buick','Terraza'),(5434,2007,'Cadillac','CTS'),(5439,2007,'Cadillac','CTS-V'),(5441,2007,'Cadillac','DTS'),(5437,2007,'Cadillac','Escalade'),(5442,2007,'Cadillac','Escalade ESV'),(5443,2007,'Cadillac','Escalade EXT'),(5436,2007,'Cadillac','SRX'),(5440,2007,'Cadillac','STS'),(5438,2007,'Cadillac','XLR'),(5435,2007,'Cadillac','XLR-V'),(5162,2007,'Chevrolet','Avalanche'),(5169,2007,'Chevrolet','Aveo'),(5163,2007,'Chevrolet','Cobalt'),(5161,2007,'Chevrolet','Cobalt SS'),(5157,2007,'Chevrolet','Colorado'),(5156,2007,'Chevrolet','Corvette'),(5158,2007,'Chevrolet','Equinox'),(5171,2007,'Chevrolet','Express'),(5173,2007,'Chevrolet','Express 1500'),(5174,2007,'Chevrolet','Express 2500'),(5175,2007,'Chevrolet','Express 3500'),(5166,2007,'Chevrolet','HHR'),(5172,2007,'Chevrolet','Impala'),(5167,2007,'Chevrolet','Malibu'),(5168,2007,'Chevrolet','Monte Carlo'),(5159,2007,'Chevrolet','Silverado'),(5176,2007,'Chevrolet','Silverado 1500'),(5177,2007,'Chevrolet','Silverado 2500'),(5178,2007,'Chevrolet','Silverado 3500'),(5165,2007,'Chevrolet','Suburban'),(5179,2007,'Chevrolet','Suburban 1500'),(5180,2007,'Chevrolet','Suburban 2500'),(5164,2007,'Chevrolet','Tahoe'),(5170,2007,'Chevrolet','Trailblazer'),(5160,2007,'Chevrolet','Uplander'),(5480,2007,'Chrysler','300'),(5483,2007,'Chrysler','Aspen'),(5484,2007,'Chrysler','Crossfire'),(5485,2007,'Chrysler','Pacifica'),(5486,2007,'Chrysler','PT Cruiser'),(5482,2007,'Chrysler','Sebring'),(5481,2007,'Chrysler','Town & Country'),(5244,2007,'Dodge','Caliber'),(5242,2007,'Dodge','Caravan'),(5239,2007,'Dodge','Charger'),(5241,2007,'Dodge','Dakota'),(5246,2007,'Dodge','Dakota Club'),(5245,2007,'Dodge','Durango'),(5247,2007,'Dodge','Grand Caravan'),(5240,2007,'Dodge','Magnum'),(5243,2007,'Dodge','Nitro'),(5238,2007,'Dodge','Ram'),(5248,2007,'Dodge','Ram 1500'),(5249,2007,'Dodge','Ram 2500'),(5250,2007,'Dodge','Ram 3500'),(5408,2007,'Ferrari','599 GTB Fiorano'),(5409,2007,'Ferrari','612 Scaglietti'),(5407,2007,'Ferrari','F430'),(5341,2007,'Foose','Hemisfear'),(5190,2007,'Ford','Crown Victoria'),(5195,2007,'Ford','E-Series'),(5206,2007,'Ford','E150'),(5207,2007,'Ford','E250'),(5208,2007,'Ford','E350'),(5204,2007,'Ford','Edge'),(5189,2007,'Ford','Escape'),(5205,2007,'Ford','Expedition'),(5209,2007,'Ford','Expedition EL'),(5203,2007,'Ford','Explorer'),(5197,2007,'Ford','Explorer Sport Trac'),(5199,2007,'Ford','F-Series'),(5193,2007,'Ford','F-Series Super Duty'),(5210,2007,'Ford','F150'),(5211,2007,'Ford','F250'),(5212,2007,'Ford','F350'),(5201,2007,'Ford','Five Hundred'),(5188,2007,'Ford','Focus'),(5194,2007,'Ford','Freestar'),(5200,2007,'Ford','Freestyle'),(5191,2007,'Ford','Fusion'),(5198,2007,'Ford','GT500'),(5192,2007,'Ford','Mustang'),(5202,2007,'Ford','Ranger'),(5196,2007,'Ford','Taurus'),(5380,2007,'GMC','Acadia'),(5384,2007,'GMC','Canyon'),(5381,2007,'GMC','Envoy'),(5379,2007,'GMC','Savana'),(5385,2007,'GMC','Savana 1500'),(5386,2007,'GMC','Savana 2500'),(5387,2007,'GMC','Savana 3500'),(5382,2007,'GMC','Sierra'),(5388,2007,'GMC','Sierra 1500'),(5389,2007,'GMC','Sierra 2500'),(5390,2007,'GMC','Sierra 3500'),(5383,2007,'GMC','Yukon'),(5391,2007,'GMC','Yukon XL 1500'),(5392,2007,'GMC','Yukon XL 2500'),(5361,2007,'Honda','Accord'),(5357,2007,'Honda','Civic'),(5362,2007,'Honda','CR-V'),(5363,2007,'Honda','Element'),(5360,2007,'Honda','Fit'),(5358,2007,'Honda','Odyssey'),(5355,2007,'Honda','Pilot'),(5356,2007,'Honda','Ridgeline'),(5359,2007,'Honda','S2000'),(5398,2007,'Hummer','H2'),(5397,2007,'Hummer','H3'),(5333,2007,'Hyundai','Accent'),(5335,2007,'Hyundai','Azera'),(5338,2007,'Hyundai','Elantra'),(5334,2007,'Hyundai','Entourage'),(5339,2007,'Hyundai','Santa Fe'),(5336,2007,'Hyundai','Sonata'),(5337,2007,'Hyundai','Tiburon'),(5340,2007,'Hyundai','Tucson'),(5332,2007,'Hyundai','Veracruz'),(5343,2007,'Infiniti','FX'),(5346,2007,'Infiniti','G'),(5342,2007,'Infiniti','G35'),(5345,2007,'Infiniti','M'),(5347,2007,'Infiniti','QX'),(5344,2007,'Infiniti','QX56'),(5329,2007,'Isuzu','Ascender'),(5330,2007,'Isuzu','i-290'),(5331,2007,'Isuzu','i-370'),(5328,2007,'Isuzu','i-Series'),(5312,2007,'Jaguar','S-Type'),(5311,2007,'Jaguar','X-Type'),(5313,2007,'Jaguar','XJ'),(5310,2007,'Jaguar','XK'),(5318,2007,'Jeep','Commander'),(5314,2007,'Jeep','Compass'),(5319,2007,'Jeep','Grand Cherokee'),(5315,2007,'Jeep','Liberty'),(5316,2007,'Jeep','Patriot'),(5317,2007,'Jeep','Wrangler'),(5267,2007,'Kia','Amanti'),(5264,2007,'Kia','Carens'),(5262,2007,'Kia','Optima'),(5265,2007,'Kia','Rio'),(5268,2007,'Kia','Rondo'),(5260,2007,'Kia','Sedona'),(5266,2007,'Kia','Sorento'),(5261,2007,'Kia','Spectra'),(5263,2007,'Kia','Sportage'),(5473,2007,'Lamborghini','Gallardo'),(5474,2007,'Lamborghini','Murciélago'),(5478,2007,'Land Rover','Discovery'),(5479,2007,'Land Rover','LR3'),(5477,2007,'Land Rover','Range Rover'),(5476,2007,'Land Rover','Range Rover Sport'),(5259,2007,'Lexus','ES'),(5257,2007,'Lexus','GS'),(5256,2007,'Lexus','GX'),(5251,2007,'Lexus','IS'),(5258,2007,'Lexus','LS'),(5253,2007,'Lexus','LX'),(5254,2007,'Lexus','RX'),(5255,2007,'Lexus','RX Hybrid'),(5252,2007,'Lexus','SC'),(5417,2007,'Lincoln','Mark LT'),(5416,2007,'Lincoln','MKX'),(5419,2007,'Lincoln','MKZ'),(5418,2007,'Lincoln','Navigator'),(5421,2007,'Lincoln','Navigator L'),(5420,2007,'Lincoln','Town Car'),(5490,2007,'Lotus','Elise'),(5491,2007,'Lotus','Exige'),(5487,2007,'Maserati','Quattroporte'),(5393,2007,'Maybach','57'),(5394,2007,'Maybach','62'),(5289,2007,'Mazda','B-Series'),(5294,2007,'Mazda','CX-7'),(5298,2007,'Mazda','CX-9'),(5292,2007,'Mazda','Mazda3'),(5297,2007,'Mazda','Mazda5'),(5291,2007,'Mazda','Mazda6'),(5296,2007,'Mazda','Mazdaspeed 3'),(5290,2007,'Mazda','Mazdaspeed6'),(5299,2007,'Mazda','Miata MX-5'),(5295,2007,'Mazda','MX-5'),(5293,2007,'Mazda','RX-8'),(5213,2007,'Mercedes-Benz','C-Class'),(5217,2007,'Mercedes-Benz','CL-Class'),(5221,2007,'Mercedes-Benz','CLK-Class'),(5223,2007,'Mercedes-Benz','CLS-Class'),(5218,2007,'Mercedes-Benz','E-Class'),(5214,2007,'Mercedes-Benz','G-Class'),(5222,2007,'Mercedes-Benz','GL-Class'),(5215,2007,'Mercedes-Benz','M-Class'),(5216,2007,'Mercedes-Benz','R-Class'),(5225,2007,'Mercedes-Benz','S-Class'),(5220,2007,'Mercedes-Benz','SL-Class'),(5219,2007,'Mercedes-Benz','SLK-Class'),(5224,2007,'Mercedes-Benz','SLR McLaren'),(5353,2007,'Mercury','Grand Marquis'),(5350,2007,'Mercury','Mariner'),(5352,2007,'Mercury','Milan'),(5349,2007,'Mercury','Montego'),(5351,2007,'Mercury','Monterey'),(5354,2007,'Mercury','Mountaineer'),(5475,2007,'MINI','Cooper'),(5444,2007,'Mitsubishi','Eclipse'),(5448,2007,'Mitsubishi','Endeavor'),(5447,2007,'Mitsubishi','Galant'),(5445,2007,'Mitsubishi','Lancer'),(5449,2007,'Mitsubishi','Outlander'),(5446,2007,'Mitsubishi','Raider'),(5488,2007,'Morgan','Aero 8'),(5371,2007,'Nissan','350Z'),(5373,2007,'Nissan','Altima'),(5368,2007,'Nissan','Armada'),(5372,2007,'Nissan','Frontier'),(5375,2007,'Nissan','Maxima'),(5367,2007,'Nissan','Murano'),(5378,2007,'Nissan','Pathfinder'),(5377,2007,'Nissan','Quest'),(5376,2007,'Nissan','Sentra'),(5370,2007,'Nissan','Titan'),(5369,2007,'Nissan','Versa'),(5374,2007,'Nissan','Xterra'),(5348,2007,'Panoz','Esperante'),(5458,2007,'Peugeot','207'),(5432,2007,'Pontiac','G5'),(5428,2007,'Pontiac','G6'),(5429,2007,'Pontiac','Grand Prix'),(5430,2007,'Pontiac','Solstice'),(5433,2007,'Pontiac','Torrent'),(5431,2007,'Pontiac','Vibe'),(5459,2007,'Porsche','911'),(5460,2007,'Porsche','Boxster'),(5461,2007,'Porsche','Cayman'),(5489,2007,'Rolls-Royce','Phantom'),(5365,2007,'Saab','9-3'),(5366,2007,'Saab','9-5'),(5364,2007,'Saab','9-7X'),(5424,2007,'Saturn','Aura'),(5426,2007,'Saturn','Ion'),(5422,2007,'Saturn','Outlook'),(5427,2007,'Saturn','Relay'),(5425,2007,'Saturn','Sky'),(5423,2007,'Saturn','VUE'),(5396,2007,'Scion','tC'),(5395,2007,'Spyker Cars','C8'),(5415,2007,'Subaru','B9 Tribeca'),(5413,2007,'Subaru','Forester'),(5411,2007,'Subaru','Impreza'),(5410,2007,'Subaru','Legacy'),(5412,2007,'Subaru','Outback'),(5414,2007,'Subaru','Tribeca'),(5403,2007,'Suzuki','Aerio'),(5399,2007,'Suzuki','Daewoo Lacetti'),(5405,2007,'Suzuki','Forenza'),(5404,2007,'Suzuki','Grand Vitara'),(5401,2007,'Suzuki','Reno'),(5402,2007,'Suzuki','SX4'),(5400,2007,'Suzuki','XL-7'),(5406,2007,'Suzuki','XL7'),(5284,2007,'Toyota','4Runner'),(5270,2007,'Toyota','Avalon'),(5285,2007,'Toyota','Camry'),(5275,2007,'Toyota','Camry Hybrid'),(5271,2007,'Toyota','Camry Solara'),(5280,2007,'Toyota','Corolla'),(5282,2007,'Toyota','FJ Cruiser'),(5277,2007,'Toyota','Highlander'),(5273,2007,'Toyota','Highlander Hybrid'),(5281,2007,'Toyota','Land Cruiser'),(5269,2007,'Toyota','Matrix'),(5279,2007,'Toyota','Prius'),(5286,2007,'Toyota','RAV4'),(5276,2007,'Toyota','Sequoia'),(5283,2007,'Toyota','Sienna'),(5287,2007,'Toyota','Solara'),(5278,2007,'Toyota','Tacoma'),(5274,2007,'Toyota','Tundra'),(5288,2007,'Toyota','TundraMax'),(5272,2007,'Toyota','Yaris'),(5186,2007,'Volkswagen','Eos'),(5181,2007,'Volkswagen','GTI'),(5184,2007,'Volkswagen','Jetta'),(5185,2007,'Volkswagen','New Beetle'),(5187,2007,'Volkswagen','Passat'),(5183,2007,'Volkswagen','Rabbit'),(5182,2007,'Volkswagen','Touareg'),(5455,2007,'Volvo','C70'),(5451,2007,'Volvo','S40'),(5452,2007,'Volvo','S60'),(5453,2007,'Volvo','S80'),(5456,2007,'Volvo','V50'),(5450,2007,'Volvo','V70'),(5454,2007,'Volvo','XC70'),(5457,2007,'Volvo','XC90'),(5825,2008,'Acura','MDX'),(5822,2008,'Acura','RDX'),(5826,2008,'Acura','RL'),(5824,2008,'Acura','TL'),(5823,2008,'Acura','TSX'),(5840,2008,'Aptera','Typ-1'),(5787,2008,'Aston Martin','DB9'),(5788,2008,'Aston Martin','DBS'),(5789,2008,'Aston Martin','V8 Vantage'),(5790,2008,'Aston Martin','Vantage'),(5559,2008,'Audi','A3'),(5549,2008,'Audi','A4'),(5556,2008,'Audi','A5'),(5557,2008,'Audi','A6'),(5554,2008,'Audi','A8'),(5551,2008,'Audi','Q7'),(5555,2008,'Audi','R8'),(5560,2008,'Audi','RS 4'),(5547,2008,'Audi','RS4'),(5548,2008,'Audi','S4'),(5553,2008,'Audi','S5'),(5558,2008,'Audi','S6'),(5550,2008,'Audi','S8'),(5552,2008,'Audi','TT'),(5655,2008,'Bentley','Arnage'),(5658,2008,'Bentley','Azure'),(5659,2008,'Bentley','Continental'),(5656,2008,'Bentley','Continental Flying Spur'),(5657,2008,'Bentley','Continental GT'),(5654,2008,'Bentley','Continental GTC'),(5532,2008,'BMW','1 Series'),(5533,2008,'BMW','3 Series'),(5534,2008,'BMW','5 Series'),(5535,2008,'BMW','6 Series'),(5536,2008,'BMW','7 Series'),(5545,2008,'BMW','Alpina B7'),(5538,2008,'BMW','M Roadster'),(5537,2008,'BMW','M3'),(5539,2008,'BMW','M5'),(5540,2008,'BMW','M6'),(5543,2008,'BMW','X3'),(5541,2008,'BMW','X5'),(5544,2008,'BMW','X6'),(5542,2008,'BMW','Z4'),(5546,2008,'BMW','Z4 M'),(5836,2008,'Buick','Enclave'),(5838,2008,'Buick','LaCrosse'),(5837,2008,'Buick','Lucerne'),(5672,2008,'Cadillac','CTS'),(5674,2008,'Cadillac','DTS'),(5671,2008,'Cadillac','Escalade'),(5678,2008,'Cadillac','Escalade ESV'),(5679,2008,'Cadillac','Escalade EXT'),(5675,2008,'Cadillac','SRX'),(5676,2008,'Cadillac','STS'),(5670,2008,'Cadillac','STS-V'),(5673,2008,'Cadillac','XLR'),(5677,2008,'Cadillac','XLR-V'),(5750,2008,'Chevrolet','Avalanche'),(5755,2008,'Chevrolet','Aveo'),(5747,2008,'Chevrolet','Cobalt'),(5746,2008,'Chevrolet','Cobalt SS'),(5743,2008,'Chevrolet','Colorado'),(5745,2008,'Chevrolet','Corvette'),(5754,2008,'Chevrolet','Equinox'),(5757,2008,'Chevrolet','Express'),(5758,2008,'Chevrolet','Express 1500'),(5759,2008,'Chevrolet','Express 2500'),(5760,2008,'Chevrolet','Express 3500'),(5742,2008,'Chevrolet','HHR'),(5752,2008,'Chevrolet','Impala'),(5749,2008,'Chevrolet','Malibu'),(5751,2008,'Chevrolet','Silverado'),(5761,2008,'Chevrolet','Silverado 1500'),(5762,2008,'Chevrolet','Silverado 2500'),(5763,2008,'Chevrolet','Silverado 3500'),(5753,2008,'Chevrolet','Suburban'),(5764,2008,'Chevrolet','Suburban 1500'),(5765,2008,'Chevrolet','Suburban 2500'),(5748,2008,'Chevrolet','Tahoe'),(5744,2008,'Chevrolet','Trailblazer'),(5756,2008,'Chevrolet','Uplander'),(5727,2008,'Chrysler','300'),(5731,2008,'Chrysler','Aspen'),(5730,2008,'Chrysler','Crossfire'),(5732,2008,'Chrysler','Pacifica'),(5733,2008,'Chrysler','PT Cruiser'),(5728,2008,'Chrysler','Sebring'),(5729,2008,'Chrysler','Town & Country'),(5769,2008,'Dodge','Avenger'),(5774,2008,'Dodge','Caliber'),(5775,2008,'Dodge','Caravan'),(5773,2008,'Dodge','Challenger'),(5771,2008,'Dodge','Charger'),(5770,2008,'Dodge','Dakota'),(5777,2008,'Dodge','Durango'),(5778,2008,'Dodge','Grand Caravan'),(5776,2008,'Dodge','Magnum'),(5767,2008,'Dodge','Nitro'),(5766,2008,'Dodge','Ram'),(5779,2008,'Dodge','Ram 1500'),(5780,2008,'Dodge','Ram 2500'),(5781,2008,'Dodge','Ram 3500'),(5768,2008,'Dodge','Sprinter'),(5772,2008,'Dodge','Viper'),(5829,2008,'Ferrari','430 Scuderia'),(5827,2008,'Ferrari','599 GTB Fiorano'),(5830,2008,'Ferrari','612 Scaglietti'),(5828,2008,'Ferrari','F430'),(5570,2008,'Ford','Crown Victoria'),(5574,2008,'Ford','E-Series'),(5577,2008,'Ford','E150'),(5578,2008,'Ford','E250'),(5579,2008,'Ford','E350'),(5564,2008,'Ford','Edge'),(5567,2008,'Ford','Escape'),(5575,2008,'Ford','Expedition'),(5580,2008,'Ford','Expedition EL'),(5571,2008,'Ford','Explorer'),(5576,2008,'Ford','Explorer Sport Trac'),(5569,2008,'Ford','F-Series'),(5573,2008,'Ford','F-Series Super Duty'),(5581,2008,'Ford','F150'),(5582,2008,'Ford','F250'),(5583,2008,'Ford','F350'),(5584,2008,'Ford','F450'),(5568,2008,'Ford','Focus'),(5562,2008,'Ford','Fusion'),(5563,2008,'Ford','GT500'),(5566,2008,'Ford','Mustang'),(5572,2008,'Ford','Ranger'),(5565,2008,'Ford','Taurus'),(5561,2008,'Ford','Taurus X'),(5595,2008,'GMC','Acadia'),(5592,2008,'GMC','Canyon'),(5597,2008,'GMC','Envoy'),(5594,2008,'GMC','Savana'),(5598,2008,'GMC','Savana 1500'),(5599,2008,'GMC','Savana 2500'),(5600,2008,'GMC','Savana 3500'),(5593,2008,'GMC','Sierra'),(5601,2008,'GMC','Sierra 1500'),(5602,2008,'GMC','Sierra 2500'),(5603,2008,'GMC','Sierra 3500'),(5596,2008,'GMC','Yukon'),(5604,2008,'GMC','Yukon XL 1500'),(5605,2008,'GMC','Yukon XL 2500'),(5723,2008,'Honda','Accord'),(5721,2008,'Honda','Civic'),(5719,2008,'Honda','CR-V'),(5722,2008,'Honda','Element'),(5720,2008,'Honda','Fit'),(5718,2008,'Honda','Odyssey'),(5724,2008,'Honda','Pilot'),(5725,2008,'Honda','Ridgeline'),(5726,2008,'Honda','S2000'),(5834,2008,'Hummer','H2'),(5835,2008,'Hummer','H3'),(5614,2008,'Hyundai','Accent'),(5617,2008,'Hyundai','Azera'),(5615,2008,'Hyundai','Elantra'),(5619,2008,'Hyundai','Entourage'),(5616,2008,'Hyundai','Santa Fe'),(5621,2008,'Hyundai','Sonata'),(5618,2008,'Hyundai','Tiburon'),(5613,2008,'Hyundai','Tucson'),(5620,2008,'Hyundai','Veracruz'),(5738,2008,'Infiniti','EX'),(5739,2008,'Infiniti','FX'),(5740,2008,'Infiniti','G'),(5735,2008,'Infiniti','G35'),(5736,2008,'Infiniti','G37'),(5737,2008,'Infiniti','M'),(5741,2008,'Infiniti','QX'),(5734,2008,'Infiniti','QX56'),(5811,2008,'Isuzu','Ascender'),(5812,2008,'Isuzu','i-290'),(5813,2008,'Isuzu','i-370'),(5810,2008,'Isuzu','i-Series'),(5792,2008,'Jaguar','S-Type'),(5793,2008,'Jaguar','X-Type'),(5794,2008,'Jaguar','XJ'),(5791,2008,'Jaguar','XK'),(5649,2008,'Jeep','Commander'),(5652,2008,'Jeep','Compass'),(5651,2008,'Jeep','Grand Cherokee'),(5648,2008,'Jeep','Liberty'),(5650,2008,'Jeep','Patriot'),(5653,2008,'Jeep','Wrangler'),(5795,2008,'Kia','Amanti'),(5796,2008,'Kia','Carens'),(5803,2008,'Kia','Optima'),(5800,2008,'Kia','Rio'),(5799,2008,'Kia','Rio5'),(5804,2008,'Kia','Rondo'),(5802,2008,'Kia','Sedona'),(5801,2008,'Kia','Sorento'),(5797,2008,'Kia','Spectra'),(5798,2008,'Kia','Sportage'),(5699,2008,'Lamborghini','Gallardo'),(5698,2008,'Lamborghini','Murciélago'),(5700,2008,'Lamborghini','Murciélago LP640'),(5697,2008,'Lamborghini','Reventón'),(5681,2008,'Land Rover','Discovery'),(5680,2008,'Land Rover','Freelander'),(5684,2008,'Land Rover','LR2'),(5685,2008,'Land Rover','LR3'),(5682,2008,'Land Rover','Range Rover'),(5683,2008,'Land Rover','Range Rover Sport'),(5686,2008,'Lexus','ES'),(5688,2008,'Lexus','GS'),(5692,2008,'Lexus','GX'),(5694,2008,'Lexus','IS'),(5696,2008,'Lexus','IS F'),(5689,2008,'Lexus','IS-F'),(5691,2008,'Lexus','LS'),(5690,2008,'Lexus','LX'),(5693,2008,'Lexus','RX'),(5695,2008,'Lexus','RX Hybrid'),(5687,2008,'Lexus','SC'),(5495,2008,'Lincoln','Mark LT'),(5493,2008,'Lincoln','MKX'),(5496,2008,'Lincoln','MKZ'),(5492,2008,'Lincoln','Navigator'),(5497,2008,'Lincoln','Navigator L'),(5494,2008,'Lincoln','Town Car'),(5849,2008,'Lotus','Elise'),(5850,2008,'Lotus','Exige'),(5843,2008,'Maserati','GranTurismo'),(5844,2008,'Maserati','Quattroporte'),(5841,2008,'Maybach','57'),(5842,2008,'Maybach','62'),(5523,2008,'Mazda','B-Series'),(5524,2008,'Mazda','CX-7'),(5530,2008,'Mazda','CX-9'),(5526,2008,'Mazda','Mazda3'),(5527,2008,'Mazda','Mazda5'),(5528,2008,'Mazda','Mazda6'),(5525,2008,'Mazda','Mazdaspeed 3'),(5531,2008,'Mazda','Miata MX-5'),(5521,2008,'Mazda','MX-5'),(5529,2008,'Mazda','RX-8'),(5522,2008,'Mazda','Tribute'),(5510,2008,'Mercedes-Benz','C-Class'),(5515,2008,'Mercedes-Benz','CL-Class'),(5511,2008,'Mercedes-Benz','CLK-Class'),(5508,2008,'Mercedes-Benz','CLS-Class'),(5509,2008,'Mercedes-Benz','E-Class'),(5513,2008,'Mercedes-Benz','G-Class'),(5519,2008,'Mercedes-Benz','GL-Class'),(5512,2008,'Mercedes-Benz','M-Class'),(5518,2008,'Mercedes-Benz','R-Class'),(5514,2008,'Mercedes-Benz','S-Class'),(5507,2008,'Mercedes-Benz','SL-Class'),(5517,2008,'Mercedes-Benz','SLK-Class'),(5516,2008,'Mercedes-Benz','SLR McLaren'),(5783,2008,'Mercury','Grand Marquis'),(5785,2008,'Mercury','Mariner'),(5784,2008,'Mercury','Milan'),(5786,2008,'Mercury','Mountaineer'),(5782,2008,'Mercury','Sable'),(5832,2008,'MINI','Clubman'),(5831,2008,'MINI','Cooper'),(5833,2008,'MINI','Cooper Clubman'),(5609,2008,'Mitsubishi','Eclipse'),(5607,2008,'Mitsubishi','Endeavor'),(5606,2008,'Mitsubishi','Galant'),(5611,2008,'Mitsubishi','Lancer'),(5610,2008,'Mitsubishi','Lancer Evolution'),(5608,2008,'Mitsubishi','Outlander'),(5612,2008,'Mitsubishi','Raider'),(5821,2008,'Morgan','Aero 8'),(5715,2008,'Nissan','350Z'),(5709,2008,'Nissan','Altima'),(5713,2008,'Nissan','Armada'),(5714,2008,'Nissan','Frontier'),(5707,2008,'Nissan','Maxima'),(5712,2008,'Nissan','Pathfinder'),(5716,2008,'Nissan','Quest'),(5708,2008,'Nissan','Rogue'),(5710,2008,'Nissan','Sentra'),(5711,2008,'Nissan','Titan'),(5706,2008,'Nissan','Versa'),(5717,2008,'Nissan','Xterra'),(5839,2008,'Panoz','Esperante'),(5817,2008,'Pontiac','G5'),(5814,2008,'Pontiac','G6'),(5818,2008,'Pontiac','G8'),(5819,2008,'Pontiac','Grand Prix'),(5815,2008,'Pontiac','Solstice'),(5816,2008,'Pontiac','Torrent'),(5820,2008,'Pontiac','Vibe'),(5585,2008,'Porsche','911'),(5586,2008,'Porsche','Boxster'),(5588,2008,'Porsche','Cayenne'),(5587,2008,'Porsche','Cayman'),(5520,2008,'Rolls-Royce','Phantom'),(5589,2008,'Saab','9-3'),(5590,2008,'Saab','9-5'),(5591,2008,'Saab','9-7X'),(5805,2008,'Saturn','Astra'),(5807,2008,'Saturn','Aura'),(5809,2008,'Saturn','Outlook'),(5808,2008,'Saturn','Sky'),(5806,2008,'Saturn','VUE'),(5846,2008,'Scion','tC'),(5847,2008,'Scion','xB'),(5848,2008,'Scion','xD'),(5845,2008,'Smart','Fortwo'),(5702,2008,'Subaru','Forester'),(5701,2008,'Subaru','Impreza'),(5703,2008,'Subaru','Legacy'),(5704,2008,'Subaru','Outback'),(5705,2008,'Subaru','Tribeca'),(5642,2008,'Suzuki','Daewoo Lacetti'),(5646,2008,'Suzuki','Forenza'),(5645,2008,'Suzuki','Grand Vitara'),(5644,2008,'Suzuki','Reno'),(5643,2008,'Suzuki','SX4'),(5641,2008,'Suzuki','XL-7'),(5647,2008,'Suzuki','XL7'),(5634,2008,'Toyota','4Runner'),(5638,2008,'Toyota','Avalon'),(5628,2008,'Toyota','Camry'),(5632,2008,'Toyota','Camry Hybrid'),(5627,2008,'Toyota','Camry Solara'),(5625,2008,'Toyota','Corolla'),(5637,2008,'Toyota','FJ Cruiser'),(5623,2008,'Toyota','Highlander'),(5629,2008,'Toyota','Land Cruiser'),(5635,2008,'Toyota','Matrix'),(5622,2008,'Toyota','Prius'),(5631,2008,'Toyota','RAV4'),(5624,2008,'Toyota','Sequoia'),(5630,2008,'Toyota','Sienna'),(5639,2008,'Toyota','Solara'),(5636,2008,'Toyota','Tacoma'),(5633,2008,'Toyota','Tundra'),(5640,2008,'Toyota','TundraMax'),(5626,2008,'Toyota','Yaris'),(5667,2008,'Volkswagen','Eos'),(5663,2008,'Volkswagen','GLI'),(5664,2008,'Volkswagen','GTI'),(5662,2008,'Volkswagen','Jetta'),(5661,2008,'Volkswagen','New Beetle'),(5665,2008,'Volkswagen','Passat'),(5668,2008,'Volkswagen','R32'),(5660,2008,'Volkswagen','Rabbit'),(5666,2008,'Volkswagen','Touareg'),(5669,2008,'Volkswagen','Touareg 2'),(5502,2008,'Volvo','C30'),(5500,2008,'Volvo','C70'),(5505,2008,'Volvo','S40'),(5504,2008,'Volvo','S60'),(5498,2008,'Volvo','S80'),(5501,2008,'Volvo','V50'),(5506,2008,'Volvo','V70'),(5499,2008,'Volvo','XC70'),(5503,2008,'Volvo','XC90'),(6076,2009,'Acura','MDX'),(6073,2009,'Acura','RDX'),(6075,2009,'Acura','RL'),(6072,2009,'Acura','TL'),(6074,2009,'Acura','TSX'),(6204,2009,'Aptera','2e'),(6205,2009,'Aptera','Typ-1'),(6210,2009,'Aston Martin','DB9'),(6208,2009,'Aston Martin','DBS'),(6209,2009,'Aston Martin','V8 Vantage'),(6211,2009,'Aston Martin','Vantage'),(5871,2009,'Audi','A3'),(5869,2009,'Audi','A4'),(5880,2009,'Audi','A5'),(5874,2009,'Audi','A6'),(5876,2009,'Audi','A8'),(5881,2009,'Audi','Q5'),(5877,2009,'Audi','Q7'),(5872,2009,'Audi','R8'),(5879,2009,'Audi','S4'),(5870,2009,'Audi','S5'),(5875,2009,'Audi','S6'),(5878,2009,'Audi','S8'),(5873,2009,'Audi','TT'),(6148,2009,'Bentley','Arnage'),(6150,2009,'Bentley','Azure'),(6149,2009,'Bentley','Brooklands'),(6153,2009,'Bentley','Continental'),(6152,2009,'Bentley','Continental Flying Spur'),(6147,2009,'Bentley','Continental GT'),(6151,2009,'Bentley','Continental GTC'),(5909,2009,'BMW','1 Series'),(5910,2009,'BMW','3 Series'),(5911,2009,'BMW','5 Series'),(5912,2009,'BMW','6 Series'),(5913,2009,'BMW','7 Series'),(5916,2009,'BMW','M3'),(5917,2009,'BMW','M5'),(5918,2009,'BMW','M6'),(5919,2009,'BMW','X3'),(5921,2009,'BMW','X5'),(5920,2009,'BMW','X6'),(5922,2009,'BMW','Z4'),(5915,2009,'BMW','Z4 M'),(5914,2009,'BMW','Z4 M Roadster'),(6207,2009,'Bugatti','Veyron'),(6059,2009,'Buick','Enclave'),(6057,2009,'Buick','LaCrosse'),(6058,2009,'Buick','Lucerne'),(6050,2009,'Cadillac','CTS'),(6046,2009,'Cadillac','CTS-V'),(6045,2009,'Cadillac','DTS'),(6044,2009,'Cadillac','Escalade'),(6053,2009,'Cadillac','Escalade ESV'),(6054,2009,'Cadillac','Escalade EXT'),(6047,2009,'Cadillac','SRX'),(6048,2009,'Cadillac','STS'),(6051,2009,'Cadillac','STS-V'),(6049,2009,'Cadillac','XLR'),(6052,2009,'Cadillac','XLR-V'),(5937,2009,'Chevrolet','Avalanche'),(5923,2009,'Chevrolet','Aveo'),(5926,2009,'Chevrolet','Cobalt'),(5927,2009,'Chevrolet','Cobalt SS'),(5934,2009,'Chevrolet','Colorado'),(5924,2009,'Chevrolet','Corvette'),(5932,2009,'Chevrolet','Equinox'),(5931,2009,'Chevrolet','Express'),(5939,2009,'Chevrolet','Express 1500'),(5940,2009,'Chevrolet','Express 2500'),(5941,2009,'Chevrolet','Express 3500'),(5925,2009,'Chevrolet','HHR'),(5938,2009,'Chevrolet','Impala'),(5936,2009,'Chevrolet','Malibu'),(5928,2009,'Chevrolet','Silverado'),(5942,2009,'Chevrolet','Silverado 1500'),(5943,2009,'Chevrolet','Silverado 2500'),(5944,2009,'Chevrolet','Silverado 3500'),(5933,2009,'Chevrolet','Suburban'),(5945,2009,'Chevrolet','Suburban 1500'),(5946,2009,'Chevrolet','Suburban 2500'),(5929,2009,'Chevrolet','Tahoe'),(5930,2009,'Chevrolet','Trailblazer'),(5935,2009,'Chevrolet','Traverse'),(6117,2009,'Chrysler','300'),(6119,2009,'Chrysler','Aspen'),(6121,2009,'Chrysler','PT Cruiser'),(6118,2009,'Chrysler','Sebring'),(6120,2009,'Chrysler','Town & Country'),(6088,2009,'Dodge','Avenger'),(6083,2009,'Dodge','Caliber'),(6090,2009,'Dodge','Caravan'),(6080,2009,'Dodge','Challenger'),(6081,2009,'Dodge','Charger'),(6091,2009,'Dodge','Dakota'),(6085,2009,'Dodge','Durango'),(6092,2009,'Dodge','Grand Caravan'),(6086,2009,'Dodge','Journey'),(6084,2009,'Dodge','Nitro'),(6082,2009,'Dodge','Ram'),(6093,2009,'Dodge','Ram 1500'),(6094,2009,'Dodge','Ram 2500'),(6095,2009,'Dodge','Ram 3500'),(6087,2009,'Dodge','Sprinter'),(6089,2009,'Dodge','Viper'),(6068,2009,'Ferrari','430 Scuderia'),(6070,2009,'Ferrari','599 GTB Fiorano'),(6067,2009,'Ferrari','612 Scaglietti'),(6069,2009,'Ferrari','California'),(6071,2009,'Ferrari','F430'),(6130,2009,'Ford','Crown Victoria'),(6122,2009,'Ford','E-Series'),(6139,2009,'Ford','E150'),(6140,2009,'Ford','E250'),(6141,2009,'Ford','E350'),(6133,2009,'Ford','Edge'),(6125,2009,'Ford','Escape'),(6134,2009,'Ford','Expedition'),(6142,2009,'Ford','Expedition EL'),(6138,2009,'Ford','Explorer'),(6132,2009,'Ford','Explorer Sport Trac'),(6135,2009,'Ford','F-Series'),(6123,2009,'Ford','F-Series Super Duty'),(6143,2009,'Ford','F150'),(6144,2009,'Ford','F250'),(6145,2009,'Ford','F350'),(6146,2009,'Ford','F450'),(6137,2009,'Ford','Flex'),(6126,2009,'Ford','Focus'),(6124,2009,'Ford','Fusion'),(6128,2009,'Ford','GT500'),(6136,2009,'Ford','Mustang'),(6127,2009,'Ford','Ranger'),(6129,2009,'Ford','Taurus'),(6131,2009,'Ford','Taurus X'),(5975,2009,'GMC','Acadia'),(5974,2009,'GMC','Canyon'),(5976,2009,'GMC','Envoy'),(5972,2009,'GMC','Savana'),(5977,2009,'GMC','Savana 1500'),(5978,2009,'GMC','Savana 2500'),(5979,2009,'GMC','Savana 3500'),(5971,2009,'GMC','Sierra'),(5980,2009,'GMC','Sierra 1500'),(5981,2009,'GMC','Sierra 2500'),(5982,2009,'GMC','Sierra 3500'),(5973,2009,'GMC','Yukon'),(5983,2009,'GMC','Yukon XL 1500'),(5984,2009,'GMC','Yukon XL 2500'),(5886,2009,'Honda','Accord'),(5882,2009,'Honda','Civic'),(5884,2009,'Honda','CR-V'),(5889,2009,'Honda','Element'),(5887,2009,'Honda','Fit'),(5890,2009,'Honda','Odyssey'),(5888,2009,'Honda','Pilot'),(5883,2009,'Honda','Ridgeline'),(5885,2009,'Honda','S2000'),(5902,2009,'Hummer','H2'),(5901,2009,'Hummer','H3'),(5903,2009,'HUMMER','H3T'),(5892,2009,'Hyundai','Accent'),(5900,2009,'Hyundai','Azera'),(5896,2009,'Hyundai','Elantra'),(5894,2009,'Hyundai','Entourage'),(5899,2009,'Hyundai','Genesis'),(5891,2009,'Hyundai','Santa Fe'),(5898,2009,'Hyundai','Sonata'),(5897,2009,'Hyundai','Tiburon'),(5893,2009,'Hyundai','Tucson'),(5895,2009,'Hyundai','Veracruz'),(5998,2009,'Infiniti','EX'),(5999,2009,'Infiniti','FX'),(6001,2009,'Infiniti','G'),(6000,2009,'Infiniti','G37'),(5996,2009,'Infiniti','M'),(6002,2009,'Infiniti','QX'),(5997,2009,'Infiniti','QX56'),(6200,2009,'Isuzu','Ascender'),(6187,2009,'Jaguar','XF'),(6185,2009,'Jaguar','XJ'),(6186,2009,'Jaguar','XK'),(6172,2009,'Jeep','Commander'),(6170,2009,'Jeep','Compass'),(6171,2009,'Jeep','Grand Cherokee'),(6173,2009,'Jeep','Liberty'),(6169,2009,'Jeep','Patriot'),(6168,2009,'Jeep','Wrangler'),(5989,2009,'Kia','Amanti'),(5994,2009,'Kia','Borrego'),(5985,2009,'Kia','Carens'),(5992,2009,'Kia','Mohave/Borrego'),(5987,2009,'Kia','Optima'),(5988,2009,'Kia','Rio'),(5995,2009,'Kia','Rondo'),(5991,2009,'Kia','Sedona'),(5990,2009,'Kia','Sorento'),(5986,2009,'Kia','Spectra'),(5993,2009,'Kia','Sportage'),(6055,2009,'Lamborghini','Gallardo'),(6056,2009,'Lamborghini','Murciélago'),(6113,2009,'Land Rover','Freelander'),(6115,2009,'Land Rover','LR2'),(6116,2009,'Land Rover','LR3'),(6112,2009,'Land Rover','Range Rover'),(6114,2009,'Land Rover','Range Rover Sport'),(6040,2009,'Lexus','ES'),(6041,2009,'Lexus','GS'),(6037,2009,'Lexus','GX'),(6038,2009,'Lexus','IS'),(6043,2009,'Lexus','IS F'),(6034,2009,'Lexus','IS-F'),(6036,2009,'Lexus','LS'),(6039,2009,'Lexus','LX'),(6035,2009,'Lexus','RX'),(6042,2009,'Lexus','SC'),(6181,2009,'Lincoln','MKS'),(6183,2009,'Lincoln','MKX'),(6182,2009,'Lincoln','MKZ'),(6180,2009,'Lincoln','Navigator'),(6184,2009,'Lincoln','Navigator L'),(6179,2009,'Lincoln','Town Car'),(6167,2009,'Lotus','Elise'),(6166,2009,'Lotus','Exige'),(6189,2009,'Maserati','GranTurismo'),(6188,2009,'Maserati','Quattroporte'),(6077,2009,'Maybach','57'),(6078,2009,'Maybach','62'),(6079,2009,'Maybach','Landaulet'),(5962,2009,'Mazda','B-Series'),(5968,2009,'Mazda','CX-7'),(5964,2009,'Mazda','CX-9'),(5961,2009,'Mazda','Mazda3'),(5969,2009,'Mazda','Mazda5'),(5966,2009,'Mazda','Mazda6'),(5960,2009,'Mazda','Mazdaspeed 3'),(5970,2009,'Mazda','Miata MX-5'),(5965,2009,'Mazda','MX-5'),(5967,2009,'Mazda','RX-8'),(5963,2009,'Mazda','Tribute'),(5858,2009,'Mercedes-Benz','C-Class'),(5857,2009,'Mercedes-Benz','CL-Class'),(5862,2009,'Mercedes-Benz','CL65 AMG'),(5854,2009,'Mercedes-Benz','CLK-Class'),(5856,2009,'Mercedes-Benz','CLS-Class'),(5851,2009,'Mercedes-Benz','E-Class'),(5865,2009,'Mercedes-Benz','G-Class'),(5853,2009,'Mercedes-Benz','GL-Class'),(5861,2009,'Mercedes-Benz','M-Class'),(5860,2009,'Mercedes-Benz','R-Class'),(5855,2009,'Mercedes-Benz','S-Class'),(5852,2009,'Mercedes-Benz','SL-Class'),(5863,2009,'Mercedes-Benz','SLK-Class'),(5859,2009,'Mercedes-Benz','SLK55 AMG'),(5864,2009,'Mercedes-Benz','SLR McLaren'),(6175,2009,'Mercury','Grand Marquis'),(6174,2009,'Mercury','Mariner'),(6177,2009,'Mercury','Milan'),(6176,2009,'Mercury','Mountaineer'),(6178,2009,'Mercury','Sable'),(6202,2009,'MINI','Clubman'),(6201,2009,'MINI','Cooper'),(6203,2009,'MINI','Cooper Clubman'),(6163,2009,'Mitsubishi','Eclipse'),(6162,2009,'Mitsubishi','Endeavor'),(6160,2009,'Mitsubishi','Galant'),(6164,2009,'Mitsubishi','Lancer'),(6165,2009,'Mitsubishi','Outlander'),(6159,2009,'Mitsubishi','Raider'),(6161,2009,'Mitsubishi','Tundra'),(6154,2009,'Morgan','Aero 8'),(6099,2009,'Nissan','350Z'),(6110,2009,'Nissan','370Z'),(6101,2009,'Nissan','Altima'),(6109,2009,'Nissan','Armada'),(6105,2009,'Nissan','Cube'),(6096,2009,'Nissan','Frontier'),(6106,2009,'Nissan','GT-R'),(6107,2009,'Nissan','Maxima'),(6100,2009,'Nissan','Murano'),(6098,2009,'Nissan','Pathfinder'),(6104,2009,'Nissan','Quest'),(6103,2009,'Nissan','Rogue'),(6111,2009,'Nissan','Sentra'),(6108,2009,'Nissan','Titan'),(6097,2009,'Nissan','Versa'),(6102,2009,'Nissan','Xterra'),(6063,2009,'Pontiac','G3'),(6062,2009,'Pontiac','G5'),(6061,2009,'Pontiac','G6'),(6060,2009,'Pontiac','G8'),(6066,2009,'Pontiac','Solstice'),(6064,2009,'Pontiac','Torrent'),(6065,2009,'Pontiac','Vibe'),(6196,2009,'Porsche','911'),(6198,2009,'Porsche','Boxster'),(6197,2009,'Porsche','Cayenne'),(6199,2009,'Porsche','Cayman'),(6206,2009,'Rolls-Royce','Phantom'),(5867,2009,'Saab','9-3'),(5866,2009,'Saab','9-5'),(5868,2009,'Saab','9-7X'),(6194,2009,'Saturn','Astra'),(6192,2009,'Saturn','Aura'),(6191,2009,'Saturn','Outlook'),(6195,2009,'Saturn','Sky'),(6193,2009,'Saturn','VUE'),(6005,2009,'Scion','tC'),(6003,2009,'Scion','xB'),(6004,2009,'Scion','xD'),(6190,2009,'Smart','Fortwo'),(5907,2009,'Subaru','Forester'),(5905,2009,'Subaru','Impreza'),(5908,2009,'Subaru','Legacy'),(5904,2009,'Subaru','Outback'),(5906,2009,'Subaru','Tribeca'),(6156,2009,'Suzuki','Equator'),(6157,2009,'Suzuki','Grand Vitara'),(6155,2009,'Suzuki','SX4'),(6158,2009,'Suzuki','XL7'),(6031,2009,'Toyota','4Runner'),(6027,2009,'Toyota','Avalon'),(6018,2009,'Toyota','Camry'),(6028,2009,'Toyota','Camry Hybrid'),(6019,2009,'Toyota','Corolla'),(6023,2009,'Toyota','FJ Cruiser'),(6016,2009,'Toyota','Highlander'),(6017,2009,'Toyota','Land Cruiser'),(6030,2009,'Toyota','Matrix'),(6025,2009,'Toyota','Prius'),(6021,2009,'Toyota','RAV4'),(6022,2009,'Toyota','Sequoia'),(6026,2009,'Toyota','Sienna'),(6020,2009,'Toyota','Tacoma'),(6033,2009,'Toyota','Tundra'),(6032,2009,'Toyota','TundraMax'),(6024,2009,'Toyota','Venza'),(6029,2009,'Toyota','Yaris'),(5949,2009,'Volkswagen','CC'),(5951,2009,'Volkswagen','Eos'),(5950,2009,'Volkswagen','GLI'),(5953,2009,'Volkswagen','GTI'),(5952,2009,'Volkswagen','Jetta'),(5954,2009,'Volkswagen','New Beetle'),(5947,2009,'Volkswagen','Passat'),(5948,2009,'Volkswagen','R32'),(5956,2009,'Volkswagen','Rabbit'),(5958,2009,'Volkswagen','Routan'),(5957,2009,'Volkswagen','Tiguan'),(5955,2009,'Volkswagen','Touareg'),(5959,2009,'Volkswagen','Touareg 2'),(6008,2009,'Volvo','C30'),(6015,2009,'Volvo','C70'),(6011,2009,'Volvo','S40'),(6013,2009,'Volvo','S60'),(6009,2009,'Volvo','S80'),(6014,2009,'Volvo','V50'),(6006,2009,'Volvo','V70'),(6007,2009,'Volvo','XC60'),(6010,2009,'Volvo','XC70'),(6012,2009,'Volvo','XC90'),(6537,2010,'Acura','MDX'),(6538,2010,'Acura','RDX'),(6534,2010,'Acura','RL'),(6533,2010,'Acura','TL'),(6536,2010,'Acura','TSX'),(6535,2010,'Acura','ZDX'),(6541,2010,'Aptera','Type-1h'),(6262,2010,'Aston Martin','DB9'),(6261,2010,'Aston Martin','DBS'),(6259,2010,'Aston Martin','Rapide'),(6260,2010,'Aston Martin','V8 Vantage'),(6263,2010,'Aston Martin','Vantage'),(6394,2010,'Audi','A3'),(6388,2010,'Audi','A4'),(6389,2010,'Audi','A5'),(6393,2010,'Audi','A6'),(6390,2010,'Audi','A8'),(6385,2010,'Audi','Q5'),(6384,2010,'Audi','Q7'),(6391,2010,'Audi','R8'),(6392,2010,'Audi','S4'),(6386,2010,'Audi','S5'),(6395,2010,'Audi','S6'),(6387,2010,'Audi','TT'),(6512,2010,'Bentley','Azure'),(6517,2010,'Bentley','Azure T'),(6511,2010,'Bentley','Brooklands'),(6518,2010,'Bentley','Continental'),(6513,2010,'Bentley','Continental Flying Spur'),(6515,2010,'Bentley','Continental GT'),(6516,2010,'Bentley','Continental GTC'),(6514,2010,'Bentley','Continental Super'),(6212,2010,'BMW','1 Series'),(6213,2010,'BMW','3 Series'),(6214,2010,'BMW','5 Series'),(6215,2010,'BMW','6 Series'),(6216,2010,'BMW','7 Series'),(6217,2010,'BMW','M3'),(6223,2010,'BMW','M5'),(6219,2010,'BMW','M6'),(6221,2010,'BMW','X3'),(6222,2010,'BMW','X5'),(6224,2010,'BMW','X5 M'),(6218,2010,'BMW','X6'),(6225,2010,'BMW','X6 M'),(6220,2010,'BMW','Z4'),(6527,2010,'Buick','Enclave'),(6526,2010,'Buick','LaCrosse'),(6525,2010,'Buick','Lucerne'),(6380,2010,'Cadillac','CTS'),(6379,2010,'Cadillac','CTS-V'),(6378,2010,'Cadillac','DTS'),(6376,2010,'Cadillac','Escalade'),(6382,2010,'Cadillac','Escalade ESV'),(6383,2010,'Cadillac','Escalade EXT'),(6377,2010,'Cadillac','SRX'),(6381,2010,'Cadillac','STS'),(6355,2010,'Chevrolet','Avalanche'),(6344,2010,'Chevrolet','Aveo'),(6357,2010,'Chevrolet','Camaro'),(6358,2010,'Chevrolet','Cobalt'),(6352,2010,'Chevrolet','Colorado'),(6350,2010,'Chevrolet','Corvette'),(6346,2010,'Chevrolet','Equinox'),(6349,2010,'Chevrolet','Express'),(6359,2010,'Chevrolet','Express 1500'),(6360,2010,'Chevrolet','Express 2500'),(6361,2010,'Chevrolet','Express 3500'),(6348,2010,'Chevrolet','HHR'),(6351,2010,'Chevrolet','Impala'),(6356,2010,'Chevrolet','Malibu'),(6347,2010,'Chevrolet','Silverado'),(6362,2010,'Chevrolet','Silverado 1500'),(6363,2010,'Chevrolet','Silverado 2500'),(6364,2010,'Chevrolet','Silverado 3500'),(6353,2010,'Chevrolet','Suburban'),(6365,2010,'Chevrolet','Suburban 1500'),(6366,2010,'Chevrolet','Suburban 2500'),(6354,2010,'Chevrolet','Tahoe'),(6345,2010,'Chevrolet','Traverse'),(6490,2010,'Chrysler','300'),(6493,2010,'Chrysler','PT Cruiser'),(6491,2010,'Chrysler','Sebring'),(6492,2010,'Chrysler','Town & Country'),(6437,2010,'Dodge','Avenger'),(6433,2010,'Dodge','Caliber'),(6429,2010,'Dodge','Caravan'),(6435,2010,'Dodge','Challenger'),(6431,2010,'Dodge','Charger'),(6438,2010,'Dodge','Dakota'),(6439,2010,'Dodge','Grand Caravan'),(6432,2010,'Dodge','Journey'),(6436,2010,'Dodge','Nitro'),(6434,2010,'Dodge','Ram'),(6440,2010,'Dodge','Ram 1500'),(6441,2010,'Dodge','Ram 2500'),(6442,2010,'Dodge','Ram 3500'),(6430,2010,'Dodge','Viper'),(6462,2010,'Ferrari','458 Italia'),(6465,2010,'Ferrari','599 GTB Fiorano'),(6464,2010,'Ferrari','612 Scaglietti'),(6463,2010,'Ferrari','California'),(6416,2010,'Ford','Crown Victoria'),(6409,2010,'Ford','E-Series'),(6420,2010,'Ford','E150'),(6421,2010,'Ford','E250'),(6422,2010,'Ford','E350'),(6413,2010,'Ford','Edge'),(6405,2010,'Ford','Escape'),(6419,2010,'Ford','Expedition'),(6423,2010,'Ford','Expedition EL'),(6411,2010,'Ford','Explorer'),(6424,2010,'Ford','Explorer Sport Trac'),(6414,2010,'Ford','F-Series'),(6408,2010,'Ford','F-Series Super Duty'),(6425,2010,'Ford','F150'),(6426,2010,'Ford','F250'),(6427,2010,'Ford','F350'),(6428,2010,'Ford','F450'),(6412,2010,'Ford','Flex'),(6410,2010,'Ford','Focus'),(6415,2010,'Ford','Fusion'),(6406,2010,'Ford','Mustang'),(6417,2010,'Ford','Ranger'),(6418,2010,'Ford','Taurus'),(6407,2010,'Ford','Transit Connect'),(6499,2010,'GMC','Acadia'),(6496,2010,'GMC','Canyon'),(6494,2010,'GMC','Savana'),(6500,2010,'GMC','Savana 1500'),(6501,2010,'GMC','Savana 2500'),(6502,2010,'GMC','Savana 3500'),(6495,2010,'GMC','Sierra'),(6503,2010,'GMC','Sierra 1500'),(6504,2010,'GMC','Sierra 2500'),(6505,2010,'GMC','Sierra 3500'),(6497,2010,'GMC','Terrain'),(6498,2010,'GMC','Yukon'),(6506,2010,'GMC','Yukon XL 1500'),(6507,2010,'GMC','Yukon XL 2500'),(6229,2010,'Honda','Accord'),(6235,2010,'Honda','Accord Crosstour'),(6227,2010,'Honda','Civic'),(6226,2010,'Honda','CR-V'),(6234,2010,'Honda','Element'),(6233,2010,'Honda','Fit'),(6232,2010,'Honda','Insight'),(6230,2010,'Honda','Odyssey'),(6231,2010,'Honda','Pilot'),(6228,2010,'Honda','Ridgeline'),(6543,2010,'HUMMER','H3'),(6544,2010,'HUMMER','H3T'),(6281,2010,'Hyundai','Accent'),(6285,2010,'Hyundai','Azera'),(6283,2010,'Hyundai','Elantra'),(6284,2010,'Hyundai','Genesis'),(6286,2010,'Hyundai','Genesis Coupe'),(6278,2010,'Hyundai','Santa Fe'),(6282,2010,'Hyundai','Sonata'),(6280,2010,'Hyundai','Tucson'),(6279,2010,'Hyundai','Veracruz'),(6340,2010,'Infiniti','EX'),(6341,2010,'Infiniti','FX'),(6342,2010,'Infiniti','G'),(6339,2010,'Infiniti','G37'),(6338,2010,'Infiniti','M'),(6343,2010,'Infiniti','QX'),(6337,2010,'Infiniti','QX56'),(6508,2010,'Jaguar','XF'),(6510,2010,'Jaguar','XJ'),(6509,2010,'Jaguar','XK'),(6482,2010,'Jeep','Commander'),(6484,2010,'Jeep','Compass'),(6481,2010,'Jeep','Grand Cherokee'),(6485,2010,'Jeep','Liberty'),(6483,2010,'Jeep','Patriot'),(6486,2010,'Jeep','Wrangler'),(6334,2010,'Kia','Forte'),(6331,2010,'Kia','Optima'),(6335,2010,'Kia','Rio'),(6336,2010,'Kia','Rondo'),(6333,2010,'Kia','Sedona'),(6330,2010,'Kia','Soul'),(6332,2010,'Kia','Sportage'),(6528,2010,'Lamborghini','Gallardo'),(6529,2010,'Lamborghini','Murciélago'),(6542,2010,'Land Rover','Defender Ice Edition'),(6298,2010,'Land Rover','Discovery'),(6296,2010,'Land Rover','Freelander'),(6300,2010,'Land Rover','LR2'),(6301,2010,'Land Rover','LR4'),(6299,2010,'Land Rover','Range Rover'),(6297,2010,'Land Rover','Range Rover Sport'),(6453,2010,'Lexus','ES'),(6444,2010,'Lexus','GS'),(6451,2010,'Lexus','GX'),(6450,2010,'Lexus','HS'),(6445,2010,'Lexus','IS'),(6454,2010,'Lexus','IS F'),(6446,2010,'Lexus','IS-F'),(6443,2010,'Lexus','LS'),(6447,2010,'Lexus','LS Hybrid'),(6448,2010,'Lexus','LX'),(6452,2010,'Lexus','RX'),(6449,2010,'Lexus','RX Hybrid'),(6455,2010,'Lexus','SC'),(6401,2010,'Lincoln','MKS'),(6400,2010,'Lincoln','MKT'),(6397,2010,'Lincoln','MKX'),(6399,2010,'Lincoln','MKZ'),(6398,2010,'Lincoln','Navigator'),(6402,2010,'Lincoln','Navigator L'),(6396,2010,'Lincoln','Town Car'),(6488,2010,'Lotus','Elise'),(6489,2010,'Lotus','Evora'),(6487,2010,'Lotus','Exige'),(6467,2010,'Maserati','GranTurismo'),(6466,2010,'Maserati','Quattroporte'),(6373,2010,'Maybach','57'),(6374,2010,'Maybach','62'),(6375,2010,'Maybach','Landaulet'),(6305,2010,'Mazda','CX-7'),(6302,2010,'Mazda','CX-9'),(6307,2010,'Mazda','Mazda3'),(6309,2010,'Mazda','Mazda5'),(6308,2010,'Mazda','Mazda6'),(6303,2010,'Mazda','Mazdaspeed 3'),(6311,2010,'Mazda','Miata MX-5'),(6310,2010,'Mazda','MX-5'),(6304,2010,'Mazda','RX-8'),(6306,2010,'Mazda','Tribute'),(6251,2010,'Mercedes-Benz','C-Class'),(6255,2010,'Mercedes-Benz','CL-Class'),(6250,2010,'Mercedes-Benz','CLS-Class'),(6252,2010,'Mercedes-Benz','E-Class'),(6249,2010,'Mercedes-Benz','G-Class'),(6253,2010,'Mercedes-Benz','GL-Class'),(6254,2010,'Mercedes-Benz','GLK-Class'),(6258,2010,'Mercedes-Benz','M-Class'),(6256,2010,'Mercedes-Benz','R-Class'),(6257,2010,'Mercedes-Benz','S-Class'),(6247,2010,'Mercedes-Benz','SLK-Class'),(6248,2010,'Mercedes-Benz','Sprinter'),(6294,2010,'Mercury','Grand Marquis'),(6293,2010,'Mercury','Mariner'),(6292,2010,'Mercury','Milan'),(6295,2010,'Mercury','Mountaineer'),(6530,2010,'MINI','Clubman'),(6531,2010,'MINI','Cooper'),(6532,2010,'MINI','Cooper Clubman'),(6457,2010,'Mitsubishi','Eclipse'),(6460,2010,'Mitsubishi','Endeavor'),(6459,2010,'Mitsubishi','Galant'),(6458,2010,'Mitsubishi','Lancer'),(6456,2010,'Mitsubishi','Lancer Evolution'),(6461,2010,'Mitsubishi','Outlander'),(6267,2010,'Nissan','370Z'),(6264,2010,'Nissan','Altima'),(6266,2010,'Nissan','Armada'),(6274,2010,'Nissan','Cube'),(6268,2010,'Nissan','Frontier'),(6269,2010,'Nissan','GT-R'),(6276,2010,'Nissan','Maxima'),(6275,2010,'Nissan','Murano'),(6265,2010,'Nissan','Pathfinder'),(6271,2010,'Nissan','Rogue'),(6273,2010,'Nissan','Sentra'),(6277,2010,'Nissan','Titan'),(6272,2010,'Nissan','Versa'),(6270,2010,'Nissan','Xterra'),(6545,2010,'Pontiac','G3'),(6546,2010,'Pontiac','G6'),(6547,2010,'Pontiac','Vibe'),(6287,2010,'Porsche','911'),(6291,2010,'Porsche','Boxster'),(6290,2010,'Porsche','Cayenne'),(6289,2010,'Porsche','Cayman'),(6288,2010,'Porsche','Panamera'),(6404,2010,'Rolls-Royce','Ghost'),(6403,2010,'Rolls-Royce','Phantom'),(6523,2010,'Saab','9-3'),(6524,2010,'Saab','9-5'),(6548,2010,'Saturn','Outlook'),(6549,2010,'Saturn','VUE'),(6469,2010,'Scion','tC'),(6468,2010,'Scion','xB'),(6470,2010,'Scion','xD'),(6540,2010,'Smart','Fortwo'),(6370,2010,'Subaru','Forester'),(6367,2010,'Subaru','Impreza'),(6371,2010,'Subaru','Impreza WRX'),(6369,2010,'Subaru','Legacy'),(6372,2010,'Subaru','Outback'),(6368,2010,'Subaru','Tribeca'),(6521,2010,'Suzuki','Equator'),(6520,2010,'Suzuki','Grand Vitara'),(6522,2010,'Suzuki','Kizashi'),(6519,2010,'Suzuki','SX4'),(6539,2010,'Tesla','Roadster'),(6326,2010,'Toyota','4Runner'),(6314,2010,'Toyota','Avalon'),(6321,2010,'Toyota','Camry'),(6313,2010,'Toyota','Camry Hybrid'),(6328,2010,'Toyota','Corolla'),(6316,2010,'Toyota','FJ Cruiser'),(6319,2010,'Toyota','Highlander'),(6327,2010,'Toyota','Land Cruiser'),(6317,2010,'Toyota','Matrix'),(6324,2010,'Toyota','Prius'),(6318,2010,'Toyota','RAV4'),(6325,2010,'Toyota','Sequoia'),(6315,2010,'Toyota','Sienna'),(6323,2010,'Toyota','Tacoma'),(6312,2010,'Toyota','Tundra'),(6329,2010,'Toyota','TundraMax'),(6322,2010,'Toyota','Venza'),(6320,2010,'Toyota','Yaris'),(6243,2010,'Volkswagen','CC'),(6239,2010,'Volkswagen','Eos'),(6245,2010,'Volkswagen','Golf'),(6242,2010,'Volkswagen','GTI'),(6236,2010,'Volkswagen','Jetta'),(6246,2010,'Volkswagen','New Beetle'),(6237,2010,'Volkswagen','Passat'),(6241,2010,'Volkswagen','Rabbit'),(6238,2010,'Volkswagen','Routan'),(6244,2010,'Volkswagen','Tiguan'),(6240,2010,'Volkswagen','Touareg'),(6471,2010,'Volvo','C30'),(6476,2010,'Volvo','C70'),(6472,2010,'Volvo','S40'),(6475,2010,'Volvo','S60'),(6478,2010,'Volvo','S80'),(6473,2010,'Volvo','V50'),(6480,2010,'Volvo','V70'),(6479,2010,'Volvo','XC60'),(6477,2010,'Volvo','XC70'),(6474,2010,'Volvo','XC90'),(6725,2011,'Acura','MDX'),(6721,2011,'Acura','RDX'),(6724,2011,'Acura','RL'),(6726,2011,'Acura','TL'),(6722,2011,'Acura','TSX'),(6723,2011,'Acura','ZDX'),(6757,2011,'Aston Martin','DB9'),(6754,2011,'Aston Martin','DBS'),(6753,2011,'Aston Martin','Rapide'),(6755,2011,'Aston Martin','V12 Vantage'),(6752,2011,'Aston Martin','V8 Vantage'),(6751,2011,'Aston Martin','V8 Vantage S'),(6758,2011,'Aston Martin','Vantage'),(6756,2011,'Aston Martin','Virage'),(6631,2011,'Audi','A3'),(6627,2011,'Audi','A4'),(6628,2011,'Audi','A5'),(6625,2011,'Audi','A6'),(6630,2011,'Audi','A8'),(6624,2011,'Audi','Q5'),(6632,2011,'Audi','Q7'),(6629,2011,'Audi','R8'),(6633,2011,'Audi','S4'),(6623,2011,'Audi','S5'),(6622,2011,'Audi','S6'),(6626,2011,'Audi','TT'),(6763,2011,'Bentley','Continental'),(6762,2011,'Bentley','Continental Flying Spur'),(6761,2011,'Bentley','Continental GTC'),(6760,2011,'Bentley','Continental Super'),(6759,2011,'Bentley','Mulsanne'),(6650,2011,'BMW','1 Series'),(6651,2011,'BMW','3 Series'),(6652,2011,'BMW','5 Series'),(6653,2011,'BMW','7 Series'),(6655,2011,'BMW','M3'),(6656,2011,'BMW','X3'),(6657,2011,'BMW','X5'),(6659,2011,'BMW','X5 M'),(6654,2011,'BMW','X6'),(6660,2011,'BMW','X6 M'),(6658,2011,'BMW','Z4'),(6878,2011,'Bugatti','Veyron'),(6804,2011,'Buick','Enclave'),(6801,2011,'Buick','LaCrosse'),(6803,2011,'Buick','Lucerne'),(6802,2011,'Buick','Regal'),(6868,2011,'Cadillac','CTS'),(6867,2011,'Cadillac','CTS-V'),(6866,2011,'Cadillac','DTS'),(6871,2011,'Cadillac','Escalade'),(6872,2011,'Cadillac','Escalade ESV'),(6873,2011,'Cadillac','Escalade EXT'),(6870,2011,'Cadillac','SRX'),(6869,2011,'Cadillac','STS'),(6741,2011,'Chevrolet','Avalanche'),(6733,2011,'Chevrolet','Aveo'),(6737,2011,'Chevrolet','Camaro'),(6740,2011,'Chevrolet','Colorado'),(6728,2011,'Chevrolet','Corvette'),(6735,2011,'Chevrolet','Cruze'),(6729,2011,'Chevrolet','Equinox'),(6736,2011,'Chevrolet','Express'),(6743,2011,'Chevrolet','Express 1500'),(6744,2011,'Chevrolet','Express 2500'),(6745,2011,'Chevrolet','Express 3500'),(6734,2011,'Chevrolet','HHR'),(6742,2011,'Chevrolet','Impala'),(6731,2011,'Chevrolet','Malibu'),(6738,2011,'Chevrolet','Silverado'),(6746,2011,'Chevrolet','Silverado 1500'),(6747,2011,'Chevrolet','Silverado 2500'),(6748,2011,'Chevrolet','Silverado 3500'),(6730,2011,'Chevrolet','Suburban'),(6749,2011,'Chevrolet','Suburban 1500'),(6750,2011,'Chevrolet','Suburban 2500'),(6727,2011,'Chevrolet','Tahoe'),(6739,2011,'Chevrolet','Traverse'),(6732,2011,'Chevrolet','Volt'),(6863,2011,'Chrysler','200'),(6864,2011,'Chrysler','300'),(6865,2011,'Chrysler','Town & Country'),(6677,2011,'Dodge','Avenger'),(6680,2011,'Dodge','Caliber'),(6682,2011,'Dodge','Caravan'),(6674,2011,'Dodge','Challenger'),(6683,2011,'Dodge','Charger'),(6679,2011,'Dodge','Dakota'),(6678,2011,'Dodge','Durango'),(6684,2011,'Dodge','Grand Caravan'),(6676,2011,'Dodge','Journey'),(6681,2011,'Dodge','Nitro'),(6675,2011,'Dodge','Ram'),(6877,2011,'Ferrari','458 Italia'),(6573,2011,'Ford','Crown Victoria'),(6555,2011,'Ford','E-Series'),(6565,2011,'Ford','E150'),(6566,2011,'Ford','E250'),(6567,2011,'Ford','E350'),(6562,2011,'Ford','Edge'),(6551,2011,'Ford','Escape'),(6563,2011,'Ford','Expedition'),(6568,2011,'Ford','Expedition EL'),(6557,2011,'Ford','Explorer'),(6559,2011,'Ford','F-Series'),(6552,2011,'Ford','F-Series Super Duty'),(6569,2011,'Ford','F150'),(6570,2011,'Ford','F250'),(6571,2011,'Ford','F350'),(6572,2011,'Ford','F450'),(6556,2011,'Ford','Fiesta'),(6564,2011,'Ford','Flex'),(6558,2011,'Ford','Focus'),(6554,2011,'Ford','Fusion'),(6553,2011,'Ford','Mustang'),(6560,2011,'Ford','Ranger'),(6550,2011,'Ford','Taurus'),(6561,2011,'Ford','Transit Connect'),(6706,2011,'GMC','Acadia'),(6704,2011,'GMC','Canyon'),(6705,2011,'GMC','Savana'),(6708,2011,'GMC','Savana 1500'),(6709,2011,'GMC','Savana 2500'),(6710,2011,'GMC','Savana 3500'),(6702,2011,'GMC','Sierra'),(6711,2011,'GMC','Sierra 1500'),(6712,2011,'GMC','Sierra 2500'),(6713,2011,'GMC','Sierra 3500'),(6707,2011,'GMC','Terrain'),(6703,2011,'GMC','Yukon'),(6714,2011,'GMC','Yukon XL 1500'),(6715,2011,'GMC','Yukon XL 2500'),(6634,2011,'Honda','Accord'),(6644,2011,'Honda','Accord Crosstour'),(6636,2011,'Honda','Civic'),(6642,2011,'Honda','CR-V'),(6640,2011,'Honda','CR-Z'),(6638,2011,'Honda','Element'),(6639,2011,'Honda','Fit'),(6643,2011,'Honda','Insight'),(6635,2011,'Honda','Odyssey'),(6637,2011,'Honda','Pilot'),(6641,2011,'Honda','Ridgeline'),(6825,2011,'Hyundai','Accent'),(6826,2011,'Hyundai','Azera'),(6818,2011,'Hyundai','Elantra'),(6823,2011,'Hyundai','Equus'),(6820,2011,'Hyundai','Genesis'),(6827,2011,'Hyundai','Genesis Coupe'),(6821,2011,'Hyundai','Santa Fe'),(6819,2011,'Hyundai','Sonata'),(6822,2011,'Hyundai','Tucson'),(6824,2011,'Hyundai','Veracruz'),(6772,2011,'Infiniti','EX'),(6776,2011,'Infiniti','FX'),(6779,2011,'Infiniti','G'),(6773,2011,'Infiniti','G25'),(6774,2011,'Infiniti','G37'),(6778,2011,'Infiniti','IPL G'),(6777,2011,'Infiniti','M'),(6780,2011,'Infiniti','QX'),(6775,2011,'Infiniti','QX56'),(6594,2011,'Jaguar','XF'),(6592,2011,'Jaguar','XJ'),(6593,2011,'Jaguar','XK'),(6649,2011,'Jeep','Compass'),(6646,2011,'Jeep','Grand Cherokee'),(6647,2011,'Jeep','Liberty'),(6645,2011,'Jeep','Patriot'),(6648,2011,'Jeep','Wrangler'),(6812,2011,'Kia','Forte'),(6811,2011,'Kia','Optima'),(6813,2011,'Kia','Rio'),(6814,2011,'Kia','Sedona'),(6815,2011,'Kia','Sorento'),(6817,2011,'Kia','Soul'),(6816,2011,'Kia','Sportage'),(6879,2011,'Lamborghini','Gallardo'),(6798,2011,'Land Rover','Discovery'),(6795,2011,'Land Rover','Freelander'),(6799,2011,'Land Rover','LR2'),(6800,2011,'Land Rover','LR4'),(6797,2011,'Land Rover','Range Rover'),(6796,2011,'Land Rover','Range Rover Sport'),(6668,2011,'Lexus','CT'),(6672,2011,'Lexus','ES'),(6665,2011,'Lexus','GS'),(6663,2011,'Lexus','GX'),(6670,2011,'Lexus','HS'),(6662,2011,'Lexus','IS'),(6673,2011,'Lexus','IS F'),(6667,2011,'Lexus','IS-F'),(6666,2011,'Lexus','LS'),(6664,2011,'Lexus','LS Hybrid'),(6671,2011,'Lexus','LX'),(6669,2011,'Lexus','RX'),(6661,2011,'Lexus','RX Hybrid'),(6846,2011,'Lincoln','MKS'),(6845,2011,'Lincoln','MKT'),(6849,2011,'Lincoln','MKX'),(6847,2011,'Lincoln','MKZ'),(6844,2011,'Lincoln','Navigator'),(6850,2011,'Lincoln','Navigator L'),(6848,2011,'Lincoln','Town Car'),(6808,2011,'Lotus','Elise'),(6809,2011,'Lotus','Evora'),(6810,2011,'Lotus','Exige'),(6861,2011,'Maserati','GranTurismo'),(6862,2011,'Maserati','Quattroporte'),(6874,2011,'Maybach','57'),(6875,2011,'Maybach','62'),(6876,2011,'Maybach','Landaulet'),(6603,2011,'Mazda','CX-7'),(6595,2011,'Mazda','CX-9'),(6600,2011,'Mazda','Mazda2'),(6596,2011,'Mazda','Mazda3'),(6598,2011,'Mazda','Mazda6'),(6599,2011,'Mazda','Mazdaspeed 3'),(6604,2011,'Mazda','Miata MX-5'),(6601,2011,'Mazda','MX-5'),(6597,2011,'Mazda','RX-8'),(6602,2011,'Mazda','Tribute'),(6611,2011,'Mercedes-Benz','C-Class'),(6613,2011,'Mercedes-Benz','CL-Class'),(6607,2011,'Mercedes-Benz','CLS-Class'),(6609,2011,'Mercedes-Benz','E-Class'),(6612,2011,'Mercedes-Benz','G-Class'),(6610,2011,'Mercedes-Benz','GL-Class'),(6605,2011,'Mercedes-Benz','GLK-Class'),(6617,2011,'Mercedes-Benz','M-Class'),(6615,2011,'Mercedes-Benz','R-Class'),(6606,2011,'Mercedes-Benz','S-Class'),(6618,2011,'Mercedes-Benz','SL-Class'),(6608,2011,'Mercedes-Benz','SLK-Class'),(6614,2011,'Mercedes-Benz','SLS AMG'),(6619,2011,'Mercedes-Benz','SLS-Class'),(6616,2011,'Mercedes-Benz','Sprinter'),(6620,2011,'Mercedes-Benz','Sprinter 2500'),(6621,2011,'Mercedes-Benz','Sprinter 3500'),(6859,2011,'Mercury','Grand Marquis'),(6858,2011,'Mercury','Mariner'),(6860,2011,'Mercury','Milan'),(6716,2011,'MINI','Clubman'),(6718,2011,'MINI','Cooper'),(6719,2011,'MINI','Cooper Clubman'),(6720,2011,'MINI','Cooper Countryman'),(6717,2011,'MINI','Countryman'),(6851,2011,'Mitsubishi','Eclipse'),(6853,2011,'Mitsubishi','Endeavor'),(6855,2011,'Mitsubishi','Galant'),(6854,2011,'Mitsubishi','Lancer'),(6856,2011,'Mitsubishi','Lancer Evolution'),(6852,2011,'Mitsubishi','Outlander'),(6857,2011,'Mitsubishi','Outlander Sport'),(6693,2011,'Nissan','370Z'),(6686,2011,'Nissan','Altima'),(6698,2011,'Nissan','Armada'),(6688,2011,'Nissan','Cube'),(6689,2011,'Nissan','Frontier'),(6694,2011,'Nissan','GT-R'),(6700,2011,'Nissan','JUKE'),(6697,2011,'Nissan','Leaf'),(6692,2011,'Nissan','Maxima'),(6701,2011,'Nissan','Murano'),(6685,2011,'Nissan','Pathfinder'),(6687,2011,'Nissan','Quest'),(6695,2011,'Nissan','Rogue'),(6690,2011,'Nissan','Sentra'),(6691,2011,'Nissan','Titan'),(6699,2011,'Nissan','Versa'),(6696,2011,'Nissan','Xterra'),(6790,2011,'Porsche','911'),(6793,2011,'Porsche','Boxster'),(6791,2011,'Porsche','Cayenne'),(6794,2011,'Porsche','Cayman'),(6792,2011,'Porsche','Panamera'),(6881,2011,'Ram','1500'),(6882,2011,'Ram','2500'),(6883,2011,'Ram','3500'),(6884,2011,'Ram','Dakota'),(6843,2011,'Rolls-Royce','Ghost'),(6842,2011,'Rolls-Royce','Phantom'),(6787,2011,'Saab','9-3'),(6789,2011,'Saab','9-4X'),(6788,2011,'Saab','9-5'),(6805,2011,'Scion','tC'),(6806,2011,'Scion','xB'),(6807,2011,'Scion','xD'),(6832,2011,'Smart','Fortwo'),(6786,2011,'Subaru','Forester'),(6783,2011,'Subaru','Impreza'),(6782,2011,'Subaru','Impreza WRX'),(6781,2011,'Subaru','Legacy'),(6784,2011,'Subaru','Outback'),(6785,2011,'Subaru','Tribeca'),(6831,2011,'Suzuki','Equator'),(6828,2011,'Suzuki','Grand Vitara'),(6830,2011,'Suzuki','Kizashi'),(6829,2011,'Suzuki','SX4'),(6880,2011,'Tesla','Roadster'),(6575,2011,'Toyota','4Runner'),(6579,2011,'Toyota','Avalon'),(6576,2011,'Toyota','Camry'),(6590,2011,'Toyota','Camry Hybrid'),(6587,2011,'Toyota','Corolla'),(6585,2011,'Toyota','FJ Cruiser'),(6583,2011,'Toyota','Highlander'),(6578,2011,'Toyota','Land Cruiser'),(6580,2011,'Toyota','Matrix'),(6582,2011,'Toyota','Prius'),(6586,2011,'Toyota','RAV4'),(6577,2011,'Toyota','Sequoia'),(6588,2011,'Toyota','Sienna'),(6581,2011,'Toyota','Tacoma'),(6584,2011,'Toyota','Tundra'),(6591,2011,'Toyota','TundraMax'),(6589,2011,'Toyota','Venza'),(6574,2011,'Toyota','Yaris'),(6767,2011,'Volkswagen','CC'),(6770,2011,'Volkswagen','Eos'),(6765,2011,'Volkswagen','Golf'),(6769,2011,'Volkswagen','GTI'),(6768,2011,'Volkswagen','Jetta'),(6766,2011,'Volkswagen','Routan'),(6771,2011,'Volkswagen','Tiguan'),(6764,2011,'Volkswagen','Touareg'),(6833,2011,'Volvo','C30'),(6839,2011,'Volvo','C70'),(6841,2011,'Volvo','S40'),(6836,2011,'Volvo','S60'),(6840,2011,'Volvo','S80'),(6834,2011,'Volvo','V50'),(6837,2011,'Volvo','XC60'),(6838,2011,'Volvo','XC70'),(6835,2011,'Volvo','XC90'),(7075,2012,'Acura','MDX'),(7079,2012,'Acura','RDX'),(7078,2012,'Acura','RL'),(7077,2012,'Acura','TL'),(7076,2012,'Acura','TSX'),(7074,2012,'Acura','ZDX'),(7106,2012,'Aston Martin','DB9'),(7105,2012,'Aston Martin','DBS'),(7110,2012,'Aston Martin','Rapide'),(7107,2012,'Aston Martin','V12 Vantage'),(7109,2012,'Aston Martin','V8 Vantage'),(7111,2012,'Aston Martin','V8 Vantage S'),(7108,2012,'Aston Martin','Virage'),(6916,2012,'Audi','A3'),(6925,2012,'Audi','A4'),(6920,2012,'Audi','A5'),(6918,2012,'Audi','A6'),(6923,2012,'Audi','A7'),(6921,2012,'Audi','A8'),(6919,2012,'Audi','Q5'),(6926,2012,'Audi','Q7'),(6917,2012,'Audi','R8'),(6927,2012,'Audi','S4'),(6924,2012,'Audi','S5'),(6922,2012,'Audi','TT'),(7187,2012,'Bentley','Continental'),(7185,2012,'Bentley','Continental Flying Spur'),(7182,2012,'Bentley','Continental GT'),(7184,2012,'Bentley','Continental GTC'),(7186,2012,'Bentley','Continental Super'),(7183,2012,'Bentley','Mulsanne'),(7035,2012,'BMW','1 Series'),(7036,2012,'BMW','3 Series'),(7037,2012,'BMW','5 Series'),(7038,2012,'BMW','6 Series'),(7039,2012,'BMW','7 Series'),(7040,2012,'BMW','M3'),(7041,2012,'BMW','X3'),(7042,2012,'BMW','X5'),(7043,2012,'BMW','X5 M'),(7044,2012,'BMW','X6'),(7045,2012,'BMW','X6 M'),(7046,2012,'BMW','Z4'),(7169,2012,'Buick','Enclave'),(7167,2012,'Buick','LaCrosse'),(7168,2012,'Buick','Regal'),(7166,2012,'Buick','Verano'),(6910,2012,'Cadillac','CTS'),(6911,2012,'Cadillac','CTS-V'),(6912,2012,'Cadillac','Escalade'),(6914,2012,'Cadillac','Escalade ESV'),(6915,2012,'Cadillac','Escalade EXT'),(6913,2012,'Cadillac','SRX'),(7020,2012,'Chevrolet','Avalanche'),(7014,2012,'Chevrolet','Camaro'),(7010,2012,'Chevrolet','Colorado'),(7009,2012,'Chevrolet','Corvette'),(7015,2012,'Chevrolet','Cruze'),(7018,2012,'Chevrolet','Equinox'),(7012,2012,'Chevrolet','Express'),(7021,2012,'Chevrolet','Express 1500'),(7022,2012,'Chevrolet','Express 2500'),(7023,2012,'Chevrolet','Express 3500'),(7019,2012,'Chevrolet','Impala'),(7016,2012,'Chevrolet','Malibu'),(7024,2012,'Chevrolet','Silverado 1500'),(7025,2012,'Chevrolet','Silverado 2500'),(7026,2012,'Chevrolet','Silverado 3500'),(7013,2012,'Chevrolet','Sonic'),(7027,2012,'Chevrolet','Suburban 1500'),(7028,2012,'Chevrolet','Suburban 2500'),(7029,2012,'Chevrolet','Tahoe'),(7017,2012,'Chevrolet','Traverse'),(7011,2012,'Chevrolet','Volt'),(7170,2012,'Chrysler','200'),(7171,2012,'Chrysler','300'),(7172,2012,'Chrysler','Town & Country'),(7125,2012,'Dodge','Avenger'),(7129,2012,'Dodge','Caliber'),(7126,2012,'Dodge','Caravan'),(7128,2012,'Dodge','Challenger'),(7127,2012,'Dodge','Charger'),(7130,2012,'Dodge','Durango'),(7132,2012,'Dodge','Grand Caravan'),(7131,2012,'Dodge','Journey'),(7142,2012,'Ferrari','458 Italia'),(7143,2012,'Ferrari','FF'),(7123,2012,'FIAT','500'),(7124,2012,'Fiat','Nuova 500'),(6969,2012,'Ford','E-Series'),(6979,2012,'Ford','E150'),(6980,2012,'Ford','E250'),(6981,2012,'Ford','E350'),(6978,2012,'Ford','Edge'),(6972,2012,'Ford','Escape'),(6977,2012,'Ford','Expedition'),(6982,2012,'Ford','Expedition EL'),(6976,2012,'Ford','Explorer'),(6968,2012,'Ford','F-Series Super Duty'),(6983,2012,'Ford','F150'),(6984,2012,'Ford','F250'),(6985,2012,'Ford','F350'),(6986,2012,'Ford','F450'),(6975,2012,'Ford','Fiesta'),(6971,2012,'Ford','Flex'),(6966,2012,'Ford','Focus'),(6973,2012,'Ford','Fusion'),(6967,2012,'Ford','Mustang'),(6974,2012,'Ford','Taurus'),(6970,2012,'Ford','Transit Connect'),(6990,2012,'GMC','Acadia'),(6987,2012,'GMC','Canyon'),(6992,2012,'GMC','Savana'),(6993,2012,'GMC','Savana 1500'),(6994,2012,'GMC','Savana 2500'),(6995,2012,'GMC','Savana 3500'),(6989,2012,'GMC','Sierra'),(6996,2012,'GMC','Sierra 1500'),(6997,2012,'GMC','Sierra 2500'),(6998,2012,'GMC','Sierra 3500'),(6991,2012,'GMC','Terrain'),(6988,2012,'GMC','Yukon'),(6999,2012,'GMC','Yukon XL 1500'),(7000,2012,'GMC','Yukon XL 2500'),(6945,2012,'Honda','Accord'),(6946,2012,'Honda','Civic'),(6954,2012,'Honda','CR-V'),(6950,2012,'Honda','CR-Z'),(6953,2012,'Honda','Crosstour'),(6952,2012,'Honda','FCX Clarity'),(6948,2012,'Honda','Fit'),(6949,2012,'Honda','Insight'),(6944,2012,'Honda','Odyssey'),(6951,2012,'Honda','Pilot'),(6947,2012,'Honda','Ridgeline'),(6957,2012,'Hyundai','Accent'),(6965,2012,'Hyundai','Azera'),(6960,2012,'Hyundai','Elantra'),(6958,2012,'Hyundai','Equus'),(6956,2012,'Hyundai','Genesis'),(6955,2012,'Hyundai','HED-5'),(6959,2012,'Hyundai','Santa Fe'),(6962,2012,'Hyundai','Sonata'),(6963,2012,'Hyundai','Tucson'),(6964,2012,'Hyundai','Veloster'),(6961,2012,'Hyundai','Veracruz'),(7102,2012,'Infiniti','EX'),(7096,2012,'Infiniti','FX'),(7103,2012,'Infiniti','G'),(7099,2012,'Infiniti','G25'),(7098,2012,'Infiniti','G37'),(7101,2012,'Infiniti','IPL G'),(7097,2012,'Infiniti','M'),(7104,2012,'Infiniti','QX'),(7100,2012,'Infiniti','QX56'),(7145,2012,'Jaguar','XF'),(7147,2012,'Jaguar','XJ'),(7146,2012,'Jaguar','XK'),(7149,2012,'Jeep','Compass'),(7150,2012,'Jeep','Grand Cherokee'),(7152,2012,'Jeep','Liberty'),(7151,2012,'Jeep','Patriot'),(7148,2012,'Jeep','Wrangler'),(7174,2012,'Kia','Forte'),(7175,2012,'Kia','Optima'),(7179,2012,'Kia','Rio'),(7176,2012,'Kia','Sedona'),(7178,2012,'Kia','Sorento'),(7177,2012,'Kia','Soul'),(7173,2012,'Kia','Sportage'),(7163,2012,'Lamborghini','Aventador'),(7162,2012,'Lamborghini','Gallardo'),(6939,2012,'Land Rover','Discovery'),(6942,2012,'Land Rover','LR2'),(6943,2012,'Land Rover','LR4'),(6938,2012,'Land Rover','Range Rover'),(6941,2012,'Land Rover','Range Rover Evoque'),(6940,2012,'Land Rover','Range Rover Sport'),(7116,2012,'Lexus','CT'),(7119,2012,'Lexus','ES'),(7122,2012,'Lexus','GX'),(7121,2012,'Lexus','HS'),(7114,2012,'Lexus','IS'),(7115,2012,'Lexus','IS-F'),(7120,2012,'Lexus','LFA'),(7113,2012,'Lexus','LS'),(7118,2012,'Lexus','LS Hybrid'),(7112,2012,'Lexus','RX'),(7117,2012,'Lexus','RX Hybrid'),(7049,2012,'Lincoln','MKS'),(7050,2012,'Lincoln','MKT'),(7047,2012,'Lincoln','MKX'),(7051,2012,'Lincoln','MKZ'),(7048,2012,'Lincoln','Navigator'),(7052,2012,'Lincoln','Navigator L'),(7181,2012,'Lotus','Evora'),(7180,2012,'Lotus','Exige'),(7200,2012,'Maserati','GranTurismo'),(7201,2012,'Maserati','Quattroporte'),(7202,2012,'Maybach','57'),(7203,2012,'Maybach','62'),(7204,2012,'Maybach','Landaulet'),(7160,2012,'Mazda','CX-7'),(7155,2012,'Mazda','CX-9'),(7154,2012,'Mazda','Mazda2'),(7158,2012,'Mazda','Mazda3'),(7153,2012,'Mazda','Mazda5'),(7157,2012,'Mazda','Mazda6'),(7159,2012,'Mazda','Mazdaspeed 3'),(7161,2012,'Mazda','Miata MX-5'),(7156,2012,'Mazda','MX-5'),(7205,2012,'McLaren','MP4-12C'),(7088,2012,'Mercedes-Benz','C-Class'),(7087,2012,'Mercedes-Benz','CL-Class'),(7081,2012,'Mercedes-Benz','CLS-Class'),(7083,2012,'Mercedes-Benz','E-Class'),(7080,2012,'Mercedes-Benz','G-Class'),(7082,2012,'Mercedes-Benz','GL-Class'),(7084,2012,'Mercedes-Benz','GLK-Class'),(7090,2012,'Mercedes-Benz','M-Class'),(7091,2012,'Mercedes-Benz','R-Class'),(7086,2012,'Mercedes-Benz','S-Class'),(7089,2012,'Mercedes-Benz','SL-Class'),(7092,2012,'Mercedes-Benz','SLK-Class'),(7085,2012,'Mercedes-Benz','SLS AMG'),(7093,2012,'Mercedes-Benz','SLS-Class'),(7094,2012,'Mercedes-Benz','Sprinter 2500'),(7095,2012,'Mercedes-Benz','Sprinter 3500'),(7032,2012,'MINI','Clubman'),(7030,2012,'MINI','Cooper'),(7033,2012,'MINI','Cooper Clubman'),(7034,2012,'MINI','Cooper Countryman'),(7031,2012,'MINI','Countryman'),(7189,2012,'Mitsubishi','Eclipse'),(7188,2012,'Mitsubishi','Galant'),(7191,2012,'Mitsubishi','i-MiEV'),(7192,2012,'Mitsubishi','Lancer'),(7190,2012,'Mitsubishi','Outlander'),(7193,2012,'Mitsubishi','Outlander Sport'),(6891,2012,'Nissan','370Z'),(6890,2012,'Nissan','Altima'),(6893,2012,'Nissan','Armada'),(6905,2012,'Nissan','cube'),(6906,2012,'Nissan','Frontier'),(6904,2012,'Nissan','GT-R'),(6898,2012,'Nissan','JUKE'),(6895,2012,'Nissan','Leaf'),(6900,2012,'Nissan','Maxima'),(6892,2012,'Nissan','Murano'),(6907,2012,'Nissan','NV1500'),(6908,2012,'Nissan','NV2500'),(6909,2012,'Nissan','NV3500'),(6894,2012,'Nissan','Pathfinder'),(6902,2012,'Nissan','Quest'),(6899,2012,'Nissan','Rogue'),(6903,2012,'Nissan','Sentra'),(6897,2012,'Nissan','Titan'),(6901,2012,'Nissan','Versa'),(6896,2012,'Nissan','Xterra'),(6885,2012,'Porsche','911'),(6888,2012,'Porsche','Boxster'),(6886,2012,'Porsche','Cayenne'),(6889,2012,'Porsche','Cayman'),(6887,2012,'Porsche','Panamera'),(7206,2012,'Ram','1500'),(7207,2012,'Ram','2500'),(7208,2012,'Ram','3500'),(7209,2012,'Ram','C/V'),(7198,2012,'Rolls-Royce','Ghost'),(7199,2012,'Rolls-Royce','Phantom'),(7001,2012,'Saab','9-3'),(7196,2012,'Scion','iQ'),(7195,2012,'Scion','tC'),(7194,2012,'Scion','xB'),(7197,2012,'Scion','xD'),(7144,2012,'Smart','Fortwo'),(7139,2012,'Subaru','Forester'),(7138,2012,'Subaru','Impreza'),(7137,2012,'Subaru','Legacy'),(7141,2012,'Subaru','Outback'),(7140,2012,'Subaru','Tribeca'),(7135,2012,'Suzuki','Equator'),(7134,2012,'Suzuki','Grand Vitara'),(7133,2012,'Suzuki','Kizashi'),(7136,2012,'Suzuki','SX4'),(7164,2012,'Tesla','Model S'),(7165,2012,'Tesla','Roadster'),(7053,2012,'Toyota','4Runner'),(7064,2012,'Toyota','Avalon'),(7062,2012,'Toyota','Camry'),(7058,2012,'Toyota','Camry Hybrid'),(7065,2012,'Toyota','Corolla'),(7057,2012,'Toyota','FJ Cruiser'),(7054,2012,'Toyota','Highlander'),(7066,2012,'Toyota','Matrix'),(7067,2012,'Toyota','Prius'),(7068,2012,'Toyota','Prius c'),(7069,2012,'Toyota','Prius Plug-in'),(7063,2012,'Toyota','Prius Plug-in Hybrid'),(7056,2012,'Toyota','Prius v'),(7060,2012,'Toyota','RAV4'),(7059,2012,'Toyota','Sequoia'),(7061,2012,'Toyota','Sienna'),(7070,2012,'Toyota','Tacoma'),(7072,2012,'Toyota','Tundra'),(7071,2012,'Toyota','TundraMax'),(7073,2012,'Toyota','Venza'),(7055,2012,'Toyota','Yaris'),(6937,2012,'Volkswagen','CC'),(6932,2012,'Volkswagen','Eos'),(6929,2012,'Volkswagen','Golf'),(6936,2012,'Volkswagen','GTI'),(6928,2012,'Volkswagen','Jetta'),(6933,2012,'Volkswagen','New Beetle'),(6934,2012,'Volkswagen','Passat'),(6930,2012,'Volkswagen','Routan'),(6935,2012,'Volkswagen','Tiguan'),(6931,2012,'Volkswagen','Touareg'),(7002,2012,'Volvo','C30'),(7006,2012,'Volvo','C70'),(7008,2012,'Volvo','S60'),(7007,2012,'Volvo','S80'),(7004,2012,'Volvo','XC60'),(7003,2012,'Volvo','XC70'),(7005,2012,'Volvo','XC90'),(7231,2013,'Audi','S4'),(7232,2013,'BMW','X5'),(7233,2013,'BMW','X5 M'),(7234,2013,'BMW','X6'),(7235,2013,'BMW','X6 M'),(7228,2013,'Chevrolet','Cruze'),(7229,2013,'Chevrolet','Malibu'),(7230,2013,'Chevrolet','Tahoe'),(7211,2013,'Ford','C-MAX Hybrid'),(7212,2013,'Ford','Edge'),(7213,2013,'Ford','Escape'),(7214,2013,'Ford','Explorer'),(7215,2013,'Ford','Fiesta'),(7216,2013,'Ford','Flex'),(7217,2013,'Ford','Focus'),(7218,2013,'Ford','Focus ST'),(7219,2013,'Ford','Fusion'),(7220,2013,'Ford','Mustang'),(7210,2013,'Ford','Taurus'),(7221,2013,'Ford','Transit Connect'),(7236,2013,'GMC','Sierra 1500'),(7237,2013,'GMC','Yukon'),(7238,2013,'GMC','Yukon XL 1500'),(7239,2013,'GMC','Yukon XL 2500'),(7223,2013,'Hyundai','Accent'),(7224,2013,'Hyundai','Elantra'),(7225,2013,'Hyundai','Equus'),(7226,2013,'Hyundai','Genesis Coupe'),(7227,2013,'Hyundai','Sonata'),(7222,2013,'Hyundai','Veloster'),(7240,2013,'Infiniti','JX'),(7241,2013,'Jaguar','XK Series'),(7242,2013,'Kia','Rio'),(7243,2013,'Kia','Sorento'),(7244,2013,'Lexus','GS'),(7245,2013,'Lexus','LX'),(7246,2013,'Lexus','RX'),(7247,2013,'Lincoln','MKS'),(7248,2013,'Lincoln','MKT'),(7249,2013,'Lincoln','MKX'),(7250,2013,'Mazda','CX-5'),(7251,2013,'Mazda','MAZDA6'),(7252,2013,'Nissan','Altima'),(7253,2013,'Nissan','GT-R'),(7254,2013,'Porsche','911'),(7255,2013,'Porsche','Boxster'),(7256,2013,'Porsche','Cayenne'),(7257,2013,'Porsche','Panamera'),(7258,2013,'Rolls-Royce','Phantom'),(7259,2013,'Scion','FR-S'),(7260,2013,'Scion','tC'),(7261,2013,'Subaru','BRZ'),(7262,2013,'Toyota','Land Cruiser'),(7263,2013,'Toyota','Venza'),(7264,2013,'Volkswagen','CC'),(7265,2013,'Volvo','C30'),(7266,2013,'Volvo','C70'),(7267,2013,'Volvo','S60'),(7268,2013,'Volvo','XC90');
/*!40000 ALTER TABLE `VehicleModelYear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleMovement`
--

DROP TABLE IF EXISTS `VehicleMovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleMovement` (
  `VehicleMovementID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) DEFAULT NULL,
  `DescriptionEN` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`VehicleMovementID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleMovement`
--

LOCK TABLES `VehicleMovement` WRITE;
/*!40000 ALTER TABLE `VehicleMovement` DISABLE KEYS */;
INSERT INTO `VehicleMovement` VALUES (1,'En movimiento en la vía publica','In movement thought public roadway'),(2,'Estacionado','Parked'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `VehicleMovement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleType`
--

DROP TABLE IF EXISTS `VehicleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleType` (
  `VehicleTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VehicleTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleType`
--

LOCK TABLES `VehicleType` WRITE;
/*!40000 ALTER TABLE `VehicleType` DISABLE KEYS */;
INSERT INTO `VehicleType` VALUES (1,'Vehículo Personal','Personal Vehicle'),(2,'Vehículo Rentado','Rented Vehicle'),(3,'Vehículo Comercial','Commercial Vehicle'),(4,'Vehículo de Trabajo','Working Vehicle'),(5,'Equipo de Mantenimiento','Maintenance Equipment'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `VehicleType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeatherCondition`
--

DROP TABLE IF EXISTS `WeatherCondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WeatherCondition` (
  `WeatherConditionID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(45) DEFAULT NULL,
  `DescriptionEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`WeatherConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeatherCondition`
--

LOCK TABLES `WeatherCondition` WRITE;
/*!40000 ALTER TABLE `WeatherCondition` DISABLE KEYS */;
INSERT INTO `WeatherCondition` VALUES (1,'Claro','Clear '),(2,'Nublado','Cloudy '),(3,'Neblina','Fog'),(4,'Lluvioso','Rain '),(5,'Granizo','Sleet or Hail '),(6,'Tormentas de arena o tierra','Blowing Sand, Soil, Dirt '),(7,'Nieve','Snow '),(8,'Tormenta de nieve','Blowing Snow '),(9,'Viento Fuerte','Severe Crosswinds '),(10,'Lluvia Congeladas','Freezing Rain or Freezing Drizzle '),(11,'Humo','Smoke '),(97,'Otro Clima','Other '),(98,'No aplica','Not Aplicable'),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WeatherCondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WithinInterchange`
--

DROP TABLE IF EXISTS `WithinInterchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WithinInterchange` (
  `WithinInterchangeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`WithinInterchangeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WithinInterchange`
--

LOCK TABLES `WithinInterchange` WRITE;
/*!40000 ALTER TABLE `WithinInterchange` DISABLE KEYS */;
INSERT INTO `WithinInterchange` VALUES (1,'No','No'),(2,'Si','Yes'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WithinInterchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkersPresent`
--

DROP TABLE IF EXISTS `WorkersPresent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkersPresent` (
  `WorkersPresentID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(15) DEFAULT NULL,
  `DescriptionEN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`WorkersPresentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkersPresent`
--

LOCK TABLES `WorkersPresent` WRITE;
/*!40000 ALTER TABLE `WorkersPresent` DISABLE KEYS */;
INSERT INTO `WorkersPresent` VALUES (1,'No','No '),(2,'Si','Yes '),(98,'No aplica','Does Not Apply'),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WorkersPresent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkzoneLocation`
--

DROP TABLE IF EXISTS `WorkzoneLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkzoneLocation` (
  `WorkzoneLocationID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(100) DEFAULT NULL,
  `DescriptionEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WorkzoneLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkzoneLocation`
--

LOCK TABLES `WorkzoneLocation` WRITE;
/*!40000 ALTER TABLE `WorkzoneLocation` DISABLE KEYS */;
INSERT INTO `WorkzoneLocation` VALUES (1,'Antes rótulo aviso','Before the First Work Zone Warning Sign'),(2,'Dentro área de aviso','Advance Warning Area'),(3,'En área de transición de carriles, desplazamiento de carriles o cierre de carril','Transition Area'),(4,'En zona de actividad','Activity Area'),(5,'Luego de la zona de actividades','Termination Area'),(6,'No aplica','Does Not Apply'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WorkzoneLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkzoneRelated`
--

DROP TABLE IF EXISTS `WorkzoneRelated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkzoneRelated` (
  `WorkzoneRelatedID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(25) DEFAULT NULL,
  `DescriptionEN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`WorkzoneRelatedID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkzoneRelated`
--

LOCK TABLES `WorkzoneRelated` WRITE;
/*!40000 ALTER TABLE `WorkzoneRelated` DISABLE KEYS */;
INSERT INTO `WorkzoneRelated` VALUES (1,'Si','Yes'),(2,'No','No '),(99,'Desconocido','Unknown '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WorkzoneRelated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkzoneType`
--

DROP TABLE IF EXISTS `WorkzoneType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkzoneType` (
  `WorkzoneTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(50) DEFAULT NULL,
  `DescriptionEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`WorkzoneTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkzoneType`
--

LOCK TABLES `WorkzoneType` WRITE;
/*!40000 ALTER TABLE `WorkzoneType` DISABLE KEYS */;
INSERT INTO `WorkzoneType` VALUES (1,'Cierre de carril','Lane Closure '),(2,'Cambio de carril/\"Crossover\"','Lane Shift / Crossover '),(3,'Paseo o mediana','Work on Shoulder or Median '),(4,'Trabajo intermitente o en movimiento','Intermittent or Moving Work '),(98,'No aplica','Does Not Apply'),(99,'Otro','Other '),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `WorkzoneType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZoneType`
--

DROP TABLE IF EXISTS `ZoneType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZoneType` (
  `ZoneTypeID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `DescriptionES` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `DescriptionEN` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ZoneTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZoneType`
--

LOCK TABLES `ZoneType` WRITE;
/*!40000 ALTER TABLE `ZoneType` DISABLE KEYS */;
INSERT INTO `ZoneType` VALUES (1,'Residencial','Residential'),(2,'Industrial','Industrial'),(3,'Comercial','Commercial'),(4,'Escolar','School'),(5,'Parque','National Park'),(6,'Rural','Rural Zone'),(7,'Urbano','Urban Zone'),(8,'Construcción','Construction'),(97,'Otro Tipo de Zona','Other Zone Type'),(99,'Desconocido','Unknown'),(999,'VACIO','EMPTY');
/*!40000 ALTER TABLE `ZoneType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-24  8:30:36
