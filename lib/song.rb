class Song 
    def initialize(name)
        @name = name  
        @@all << self 
    end 
    @@all = [] 
    attr_accessor :name 
    attr_accessor :artist 
    def self.all
        @@all 
    end 

    def artist_name=(art_name)
        art_obj = Artist.find_or_create_by_name(art_name) 
        art_obj.add_song(self) 
    end 

    def self.new_by_filename(filename)
        song_name = filename.split("-")[1].strip 
        song_artist = filename.split("-")[0].strip 
        new_song_obj = Song.new(song_name)
        artist = Artist.find_or_create_by_name(song_artist) 
        artist.add_song(new_song_obj) 
        return new_song_obj 
    end 
end 