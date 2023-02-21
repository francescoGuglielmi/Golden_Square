require "diary" 

describe Diary do
  context "initially" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end  
  end
end