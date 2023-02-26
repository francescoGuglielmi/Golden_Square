require "music_library"
require "track"

describe "integration" do
  it "adds tracks and returns a list of them" do
    music_library = MusicLibrary.new
    track = Track.new("It's My Life", "Bon Jovi")
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

   it "searches for tracks" do
    music_library = MusicLibrary.new
    track1 = Track.new("It's My Life", "Bon Jovi")
    track2 = Track.new("Painkiller", "Judas Priest")
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("Bon")).to eq [track1]
  end
end