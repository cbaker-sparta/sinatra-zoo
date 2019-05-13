require 'pg'

class Animal
  attr_accessor(:animal_id, :name, :class, :lifespan, :diet, :habitat, :region, :image, :alt_tag, :region_id, :class_id)

  def self.open_connection
    connection = PG.connect(dbname: 'animal_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM animals INNER JOIN regions ON animals.region_id = regions.region_id INNER JOIN classes on animals.class_id = classes.class_id ORDER BY animal_id"

    results = connection.exec(sql)

    animals = results.map do |animal|
      self.hydrate(animal)
    end

    animals
  end

  def self.find(animal_id)
    connection = self.open_connection

    sql = "SELECT * FROM animals INNER JOIN regions ON animals.region_id = regions.region_id INNER JOIN classes on animals.class_id = classes.class_id WHERE animal_id = #{animal_id} LIMIT 1"

    animals = connection.exec(sql)

    animal = self.hydrate(animals[0])

    animal
  end

  def self.hydrate(animal_data)
    animal = Animal.new

    animal.animal_id = animal_data['animal_id']
    animal.name = animal_data['name']
    animal.class = animal_data['class']
    animal.lifespan = animal_data['lifespan']
    animal.diet = animal_data['diet']
    animal.habitat = animal_data['habitat']
    animal.region = animal_data['region']
    animal.image = animal_data['image']
    animal.alt_tag = animal_data['alt_tag']
    animal.region_id = animal_data['region_id']
    animal.class_id = animal_data['class_id']

    animal
  end

  def save
    connection = Animal.open_connection
    if (!self.animal_id)
      sql = "INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, class_id, region_id) VALUES ('#{self.name}', '#{self.lifepsan}', '#{self.diet}', '#{self.habitat}', '#{self.image}', '#{self.alt_tag}', #{self.class_id}, #{self.region_id}')"

    else
      sql = "UPDATE animals SET name='#{self.name}', lifespan='#{self.lifespan}', diet='#{self.diet}', habitat='#{self.habitat}', image='#{self.image}', alt_tag='#{self.alt_tag}', class_id=#{self.class_id}, region_id=#{self.region_id} WHERE animal_id=#{self.animal_id}"

    end

    connection.exec(sql)
  end

  def self.destroy(animal_id)
    connection = self.open_connection

    sql = "DELETE FROM animals WHERE animal_id = #{animal_id}"

    connection.exec(sql)
  end
end
