CREATE TABLE `User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(191) NOT NULL,
  `firstName` VARCHAR(191),
  `lastName` VARCHAR(191),
  `password` VARCHAR(191),
  `role` ENUM('CONDUCTEUR', 'PASSAGER') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User.email_unique` (`email`)
);


