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

    def self.new_by_filename(file)
        edit_artist, edit_song = file.split(" - ")
        final_song = self.new(edit_song)
        final_song.artist_name = edit_artist 
        return final_song
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)         
    end 

end 