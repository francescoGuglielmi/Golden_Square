require "diary_entry"

RSpec.describe DiaryEntry do
  context "verifying validity of parameters" do
    it "fails if the parameters are not strings" do 
      new_class = DiaryEntry.new(9, "string")
      expect{ new_class.title }.to raise_error "you need to input 2 strings!"
      new_class = DiaryEntry.new("string", 9)
      expect{ new_class.contents }.to raise_error "you need to input 2 strings!"
    end
  end

  context "testing 'title' and 'contents' methods" do
    it "returns parameters if they are strings" do 
      new_class = DiaryEntry.new("title", "contents")
      expect(new_class.title).to eq "title"
      expect(new_class.contents).to eq "contents"
    end
  end

  context "testing 'count_words' method" do
    it "return the number of words in 'contents'" do
      new_class = DiaryEntry.new("title", "a bunch of stuff")
      expect(new_class.count_words).to eq 4
    end
  end

  context "testing 'reading_time' method" do
    it "returns the amount of minutes to read a text" do
      new_class = DiaryEntry.new("title", "1 2 3 4 5 6 7 8 9 10")
      expect(new_class.reading_time(5)).to eq 2
    end
  end

  context "testing reading_chunk method" do
    it "fails if the arguments are not Integers" do
      new_class = DiaryEntry.new("title","I once walked the dog outside and realized there was so much wind that I felt like going to a cafè to drink something hot and watch a bit of tv feeling comfortable")
      expect{ new_class.reading_chunk("hello",2) }.to raise_error "You need to input 2 Integers!"
    end

    it "returns a string that contains the first 10 words of a string" do
      new_class = DiaryEntry.new("title","I once walked the dog outside and realized there was so much wind that I felt like going to a cafè to drink something hot and watch a bit of tv feeling comfortable")
      result = new_class.reading_chunk(5,2)
      expect(result).to eq "I once walked the dog outside and realized there was"
    end

    it "returns the second 10 words of @contents if called again" do
      new_class = DiaryEntry.new("title","I once walked the dog outside and realized there was so much wind that I felt like going to a cafè to drink something hot and watch a bit of tv feeling comfortable")
      new_class.reading_chunk(5,2)
      expect(new_class.reading_chunk(5,2)).to eq "so much wind that I felt like going to a"
    end

    it "returns the last chunk of words even if it's smaller than the previous ones" do
      new_class = DiaryEntry.new("title","I once walked the dog outside and realized there was so much wind that I felt like going to a cafè to drink something hot and watch a bit of tv feeling comfortable")
      new_class.reading_chunk(5,2)
      new_class.reading_chunk(5,2)
      new_class.reading_chunk(5,2)
      expect(new_class.reading_chunk(5,2)).to eq "tv feeling comfortable"
    end
  end
end