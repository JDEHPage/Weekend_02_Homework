class Room

  attr_reader :name, :cost, :capacity, :guests_in_room, :room_playlist

  def initialize(name, cost, capacity)
    @name = name
    @cost = cost
    @capacity = capacity
    @guests_in_room = []
    @room_playlist = []
  end

  def load_song(song)
    @room_playlist.push(song)
  end





  def can_afford_entry(guest_or_group)
    cost_per_person = @cost / @capacity

    if guest_or_group.class == Array
      guest_or_group.sum { |person| person.cash} >= @cost ? true : false
    else
      cost_per_person <= guest_or_group.cash ? true : false
    end
  end


  def can_fit_room(guest_or_group)

    space_available = @capacity - @guests_in_room.length

    if guest_or_group.class == Array
      space_available >= guest_or_group.length ? true : false
    else
      space_available >= 1 ? true : false
    end
  end





  # Individual guests
  # Checking in individuals
  def check_in(guest)
    if can_afford_entry(guest) && can_fit_room(guest)
    @guests_in_room.push(guest)
  end
  end

  #  Checking out individuals
  def check_out
    @guests_in_room.pop
  end


  #Groups
  # Checks in entire group
  def check_in_group(group, waiting_room)
    if can_afford_entry(group) && can_fit_room(group)

      # Checks freind group Ident and compares it to Guests that have that ident in the waiting area
      # Then builds a array of those guests
      moving_group = waiting_room.select { |guest| guest.frineds_group == group[0].frineds_group }
      # Moves all guests from genearsted arrat into the @guests_in_room array (that keeps track of who is in the room)
      (moving_group.length).times do
        @guests_in_room.push(moving_group.pop())
      end
      # Deletes guests from the waiting area that are part of the group based on freind group Idents
      waiting_room.delete_if{ |guest| guest.frineds_group == group[0].frineds_group }

    end

    # -------------------

    # # Checks freind group Ident and compares it to Guests that have that ident in the waiting area
    # # Then builds a array of those guests
    # moving_group = waiting_room.select { |guest| guest.frineds_group == group[0].frineds_group }
    # # Moves all guests from genearsted arrat into the @guests_in_room array (that keeps track of who is in the room)
    # (moving_group.length).times do
    #   @guests_in_room.push(moving_group.pop())
    # end
    # # Deletes guests from the waiting area that are part of the group based on freind group Idents
    # waiting_room.delete_if{ |guest| guest.frineds_group == group[0].frineds_group }

    # -------------------

    # # Will clone guests from guest list
    # group.each { |guest| @guests_in_room.push(guest) }
    # # Will take guests from guest list
    # (group.length).times do
    #   @guests_in_room.push(group.pop())
    # end
    # # Will take last guests from guest list
    # for guest in waiting_room
    #   if guest.frineds_group == group[0].frineds_group
    #
    #     @guests_in_room.push(waiting_room.pop)
    #
    #   end
    # end

  end


  # Checks out entire group that was pushed in
  def check_out_group(group)
    @guests_in_room.pop(group.length)

    return group
  end
  # +++++++








end
