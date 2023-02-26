class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @lock = true
  end

  def read
    raise "Go away!" if @lock == true
    return @diary.read 
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end
end