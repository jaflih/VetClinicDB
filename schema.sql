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
