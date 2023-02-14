require "counter"

RSpec.describe Counter do 
    it "counts to a given number" do
       object1 = Counter.new
       object1.add(5)
       result = object1.report
       expect(result).to eq "Counted to 5 so far."
    end
end