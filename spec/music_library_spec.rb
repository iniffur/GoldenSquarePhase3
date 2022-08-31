require "music_library"

RSpec.describe MusicLibrary do 
    it "adds tracks" do
        music_library = MusicLibrary.new
        fake_track_1 = double :track
        fake_track_2 = double :track
        music_library.add(fake_track_1)
        music_library.add(fake_track_2)
        expect(music_library.all).to eq [fake_track_1, fake_track_2]
    end

    it "Searches for a keyword" do
        music_library = MusicLibrary.new
        fake_track_1 = double :track
        expect(fake_track_1).to receive(:matches?).with("asdff").and_return(true)
        fake_track_2 = double :track
        expect(fake_track_2).to receive(:matches?).with("asdff").and_return(false)
        music_library.add(fake_track_1)
        music_library.add(fake_track_2)
        expect(music_library.search("asdff")).to eq [fake_track_1]
    end
end