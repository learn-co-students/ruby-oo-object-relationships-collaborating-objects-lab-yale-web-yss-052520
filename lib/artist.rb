class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save 
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self 
    end

    def self.find_artist(name)
        Artist.all.find {|artist| artist.name == name }
    end 

    def self.find_or_create_by_name(name)
        if self.find_artist(name) 
            self.find_artist(name)
        else 
            self.new(name)
        end
    end

    def print_songs
        self.songs.map {|song| puts "#{song.name}"}
    end



end