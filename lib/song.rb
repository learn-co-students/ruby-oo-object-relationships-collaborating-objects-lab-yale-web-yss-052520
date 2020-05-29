class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        # binding.pry
        song_data_array = file.split(" - ")
        new_song = Song.new(song_data_array[1])
        new_song.artist_name=(song_data_array[0])
    end

    def artist_name=(artist_name)
        if (Artist.all_names.include?(artist_name))
            artist = Artist.find_by_name(artist_name)
            self.artist = artist
        else
            artist = Artist.create_by_name(artist_name)
            self.artist = artist
        end
    end
end


