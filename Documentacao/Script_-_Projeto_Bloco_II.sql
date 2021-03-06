-- MySQL Script generated by MySQL Workbench
-- Wed Jun 29 09:49:12 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_blogpessoal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_blogpessoal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_blogpessoal` DEFAULT CHARACTER SET utf8 ;
USE `db_blogpessoal` ;

-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_vendedora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_vendedora` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_vendedora` VARCHAR(255) NOT NULL,
  `cpf_vendedora` INT(11) NOT NULL,
  `foto_documento` VARCHAR(255) NOT NULL,
  `endereco_vendedora` VARCHAR(255) NOT NULL,
  `email_vendedora` VARCHAR(255) NOT NULL,
  `telefone_vendedora` INT(11) NOT NULL,
  `senha_vendedora` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_produtos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(255) NOT NULL,
  `valor_produto` DECIMAL(10,2) NOT NULL,
  `categoria_id` BIGINT NOT NULL,
  `vendedora_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_produtos_tb_categoria_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_vendedora1_idx` (`vendedora_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_tb_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `db_blogpessoal`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_vendedora1`
    FOREIGN KEY (`vendedora_id`)
    REFERENCES `db_blogpessoal`.`tb_vendedora` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
