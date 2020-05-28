require 'artist.rb'

class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        # if name.class==String
        #      puts "Hoorah It's a string!!!"
        # else
        #      puts "Boo"
        # end
        @name=name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(file_name)
        name_array=file_name.split(/[-.]/).map{|e| e.strip}
        song=Song.new(name_array[1])
        song.artist=Artist.find_or_create_by_name(name_array[0])
        song
    end
    def artist_name=(artist_name)
        self.artist=Artist.find_or_create_by_name(artist_name)
    end
    # def self.create_with_name_and_artist(song_name, artist_object)
    #     song=Song.new(song_name)
    #     song.artist=artist_object
    # end
end