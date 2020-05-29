
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        data = file.split("-")
        new_song = Song.new(data[1].strip)
        new_song.artist = Artist.find_or_create_by_name(data[0].strip)
        new_song
    end
        
end