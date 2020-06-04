require 'pry'

class Artist

    attr_accessor :name, :songs

    @@all = [] 

    def initialize(name)
        @name = name
        @songs = [] 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 


    def add_song(song)
        song.artist = self
    end 

  
    def self.find(name)
        Artist.all.find {|a| a.name == name }
    end  

    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            Artist.new(name)
        end
    end

    def print_songs
        songs.each {|s| puts s.name }
    end 

end 






