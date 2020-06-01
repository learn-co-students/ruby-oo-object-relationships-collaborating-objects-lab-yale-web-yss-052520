require 'pry'

class MP3Importer
    
    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end 

    def files
        Dir.entries(self.path).drop(2)
    end

    def import 
        self.files.map do |file|
            Song.new_by_filename(file)
        end

    end
    

end

# binding.pry
# 0