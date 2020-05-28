class MP3Importer
    
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        Dir[self.path + "/*.mp3"].map{|path| path.gsub(/.*\//, "")}
    end

    def import
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end

