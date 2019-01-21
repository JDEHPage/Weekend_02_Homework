require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../venue.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestVenue < MiniTest::Test

  def setup

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

    @venue1 = Venue.new("Sing Something", 100, @room_list, @bar_and_waiting_room)

    @room_list = [@room1, @room2, @room3]

    @bar_and_waiting_room = [@guest1, @guest2, @guest3,
      @guest4, @guest5,@guest6,
      @guest7, @guest8, @guest9,
      @guest10, @guest11, @guest12]

    end







  end
