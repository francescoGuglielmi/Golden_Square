require "grammar_checker"

RSpec.describe "grammar_nazi method" do
  it "capitalizes string and adds a full stop at the end if not present" do
    result = grammar_nazi("me writing something")
    expect(result).to eq "Me writing something."
  end
end