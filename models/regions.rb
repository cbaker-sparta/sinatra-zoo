require 'pg'

class Region
  attr_accessor(:region_id, :region, :continent, :map_image, :map_alt)

  def self.open_connection
    connection = PG.connect(dbname: 'animal_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM regions"

    results = connection.exec(sql)

    regions = results.map do |region|
      self.hydrate(region)
    end

    regions
  end

  def self.find(region_id)
    connection = self.open_connection

    sql = "SELECT * FROM regions WHERE region_id = #{region_id} LIMIT 1"

    regions = connection.exec(sql)

    region = self.hydrate(regions[0])

    region
  end

  def self.hydrate(region_data)
    region = Region.new

    region.region_id = region_data['region_id']
    region.region = region_data['region']
    region.continent = region_data['continent']
    region.map_image = region_data['map_image']
    region.map_alt = region_data['map_alt']

    region
  end

  def save
  connection = Region.open_connection
  if (!self.region_id)
   sql = "INSERT INTO regions (region, continent, map_image, map_alt) VALUES ('#{self.region}', '#{self.continent}', '#{self.map_image}', '#{self.map_alt}')"

  else
    sql = "UPDATE regions SET region='#{self.region}', contient='#{self.continent}', map_image='#{self.map_image}', map_alt='#{self.map_alt}' WHERE region_id=#{self.region_id}"
  end

   connection.exec(sql)
  end

  def self.destroy(region_id)
    connection = self.open_connection

    sql = "DELETE FROM regions WHERE region_id = #{region_id}"

    connection.exec(sql)
  end
end
