require(PG)
class SqlRunner

  def run(sql)

    begin
      db = PG.connect ({dbname: 'music', host: 'localhost'})
      db.exec(sql)
    ensure
      db.close()
    end
  end


end
