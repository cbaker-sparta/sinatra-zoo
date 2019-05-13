require 'pg'

class Class
  attr_accessor(:class_id, :class, :class_description)

  def self.open_connection
    connection = PG.connect(dbname: 'animal_db')
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM classes"

    results = connection.exec(sql)

    classes = results.map do |new_class|
      self.hydrate(new_class)
    end
    classes
  end

  def self.find(class_id)

    connection = self.open_connection

    sql = "SELECT * FROM classes WHERE class_id = #{class_id} LIMIT 1"

    classes = connection.exec(sql)

    new_class = self.hydrate(classes[0])

    new_class
  end

  def self.hydrate(class_data)
    new_class = Class.new

    new_class.class_id = class_data['class_id']
    new_class.class = class_data['class']
    new_class.class_description = class_data['class_description']

    new_class
  end

  def save
    connection = Class.open_connection
   if (!self.class_id)
   sql = "INSERT INTO classes (class, class_description) VALUES ('#{self.class}', '#{self.class_description}')"
   else
   sql = "UPDATE classes SET class='#{self.class}', class_description='#{self.class_description}' WHERE class_id=classes.class_id;"
   end

    connection.exec(sql)
  end

  def self.destroy(class_id)
    connection = self.open_connection

    sql = "DELETE FROM classes WHERE class_id = #{class_id}"

    connection.exec(sql)
  end
end
