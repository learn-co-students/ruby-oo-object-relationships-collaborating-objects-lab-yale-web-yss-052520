require "pry"
class MP3Importer
    attr_accessor :file

    def initialize(file)
        @file = file
    end

    def files
        Dir.chdir path
        files_array = Dir.glob("*.mp3")
        Dir.chdir "/home/enrique/code/labs/ruby-oo/ruby-oo-object-relationships-collaborating-objects-lab-yale-web-yss-052520"
        return files_array
    end

    def path
        @file
    end

    def import
        # binding.pry
        files.each do |song_filename|
            Song.new_by_filename(song_filename)
        end
    end
end

# Dir["/path/to/search/*"]

# "./spec/fixtures/mp3s"
