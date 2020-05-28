class MP3Importer

    attr_reader :path, :files

    def initialize(path)
        @path = path
        @files = Dir.entries(path).select{
            |file_name| file_name.include?(".mp3") 
        }
    end

    def import()
        self.files.map {|mp3_string| Song.new_by_filename(mp3_string)}
    end 

end