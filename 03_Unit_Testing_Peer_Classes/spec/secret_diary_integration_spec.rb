require 'secret_diary'
require 'diary'

RSpec.describe "integration" do
  it "initially is locked" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "returns contents when diary is unlocked" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "contents"
  end

  it "raises error if diary is locked" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end