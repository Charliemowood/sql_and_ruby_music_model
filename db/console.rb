require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({ 'name' => 'Elvis'})
artist1.save()

album1 = Album.new({
  'title' => 'Jail House Rock',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })
album1.save()
binding.pry
nil
