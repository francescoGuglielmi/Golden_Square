def make_snippet(string)
  if string.split(" ").length > 5
    string.split(" ")[0,5].join(" ") + "..."
  else
    string
  end
end

 
