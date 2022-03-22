/* Populate database with sample data. */

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.0);
	
INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
	
INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Charmander', '2020-02-08', 0, false, -11.0);
	
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
	
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Angemon', '2005-06-12', 1, true, -45);
	
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
	
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Ditto', '2022-05-14', 4, true, 22);


INSERT INTO public.owners(full_name, age) VALUES ('Sam Smith', '34');
INSERT INTO public.owners(full_name, age) VALUES ('Jennifer Orwell', '19');
INSERT INTO public.owners(full_name, age) VALUES ('Bob', '45');
INSERT INTO public.owners(full_name, age) VALUES ('Melody Pond', '77');
INSERT INTO public.owners(full_name, age) VALUES ('Dean Winchester', '14');
INSERT INTO public.owners(full_name, age) VALUES ('Jodie Whittaker', '38');

INSERT INTO public.species(name) VALUES ('Pokemon');
INSERT INTO public.species(name) VALUES ('Digimon');

/* Modify your inserted animals so it includes the species_id value:
   If the name ends in "mon" it will be Digimon
   All other animals are Pokemon
*/
BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon' ;
COMMIT;

/* Modify your inserted animals to include owner information (owner_id):
Sam Smith owns Agumon.
Jennifer Orwell owns Gabumon and Pikachu.
Bob owns Devimon and Plantmon.
Melody Pond owns Charmander, Squirtle, and Blossom.
Dean Winchester owns Angemon and Boarmon.
*/
BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';
COMMIT;

/* ADD vets */
INSERT INTO public.vets(name, age, date_of_graduation)VALUES ('William Tatcher', 45, '2020-04-23');
INSERT INTO public.vets(name, age, date_of_graduation)VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO public.vets(name, age, date_of_graduation)VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO public.vets(name, age, date_of_graduation)VALUES ('Jack Harkness', 38, '2008-06-08');

/* Insert the following data for specialties:
		Vet William Tatcher is specialized in Pokemon.
		Vet Stephanie Mendez is specialized in Digimon and Pokemon.
		Vet Jack Harkness is specialized in Digimon. 
*/
INSERT INTO public.specializations(vet_id, species_id)
	VALUES ((SELECT id FROM vets WHERE name='William Tatcher'), 
		    (SELECT id FROM species WHERE name='Pokemon'));
			
INSERT INTO public.specializations(vet_id, species_id)
	VALUES ((SELECT id FROM vets WHERE name='Stephanie Mendez'), 
		    (SELECT id FROM species WHERE name='Digimon'));

INSERT INTO public.specializations(vet_id, species_id)
	VALUES ((SELECT id FROM vets WHERE name='Stephanie Mendez'), 
		    (SELECT id FROM species WHERE name='Pokemon'));
			
INSERT INTO public.specializations(vet_id, species_id)
	VALUES ((SELECT id FROM vets WHERE name='Jack Harkness'), 
		    (SELECT id FROM species WHERE name='Digimon'));

/* Insert datas for visits */			
		
INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
			(SELECT id FROM animals WHERE name='Agumon'), 
		    '2020-05-24');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
			(SELECT id FROM animals WHERE name='Agumon'), 
		    '2020-07-22');
	
INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Jack Harkness'),
			(SELECT id FROM animals WHERE name='Gabumon'), 
		    '2021-02-02');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Pikachu'), 
		    '2020-01-05');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Pikachu'), 
		    '2020-03-08');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Pikachu'), 
		    '2020-05-14');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
			(SELECT id FROM animals WHERE name='Devimon'), 
		    '2021-05-04');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Jack Harkness'),
			(SELECT id FROM animals WHERE name='Charmander'), 
		    '2021-02-24');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Plantmon'), 
		    '2019-12-21');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
			(SELECT id FROM animals WHERE name='Plantmon'), 
		    '2020-08-10');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Plantmon'), 
		    '2021-04-07');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
			(SELECT id FROM animals WHERE name='Squirtle'), 
		    '2019-09-29');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Jack Harkness'),
			(SELECT id FROM animals WHERE name='Angemon'), 
		    '2020-10-03');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Jack Harkness'),
			(SELECT id FROM animals WHERE name='Angemon'), 
		    '2020-11-04');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Boarmon'), 
		    '2019-01-24');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Boarmon'), 
		    '2019-05-15');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Boarmon'), 
		    '2020-02-27');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Maisy Smith'),
			(SELECT id FROM animals WHERE name='Boarmon'), 
		    '2020-08-03');	

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
			(SELECT id FROM animals WHERE name='Blossom'), 
		    '2020-05-24');

INSERT INTO public.visits(vet_id, animal_id, date_of_visit)
	VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
			(SELECT id FROM animals WHERE name='Blossom'), 
		    '2021-01-11');			
	
	
