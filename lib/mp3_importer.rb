require_relative './song.rb'
require_relative './artist.rb'
require 'pry'
class MP3Importer
attr_reader :path
attr_accessor :file_names

def initialize(path = "./spec/fixtures/mp3s")
@path = path
end

def import
files.each{|el| Song.new_by_filename(el)}
end

def files
@file_names = []
Dir.glob("#{@path}/*").each{|el| @file_names << el.gsub("./spec/fixtures/mp3s/", "")}
@file_names
end
end
