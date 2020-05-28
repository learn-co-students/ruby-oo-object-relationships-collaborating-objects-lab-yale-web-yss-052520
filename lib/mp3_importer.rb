class MP3Importer
    attr_accessor :path
    attr_reader :files
    def initialize(path)
        self.path=path
    end
    def files
        entries= Dir.entries(self.path)
        entries.shift(2)
        entries
    end
    def import
        files.each do |song|
            Song.new_by_filename(song)
            # song_array=song.split(/[-.]/).map{|e| e.strip}
            # artist=Artist.new(song_array[0])
            # song=Song.new(song_array[1])
            # song.artist=artist
        end
    end
end