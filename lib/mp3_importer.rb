class MP3Importer

    attr_reader :path
    def initialize(path)
        @path = path
    end

    def files
        @files = Dir[path + "/*.mp3"]
        @files.map{|file_name|
            file_name.gsub(path + "/", "")
        }
    end

    def import
        files().each{|file_name|
            Song.new_by_filename(file_name)
        }
    end
end

# Sleep scheule is rough -> naps
# same with adil -> squeezed in a couple episodes yesterday
# excited for the weekend to fix that 

# Time commitment -> Lost track of time when working with CS which is fun



