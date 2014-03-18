require 'pg'

class Doctors
  attr_reader :name, :id, :specialty_id

  def ==(another_doctor)
    self.name == another_doctor.name
  end

  def initialize(name, specialty_id, id=nil)
    @name = name
    @id = id
    @specialty_id = specialty_id
  end

  def self.all
    entry = DB.exec("SELECT * FROM doctors")
    doctors_list = []
    entry.each do |result|
      name = result['name']
      id = result['id'].to_i
      specialty_id = result['specialty_id'].to_i
      doctors_list << Doctors.new(name, specialty_id, id)
    end
    doctors_list
  end

  def save
    entry = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', #{@specialty_id}) RETURNING id;")
    @id = entry.first['id'].to_i
  end
end
