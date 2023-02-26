class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    (@task.complete == false)? (return "- [ ] #{@task.title}") : (return "- [x] #{@task.title}")
  end
end