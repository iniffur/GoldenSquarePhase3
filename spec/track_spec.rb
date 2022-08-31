require "track"

RSpec.describe Track do
    it "constructs" do
        track = Track.new("Alright", "Kendrick Lamar")
        expect(track.title).to eq "Alright"
        expect(track.artist).to eq "Kendrick Lamar"
    end

    it "matches if title contains keyword" do
        track = Track.new("Around the World", "Daft Punk")
        expect(track.matches?("World")).to eq true
    end

    it "matches if artist contains keyword" do
        track = Track.new("Around the World", "Daft Punk")
        expect(track.matches?("Punk")).to eq true
    end
end