class MP3Importer
    def initialize(filepath)
        @path = filepath 
    end 
    attr_reader :path 

    def files 
        file_list = [] 
        Dir.each_child(@path).each do |filename| 
            file_list << filename 
        end
        return file_list 
    end 

    def import 
        song_array = []
        self.files.each do |one_song| 
            song_array << Song.new_by_filename(one_song)
        end 
        return song_array 
    end 
end 