require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../venue.rb')

class TestRoom < MiniTest::Test

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

    @songs = [@song1, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9, @song10]

    @guest1 = Guest.new("Sam", 300, "Staying Alive", "group1")
    @guest2 = Guest.new("Mike", 3000, "", "group1")
    @guest3 = Guest.new("Alice", 150, "Wicked Game", "group1")
    @guest4 = Guest.new("Tammi", 400, "Funkytown", "group1")
    @guest5 = Guest.new("Sarha", 2000, "Son of a Preacher Man", "group1")
    @guest6 = Guest.new("Steven", 350, "500 Miles", "group2")
    @guest7 = Guest.new("Ian", 450, "Dancing Queen", "group2")
    @guest8 = Guest.new("William", 305, "Country Roads", "group2")
    @guest9 = Guest.new("Maria", 550, "Bohemian Rhapsody", "group2")
    @guest10 = Guest.new("Tony", 700, "Bohemian Rhapsody", "group3")
    @guest11 = Guest.new("Shela", 900, "Bohemian Rhapsody", "group3")
    @guest12 = Guest.new("Craig", 350, "Back in Black", "group3")

    @group1 = [@guest1, @guest2, @guest3, @guest4, @guest5]
    @group2 = [@guest6, @guest7, @guest8, @guest9]
    @group3 = [@guest10, @guest11, @guest12]

    @room1 = Room.new("Room1", 50, 5)
    @room2 = Room.new("Room2", 40, 4)
    @room3 = Room.new("Room3", 30, 2)

    @bar_and_waiting_room = [@guest1, @guest2, @guest3,
      @guest4, @guest5,@guest6,
      @guest7, @guest8, @guest9,
      @guest10, @guest11, @guest12]

    end


    def test_load_song_onto_list
      @room1.load_song(@song1)
      assert_equal("Staying Alive", @room1.room_playlist[0].name)
    end

    def test_if_guest_can_afford_entry
      assert_equal(true, @room1.can_afford_entry(@guest1))
      assert_equal(true, @room2.can_afford_entry(@group2))
    end

    def test_if_group_or_guest_fits_room
      assert_equal(true, @room1.can_fit_room(@group1))
      assert_equal(false, @room2.can_fit_room(@group1))
    end

    def test_CAN_check_in_guest_into_room
      @room1.check_in(@guest1)
      assert_equal(true, @room1.guests_in_room.any? {|guset| guset.name == "Sam"})
    end

    def test_CANT_check_in_guest_into_room
      @room2.check_in_group(@group2, @bar_and_waiting_room)
      @room2.check_in(@guest1)
      assert_equal(false, @room2.guests_in_room.any? {|guset| guset.name == "Sam"})
    end


    def test_check_out_guest_from_room
      @room1.check_in(@guest1)
      @room1.check_in(@guest2)
      @room1.check_out
      assert_equal(1, @room1.guests_in_room.length)
    end


    def test_CAN_check_in_group_from_bar_and_waiting_room
      @room2.check_in_group(@group2, @bar_and_waiting_room)
      assert_equal(4, @room2.guests_in_room.length)
      assert_equal(8, @bar_and_waiting_room.length)
    end

    def test_CANT_check_in_group_from_bar_and_waiting_room
      @room2.check_in_group(@group1, @bar_and_waiting_room)
      assert_equal(0, @room2.guests_in_room.length)
      assert_equal(12, @bar_and_waiting_room.length)
    end

    def test_check_out_group
      @room1.check_in(@guest1)
      @room1.check_in_group(@group2, @bar_and_waiting_room)
      guests = @room1.check_out_group(@group2)
      assert_equal(1, @room1.guests_in_room.length)
    end


  end
