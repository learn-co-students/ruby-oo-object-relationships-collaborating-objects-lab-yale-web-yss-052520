# require "pry"
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.all_names
        self.all.collect do |artist|
            artist.name
        end
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(artist_name)
        self.all.find do |artist|
            artist.name == artist_name
        end
    end

    def self.create_by_name(artist_name)
        new_artist = Artist.new(artist_name)
    end


    def self.find_or_create_by_name(artist_name)
        self.find_by_name(artist_name) || self.create_by_name(artist_name)
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end


