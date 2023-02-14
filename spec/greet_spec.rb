require "greet"

RSpec.describe "greet method" do
  it "greets the name inputted as parameter" do
    result = greet("Paul")
    expect(result).to eq "Hello, Paul"
  end
end