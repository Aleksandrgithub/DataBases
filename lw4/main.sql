DROP DATABASE IF EXISTS lw4;
CREATE DATABASE lw4 collate utf16_general_ci;
USE lw4;

CREATE TABLE apartment
(
	id_apartment INT NOT NULL auto_increment,
	floor INT,
    size INT,
    number_of_inhabitants INT,
    apartment_number INT,
    PRIMARY KEY (id_apartment)
);

CREATE TABLE service
(
	id_service INT NOT NULL auto_increment,
	type VARCHAR(45),
    units VARCHAR(45),
    time_frame DATETIME,
    PRIMARY KEY (id_service)
);

CREATE TABLE tariff
(
	id_tariff INT NOT NULL auto_increment,
	price INT,
    conditions VARCHAR(45),
    validity DATE,
    PRIMARY KEY (id_tariff)
);

CREATE TABLE personal_account
(
	id_personal_account INT NOT NULL auto_increment,
	full_name VARCHAR(45),
    phone VARCHAR(45),
    entrance_number INT,
    id_apartment INT NOT NULL,
    FOREIGN KEY (id_apartment) REFERENCES apartment (id_apartment),
    PRIMARY KEY (id_personal_account)
);

CREATE TABLE service_for_payment
(
	id_personal_account INT NOT NULL,
    id_service INT NOT NULL,
    FOREIGN KEY (id_personal_account) REFERENCES personal_account (id_personal_account),
    FOREIGN KEY (id_service) REFERENCES service (id_service),
    PRIMARY KEY (id_personal_account, id_service)
);

CREATE TABLE tariff_for_service
(
	id_tariff INT NOT NULL,
    id_services INT NOT NULL,
    FOREIGN KEY (id_tariff) REFERENCES tariff (id_tariff),
    FOREIGN KEY (id_services) REFERENCES service (id_service),
    PRIMARY KEY (id_tariff, id_services)
);