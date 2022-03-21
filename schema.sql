/* Database schema to keep the structure of entire database. */

create table animals(id INT PRIMARY KEY NOT NULL, 
					 name TEXT NOT NULL, 
					 date_of_birth DATE NOT NULL, 
					 escape_attempts INT DEFAULT 0, 
					 neutered BOOLEAN DEFAULT false, 
					 weight_kg REAL
					);
