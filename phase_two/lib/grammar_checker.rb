def grammar_nazi(string)
  (string[0] == string[0].upcase) ? string : (string[0] = string[0].upcase!)
  (string.split("")[-1] == ".") ? string : string + "."
end
   
str = "nvfhagfjhs hi"
print grammar_nazi(str)