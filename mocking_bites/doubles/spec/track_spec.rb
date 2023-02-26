require "track"

describe Track do 
  it "throws an error if title is not a string" do
    expect { track = Track.new(9, "Bon Jovi") }.to raise_error "title must be a string!"
  end

  it "throws an error if artist is not a string" do
    expect { track = Track.new("It's My Life", 9786) }.to raise_error "artist must be a string!"
  end

  it "throws an error if keyword is not a string" do
    track = Track.new("It's My Life", "Bon Jovi")
    expect { track.matches?(237) }.to raise_error "keyword must be a string!"
  end


  it "returns true if the keyword matches either the title or artist" do
    track = Track.new("It's My Life", "Bon Jovi")
    expect(track.matches?("Bon")).to eq true
  end

  it "returns false if the keyword doesn't match either the title or artist" do
    track = Track.new("It's My Life", "Bon Jovi")
    expect(track.matches?("Van")).to eq false
  end
end