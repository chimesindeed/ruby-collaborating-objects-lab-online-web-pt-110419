require_relative './song.rb'
require_relative './mp3_importer.rb'
require 'pry'
class Artist
  
  attr_accessor :songs, :name
  
def songs
	@songs = []
    Song.all.each {|el|
	if el.artist== self
	@songs << el
	end
}
@songs
    end
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
	found = Artist.all.detect{|instance| instance.name == name}
	if 	found == nil
		found =(name = Artist.new(name))
	end
found
  end
    
  def print_songs
	formatted_songs = []
	songs.each{|instance| formatted_songs << instance.name}
	puts "#{formatted_songs[0]}\n""#{formatted_songs[1]}"
  end

  def add_song(song)
    song.artist = self
  end
end
