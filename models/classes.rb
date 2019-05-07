require 'pg'

class Class
  attr_accessor(:classId, :class, :class_description)

  def self.open_connection
    connection = PG.connect(dbname: 'class_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT class, class_description FROM classes ORDER BY classId"

    results = connection.exec(sql)

    classes = results.map do |class|
      self.hydrate(class)
    end

    classes
  end

  def self.find(classId)

    connection = self.open_connection

    sql = "SELECT * FROM classes WHERE classId = #{classId} LIMIT 1"

    classes = connection.exec(sql)

    class = self.hydrate(posts[0])

    class
  end

  def self.hydrate(class_data)
    class = class.new

    class.classId = class_data['classId']
    class.class = class_data['class']
    class.class_description = class_data['class_description']

    class
  end

#   def save
#     connection = class.open_connection
#    if (!self.animalId)
#    sql = "INSERT INTO regions (region) VALUES ('#{self.region}');
#           INSERT INTO classes (class) VALUES ('#{self.class}');
#           INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, classId, regionId) VALUES ('#{self.name}', '#{self.diet}', '#{self.lifespan}', '#{self.habitat}', '#{self.image}', '#{self.alt_tag}', '#{Region.regionId}', '#{Class.classId}');"
#
#    else
#    sql = "UPDATE regions SET region='#{self.region}' WHERE regionId=animals.regionId;
#           UPDATE classes SET class='#{self.class}' WHERE classId=animals.classId;
#           UPDATE animals SET name='#{self.name}', diet='#{self.diet}', lifespan='#{self.lifespan}', habitat='#{self.habitat}', image='#{self.image}', alt_tag='#{self.alt_tag}' WHERE animalId=#{self.animalId}"
# #           UPDATE animals, regions, classes INNER JOIN regions ON animals.regionId = regions.regionId INNER JOIN classes ON animals.classId = classes.classId SET region='#{self.region}' WHERE regionId=animals.regionId;
#
#    end
#
#     connection.exec(sql)
#   end

  def self.destroy(classId)
    connection = self.open_connection

    sql = "DELETE FROM classes where classId = #{classId}"

    connection.exec(sql)
  end
end
