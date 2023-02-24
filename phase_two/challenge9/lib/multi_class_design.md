# User Story / Description of the problem

1) As a user
   So that I can record my experiences
   I want to keep a regular diary

2) As a user
   So that I can reflect on my experiences
   I want to read my past diary entries

3) As a user
   So that I can reflect on my experiences in my busy day
   I want to select diary entries to read based on how much time I have and my reading speed

4) As a user
   So that I can keep track of my tasks
   I want to keep a todo list along with my diary

5) As a user
   So that I can keep track of my contacts
   I want to see a list of all of the mobile phone numbers in all my diary entries


# Class signature / structure 1

```ruby

class DiaryEntry
  def initialize(entry) #entry is a string 
    @entry = entry # that gets stored into an instance variable
  end

  def show_entry
    return @entry # I want to be able to see the entry I just wrote
  end

  def count_words
    return @entry.split.length # I want to know how many words there are in an entry
  end
end


class Diary
  def initialize
    # I need to make sure that I can store the entries in a list here
    # I also need to store @wpm for future references, this can be changed at any time
    # I need to create a hash where I can store all the phone numbers detected
  end

  def add(entry) # entry is an instance of the class DiaryEntry
    # it should show a message if the entry is not an instance of DiaryEntry
    # it should push the entry inside the list of stored entries
  end

  def read
    # I have to be able to return the entries stored in the entries list
    # it should return an empty array if there are no entries stored
  end

  def delete_entry(entry) # entry is an instance of the class DiaryEntry
    # it should delete the entry from the list
    # it should return a message if the entry doesn't exist yet
  end

  def my_reading_time(words) # words must be an Integer
     # stores the amount of words readable in a certain amount of time in a variable and returns a message
  end

  def best_entries_for_reading_time(minutes) # minutes has to be an Integer representing the time available to read entries
    # it has to return the entries that are shorter than the amount of words the user can read in the given amount of minutes available
  end

  def detect_phone_numbers
    # it should identify whether there is a phone number in an entry and store it in a hash
  end

  def diary
    # it returns the current instance of Diary
  end
end


class Todo
  def initialize(task) # task must be a string
    @task = task # I have to be able to store the task inputted
    # I need to initalize a variable that determines if the todo is completed or not
  end

  def task
    # returns the task
  end

  def complete_todo
    # it should mark the todo as completed
  end

  def incomplete_todo
    # it should mark the complete todo as incomplete
  end
end


class TodoList
  def initialize
    @list = [] # I will most likely need to store the todos inside an array here
  end

  def add(todo) # todo is an instance of the class Todo
    # it should push the todo inside the list of todos in the initialize method
  end

  def show
    # it should return the incomplete todos present in the list
  end

  def show_completed
    # it should return all the completed todos
  end

  def delete(todo) # todo is an instance of the class Todo
    # it should delete the required todo permanently
  end

  def todo_list
    # it returns the current instance of TodoList
  end
end


class Agenda
  def initialize
    # I need to have a variable stored for the diary and one for the todo list
  end

  def load_diary
    # it should display a message if there are no existing diaries
    # it should pick the existing diary stored 
  end

  def load_tasks
    # it should display a message if there are no existing todo lists
    # it should pick the todo list stored 
  end
  
  def new_diary
    # it creates a new Diary instance that overrides the one stored
  end

  def new_tasks
    # it creates a new TodoList instance that overrides the one stored
  end
end

```


# Examples

# Examples for Todo class

```ruby

# Example 1: Task must be a string
todo = Todo.new(9)
# => raise_error "task must be a string!"

# Example 2: it should return the task 
todo = Todo.new("wash dishes")
todo.task
# => returns the todo

# Example 3: it should mark the todo as completed
todo = Todo.new("wash dishes")
todo.complete_todo
# => eq true

# Example 4: it should mark the todo as incomplete
todo = Todo.new("wash dishes")
todo.complete_todo
todo.incomplete_todo
# => eq false

```

# Examples for DiaryEntry class

```ruby

# Example 1: it throws an error if entry is not a string 
entry = DiaryEntry.new(9)
# => raise_error "entry must be a string!"

# Example 2: it returns the entry as a string
entry = DiaryEntry.new("coding is really fun!")
entry.show_entry
# => eq "coding is really fun!"

# Example 3: it returns the amount of words in an entry
entry = DiaryEntry.new("coding is really fun!")
entry.count_words
# => 4

```

# Examples for TodoList class

```ruby

# Example 1: it throws an error if the argument of the method add is not an instance of Todo
todo_list = TodoList.new
todo = Todo.new("wash dishes")
todo_list.add("cleaning")
# => raise_error "todo must be an instance of Todo!"

# Example 2: it should return the incomplete todos present in the list
todo_list = TodoList.new
todo1 = Todo.new("wash dishes")
todo2 = Todo.new("cleaning")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.show_incompleted
# => eq [todo1, todo2]

# Example 3: it should return all the completed todos
todo_list = TodoList.new
todo1 = Todo.new("wash dishes")
todo2 = Todo.new("cleaning")
todo1.complete_todo
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.show_completed
# => eq [todo2]

# Example 4: it throws an error if the argument of delete_todo is not an instance of Todo
todo_list = TodoList.new
todo1 = Todo.new("wash dishes")
todo2 = Todo.new("cleaning")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.delete_todo("hello")
# => raise_error "todo must be an instance of Todo!"

# Example 5: it should delete the required todo permanently
todo_list = TodoList.new
todo1 = Todo.new("wash dishes")
todo2 = Todo.new("cleaning")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.delete_todo(todo2)
todo_list.show_incompleted
# => eq [todo1]

# Example 6: it throws an error if the todo deleted didn't exist
todo_list = TodoList.new
todo1 = Todo.new("wash dishes")
todo2 = Todo.new("cleaning")
todo3 = Todo.new("tidy up")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.delete_todo(todo3)
# => raise_error "that todo does not exist!"

```

# Examples for Diary class

```ruby

# Example 1: it throws an error if the entry is not an instance of DiaryEntry
diary = Diary.new
entry = DiaryEntry.new("coding is readlly fun!")
diary.add("this is not a DiaryEntry")
# => raise_error "entry must be an instance of DiaryEntry!"

# Example 2: it returns an empty array if there are no entries stored
diary = Diary.new
entry = DiaryEntry.new("coding is really fun!")
diary.read
# => eq []

# Example 3: it returns the entries stored in the entries list
diary = Diary.new
entry = DiaryEntry.new("coding is readlly fun!")
diary.add(entry)
diary.read
# => eq [entry]

# Example 4: it throws an error if the entry is not an instance of DiaryEntry
diary = Diary.new
entry = DiaryEntry.new("coding is readlly fun!")
diary.add(entry)
diary.delete_entry("this is not a DiaryEntry")
# => raise_error "entry must be an instance of DiaryEntry"

# Example 5: it throws an error if the entry doesn't exist yet
diary = Diary.new
entry1 = DiaryEntry.new("coding is really fun!")
entry2 = DiaryEntry.new("I drink coffee every day")
diary.add(entry1)
diary.delete_entry(entry2)
# => raise_error "entry doesn't exist yet!"

# Example 6: it deletes the entry from the list
diary = Diary.new
entry = DiaryEntry.new("coding is really fun!")
diary.add(entry)
diary.delete_entry(entry)
diary.read
# => eq []

# Example 7: it throws an error if words is not an Integer
diary = Diary.new
entry = DiaryEntry.new("coding is really fun!")
diary.add(entry)
diary.my_reading_time("hello")
# => raise_error "words has to be an Integer!"

# Example 8: it returns a message and sets the amount of words user can read per minute
diary = Diary.new
entry = DiaryEntry.new("coding is really fun!")
diary.add(entry)
diary.my_reading_time(9)
# => eq "words per minute set as: #{words}"

# Example 9: it throws an error if minutes is not an Integer
diary = Diary.new
entry = DiaryEntry.new("coding is really fun!")
diary.add(entry)
diary.my_reading_time(9)
diary.best_entries_for_reading_time("hello there!")
# => raise_error "minutes has to be an Integer!"

# Example 9.1: it throws an error if @wpm has't been set yet
diary = Diary.new
entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond")
entry2 = DiaryEntry.new("today it was a nice day overall")
diary.add(entry1)
diary.add(entry2)
diary.best_entries_for_reading_time(2)
# => raise_error "you need to set my_reading_time first!"

# Example 10: it returns the entries that are shorter than the amount of words the user can read in the given amount of minutes available
diary = Diary.new
entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond")
entry2 = DiaryEntry.new("today it was a nice day overall")
diary.add(entry1)
diary.add(entry2)
diary.my_reading_time(5)
diary.best_entries_for_reading_time(2)
# => eq [entry2]

# Example 11: it returns a list of phone numbers if present in the diary entries
diary = Diary.new
entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond. Carla: 334567589")
entry2 = DiaryEntry.new("today it was a nice day0584777121 overall")
diary.add(entry1)
diary.add(entry2)
diary.detect_phone_numbers
# => eq [334567589, 0584777121]

```

# Examples for Agenda

```ruby 

# Example 1: it creates a new Diary instance that overrides the one stored 
agenda = Agenda.new
agenda.new_diary(diary1)
agenda.show_diary
# => diary1

# Example 2: it creates a new TodoList instance that overrides the one stored
agenda = Agenda.new
agenda.new_tasks(todo_list)
agenda.show_tasks
# => todo_list

# Example 3: it displays a message if there are no existing diaries
agenda = Agenda.new
agenda.show_diary
# => raise_error "there are no diary saved!"

# Example 4: it displays a message if there are no existing todo lists
agenda = Agenda.new
agenda.show_tasks
# => raise_error "there are no task folders saved!"

```
