class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed = filename.split(" - ")
        song = self.new(parsed[1])
        song.artist_name = parsed[0]
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        # Artist.find_or_create_by_name(artist_name).add_song(self)
    end
end
