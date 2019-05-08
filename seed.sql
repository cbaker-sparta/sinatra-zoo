-- Animal table

DROP TABLE IF EXISTS animals CASCADE;

CREATE TABLE animals (
  animal_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  lifespan VARCHAR(255),
  diet VARCHAR(255),
  habitat VARCHAR(255),
  image text,
  alt_tag VARCHAR(255),
  region_id INT,
  FOREIGN KEY (region_id) REFERENCES regions (region_id),
  class_id INT,
  FOREIGN KEY (class_id) REFERENCES classes (class_id)
);

INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Gorilla', '35-40 years', 'Herbivore', 'Forest/Jungle', 'https://www.wwf.org.uk/sites/default/files/styles/social_share_image/public/2016-09/Medium_WW22557.jpg?itok=hg7S3zWD', 'Picture of a Gorilla', 1, 1);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Vampire Bat', '9-10 years', 'Carnivore', 'Caves', 'https://thumbs-prod.si-cdn.com/Rg0MNNgbSS5_idHvXFDZb9j9-mmo=/800x600/filters:no_upscale():focal(815x330:816x331)/https://public-media.si-cdn.com/filer/c4/5e/c45e215d-7646-4a2d-9586-611fa177e8c7/desmo-boden.jpg', 'Picture of a Vampire Bat', 1, 2);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Anaconda', '10-12 years', 'Carnivore', 'Tropical', 'https://media-cdn.tripadvisor.com/media/photo-s/0d/fc/47/63/anaconda.jpg', 'Picture of an Anaconda', 2, 2);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Spider-Pig', 'Infinity - we are all spider-pigs',  'The souls of the fallen', 'Our hearts and minds', 'https://i.kym-cdn.com/photos/images/newsfeed/000/377/300/e30', 'Picture of the Spider-Pig', 3, 3);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Koala', '13-18 years', 'Herbivore', 'Forest', 'https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA5OS83MTYvb3JpZ2luYWwva29hbGFzLXdpdGgtY2hsYW15ZGlhLmpwZw==', 'Picture of a Koala', 1, 4);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Guinea Baboon', '25-30 years', 'Omnivore', 'Savannah/Woodland', 'https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA1Mi81Nzgvb3JpZ2luYWwvYmFib29uLTEyMDQwOS5qcGc=', 'Picture of a Baboon', 1, 5);
INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('Lyrebird', '25-30 years', 'Insectivore', 'Rainforest', 'https://www.echoactive.com/images/easyblog_articles/715/SuperbLyrebird_800_400.jpg', 'Picture of a Lyrebird', 4, 6);

-- Geographical information

DROP TABLE IF EXISTS regions CASCADE;

CREATE TABLE regions (
  region_id SERIAL PRIMARY KEY,
  region VARCHAR(255),
  continent VARCHAR(255),
  map_image TEXT,
  alt_tag VARCHAR(255)
);

INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('Sub-Saharan Africa', 'Africa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Sub-Saharan_Africa_definition_UN.png/220px-Sub-Saharan_Africa_definition_UN.png', 'map of Sub-Saharan Africa');
INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('Sub-Tropical Americas', 'South America', 'https://www.researchgate.net/profile/Felipe_Turchetto3/publication/320349598/figure/fig1/AS:677246964609028@1538479667814/Geographical-distribution-of-hum_id-subtropical-climate-in-South-America-adapted-from.png', 'map of Sub-Tropical America');
INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('The Cosmos', 'Heaven', 'https://www.researchgate.net/profile/Felipe_Turchetto3/publication/320349598/figure/fig1/AS:677246964609028@1538479667814/Geographical-distribution-of-hum_id-subtropical-climate-in-South-America-adapted-from.png', 'map of Sub-Tropical America');
INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('Eastern Australia', 'Oceania', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Koala_Range.jpg/240px-Koala_Range.jpg', 'map of Eastern Australia');
INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('Western Africa', 'Africa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Guinea_Baboon_area.png/220px-Guinea_Baboon_area.png', 'map of Western Africa');
INSERT INTO regions (region, continent, map_image, alt_tag) VALUES ('South-Eastern Australia', 'Oceania', 'https://upload.wikimedia.org/wikipedia/commons/a/a8/B_spinulosa_dist_map.png', 'map of Western Africa');

-- Animal class information and description

DROP TABLE IF EXISTS classes CASCADE;

CREATE TABLE classes (
  class_id SERIAL PRIMARY KEY,
  class VARCHAR(255),
  class_description TEXT
);

INSERT INTO classes (class, class_description) VALUES ('Mammalia', 'Mammals (from Latin mamma "breast") are vertebrate animals constituting the class Mammalia (/məˈmeɪliə/), and characterized by the presence of mammary glands which in females produce milk for feeding (nursing) their young, a neocortex (a region of the brain), fur or hair, and three m_iddle ear bones. These characteristics distinguish them from reptiles and birds, from which they diverged in the late Triassic, 201–227 million years ago. There are around 5,450 species of mammals. The largest orders are the rodents, bats and Soricomorpha (shrews and others). The next three are the Primates (humans, apes, monkeys, and others), the Cetartiodactyla (whales and even-toed ungulates), and the Carnivora (cats, dogs, seals, and others).');
INSERT INTO classes (class, class_description) VALUES ('Reptilia', 'Reptiles are tetrapod animals in the class Reptilia, comprising today''s turtles, crocodilians, snakes, amphisbaenians, lizards, tuatara, and their extinct relatives. The study of these traditional reptile orders, historically combined with that of modern amphibians, is called herpetology.');
INSERT INTO classes (class, class_description) VALUES ('Spiderus-Pigia', 'Spider-Pig, Spider-Pig,
Does whatever a Spider-Pig does.
Can he swing from a web?
No, he can''t, he''s a pig,
Look out, he is a Spider-Pig!');
INSERT INTO classes (class, class_description) VALUES ('Aves', 'Birds, also known as Aves or avian dinosaurs, are a group of endothermic vertebrates, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton. Birds live worldw_ide and range in size from the 5 cm (2 in) bee hummingbird to the 2.75 m (9 ft) ostrich. They rank as the world''s most numerically-successful class of tetrapods, with approximately ten thousand living species, more than half of these being passerines, sometimes known as perching birds. Birds have wings which are more or less developed depending on the species; the only known groups without wings are the extinct moa and elephant birds. Wings, which evolved from forelimbs, gave birds the ability to fly, although further evolution has led to the loss of flight in flightless birds, including ratites, penguins, and diverse endemic island species of birds. The digestive and respiratory systems of birds are also uniquely adapted for flight. Some bird species of aquatic environments, particularly seabirds and some waterbirds, have further evolved for swimming.');
