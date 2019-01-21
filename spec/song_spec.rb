require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Staying Alive")
    @song2 = Song.new("Country Roads")
    @song3 = Song.new("Tribute")
    @song4 = Song.new("Back in Black")
    @song5 = Song.new("Fear of the Dark")
    @song6 = Song.new("Bohemian Rhapsody")
    @song7 = Song.new("Son of a Preacher Man")
    @song8 = Song.new("500 Miles")
    @song9 = Song.new("Wake Me Up Before You Go Go")
    @song10 = Song.new("Dancing Queen")
  end

  def test_what_is_song_name
    assert("Back in Black", @song4.name)
  end


end
