require 'pry'

class Song

    attr_accessor :name, :artist 

    @@all = []

    def initialize(name)
        @name = name
        save 
    end
    
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        array = file.split(' - ')
        song = Song.new(array[1])
        song.artist_name = array[0]
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        artist 
    end

end

# binding.pry
# 0