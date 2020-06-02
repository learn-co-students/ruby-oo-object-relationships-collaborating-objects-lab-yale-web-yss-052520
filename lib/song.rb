class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsedsong = filename.split(" - ")
        song_name = parsedsong[1]
        artistname = parsedsong[0]
        new_song = self.new(song_name)
        new_song.artist_name = artistname
        new_song
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end