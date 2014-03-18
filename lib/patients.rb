require 'pg'

class Patients
  attr_reader :name, :id, :birthdate

  def initialize(name, id=nil, birthdate)
    @name = name
    @id = id
    @birthdate = birthdate
  end

  def ==(another_patient)
    self.name == another_patient.name && self.id == another_patient.id && self.birthdate == another_patient.birthdate
  end

  def self.all
    all_patients = []
    results = DB.exec('SELECT * FROM patients;')
    results.each do |result|
      all_patients << Patients.new(result['name'], result['id'].to_i, result['birthdate'])
    end
    all_patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthdate, id) VALUES ('#{@name}', '#{@birthdate}', '#{@id}');")
  end
end
