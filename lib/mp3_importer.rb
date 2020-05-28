
class MP3Importer

    attr_accessor :path
    attr_reader :files
    def initialize(music_path)
        @path = music_path
        self.files
    end

    def files
        @files = Dir[@path + "/*.mp3"]
        @files.map do |file|
            file.split("/")[-1]
        end
    end

    def import

        @files.each do |file|

            Song.new_by_filename(file)
        end
    end


end