class MP3Importer

  attr_accessor :path, :array

  def initialize(path)
    @path = path
  end

  def files
    @array = Dir["#{@path}/*.mp3"]
    #array.each{|string| string.chomp!('.mp3')}
    @array.each{|string| string.gsub!("#{@path}/", "")}
    @array

    #binding.pry
  end

  def import
    files.each{|song| Song.new_by_filename(song)}
  end

end