require "report_length"

RSpec.describe "report_length(str)" do
   it "prints the length of the str" do
     result = report_length("hello")
     expect(result).to eq "This string was 5 characters long."
   end
end