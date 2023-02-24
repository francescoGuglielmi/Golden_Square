require "todo_list2"
require "todo1"

RSpec.describe TodoList2 do
  it "throws an error if the add method's argument is not an instance of Todo" do
    todo_list = TodoList2.new
    expect{ todo_list.add("hi") }.to raise_error "argument needs to be a Todo instance"
  end

  it "returns all the incomplete todos" do
    todo_list = TodoList2.new
    todo1 = Todo.new("pairing with Josh")
    todo2 = Todo.new("pair with Francesco")
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect(todo_list.incomplete).to eq [todo1, todo2]
  end

  it "returns all completed todos" do
    todo_list = TodoList2.new
    todo1 = Todo.new("pairing with Josh")
    todo2 = Todo.new("pair with Francesco")
    todo1.mark_done!
    todo2.mark_done!
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect(todo_list.complete).to eq [todo1, todo2]
  end  

  it "marks all the todos as complete" do
    todo_list = TodoList2.new
    todo1 = Todo.new("pairing with Josh")
    todo2 = Todo.new("pair with Francesco")
    todo3 = Todo.new("tea bags and guitars")
    todo2.mark_done!
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo_list.add(todo3)
    todo_list.give_up!
    expect(todo_list.incomplete).to eq []
  end
end