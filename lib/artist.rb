class Artist
  attr_accessor :name, :songs 
  
  @@song_count = 0 
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def add_song(song)
    @songs << song 
    song.artist = self
    @@song_count += 1 
  end
    
  def self.song_count
    @@song_count
  end
  
  def songs
    Song.all.select do |song|
      song.artist ==self
    end
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find {|artist| artist.name == artist_name}
    if found_artist
      found_artist
    else
      new_artist = self.new(artist_name)
      new_artist.save
      new_artist
    end
  end
    
end
    