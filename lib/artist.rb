class Artist 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_accessor :name 
    @@all = [] 

    def self.all 
        @@all 
    end 

    def songs
        Song.all.select {|one_song| one_song.artist == self} 
    end 

    def add_song(song_obj)
        song_obj.artist = self 
    end 
    
    def self.find_or_create_by_name(art_name)
        art_target = @@all.find { |artist_obj| artist_obj.name == art_name}
        if  art_target 
            return art_target 
        else art_new = Artist.new(art_name)
        end 
    end 
    
    def print_songs 
        song_array = self.songs.map {|song_obj| song_obj.name} 
        puts song_array 
    end 
end 