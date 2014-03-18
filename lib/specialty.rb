require 'pg'

class Specialty

  attr_reader :type, :id

  def ==(another_specialty)
    self.type == another_specialty.type
  end

  def initialize(type, id=nil)
    @type = type
    @id = id
  end

  def self.all
    entry = DB.exec('SELECT * FROM specialty')
    all_specialties = []
    entry.each do |result|
      type = result['type']
      id = result['id'].to_i
      all_specialties << Specialty.new(type, id)
    end
    all_specialties
  end

  def save
    results = DB.exec("INSERT INTO specialty (type) VALUES ('#{@type}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
