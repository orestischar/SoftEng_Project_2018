CREATE DATABASE `crowdsporting`;

DROP TABLE IF EXISTS `crowdsporting`.`shop`;
CREATE TABLE `crowdsporting`.`shop`
(
  `id`          int(11)      NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(255) NOT NULL UNIQUE,
  `street`      VARCHAR(100) NOT NULL,
  `number`      INT          NOT NULL,
  `postal_code` INT          NOT NULL,
  `city`        VARCHAR(100) NOT NULL,
  `lng`         DOUBLE,
  `lat`         DOUBLE,
  `mail`        VARCHAR(320),
  `phone`       VARCHAR(15)  NOT NULL,
  `website`     VARCHAR(320),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `crowdsporting`.`product`;
CREATE TABLE `crowdsporting`.`product`
(
  `id`          int(11)      NOT NULL AUTO_INCREMENT,
  `name`        varchar(255) NOT NULL,
  `description` mediumtext,
  `category`    ENUM ('Γυμναστήριο', 'χορός', 'πολεμικές τέχνες', 'Paintball', 'Personal Training', 'Rafting', 'Αναρρίχηση','Γιόγκα', 'Ιππασία', 'Καταδύσεις' , 'Κολύμβηση', 'Πιλάτες', 'Ποδόσφαιρο', 'Σκι' ,'Τένις'),
  `withdrawn`   bool         NOT NULL DEFAULT false,
  `likes`       int(11),
  `prov_id`     int(11)      NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`prov_id`) REFERENCES `crowdsporting`.`shop` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `crowdsporting`.`product_tags`;
CREATE TABLE `crowdsporting`.`product_tags`
(
  `pid` int(11)      NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`, `tag`),
  FOREIGN KEY (`pid`) REFERENCES `crowdsporting`.`product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `crowdsporting`.`shop_tags`;
CREATE TABLE `crowdsporting`.`shop_tags`
(
  `sid` int(11)      NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`sid`, `tag`),
  FOREIGN KEY (`sid`) REFERENCES `crowdsporting`.`shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `crowdsporting`.`user`;
CREATE TABLE `crowdsporting`.`users`
(
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(12)  NOT NULL,
  `points`   INT          NOT NULL DEFAULT 0,
  `mail`     VARCHAR(320) NOT NULL,
  PRIMARY KEY (`mail`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

