class Song

    attr_accessor :name , :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all()
        @@all
    end

    def self.new_by_filename(filename)
        new_file = filename.split("-")
        new_song = self.new(new_file[1][1..-2])
        new_song.artist_name = new_file[0][0..-2]
        new_song
    end

    def artist_name= (artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end


end
