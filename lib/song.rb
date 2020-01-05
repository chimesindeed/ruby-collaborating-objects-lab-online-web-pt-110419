require_relative './artist.rb'
require_relative './mp3_importer.rb'
require 'pry'

class Song

  attr_accessor :artist_name, :artist, :name
 
  @@all = []
  def initialize(name)
       @name = name
       @@all << self
     end
     
    def self.all
      @@all
    end
   
    
    def artist= (artist)
     @artist = artist

	#Artist.all.each{|element|
	#	if element == self.artist
	#		artist.add_song(self)
	#	else artist = Artist.new(artist)
	#		artist.add_song(self)
	#	end
	#		}
end
  
    def self.new_by_filename(filename)
      song_name = filename.partition(" - ")[2]
      song_name2= /[a-zA-Z ]+-/.match(song_name).to_s.gsub(" -", "")
        artist_name_formatted = filename.partition(" - ")[0]
      song_name2 = Song.new(song_name2)
      @artist=(artist_name_formatted)
      
      #binding.pry
      artist_name=(artist_name_formatted)
      
                                 song_name2.artist= artist_name_formatted
      song_name2  
    end
    
    def artist_name=(artistname) 
		found = Artist.all.detect{|el| el.name == artistname}
			 if found ==true
			   self.artist=found  
					artistname.songs << self
			 elsif 	found != true
				 artistname = Artist.new(artistname)
				 self.artist=(artistname)
				 artistname.songs << self
			end
end
end
