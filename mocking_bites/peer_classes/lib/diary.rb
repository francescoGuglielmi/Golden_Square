class Diary
  def initialize(contents) # contents is a string
    raise "contents needs to be a string!" unless contents.class == String
    @contents = contents
  end

  def read
    @contents
  end
end