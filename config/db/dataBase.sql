-- MySQL Script generated by MySQL Workbench
-- Sun Oct 24 22:15:21 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Looper
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Looper` ;

-- -----------------------------------------------------
-- Schema Looper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Looper` DEFAULT CHARACTER SET utf8 ;
USE `Looper` ;

-- -----------------------------------------------------
-- Table `Looper`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`status` ;

CREATE TABLE IF NOT EXISTS `Looper`.`status` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Looper`.`exercises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`exercises` ;

CREATE TABLE IF NOT EXISTS `Looper`.`exercises` (
                                                    `id` INT NOT NULL AUTO_INCREMENT,
                                                    `title` VARCHAR(150) NULL,
    `status_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_exercises_status1_idx` (`status_id` ASC) VISIBLE,
    CONSTRAINT `fk_exercises_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `Looper`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Looper`.`types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`types` ;

CREATE TABLE IF NOT EXISTS `Looper`.`types` (
                                                `id` INT NOT NULL AUTO_INCREMENT,
                                                `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Looper`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`questions` ;

CREATE TABLE IF NOT EXISTS `Looper`.`questions` (
                                                    `id` INT NOT NULL AUTO_INCREMENT,
                                                    `text` VARCHAR(255) NULL,
    `exercise_id` INT NOT NULL,
    `type_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_questions_exercises_idx` (`exercise_id` ASC) VISIBLE,
    INDEX `fk_questions_types1_idx` (`type_id` ASC) VISIBLE,
    CONSTRAINT `fk_questions_exercises`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `Looper`.`exercises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_questions_types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `Looper`.`types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Looper`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`users` ;

CREATE TABLE IF NOT EXISTS `Looper`.`users` (
                                                `id` INT NOT NULL AUTO_INCREMENT,
                                                `name` VARCHAR(100) NOT NULL DEFAULT 'user',
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Looper`.`answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Looper`.`answers` ;

CREATE TABLE IF NOT EXISTS `Looper`.`answers` (
                                                  `id` INT NOT NULL AUTO_INCREMENT,
                                                  `question_id` INT NOT NULL,
                                                  `user_id` INT NOT NULL,
                                                  `answer` VARCHAR(45) NULL,
    INDEX `fk_answers_questions1_idx` (`question_id` ASC) VISIBLE,
    INDEX `fk_answers_users1_idx` (`user_id` ASC) VISIBLE,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_answers_questions1`
    FOREIGN KEY (`question_id`)
    REFERENCES `Looper`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_answers_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Looper`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Development data insertion
-- Thu Oct 21 18:12:54 2021
-- Version: 1.0

--  ----------------- Types insertion ----------------- --

INSERT INTO looper.types (name) VALUES ("Single line text");
INSERT INTO looper.types (name) VALUES ("List of single lines");
INSERT INTO looper.types (name) VALUES ("Multi-line text");

--  ----------------- Status insertion ----------------- --

INSERT INTO looper.status (name) VALUES ("Building");
INSERT INTO looper.status (name) VALUES ("Answering");
INSERT INTO looper.status (name) VALUES ("Closed");

--  ----------------- Exercise insertion ----------------- --

INSERT INTO looper.exercises (title, status_id) VALUES ("Exercice 2 - Histoire", 1);
INSERT INTO looper.exercises (title, status_id) VALUES ("Exercice 1 - Art et littérature", 1);
INSERT INTO looper.exercises (title, status_id) VALUES ("Exercice 3 - Géographie", 1);

--  ----------------- Questions insertion ----------------- --

INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Quand l'ONU a-t-elle été créée ?",1,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Qui a été le premier président des États-Unis?",1,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Qui a peint la Chapelle Sixtine ?",2,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Où est née Arya Stark, de la saga Le Trône de Fer ?",2,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Qui est l'auteur de l'Ode à Aphrodite ?" ,2,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Où se trouve la péninsule du Yucatan ?",3,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Quelle est la capitale de l'Albanie ?",3,1);
INSERT INTO looper.questions (text, exercise_id, type_id) VALUES ("Dans quel océan se trouve le Sri Lanka ?",3,1);

--  ----------------- Users insertion ----------------- --

INSERT INTO looper.users (name) VALUES ("2020-09-15 09:57:08 UTC");
INSERT INTO looper.users (name) VALUES ("2020-10-26 13:57:22 UTC");
INSERT INTO looper.users (name) VALUES ("2020-09-15 09:57:08 UTC");
INSERT INTO looper.users (name) VALUES ("2020-10-29 12:36:32 UTC");
INSERT INTO looper.users (name) VALUES ("2020-12-18 12:41:45 UTC");

--  ----------------- Answer insertion ----------------- --

INSERT INTO looper.answers (question_id, user_id, answer) VALUES (1,1,"24 octobre 1945");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (1,2,"1 novembre 1993");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (4,3,"Winterfell ");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (7,4,"Tirana");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (7,2,"Pristina");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (8,3,"Pacifique");
INSERT INTO looper.answers (question_id, user_id, answer) VALUES (3,5," Michel-Ange");