require "check_todos"

RSpec.describe "check_todos method" do
  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("random_string")
    expect(result1).to eq false
  end

  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("TOsomethingDO")
    expect(result1).to eq false
  end

  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("Lorem ipsumTODO and other stuff")
    expect(result1).to eq true
  end

  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("")
    expect(result1).to eq false
  end

  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("TODOTODOTODO")
    expect(result1).to eq true
  end

  it "checks whether a string includes 'TODO'" do
    result1 = check_todos("TOTO DODO")
    expect(result1).to eq false
  end
end