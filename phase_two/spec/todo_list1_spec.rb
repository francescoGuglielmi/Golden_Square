require "todo_list1"

describe TodoList do
  context "initialize method" do
    it "fails if the initialize parameter is not a string" do
      expect { TodoList.new(9) }.to raise_error "you need to initialize the class with a string!" 
    end
  end

  context "todo method" do
    it "fails if the argument of todo is not a string" do
      class_instance = TodoList.new("Francesco")
      expect { class_instance.todo(9) }.to raise_error "you need to input a string!" 
    end

    it "returns an array containing task" do
      class_instance = TodoList.new("Francesco")
      expect(class_instance.todo("wash dishes")).to eq ["wash dishes"] 
    end
  end

  context "list method" do
    it "returns name + ', you have nothing to do at the moment!' if the array todo_list is empty" do
      class_instance = TodoList.new("Francesco")
      expect(class_instance.list).to eq "Francesco, you have nothing to do at the moment!" 
    end
  
  
    it "returns name + ', you have nothing to do at the moment!' if the array todo_list contains only empty strings" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("")
      expect(class_instance.list).to eq "Francesco, you have nothing to do at the moment!"
    end 

    it "returns name + ', you have nothing to do at the moment!' if the array todo_list contains only blank spaces" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("   ")
      class_instance.todo(" ")
      expect(class_instance.list).to eq "Francesco, you have nothing to do at the moment!"
    end

    it "returns the name + ', you should: ' + the list of contents of todo_list as a string separated by a comma" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("wash dishes")
      class_instance.todo("tidy up")
      class_instance.todo("have a shower")
      expect(class_instance.list).to eq "Francesco, you should: wash dishes, tidy up, have a shower"
    end
  end

  context "complete method" do
    it "fails if the task inputted doesn't exist" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("wash dishes")
      class_instance.todo("tidy up")
      class_instance.todo("have a shower")
      expect{ class_instance.complete(9) }.to raise_error "you need to input a string!"  
    end
    
    it "fails if the task inputted doesn't exist" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("wash dishes")
      class_instance.todo("tidy up")
      class_instance.todo("have a shower")
      expect{ class_instance.complete("walking dog") }.to raise_error "this task doesn't exist!"  
    end

    it "returns todo_list without the chosen task" do
      class_instance = TodoList.new("Francesco")
      class_instance.todo("wash dishes")
      class_instance.todo("tidy up")
      class_instance.todo("have a shower")
      expect(class_instance.complete("tidy up")).to eq ["wash dishes", "have a shower"]
    end
  end
end