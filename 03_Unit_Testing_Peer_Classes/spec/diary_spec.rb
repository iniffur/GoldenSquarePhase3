require 'diary'

RSpec.describe Diary do
  it "returns contents" do
    diary = Diary.new("contents")
    expect(diary.read).to eq "contents"
  end
end