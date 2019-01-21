class Venue

  attr_reader :name, :cashfloat, :bar_and_waiting_room, :room_list

  def initialize(name, cashfloat, room_list, bar_and_waiting_room)
    @name = name
    @cashfloat = cashfloat
    @room_list = room_list
    @bar_and_waiting_room = bar_and_waiting_room
  end


  def group_fits_room(group, room)
    group.length <= room.capacity ? true : false
  end

  

end
