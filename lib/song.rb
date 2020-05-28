class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    name_array = filename.split(" - ")
    #binding.pry
    newsong = self.new(name_array[1])
    newsong.artist_name = name_array[0]
    #binding.pry
    newsong
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end