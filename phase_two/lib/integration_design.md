# Structure

```ruby
class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end

# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    # @completed = []
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing          
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
```

# Examples 

```ruby
# Todo examples

# Example 1: it thorws an error if the argument is not a string
todo = Todo.new(9)
# => it thorws an error

# Example 2: it returns the task as a string
todo = Todo.new("washing up")
todo.task
# => returns "washing up"

# Example 3: it marks the task as complete
todo = Todo.new("washing up")
todo.task
todo.mark_done!
# => it completes the todo

# Example 4: it returns true if the task is done
todo = Todo.new("washing up")
todo.task
todo.mark_done!
todo.done?
# => true

# Example 5: it returns false if the task is not complete
todo = Todo.new("washing up")
todo.task
todo.done?
# => false

# Todo_list examples

# Example 1: if the argument of add is an instance of Todo
todo_list = TodoList.new
todo = Todo.new("hello")
todo_list.add(todo)

# Example 2: if the argument of add is the wrong class
todo_list = TodoList.new
random_class = Array.new
todo_list.add(random_class)
# => throws an error

# Example 3: incomplete method returns nothing if no tasks are added
todo_list = TodoList.new
todo = Todo.new("hello")
# => nil

#Example 4: incomplete returns the whole list of todos if none of them is completed
todo_list = TodoList.new
todo1 = Todo.new("hello")
todo2 = Todo.new("Hi mom")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.incomplete
# => [todo1, todo2]

# Example 5: returns all the complete todos
todo_list = TodoList.new
todo1 = Todo.new("hello")
todo2 = Todo.new("Hi mom")
todo_list.add(todo1)
todo_list.add(todo2)
todo_list.complete
# 

```