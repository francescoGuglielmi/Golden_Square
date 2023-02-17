require "make_snippet"

RSpec.describe "make_snippet" do
  it "returns the first 5 words of a string" do
    result = make_snippet("1 2 3 4 5 6")
    expect(result).to eq "1 2 3 4 5..."
  end
end