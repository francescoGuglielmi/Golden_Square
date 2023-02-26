class Track
  def initialize(title, artist) # title and artist are both strings
    raise "title must be a string!" unless title.class == String
    raise "artist must be a string!" unless artist.class == String
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    raise "keyword must be a string!" unless keyword.class == String
    return true if @title.include?(keyword) || @artist.include?(keyword)
    return false 
  end
end