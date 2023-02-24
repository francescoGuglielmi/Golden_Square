class TodoList
  def initialize
    @list = [] 
  end

  def add(todo) # todo is an instance of the class Todo
    raise "todo must be an instance of Todo!" unless todo.class == Todo
    @list << todo
  end

  def show_incompleted
    incompleted_list = []
    @list.each do |todo|
      if todo.show_completion == false
        incompleted_list << todo
      end
    end
    return incompleted_list
  end

  def show_completed
    completed_list = []
    @list.each do |todo|
      if todo.show_completion == true
        completed_list << todo
      end
    end
    return completed_list
  end

  def delete_todo(todo) 
    raise "todo must be an instance of Todo!" unless todo.class == Todo
    raise "that todo does not exist!" if !@list.include?(todo)
    @list.delete(todo)
    return @list
  end

end