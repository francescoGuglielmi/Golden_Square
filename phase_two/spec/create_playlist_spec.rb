require "create_playlist"

describe CreatePlaylist do
  context "initialize method" do
    it "fails if the name is not a string" do
      expect{ class_instance = CreatePlaylist.new(9)}.to raise_error "Name needs to be a string!"
    end
  end

  context "add method" do
    it "fails if track is not a string" do
      class_instance = CreatePlaylist.new("Francesco")
      expect { class_instance.add(9) }.to raise_error "Track needs to be a string!"
    end
    
    it "throws an error if the track already exists" do
      class_instance = CreatePlaylist.new("Francesco")
      class_instance.add("The Wall")
      expect { class_instance.add("The Wall") }.to raise_error "Track already exists!"
    end

    it "stores track into the array list if track is a string" do
      class_instance = CreatePlaylist.new("Francesco")
      expect(class_instance.add("The Wall")).to eq ["The Wall"]
    end
  end

  context "playlist method" do
    it "returns 'you have no tracks in your playlist' if array list is made only of empty strings" do
      class_instance = CreatePlaylist.new("Francesco")
      class_instance.add("")
      expect(class_instance.playlist).to eq 'You have no tracks in your playlist'
    end

    it "returns 'you have no tracks in your playlist' if array list is made only of blank spaces" do
      class_instance = CreatePlaylist.new("Francesco")
      class_instance.add(" ")
      class_instance.add("   ")
      expect(class_instance.playlist).to eq 'You have no tracks in your playlist'
    end

    it "returns the list of tracks separated by a comma as a string" do
      class_instance = CreatePlaylist.new("Francesco")
      class_instance.add("The Wall")
      class_instance.add("Time")
      expect(class_instance.playlist).to eq "The Wall, Time"
    end

    it "returns the list of tracks separated by a comma as a string" do
      class_instance = CreatePlaylist.new("Francesco")
      class_instance.add("The Wall")
      expect(class_instance.playlist).to eq "The Wall"
    end
  end
end