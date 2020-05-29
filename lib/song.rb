class Song

    attr_accessor :artist, :name
    # attr_reader :name
    @@all = []

    def initialize(name) #, artist)
        @name = name
        # @artist = artist
        @@all << self
    end
    
    def self.new_by_filename(filename)
        file_name = filename.split(" - ")
        
        song = Song.new(file_name[1])
        song.artist = Artist.find_or_create_by_name(file_name[0])
        # binding.pry
        song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end
end