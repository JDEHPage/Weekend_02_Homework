require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

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


  end

  def test_what_can_guest_spend
    assert_equal(300, @guest13.cash)
  end

  def test_guests_name
    assert_equal("Craig", @guest12.name)
  end

  def test_guests_favorate_song
    assert_equal("Bohemian Rhapsody", @guest10.fave_song)
  end


end
