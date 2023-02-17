require "count_words"

RSpec.describe "count_words" do
  it "counts the number of words in a string" do
    result = count_words("Hi There")
    expect(result).to eq 2
  end
end