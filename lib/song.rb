class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        save()
    end

    def save()
        self.class.all() << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end


    def self.new_by_filename(mp3_string)
        file = MP3_File.new(mp3_string)
        song = self.new(file.title)
        song.artist_name = file.artist
        song
    end

    def self.all()
        @@all
    end


    class MP3_File
        attr_reader :artist, :title, :genre
        def initialize(mp3_string)
            mp3_split = mp3_string.split(" - ")
            @artist = mp3_split[0]
            @title = mp3_split[1]
            @genre = mp3_split[2]
        end
    end


end