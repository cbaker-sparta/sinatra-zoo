require 'pg'

class Region
  attr_accessor(:regionId, :region, :continent, :map_image, :alt_tag)

  def self.open_connection
    connection = PG.connect(dbname: 'region_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT region, map_image, alt_tag FROM regions ORDER BY regionId"

    results = connection.exec(sql)

    regions = results.map do |region|
      self.hydrate(region)
    end

    regions
  end

  def self.find(regionId)
    connection = self.open_connection

    sql = "SELECT * FROM regions WHERE regionId = #{regionId} LIMIT 1"

    regions = connection.exec(sql)

    region = self.hydrate(posts[0])

    region
  end

  def self.hydrate(region_data)
    region = Region.new

    region.regionId = region_data['regionId']
    region.region = region_data['region']
    region.continent = region_data['continent']
    region.map_image = region_data['map_image']
    region.alt_tag = region_data['alt_tag']

    region
  end

 #  def save
 #    connection = region.open_connection
 #    if (!self.animalId)
   sql = "INSERT INTO regions (region) VALUES ('#{self.region}');
          INSERT INTO classes (class) VALUES ('#{self.class}');
          INSERT INTO animals (name, lifespan, diet, habitat, image, alt_tag, classId, regionId) VALUES ('#{self.name}', '#{self.diet}', '#{self.lifespan}', '#{self.habitat}', '#{self.image}', '#{self.alt_tag}', '#{Region.regionId}', '#{Class.classId}');"

 else
   sql = "UPDATE regions SET region='#{self.region}' WHERE regionId=animals.regionId;
          UPDATE classes SET class='#{self.class}' WHERE classId=animals.classId;
          UPDATE animals SET name='#{self.name}', diet='#{self.diet}', lifespan='#{self.lifespan}', habitat='#{self.habitat}', image='#{self.image}', alt_tag='#{self.alt_tag}' WHERE animalId=#{self.animalId}"
#           UPDATE animals, regions, classes INNER JOIN regions ON animals.regionId = regions.regionId INNER JOIN classes ON animals.classId = classes.classId SET region='#{self.region}' WHERE regionId=animals.regionId;

 end

    connection.exec(sql)
  end

  def self.destroy(regionId)
    connection = self.open_connection

    sql = "DELETE FROM regions where regionId = #{regionId}"

    connection.exec(sql)
  end
end
