require 'pry'

class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end 

    #Dir.entries with the path name gets all files as 
    # strings in an array and we only want those that 
    # include the substring "mp3"
    def files
        Dir.entries(self.path).select {|file| file.include? "mp3"}
    end 

    # Goes through each of the music files and invokes 
    # new_by_filename to in Song class to do the parsing 
    # and instance initialization. 
    def import 
        arr_files = self.files
        arr_files.each do |file|
            Song.new_by_filename(file)
        end
    end 
end 