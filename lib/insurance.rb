require 'pg'

class Insurance

  attr_reader :company, :phone, :id

  def ==(another_insurance)
    self.company == another_insurance.company
  end

  def initialize(company, phone, id=nil)
    @company = company
    @phone = phone
    @id = id
  end

  def self.all
    entry = DB.exec('SELECT * FROM insurance')
    all_companies = []
    entry.each do |result|
      company = result['company']
      phone = result['phone']
      id = result['id'].to_i
      all_companies << Insurance.new(company, phone, id)
    end
    all_companies
  end

  def save
    results = DB.exec("INSERT INTO insurance (company, phone) VALUES ('#{@company}', '#{@phone}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
