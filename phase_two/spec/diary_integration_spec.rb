require "diary"
require "diary_entry"

describe "integration" do
  context "when we call the add method" do
    it "adds a diary entry to a list" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [entry1,entry2]
    end
  end 

  describe "count_words behaviour" do
    it "counts the amount of words in all diary entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      diary.add(entry1)
      diary.add(entry2)  
      expect(diary.count_words).to eq 19
    end
  end

  describe "reading_time behaviour" do
    it "returns the time to read all the entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(4)).to eq 5
    end

    it "returns 0 when wpm is 0" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      diary.add(entry1)
      diary.add(entry2)
      expect { diary.reading_time(0) }.to raise_error "wpm has to be positive"
    end
  end

  describe "find_best_entry_for_reading_time behaviour" do
    it "fails if wpm is not positive" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      diary.add(entry1)
      diary.add(entry2)
      expect { diary.find_best_entry_for_reading_time(0,5) }.to raise_error "wpm has to be positive"
    end

    it "returns the longest diary entry that has less words than the user can read in the given time" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
      entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
      entry3 = DiaryEntry.new("title3","one two three four five")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.find_best_entry_for_reading_time(3,3)).to eq entry1
    end
  end
end