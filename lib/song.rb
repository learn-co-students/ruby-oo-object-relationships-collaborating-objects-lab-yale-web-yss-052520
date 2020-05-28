require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def name 
        @name
    end 

    def self.all
        @@all
    end
    

    def self.new_by_filename(file)
        song = self.new(file.split(" - ")[1])
        song.artist_name = file.split(" - ")[0] 
        song
        # song.name= file.split(" - ")[1]
    end

    def artist_name= (artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
end 