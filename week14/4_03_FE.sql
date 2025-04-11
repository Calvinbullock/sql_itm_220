-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SQL_Monster
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SQL_Monster` ;

-- -----------------------------------------------------
-- Schema SQL_Monster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SQL_Monster` ;
USE `SQL_Monster` ;

-- -----------------------------------------------------
-- Table `SQL_Monster`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`user` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`post` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`post` (
  `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_post_1_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`friendship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`friendship` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`friendship` (
  `friendship_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `friend_user_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`friendship_id`),
  INDEX `fk_friendship_2_idx` (`friend_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_friendship_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friendship_2`
    FOREIGN KEY (`friend_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`subscription` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`subscription` (
  `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`transaction` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`transaction` (
  `transaction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_date` DATE NOT NULL,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `fk_subscription_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transaction_1_idx` (`fk_user_id` ASC) VISIBLE,
  INDEX `fk_transaction_2_idx` (`fk_subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_2`
    FOREIGN KEY (`fk_subscription_id`)
    REFERENCES `SQL_Monster`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`comments` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`comments` (
  `comment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` LONGTEXT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_user_comment_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_comment`
    FOREIGN KEY (`user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`tag` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`tag` (
  `tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tagger_user_id` INT UNSIGNED NOT NULL,
  `tagged_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tag_id`),
  INDEX `fk_user_tag_idx` (`tagged_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tagged`
    FOREIGN KEY (`tagged_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tagger`
    FOREIGN KEY (`tagger_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`messages` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`messages` (
  `messages_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_user_id_1` INT UNSIGNED NOT NULL,
  `fk_user_id_2` INT UNSIGNED NOT NULL,
  `message_content` LONGTEXT NOT NULL,
  PRIMARY KEY (`messages_id`),
  INDEX `fk_messages_2_idx` (`fk_user_id_1` ASC) VISIBLE,
  INDEX `fk_messages_1_idx` (`fk_user_id_2` ASC) VISIBLE,
  CONSTRAINT `fk_messages_2`
    FOREIGN KEY (`fk_user_id_1`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_1`
    FOREIGN KEY (`fk_user_id_2`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`likes` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`likes` (
  `likes_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `likes_dislike` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`likes_id`),
  INDEX `fk_like_1_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_like_1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `SQL_Monster`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`post_likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`post_likes` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`post_likes` (
  `post_likes_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_likes_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_likes_id`),
  INDEX `fk_post_likes_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_likes_2_idx` (`fk_likes_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_likes_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `SQL_Monster`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_likes_2`
    FOREIGN KEY (`fk_likes_id`)
    REFERENCES `SQL_Monster`.`likes` (`likes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`post_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`post_comments` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`post_comments` (
  `post_comments_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_comments_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_comments_id`),
  INDEX `fk_post_comments_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_comments_2_idx` (`fk_comments_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_comments_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `SQL_Monster`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_comments_2`
    FOREIGN KEY (`fk_comments_id`)
    REFERENCES `SQL_Monster`.`comments` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_Monster`.`post_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SQL_Monster`.`post_tag` ;

CREATE TABLE IF NOT EXISTS `SQL_Monster`.`post_tag` (
  `post_tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_tag_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_tag_id`),
  INDEX `fk_post_tag_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_tag_2_idx` (`fk_tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_tag_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `SQL_Monster`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_tag_2`
    FOREIGN KEY (`fk_tag_id`)
    REFERENCES `SQL_Monster`.`tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
