class Artist
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def add_song(song)
    @songs << song 
  end
    
  def self.song_count
    @@song_count
  end
  
    def songs
    Song.all.select do |song|
      song.artist ==self
    end
  end

  def self.all
    @@all 
  end

    
    
end
    