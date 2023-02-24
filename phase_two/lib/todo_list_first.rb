class TodoList
  def initialize(name)
    raise "you need to initialize the class with a string!" if name.class != String
    @name = name
    @todo_list = []
  end

  def todo(task)
    raise "you need to input a string!" if task.class != String
    @todo_list.push(task)
  end

  def list
    return "#{@name}, you have nothing to do at the moment!" if @todo_list.count == 0
    return "#{@name}, you have nothing to do at the moment!" if @todo_list.join == ""
    return "#{@name}, you have nothing to do at the moment!" if @todo_list.join.gsub(/\s+/, "") == ""
    return "#{@name}, you should: #{@todo_list.join(", ")}"
  end

  def complete(task)
    raise "you need to input a string!" if task.class != String
    raise "this task doesn't exist!" if !@todo_list.include?(task)
    @todo_list.delete(task)
    return @todo_list
  end
end