require('pg')
require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i if options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    ) VALUES (
    '#{ @title }',
    '#{ @genre }',
    #{ @artist_id })
    RETURNING id;"
    result = SqlRunner.run(sql)
    result_hash = result.first
    new_id = result_hash["id"].to_i
    @id = new_id
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def artists
    sql = "SELECT * FROM artists WHERE id = #{@id};"
    artist_hashes = SqlRunner.run(sql)
    artist_objects = artist_hashes.map { |artist_hash| Artist.new(artist_hash)}
    return artist_objects
  end
end
