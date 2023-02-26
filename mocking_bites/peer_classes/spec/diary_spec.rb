require "diary"

describe Diary do

  it "throws an error if contents is not a string" do
    expect { diary = Diary.new(9) }.to raise_error "contents needs to be a string!"
  end

  it "returns contents" do
    diary = Diary.new("Hello World")
    expect(diary.read).to eq "Hello World"
  end
end