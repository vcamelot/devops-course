--
-- Database: `schooldb`
--
CREATE DATABASE IF NOT EXISTS `schooldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `schooldb`;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
CREATE TABLE IF NOT EXISTS `children` (
    `child_id` int NOT NULL AUTO_INCREMENT,
    `first_name` varchar(50) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    `birth_date` date NOT NULL,
    `year_of_entry` int NOT NULL,
    `age` int NOT NULL,
    `institution_id` int NOT NULL,
    `class_id` int NOT NULL,
    PRIMARY KEY (`child_id`),
    KEY `fk_children_institutions` (`institution_id`),
    KEY `fk_children_classes` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`child_id`, `first_name`, `last_name`, `birth_date`, `year_of_entry`, `age`, `institution_id`, `class_id`) VALUES
(1, 'Harvey', 'Abram', '2000-10-07', 2020, 24, 1, 1),
(2, 'Peter', 'West', '2002-07-18', 2022, 22, 1, 2),
(3, 'Peter', 'Chambers', '2004-07-01', 2023, 20, 2, 3),
(4, 'Anna', 'Ryland', '2003-01-08', 2021, 21, 3, 5),
(5, 'Cameron', 'Ross', '2020-01-08', 2022, 4, 5, 8),
(6, 'Anthony', 'Hayden', '2021-10-20', 2023, 3, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
    `class_id` int NOT NULL AUTO_INCREMENT,
    `class_name` varchar(100) NOT NULL,
    `institution_id` int NOT NULL,
    `institution_direction` enum('Mathematics','Biology and Chemistry','Language Studies') NOT NULL,
    PRIMARY KEY (`class_id`),
    KEY `fk_classes_institutions` (`institution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `institution_id`, `institution_direction`) VALUES
(1, 'Astronomy', 1, 'Mathematics'),
(2, 'Genetics and Heredity', 1, 'Biology and Chemistry'),
(3, 'French Language', 2, 'Language Studies'),
(4, 'Italian Language', 2, 'Language Studies'),
(5, 'Linear Algebra', 3, 'Mathematics'),
(6, 'Spanish Language', 4, 'Language Studies'),
(7, 'Numbers 1-9', 5, 'Mathematics'),
(8, 'English Alphabet', 5, 'Language Studies'),
(9, 'Nature Around Us', 6, 'Biology and Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
CREATE TABLE IF NOT EXISTS `institutions` (
    `institution_id` int NOT NULL AUTO_INCREMENT,
    `institution_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `institution_type` enum('School','Kindergarten') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`institution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`institution_id`, `institution_name`, `institution_type`, `address`) VALUES
(1, 'City of London School', 'School', '107 Queen Victoria Street, London, EC4V 3AL, United Kingdom'),
(2, 'King\'s College School (Wimbledon)', 'School', 'Southside, London, SW19 4TT, United Kingdom'),
(3, 'Dulwich College', 'School', 'Dulwich Common, London, SE21 7LD, United Kingdom'),
(4, 'Channing School', 'School', 'The Bank, London, N6 5HF, United Kingdom'),
(5, 'Mouse House – Wandsworth', 'Kindergarten', '13-15 Barmouth Road, London SW18 2DT'),
(6, 'Pooh Corner W8 Kindergarten Nursery', 'Kindergarten', 'St. George’s Church, Aubrey Walk, Campden Hill Road, London W8 7JG, United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
CREATE TABLE IF NOT EXISTS `parents` (
  `parent_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `child_id` int NOT NULL,
  `tuition_fee` int NOT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `fk_parents_children` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parent_id`, `first_name`, `last_name`, `child_id`, `tuition_fee`) VALUES
(1, 'John', 'Abram', 1, 22000),
(2, 'Sarah', 'West', 2, 34000),
(3, 'Ronald', 'Chambers', 3, 48000),
(4, 'Reginald', 'Ryland', 4, 28000),
(5, 'Diana', 'Ross', 5, 14000),
(6, 'German', 'Hayden', 6, 11000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `fk_children_classes` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `fk_children_institutions` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_institution` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`);

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `fk_parents_children` FOREIGN KEY (`child_id`) REFERENCES `children` (`child_id`);
COMMIT;