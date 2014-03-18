require 'pg'

class Doctors
  attr_reader :name, :id

  def ==(another_doctor)
    self.name == another_doctor.name
  end

  def initialize(name, id=nil)
    @name = name
    @id = id
  end

  def self.all
    entry = DB.exec("SELECT * FROM doctors")
    doctors_list = []
    entry.each do |result|
      name = result['name']
      id = result['id'].to_i
      doctors_list << Doctors.new(name, id)
    end
    doctors_list
  end

  def save
    DB.exec("INSERT INTO doctors (name, id) VALUES ('#{@name}', '#{@id}');")
  end
end
