require "todo1"

RSpec.describe Todo do
  it 'task entry is not a string' do
    expect{ todo = Todo.new(99) }.to raise_error "not a string"
  end

  it 'task entry is a string' do
    todo = Todo.new("pair with Francesco")
    result = todo.task
    expect(result).to eq "pair with Francesco"
  end

  it 'mark_done method throws an error if task added is an empty string' do
    todo = Todo.new("")
    expect{ todo.mark_done! }.to raise_error "task is an empty string"
  end


  it 'mark_done method throws an error if task added is only spaces' do
    todo = Todo.new("   ")
    expect{ todo.mark_done! }.to raise_error "todo does not contain characters"
  end

  it 'done? method return false if not marked as done' do
    todo = Todo.new("pair with Francesco")
    result = todo.done?
    expect(result).to eq false
  end

  it 'done? method returns true if masked as done' do
    todo = Todo.new("pair with Francesco")
    todo.mark_done!
    result = todo.done?
    expect(result).to eq true
  end

end