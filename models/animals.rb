require 'pg'

class Animal
  attr_accessor(:animalId, :name, :class, :lifespan, :diet, :habitat, :region, :image, :alt_tag, :regionId, :classId)

  def self.open_connection
    connection = PG.connect(dbname: 'animal_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT name, class, lifespan, diet, habitat, region, image, animals.alt_tag FROM animals INNER JOIN regions ON animals.regionId = regions.regionId INNER JOIN classes on animals.classId = classes.classId ORDER BY animalId"

    results = connection.exec(sql)

    animals = results.map do |animal|
      self.hydrate(animal)
    end

    animals
  end

  def self.find(animalId)
    connection = self.open_connection

    sql = "SELECT * FROM animals WHERE animalId = #{animalId} LIMIT 1"

    animals = connection.exec(sql)

    animal = self.hydrate(posts[0])

    animal
  end

  def self.hydrate(animal_data)
    animal = Animal.new

    animal.animalId = animal_data['animalId']
    animal.class = animal_data['class']
    animal.lifespan = animal_data['lifespan']
    animal.diet = animal_data['diet']
    animal.habitat = animal_data['habitat']
    animal.region = animal_data['region']
    animal.image = animal_data['image']
    animal.alt_tag = animal_data['alt_tag']
    animal.regionId = animal_data['regionId']
    animal.classId = animal_data['classId']

    animal
  end

  def save
    connection = Animal.open_connection
    if (!self.animalId)
      sql = "INSERT INTO regions (region) VALUES ('#{self.region}');
             INSERT INTO classes (class) VALUES ('#{self.class}');
             INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, classId, regionId) VALUES ('#{self.name}', '#{self.diet}', '#{self.lifespan}', '#{self.habitat}', '#{self.image}', '#{self.alt_tag}', '#{Region.regionId}', '#{Class.classId}');"

    else
      sql = "UPDATE regions SET region='#{self.region}' WHERE regionId=animals.regionId;
             UPDATE regions SET class='#{self.class}' WHERE classId=animals.classId;
             UPDATE animals SET name='#{self.name}', diet='#{self.diet}', lifespan='#{self.lifespan}', habitat='#{self.habitat}', image='#{self.image}', alt_tag='#{self.alt_tag}' WHERE animalId=#{self.animalId}"
 #           UPDATE animals, regions, classes INNER JOIN regions ON animals.regionId = regions.regionId INNER JOIN classes ON animals.classId = classes.classId SET region='#{self.region}' WHERE regionId=animals.regionId;

    end

    connection.exec(sql)
  end

  def self.destroy(animalId)
    connection = self.open_connection

    sql = "DELETE FROM animals where animalId = #{animalId}"

    connection.exec(sql)
  end
end
