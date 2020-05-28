require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = [] 

    def initialize(name)
        @name = name 
        self.class.all << self #keep track of all instances of song
    end 

    def self.all 
        @@all 
    end 

    def self.new_by_filename(filename)
        # Ruby has parallel assignment!
        creator, title, genre = filename.split(" - ") 
        
        new_song = Song.new(title) #create new instance of Song
        
        #Song's artist attribute is an Artist object. Calling another method which invokes the initialize method for the artist class
        # Uses the find_or_create_by_name instance method outlined in the Artist class
        new_song.artist_name=(creator)
        new_song  #returns the new Song object. 
    end 

    # Takes in a string and returns the artist object
    # Example return value: <Artist:0x00007f82efa12420 @name="Michael Jackson">
    def artist_name=(name)
        # The actual assignment of the artist "michael jackson"
        # to the Song instance variable occurs in the .add_song 
        # method in the Artist class.
        Artist.find_or_create_by_name(name).add_song(self)
    end 
end 