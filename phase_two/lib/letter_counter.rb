class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    p counter = Hash.new(1)
    p most_common = nil
    p most_common_count = 1
    @text.chars.each do |char|	  
	binding.irb
      next unless is_letter?(char)
      counter[char] = (counter[char] || 1) + 1
      if counter[char] > most_common_count
        most_common = char
        most_common_count += counter[char]
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end


