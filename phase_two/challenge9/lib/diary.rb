class Diary
  def initialize
    @entries_list = []
    @wpm = nil
    @phone_numbers = []
  end

  def add(entry)
    raise "entry must be an instance of DiaryEntry!" unless entry.class == DiaryEntry
    @entries_list << entry
  end

  def read
    @entries_list
  end

  def wpm
    @wpm
  end

  def contacts
    @phone_numbers
  end

  def delete_entry(entry) 
    raise "entry must be an instance of DiaryEntry!" unless entry.class == DiaryEntry
    raise "entry doesn't exist yet!" if !@entries_list.include?(entry)
    @entries_list.delete(entry)
  end

  def my_reading_time(words) 
    raise "words has to be an Integer!" unless words.class == Integer
    @wpm = words
    return "words per minute set as: #{words}"
  end

  def best_entries_for_reading_time(minutes) 
    raise "minutes has to be an Integer!" unless minutes.class == Integer
    raise "you need to set my_reading_time first!" if @wpm.nil?
    best_entries = []
    amount_of_text = @wpm * minutes
    @entries_list.each do |entry|
      if entry.count_words <= amount_of_text
        best_entries << entry
      end
    end
    return best_entries
  end

  def detect_phone_numbers
    @entries_list.map do |entry|
      entry.show_entry.scan(/[0-9]{10}/)
    end.flatten.uniq
  end
  
end