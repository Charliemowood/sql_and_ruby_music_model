require('PG')
require_relative('../db/sql_runner')
require_relative('./album')

class Artist

  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id'].to_i()
    @id = new_id
  end

end
