require "track"
require "music_library"

RSpec.describe "Integration" do
    it "Returns a list of tracks" do
        music_library = MusicLibrary.new
        track_1 = (Track.new("All Along the Watchtower", "Jimi Hendrix"))
        track_2 = (Track.new("Flashing Lights", "Kanye West"))
        music_library.add(track_1)
        music_library.add(track_2)
        expect(music_library.all).to eq [track_1, track_2]
    end

    it "Returns track list with a matching keyword - test1" do
        music_library = MusicLibrary.new
        track_1 = (Track.new("All Along the Watchtower", "Jimi Hendrix"))
        track_2 = (Track.new("Flashing Lights", "Kanye West"))
        track_3 = (Track.new("All of the Lights", "Kanye West"))
        music_library.add(track_1)
        music_library.add(track_2)
        music_library.add(track_3)
        expect(music_library.search("Lights")).to eq [track_2, track_3]
    end

    it "Returns track list with a matching keyword - test2" do
        music_library = MusicLibrary.new
        track_1 = (Track.new("All Along the Watchtower", "Jimi Hendrix"))
        track_2 = (Track.new("Flashing Lights", "Kanye West"))
        track_3 = (Track.new("All of the Lights", "Kanye West"))
        music_library.add(track_1)
        music_library.add(track_2)
        music_library.add(track_3)
        expect(music_library.search("All")).to eq [track_1, track_3]
    end
end