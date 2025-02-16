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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)

    @@all.each do |song_instance|
      if song_instance.name == name
        return song_instance
      end
    end

  nil
  end

  def self.find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end

  def self.alphabetical
    @@all = @@all.sort_by{|name| name.name}
    
  end

  def self.new_from_filename(name)
    name = name.slice(0..-5)
    name = name.split(" - ")
    
   
    song = self.new
    song.name = name[1]
    song.artist_name = name[0]
    @@all << song
    song

  end

  def self.create_from_filename(name)
    name = name.slice(0..-5)
    name = name.split(" - ")
    
   
    song = self.new
    song.name = name[1]
    song.artist_name = name[0]
    @@all << song
    song
  end


  def self.destroy_all
    self.all.clear
  end

end
