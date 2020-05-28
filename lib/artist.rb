require 'pry'

class Artist
    attr_accessor :name 
    @@all = [] 

    def initialize(name)
        @name = name
        self.class.all << self #keep track of all new instances
    end 

    def self.all
        @@all
    end 

    def add_song(song)
        #tell the song instance it belongs to this Artist
        song.artist = self
    end
    
    # Rather than having each artist have an array of all their songs, 
    # we can filter out the songs with song.artist == self to find 
    # songs that were created by this instance of artist.
    def songs
        Song.all.select {|song| song.artist == self}
    end 

    # Given str - a string that represents the artist's name 
    # If that artist already exists, returns that artist instance.
    # Otherwise, creates a new artist and returns it. 
    def self.find_or_create_by_name(str)
        all.each do |artist|
            if artist.name == str 
                return artist 
            end 
        end 
        # Will only get to this point in the code if this is a new artist 
        # ie. not already an instance with this name. 
        new_artist = Artist.new(str)
    end 

    # Prints all songs written by this instance of Artist.
    def print_songs
        Song.all.each do |song|
            if song.artist == self 
                puts song.name
            end 
        end 
    end
end 