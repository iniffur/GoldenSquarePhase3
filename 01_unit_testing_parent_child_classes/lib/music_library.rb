class MusicLibrary
    def initialize
        @all_songs = []
    end
  
    def add(track) # track is an instance of Track
        @all_songs << track
    end
  
    def all
       @all_songs
    end
    
    def search(keyword) # keyword is a string
      # Returns a list of tracks that match the keyword
      @matches = []
      @all_songs.map do |track|
        if track.matches?(keyword)
            @matches << track
        end
      end
      return @matches
    end
  end

  #return @all_songs.select do |track|
    #track.matches?(keyword)
  #end