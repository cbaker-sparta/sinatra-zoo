require 'pg'

class Animal
  attr_accessor(:animalId, :name, :lifespan, :diet, :habitat, :image, :altTag, :regionId, :classId)

  def self.open_connection
    connection = PG.connect(dbname: 'animals')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT name, class, lifespan, diet, habitat, region, image, animals.alt_tag FROM animals INNER JOIN regions ON animals.regionId = regions.regionId INNER JOIN classes on animals.classId = classes.classId;"

    results = connection.exec(sql)

    animals = results.map do |animal|
      self.hydrate(animal)

    animal
  end
end
