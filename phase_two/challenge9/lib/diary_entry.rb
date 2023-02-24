class DiaryEntry
  def initialize(entry) #entry is a string 
    raise "entry must be a string!" unless entry.class == String
    @entry = entry # that gets stored into an instance variable
  end

  def show_entry
    return @entry # I want to be able to see the entry I just wrote
  end

  def count_words
    return @entry.split.length # I want to know how many words there are in an entry
  end
end