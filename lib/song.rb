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
      song_name = filename.partition(" - ")[2] ########################  isolate - SONG NAME AS STRING ------------
      song_name2= /[a-zA-Z ]+-/.match(song_name).to_s.gsub(" -", "") ##  isolate - SONG NAME AS STRING ------------
      song_name2 = Song.new(song_name2) ################################ create  - SONG INSTANCE FROM SONG NAME ---
      artist_name_formatted = filename.partition(" - ")[0]############## isolate - ARTIST NAME FROM STRING --------
      
	  song_name2.artist=(Artist.find_or_create_by_name(artist_name_formatted))
      
      song_name2 ##RETURN SONG INSTANCE AS PER SPEC##
    end
    
    def artist_name=(artistname) 
		self.artist=(Artist.find_or_create_by_name(artistname))
end
end
