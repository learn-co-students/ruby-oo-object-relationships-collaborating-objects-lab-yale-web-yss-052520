# require_relative 'lib/song.rb'

require 'pry'
class Artist 
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        artist =  @@all.find{|artist| artist.name == name}        
        return Artist.new(name) if(artist == nil) 
        artist
    end

    def print_songs
        Song.all.select{|song| puts song.name if (song.artist == self)}
    end

    def self.all
     @@all
    end

end