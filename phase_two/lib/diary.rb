class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    @entries.sum(&:count_words)
  end

  def reading_time(wpm) 
    @entries.sum do |entry|
      entry.reading_time(wpm)
    end
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    raise "wpm has to be positive" unless wpm.positive?
    @entries.each do |entry|
      chunk_length = entry.reading_chunk(wpm,minutes).split.length
      if entry.count_words <= chunk_length
        best_entries = [] << entry
      end
      if entry.count_words == best_entries.map(&:count_words).max
        return entry
      end
    end
  end
end