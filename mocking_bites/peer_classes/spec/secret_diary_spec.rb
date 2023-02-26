require "secret_diary"

describe SecretDiary do
  it "returns false" do
    diary = double :fake_diary
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.unlock).to eq false
  end

  it "returns true" do
    diary = double :fake_diary
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.lock).to eq true
  end

  it "returns an error if the diary is locked" do
    diary = double :fake_diary
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "returns the diary's content" do
    diary = double :fake_diary, read: "Hello World"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Hello World"
  end

end