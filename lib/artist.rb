require_relative 'song.rb'
require 'pry'

class Artist
    attr_accessor :name
    @@all=[]
    def self.all
        @@all
    end
    def initialize(name)
        @name=name
        @@all << self
    end
    def add_song(song_object)
        selected_song=Song.all.find{|song| song.name==song_object.name}
        if selected_song
            # puts "The song #{selected_song.name} does exist!"
            selected_song.artist=self
            return selected_song
        else
            # puts "The song does not exist yet"
            selected_song=Song.new(song_object.name)
            # puts "The song #{selected_song.name} exists now"
            selected_song.artist = self
            selected_song
        end
    end
    def songs
        new_array=Song.all.each_with_object([]){|song, song_array| song_array << song if song.artist==self}
        new_array
    end
    def self.find_or_create_by_name(artist_name)
        @@all.find{|artist| artist.name==artist_name} || Artist.new(artist_name)
    end
    def print_songs
        self.songs.each {|song| puts song.name }
    end
end