class Guest

  attr_reader :name, :cash, :fave_song, :frineds_group

  def initialize(name, cash, fave_song, frineds_group)
    @name = name
    @cash = cash
    @fave_song = fave_song
    @frineds_group = frineds_group
  end


end
