require "check_codeword"

RSpec.describe "check_codeword(codeword)" do
  it "checks if codeword is 'horse'" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end
  it "checks if codeword starts with 'h' and finishes with 'e'" do
    result = check_codeword("hhjsfgcefkne")
    expect(result).to eq "Close, but nope."
  end
  it "check if codeword is nor 'horse' nor starts with 'h' and finishes with 'e'" do
    result = check_codeword("random")
    expect(result).to eq "WRONG!"
  end
end