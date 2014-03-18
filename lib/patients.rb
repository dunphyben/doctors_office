require 'pg'

class Patients
  attr_reader :name, :id, :birthdate, :insurance_id, :doctor_id

  def initialize(name, birthdate, doctor_id, insurance_id, id=nil)
    @name = name
    @birthdate = birthdate
    @doctor_id = doctor_id
    @insurance_id = insurance_id
    @id = id
  end

  def ==(another_patient)
    self.name == another_patient.name && self.id == another_patient.id && self.birthdate == another_patient.birthdate
  end

  def self.all
    all_patients = []
    results = DB.exec('SELECT * FROM patients;')
    results.each do |result|
      name = result['name']
      birthdate = result['birthdate']
      id = result['id'].to_i
      doctor_id = result['doctor_id']
      insurance_id = result['insurance_id']
      all_patients << Patients.new(name, birthdate, doctor_id, insurance_id, id)
    end
    all_patients
  end

  def save
   results = DB.exec("INSERT INTO patients (name, birthdate, doctor_id, insurance_id) VALUES ('#{@name}', '#{@birthdate}', '#{doctor_id}', '#{insurance_id}') RETURNING id;")
   @id = results.first['id'].to_i
  end
end
