class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        # binding.pry
        Dir.entries(self.path).delete_if {|w| w.length < 3}
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end