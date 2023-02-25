class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) 
    # raise "track must be an instance of Track!" unless track.class == Track
    @library.push(track)
  end

  def all
    @library
  end
  
  def search(keyword) # keyword is a string
    @library.select do |track|
      track.matches?(keyword)
    end
  end
end