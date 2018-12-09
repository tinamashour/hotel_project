require_relative "room"

class Hotel

  def initialize(name, hash)
    @name = name
    @rooms = Hash.new
    hash.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
  end

  def name
    @name.split.map {|word| word.capitalize}.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person_name, room_name)
    if !self.room_exists?(room_name)
      puts "should print 'sorry, room does not exist"
      return
    else
      if !@rooms[room_name].add_occupant(person_name)
        puts "should print 'sorry, room is full"
      else
        puts "check in successful"
      end
    end
  end

  def has_vacancy?
    # @rooms.values.any? {|room| room.full?}
    @rooms.values.any? { |room| !room.full? }
    # @rooms.values.any? { |room| room.available_space > 0 }

  end

  def list_rooms
    @rooms.each  {|room_name, capacity| puts"#{room_name} : #{capacity.available_space}"}
    # @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
  end


end
