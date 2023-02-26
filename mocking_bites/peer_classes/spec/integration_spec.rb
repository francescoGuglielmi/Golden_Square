require "diary"
require "secret_diary"

describe "integration" do
  
  it "raises an error if the diary is locked" do
    diary = Diary.new("Hello World")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end
  
  it "returns the diary contents" do
    diary = Diary.new("Hello World")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Hello World"
  end

end