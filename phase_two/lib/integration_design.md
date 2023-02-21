# Structure

```ruby
class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
```

# Examples 

```ruby
# Example 1: returns a list of lists containing the title and the body

diary = Diary.new
entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
diary.add(entry1)
diary.add(entry2)
diary.all 
# => [["title1", "some quite long text that goes in here."], ["title2", "some other long text that goes in a new DiaryEntry instance"]]
 
 # Example 2: returns the number of words in all diary entries
diary = Diary.new
entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
diary.add(entry1)
diary.add(entry2)
diary.count_words
# => 21

# Example 3: returns the amount of time in minutes to read all the DiaryEntry instances.
diary = Diary.new
entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
diary.add(entry1)
diary.add(entry2)
diary.reading_time(5)
# => ~ 4

# Example 4: returns the closes entry to the speed and the time available to read.
diary = Diary.new
entry1 = DiaryEntry.new("title1","some quite long text that goes in here.")
entry2 = DiaryEntry.new("title2","some other long text that goes in a new DiaryEntry instance")
diary.add(entry1)
diary.add(entry2)
diary.find_best_entry_for_reading_time(5,2)
# => entry1

```