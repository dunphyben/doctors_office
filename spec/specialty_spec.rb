require 'spec_master_splinter'

describe Specialty do
  describe 'initialize' do
    it 'should create an instance of the class Specialty' do
      new_specialty = Specialty.new('Urologist')
      new_specialty.should be_an_instance_of Specialty
    end

    it 'should tell you the specialty name' do
      new_specialty = Specialty.new('Urologist')
      new_specialty.type.should eq 'Urologist'
    end
  end

  describe 'all' do
    it 'should begin with no specialty' do
      Specialty.all.should eq []
    end
  end

  describe 'save' do
    it 'should save a specialty to the database' do
      new_specialty = Specialty.new('Urologist')
      new_specialty.save
      Specialty.all.should eq [new_specialty]
    end

    it 'sets its serial ID when you save the entry' do
      new_specialty = Specialty.new('Urologist')
      new_specialty.save
      new_specialty.id.should be_an_instance_of Fixnum
    end
  end
end
