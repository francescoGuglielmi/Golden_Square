class GrammarStats
  def initialize
    @results = []
  end

  def check(text)
    fail "Text must be a string!" if text.class != String
    boolean1 = true if text[-1] == "." || text[-1] == "!" || text[-1] == "?"
    if text[0] == text[0].upcase && boolean1
      @results.push("Y")
      return true
    else
      @results.push("N")
      return false
    end
  end

  def percentage_good
    return ((@results.count("Y") / @results.count.to_f) * 100).round
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end 
end