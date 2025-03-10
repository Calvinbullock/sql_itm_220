-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `username` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_post_1_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`friendship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`friendship` (
  `friendship_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `friend_user_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`friendship_id`),
  INDEX `fk_friendship_2_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_friendship_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friendship_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subscription` (
  `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_number` INT UNSIGNED NOT NULL,
  `subscription_duration` INT UNSIGNED NOT NULL,
  `subscription_type` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transaction` (
  `transaction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_date` DATE NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `subscription_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transaction_1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_transaction_2_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_2`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `mydb`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `comment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `likes` VARCHAR(45) NULL,
  `dislikes` VARCHAR(45) NULL,
  PRIMARY KEY (`comment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tagger_name` VARCHAR(45) NOT NULL,
  `tagger_follower` VARCHAR(45) NOT NULL,
  `likes` VARCHAR(45) NOT NULL,
  `comments` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`messages` (
  `messages_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `answered` TINYINT NULL,
  `conversation_start` DATE NOT NULL,
  PRIMARY KEY (`messages_id`),
  INDEX `fk_messages_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_messages_2_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `mydb`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_2`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`like` (
  `like_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_user_id` INT UNSIGNED NOT NULL,
  `like_dislike` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`like_id`),
  INDEX `fk_like_1_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_like_1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post_likes` (
  `post_likes_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_likes_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_likes_id`),
  INDEX `fk_post_likes_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_likes_2_idx` (`fk_likes_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_likes_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `mydb`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_likes_2`
    FOREIGN KEY (`fk_likes_id`)
    REFERENCES `mydb`.`like` (`like_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post_comments` (
  `post_comments_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_comments_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_comments_id`),
  INDEX `fk_post_comments_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_comments_2_idx` (`fk_comments_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_comments_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `mydb`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_comments_2`
    FOREIGN KEY (`fk_comments_id`)
    REFERENCES `mydb`.`comment` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post_tag` (
  `post_tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_post_id` INT UNSIGNED NOT NULL,
  `fk_tag_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`post_tag_id`),
  INDEX `fk_post_tag_1_idx` (`fk_post_id` ASC) VISIBLE,
  INDEX `fk_post_tag_2_idx` (`fk_tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_tag_1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `mydb`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_tag_2`
    FOREIGN KEY (`fk_tag_id`)
    REFERENCES `mydb`.`tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
