require 'secret_diary'

RSpec.describe SecretDiary do
    it "initially is locked" do
    fake_secret_diary = double(:fake_secret_diary)
    secret_diary = SecretDiary.new(fake_secret_diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "returns contents when diary is unlocked" do
    fake_secret_diary = double(:fake_secret_diary, read: "fake contents")
    secret_diary = SecretDiary.new(fake_secret_diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "fake contents"  
  end

  it "raises error if diary is locked" do
    fake_secret_diary = double(:fake_secret_diary)
    secret_diary = SecretDiary.new(fake_secret_diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end