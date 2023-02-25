require "music_library"

describe MusicLibrary do
  #it "throws an error if track is not an instance of Track" do
    #music_library = MusicLibrary.new
    #expect { music_library.add("BYOB") }.to raise_error "track must be an instance of Track!"
  #end

  it "returns a list of tracks stored in @library" do
    music_library = MusicLibrary.new
    track = double :fake_track 
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "searches for tracks" do
    music_library = MusicLibrary.new
    track1 = double :fake_track, matches?: true
    track2 = double :fake_track, matches?: false
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("Bon")).to eq [track1]
  end 
end