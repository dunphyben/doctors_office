require 'rspec'
require 'patients'

DB = PG.connect({:dbname => 'doc_data_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end
end

describe Patients do
  describe 'initialize' do
    it 'should create an instance of the class Patients' do
      new_patient = Patients.new('Jay', 1, '1969-01-01')
      new_patient.should be_an_instance_of Patients
    end

    it 'should tell you the name, id, and birthdate of the patient' do
      new_patient = Patients.new('Jay', 1, '1969-01-01')
      new_patient.name.should eq 'Jay'
      new_patient.id.should eq 1
      new_patient.birthdate.should eq '1969-01-01'
    end

    it 'should start off with no patients' do
      Patients.all.should eq []
    end

    it 'lets you save a patient entry to the patient list' do
      new_patient = Patients.new('Jay', 1, '1969-01-01')
      new_patient.save
      Patients.all.should eq [new_patient]
    end

    it 'recognizes patients with the same name and id as the same object' do
      new_patient = Patients.new('Jay', 1, '1969-01-01')
      new_patient2 = Patients.new('Jay', 1, '1969-01-01')
      new_patient.should eq new_patient2
    end
  end
end

