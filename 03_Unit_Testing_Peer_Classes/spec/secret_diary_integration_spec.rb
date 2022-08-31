require 'secret_diary'
require 'diary'

RSpec.describe "integration" do
  it "creates a secret entry" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end