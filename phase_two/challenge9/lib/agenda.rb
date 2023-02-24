class Agenda
  def initialize
    @diary = nil
    @todo_list = nil
  end

  def new_diary
    @diary = Diary.new
  end

  def new_tasks
    @todo_list = TodoList.new
  end

  def show_diary
    @diary
  end

  def show_tasks
    @todo_list
  end  

  def save_diary(diary)
    @diary = diary
  end

  def save_tasks(tasks)
    @todo_list = tasks
  end
end