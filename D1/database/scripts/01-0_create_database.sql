-- Base de données créée
drop database if exists recipe_app;

CREATE DATABASE recipe_app;

USE recipe_app;

-- MariaDB user uniquement pour cette base de données
DROP USER IF EXISTS 'SwissBooking_bdd_mod'@'localhost';
CREATE USER 'SwissBooking_bdd_mod'@'localhost' IDENTIFIED BY 'super';
REVOKE ALL PRIVILEGES ON *.* FROM 'SwissBooking_bdd_mod'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON recipe_app.* TO 'SwissBooking_bdd_mod'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'SwissBooking_bdd_mod'@'localhost';