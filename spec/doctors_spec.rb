require 'rspec'
require 'doctors'

DB = PG.connect({:dbname => 'doc_data_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end
end

describe Doctors do

  describe 'initialize' do
    it 'is initialized as an instance of Doctors' do
    new_doc = Doctors.new('Dr. Kevorkian', 1)
    new_doc.should be_an_instance_of Doctors
    end

    it 'should tell you the doctors name' do
      new_doc = Doctors.new('Dr. Kevorkian', 1)
      new_doc.name.should eq "Dr. Kevorkian"
      new_doc.id.should eq 1
    end

    it 'starts off with no doctors' do
      Doctors.all.should eq []
    end

    it 'lets you save a doctor entry to the doctor_list' do
      new_doc = Doctors.new('Dr. Kevorkian', 1)
      new_doc.save
      Doctors.all.should eq [new_doc]
    end

    it 'is the same doctor if it has the same name and id' do
      new_doc = Doctors.new('Dr. Kevorkian', 1)
      new_doc2 = Doctors.new('Dr. Kevorkian', 1)
      new_doc.should eq new_doc2
    end
  end

end
