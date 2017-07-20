require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all.last
  end

  def self.new_by_name(songname)
    song = self.new
      song.name = songname
      song
  end

  def self.create_by_name (songname)
    song = self.new
    song.name = songname
    song.save
    song
  end

  def self.find_by_name(songname)
    @@all.find do |x|
      x.name == songname
    end
  end

  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname) == nil
        self.create_by_name(songname)
      end
      self.find_by_name(songname)
  end

  def self.alphabetical
    @@all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(songname)
       song = self.new
       spl = songname[0...-4].split(" - ")
          song.name = spl[1]
          song.artist_name = spl[0]
          song
  end

  def self.create_from_filename(songname)
    song = self.new
    spl = songname[0...-4].split(" - ")
       song.name = spl[1]
       song.artist_name = spl[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end



end
