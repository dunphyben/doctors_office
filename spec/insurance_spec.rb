require 'spec_master_splinter'


describe Insurance do

  describe 'initialize' do
    it 'is initialized as an instance of Insurance' do
    new_insur = Insurance.new('Red Shield', "800-555-2121")
    new_insur.should be_an_instance_of Insurance
    end

    it 'should tell you the Insurance company name' do
      new_insur = Insurance.new('Red Shield', "800-555-2121")
      new_insur.company.should eq "Red Shield"
      new_insur.phone.should eq "800-555-2121"
    end

    it 'starts off with no Insurance' do
      Insurance.all.should eq []
    end

    it 'lets you save a doctor entry to the doctor_list' do
      new_insur = Insurance.new('Red Shield', "800-555-2121")
      new_insur.save
      Insurance.all.should eq [new_insur]
    end

    it 'is the same doctor if it has the same name and id' do
      new_insur = Insurance.new('Red Shield', "800-555-2121")
      new_insur2 = Insurance.new('Red Shield', "800-555-2121")
      new_insur.should eq new_insur2
    end

    it 'sets its serial ID when you save the entry' do
      new_insurance = Insurance.new('Red Shield', "800-555-2121")
      new_insurance.save
      new_insurance.id.should be_an_instance_of Fixnum
    end
  end
end
