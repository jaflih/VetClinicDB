/* Database schema to keep the structure of entire database. */

/* CREATE ANIMALS TABLE */
CREATE TABLE animals(id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY, 
					 name VARCHAR(255) NOT NULL, 
					 date_of_birth DATE NOT NULL, 
					 escape_attempts INT DEFAULT 0, 
					 neutered BOOLEAN DEFAULT false, 
					 weight_kg DECIMAL
					);

/* ADD SPECIES COLUMN TO ANIMALS TABLE */
ALTER TABLE animals ADD COLUMN species VARCHAR(255);

/* CREATE OWNERS TABLE */
CREATE TABLE owners(id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
										full_name VARCHAR(255),
										age INT
);

/* CREATE SPECIES TABLE */
CREATE TABLE species(id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
										 name VARCHAR(255)
);

/* REMOVE COLUMN SPECIES */
ALTER TABLE animals DROP COLUMN species;

/* ADD COLUMN SPECIES_ID AS FOREIGN KEY REFERENCING SPECIES TABLE */
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_constraint FOREIGN KEY(species_id) REFERENCES species(id);

/* ADD COLUMN OWNER_ID AS FOREIGN KEY REFERENCING OWNERS TABLE */
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owners_constraint FOREIGN KEY(owner_id) REFERENCES owners(id);

/* CREATE VETS TABLE */
CREATE TABLE vets(id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
										 name VARCHAR(255),
										 age INT,
										 date_of_graduation DATE
);

/* CREATE specializations TABLE */
CREATE TABLE specializations(vet_id INT, species_id INT);
ALTER TABLE specializations ADD CONSTRAINT vets_constraint FOREIGN KEY(vet_id) REFERENCES vets(id);
ALTER TABLE specializations ADD CONSTRAINT species_constraint FOREIGN KEY(species_id) REFERENCES species(id);

/* CREATE visits TABLE */
CREATE TABLE visits(vet_id INT, animal_id INT, date_of_visit DATE);
ALTER TABLE visits ADD CONSTRAINT vets_constraint FOREIGN KEY(vet_id) REFERENCES vets(id);
ALTER TABLE visits ADD CONSTRAINT animals_constraint FOREIGN KEY(animal_id) REFERENCES animal(id);
