class CreatePlaylist
  def initialize(name)
    raise "Name needs to be a string!" if name.class != String
    @name = name
    @list = []
  end 

  def add(track)
    raise "Track needs to be a string!" if track.class != String
    raise "Track already exists!" if @list.include?(track)
    return @list.push(track)
  end

  def playlist
    return 'You have no tracks in your playlist' if @list.join == ""
    return 'You have no tracks in your playlist' if @list.join.gsub(/\s+/,"") == ""
    return @list.join(", ")
  end
end