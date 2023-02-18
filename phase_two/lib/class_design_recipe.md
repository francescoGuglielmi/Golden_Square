# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.


## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE
class CreatePlaylist
  def initialize(name) #name has to be a string
    # name needs to get stored into an instance variable
    # we need to initialize the class with an array representing the list of tracks
  end

  def add(track) #tracks is a string as well
    # we need to store track into a list
  end

  def playlist
   # we need to return the list of tracks, separated by a comma, as a string
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
 class_instance = CreatePlaylist.new(9)
 # => it throws an error
 class_instance = CreatePlaylist.new("Francesco")
 # => the name gets stored into a variable

# 2
class_instance = CreatePlaylist.new("Francesco")
class_instance.add(9)
# => throws an error
class_instance = CreatePlaylist.new("Francesco")
class_instance.add("The Wall")
class_instance.add("The Wall")
# => returns "track already exists!"
class_instance = CreatePlaylist.new("Francesco")
class_instance.add("The Wall")
# => store the track into an array (list)

# 3
class_instance = CreatePlaylist.new("Francesco")
class_instance.add("")
# => "you have no tracks in your playlist"
class_instance = CreatePlaylist.new("Francesco")
class_instance.add(" ")
class_instance.add("   ")
# => "you have no tracks in your playlist"
class_instance = CreatePlaylist.new("Francesco")
class_instance.add("The Wall")
class_instance.add("Time")
class_instance.playlist
# => "The Wall, Time"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
