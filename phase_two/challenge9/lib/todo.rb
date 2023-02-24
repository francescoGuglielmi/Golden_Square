class Todo
  def initialize(task) # task must be a string
    raise "task must be a string!" unless task.class == String
    @task = task 
    @completed = false
  end

  def task
    @task
  end

  def complete_todo
    @completed = true
    return @completed
  end

  def incomplete_todo
    @completed = false
    return @completed
  end

  def show_completion
    @completed
  end
end