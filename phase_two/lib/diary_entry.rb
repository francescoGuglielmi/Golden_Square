class DiaryEntry
  def initialize(title,contents)
    @title = title
    @contents = contents
    @position = 0
  end

  def title
    fail "you need to input 2 strings!" unless @title.is_a?(String)
    return @title
  end

  def contents
    fail "you need to input 2 strings!" unless @contents.is_a?(String)
    return @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm) 
    raise "wpm has to be positive" unless wpm.positive?
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm,minutes)
    fail "You need to input 2 Integers!" unless wpm.is_a?(Integer) && minutes.is_a?(Integer)
    words = wpm * minutes
    chunk = @contents.split.slice(@position,words)
    @position += words
    if @position >= @contents.split.length
      @position = 0
    end
    return chunk.join(" ")
  end
end

