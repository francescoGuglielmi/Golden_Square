class TodoList2
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    raise "argument needs to be a Todo instance" unless todo.is_a?(Todo)
    @todos << todo
  end

  def incomplete
    incompleted = []
    @todos.each do |todo|
      incompleted << todo if !todo.done?
    end
    return incompleted
  end

  def complete
    completed = []
    @todos.each do |todo|
     completed << todo if todo.done?
    end
    return completed
  end

  def give_up!
    @todos.each do |todo|
      todo.mark_done! 
    end 
  end
end