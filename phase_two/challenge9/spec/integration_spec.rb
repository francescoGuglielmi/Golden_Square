require "todo"
require "diary_entry"
require "todo_list"
require "diary"
require "agenda"

describe Todo do
  it "fails if task is not a string" do
    expect { todo = Todo.new(9) }.to raise_error "task must be a string!"
  end

  it "returns the task" do
    todo = Todo.new("wash dishes")
    expect(todo.task).to eq "wash dishes"
  end

  it "should mark the todo as completed" do
    todo = Todo.new("wash dishes")
    expect(todo.complete_todo).to eq true
  end

  it "should mark the todo as incomplete" do
    todo = Todo.new("wash dishes")
    todo.complete_todo
    expect(todo.incomplete_todo).to eq false
  end
end

describe DiaryEntry do
  it "throws an error if entry is not a string" do
    expect { diary_entry = DiaryEntry.new(9) }.to raise_error "entry must be a string!"
  end

  it "returns the entry as a string" do
    diary_entry = DiaryEntry.new("coding is really fun!")
    expect(diary_entry.show_entry).to eq "coding is really fun!"
  end

  it "returns the amount of words in an entry" do
    entry = DiaryEntry.new("coding is really fun!")
    expect(entry.count_words).to eq 4
  end
end

describe TodoList do
  it "throws an error if the argument of the method add is not an instance of Todo" do
    todo_list = TodoList.new
    todo = Todo.new("wash dishes")
    expect { todo_list.add("cleaning") }.to raise_error "todo must be an instance of Todo!"
  end

  it "returns the incomplete todos present in the list" do
    todo_list = TodoList.new
    todo1 = Todo.new("wash dishes")
    todo2 = Todo.new("cleaning")
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect(todo_list.show_incompleted).to eq [todo1, todo2]
  end

  it "returns all the completed todos" do
    todo_list = TodoList.new
    todo1 = Todo.new("wash dishes")
    todo2 = Todo.new("cleaning")
    todo1.complete_todo
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect(todo_list.show_completed).to eq [todo1] 
  end

  it "throws an error if the argument of delete_todo is not an instance of Todo" do
    todo_list = TodoList.new
    todo1 = Todo.new("wash dishes")
    todo2 = Todo.new("cleaning")
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect { todo_list.delete_todo("hello") }.to raise_error "todo must be an instance of Todo!"
  end

  it "deletes the required todo permanently" do
    todo_list = TodoList.new
    todo1 = Todo.new("wash dishes")
    todo2 = Todo.new("cleaning")
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo_list.delete_todo(todo2)
    expect(todo_list.show_incompleted).to eq [todo1]
  end

  it "throws an error if the todo deleted didn't exist yet" do
    todo_list = TodoList.new
    todo1 = Todo.new("wash dishes")
    todo2 = Todo.new("cleaning")
    todo3 = Todo.new("tidy up")
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect { todo_list.delete_todo(todo3) }.to raise_error "that todo does not exist!"
  end
end

describe Diary do
  it "throws an error if the entry is not an instance of DiaryEntry" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is readlly fun!")
    expect { diary.add("this is not a DiaryEntry") }.to raise_error "entry must be an instance of DiaryEntry!"
  end

  it "returns an empty array if there are no entries stored" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is really fun!")
    expect(diary.read).to eq []
  end

  it "returns the entries stored in the entries list" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is readlly fun!")
    diary.add(entry)
    expect(diary.read).to eq [entry]
  end

  it "throws an error if the entry is not an instance of DiaryEntry" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is readlly fun!")
    diary.add(entry)
    expect { diary.delete_entry("this is not a DiaryEntry") }.to raise_error "entry must be an instance of DiaryEntry!"
  end

  it "throws an error if the entry doesn't exist yet" do
    diary = Diary.new
    entry1 = DiaryEntry.new("coding is really fun!")
    entry2 = DiaryEntry.new("I drink coffee every day")
    diary.add(entry1)
    expect { diary.delete_entry(entry2) }.to raise_error "entry doesn't exist yet!"
  end

  it "deletes the entry from the list" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is really fun!")
    diary.add(entry)
    diary.delete_entry(entry)
    expect(diary.read).to eq []
  end

  it "throws an error if words is not an Integer" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is really fun!")
    diary.add(entry)
    expect { diary.my_reading_time("hello") }.to raise_error "words has to be an Integer!"
  end

  it "returns a message and sets the amount of words user can read per minute" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is really fun!")
    diary.add(entry)
    expect(diary.my_reading_time(9)).to eq "words per minute set as: 9"
  end

  it "throws an error if minutes is not an Integer" do
    diary = Diary.new
    entry = DiaryEntry.new("coding is really fun!")
    diary.add(entry)
    diary.my_reading_time(9)
    expect { diary.best_entries_for_reading_time("hello there!") }.to raise_error "minutes has to be an Integer!"
  end

  it "throws an error if @wpm has't been set yet" do
    diary = Diary.new
    entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond")
    entry2 = DiaryEntry.new("today it was a nice day overall")
    diary.add(entry1)
    diary.add(entry2)
    expect { diary.best_entries_for_reading_time(2) }.to raise_error "you need to set my_reading_time first!"
  end

  it "returns the entries that the user can read in the given amount of minutes available" do
    diary = Diary.new
    entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond")
    entry2 = DiaryEntry.new("today it was a nice day overall")
    diary.add(entry1)
    diary.add(entry2)
    diary.my_reading_time(5)
    expect(diary.best_entries_for_reading_time(2)).to eq [entry2]
  end

  it "returns a list of phone numbers if present in the diary entries" do
    diary = Diary.new
    entry1 = DiaryEntry.new("coding is really fun and I will do it for life and beyond. Carla: 3345675897")
    entry2 = DiaryEntry.new("today it was a nice day0584777121 overall")
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.detect_phone_numbers).to eq ["3345675897", "0584777121"]
  end
end

describe Agenda do

  it "creates a new Diary instance that overrides the one stored" do
    agenda = Agenda.new
    result = agenda.new_diary
    expect(agenda.show_diary).to eq result
  end

  it "creates a new TodoList instance that overrides the one stored" do
    agenda = Agenda.new
    result = agenda.new_tasks
    expect(agenda.show_tasks).to eq result
  end

  it "saves a diary into the agenda" do
    agenda = Agenda.new
    diary1 = Diary.new
    agenda.save_diary(diary1)
    expect(agenda.show_diary).to eq diary1
  end

  it "saves a todo_list into the agenda" do
    agenda = Agenda.new
    todos1 = TodoList.new
    agenda.save_tasks(todos1)
    expect(agenda.show_tasks).to eq todos1
  end

end