DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
  animalId SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  classId INT FOREGIN KEY REFERENCES classes(classId),
  lifespan VARCHAR(255),
  diet VARCHAR(255),
  habitat VARCHAR(255),
  regionId INT FOREGIN KEY REFERENCES regions(regionId),
  image text,
  alt_tag VARCHAR(255)
);

INSERT INTO animals VALUES ('Gorilla', 1, '35-40 years', 'Herbivore', 'Forest/Jungle', 1, 'https://www.wwf.org.uk/sites/default/files/styles/social_share_image/public/2016-09/Medium_WW22557.jpg?itok=hg7S3zWD', 'Picture of a Gorilla');
INSERT INTO animals VALUES ('Vampire Bat', 1, '9-10 years', 'Carnivore', 'Caves', 2, 'https://thumbs-prod.si-cdn.com/Rg0MNNgbSS5IdHvXFDZb9j9-mmo=/800x600/filters:no_upscale():focal(815x330:816x331)/https://public-media.si-cdn.com/filer/c4/5e/c45e215d-7646-4a2d-9586-611fa177e8c7/desmo-boden.jpg', 'Picture of a Vampire Bat');
INSERT INTO animals VALUES ('Anaconda', 2, '10-12 years', 'Carnivore', 'Tropical', 2, 'https://media-cdn.tripadvisor.com/media/photo-s/0d/fc/47/63/anaconda.jpg', 'Picture of an Anaconda');
INSERT INTO animals VALUES ('Spider-Pig', 3, 'Infinity - we are all spider-pigs',  'The souls of the fallen', 'Our hearts and minds', 3, 'https://i.kym-cdn.com/photos/images/newsfeed/000/377/300/e30', 'Picture of the Spider-Pig');
INSERT INTO animals VALUES ('Koala', 1, '13-18 years', 'Herbivore', 'Forest', 4, 'https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA5OS83MTYvb3JpZ2luYWwva29hbGFzLXdpdGgtY2hsYW15ZGlhLmpwZw==', 'Picture of a Koala');
INSERT INTO animals VALUES ('Guinea Baboon', 1, '25-30 years', 'Omnivore', 'Savannah/Woodland', 5, 'https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA1Mi81Nzgvb3JpZ2luYWwvYmFib29uLTEyMDQwOS5qcGc=', 'Picture of a Baboon');
INSERT INTO animals VALUES ('Lyrebird', 4, '25-30 years', 'Insectivore', 'Rainforest', 6, 'https://www.echoactive.com/images/easyblog_articles/715/SuperbLyrebird_800_400.jpg', 'Picture of a Lyrebird');


-- DROP TABLE IF EXISTS regions;
--
-- CREATE TABLE regions (
--   regionId SERIAL PRIMARY KEY,
--   region VARCHAR(255),
--   continent VARCHAR(255),
--   map_image text,
--   alt_tag VARCHAR(255)
-- );
--
-- INSERT INTO regions VALUES ('Sub-Saharan Africa', 'Africa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Sub-Saharan_Africa_definition_UN.png/220px-Sub-Saharan_Africa_definition_UN.png', 'map of Sub-Saharan Africa');
-- INSERT INTO regions VALUES ('Sub-Tropical Americas', 'South America', 'https://www.researchgate.net/profile/Felipe_Turchetto3/publication/320349598/figure/fig1/AS:677246964609028@1538479667814/Geographical-distribution-of-humid-subtropical-climate-in-South-America-adapted-from.png', 'map of Sub-Tropical America');
-- INSERT INTO regions VALUES ('The Cosmos', 'Heaven', 'https://www.researchgate.net/profile/Felipe_Turchetto3/publication/320349598/figure/fig1/AS:677246964609028@1538479667814/Geographical-distribution-of-humid-subtropical-climate-in-South-America-adapted-from.png', 'map of Sub-Tropical America');
-- INSERT INTO regions VALUES ('Eastern Australia', 'Oceania', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Koala_Range.jpg/240px-Koala_Range.jpg', 'map of Eastern Australia');
-- INSERT INTO regions VALUES ('Western Africa', 'Africa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Guinea_Baboon_area.png/220px-Guinea_Baboon_area.png', 'map of Western Africa');
-- INSERT INTO regions VALUES ('South-Eastern Australia', 'Oceania', 'https://upload.wikimedia.org/wikipedia/commons/a/a8/B_spinulosa_dist_map.png', 'map of Western Africa');
--
--
-- DROP TABLE IF EXISTS classes;
--
-- CREATE TABLE classes (
--   classId SERIAL PRIMARY KEY,
--   class VARCHAR(255),
--   class_description TEXT,
-- );
--
-- INSERT INTO classes VALUES ('Mammalia', 'Mammals (from Latin mamma "breast") are vertebrate animals constituting the class Mammalia (/məˈmeɪliə/), and characterized by the presence of mammary glands which in females produce milk for feeding (nursing) their young, a neocortex (a region of the brain), fur or hair, and three middle ear bones. These characteristics distinguish them from reptiles and birds, from which they diverged in the late Triassic, 201–227 million years ago. There are around 5,450 species of mammals. The largest orders are the rodents, bats and Soricomorpha (shrews and others). The next three are the Primates (humans, apes, monkeys, and others), the Cetartiodactyla (whales and even-toed ungulates), and the Carnivora (cats, dogs, seals, and others).');
-- INSERT INTO classes VALUES ('Reptilia', 'Reptiles are tetrapod animals in the class Reptilia, comprising today\'s turtles, crocodilians, snakes, amphisbaenians, lizards, tuatara, and their extinct relatives. The study of these traditional reptile orders, historically combined with that of modern amphibians, is called herpetology.');
-- INSERT INTO classes VALUES ('Spiderus-Pigia', 'Spider-Pig, Spider-Pig,
-- Does whatever a Spider-Pig does.
-- Can he swing from a web?
-- No, he can\'t, he\'s a pig,
-- Look out, he is a Spider-Pig!');
-- INSERT INTO classes VALUES ('Aves', 'Birds, also known as Aves or avian dinosaurs, are a group of endothermic vertebrates, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton. Birds live worldwide and range in size from the 5 cm (2 in) bee hummingbird to the 2.75 m (9 ft) ostrich. They rank as the world\'s most numerically-successful class of tetrapods, with approximately ten thousand living species, more than half of these being passerines, sometimes known as perching birds. Birds have wings which are more or less developed depending on the species; the only known groups without wings are the extinct moa and elephant birds. Wings, which evolved from forelimbs, gave birds the ability to fly, although further evolution has led to the loss of flight in flightless birds, including ratites, penguins, and diverse endemic island species of birds. The digestive and respiratory systems of birds are also uniquely adapted for flight. Some bird species of aquatic environments, particularly seabirds and some waterbirds, have further evolved for swimming.');
