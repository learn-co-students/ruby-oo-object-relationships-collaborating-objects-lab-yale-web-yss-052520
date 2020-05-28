require "pry"

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir["#{@path}/*.mp3"].each do |string|
        string.gsub!("#{@path}/","")
    end

    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end

end

# binding.pry
# 0
