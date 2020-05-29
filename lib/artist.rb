class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find {|artist| artist.name == name}

        if !artist
            return Artist.new(name)
        else return artist
        end
    end
end