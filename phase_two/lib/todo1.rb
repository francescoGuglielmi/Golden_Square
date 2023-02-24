class Todo
  def initialize(task) 
    raise "not a string" unless task.is_a?(String)
    @task = task
    @is_done = false
  end

  def task
    return @task
  end

  def mark_done!
    raise "task is an empty string" if @task == ""
    raise "todo does not contain characters" if @task.delete(" ") == ""
    @is_done = true
  end

  def done?
    return @is_done
  end
end