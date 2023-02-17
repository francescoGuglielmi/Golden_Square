# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# EXAMPLE

check_todos(string) is a method that checks if a string contains the string "TODO"

string: a string containing 1 or more words
chech_todos: returns is a boolean

The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

#check_todos("random_string")
#=> false

#check_todos("TOsomethingDO")
#=> false

#check_todos("Lorem ipsumTODO and other stuff")
#=> true

#check_todos("")
#=> false

#check_todos("TODOTODOTODO")
#=> true

check_todos("TOTO DODO")
=> false
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
