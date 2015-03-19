class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :available_room, :bikes

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @available_room = @capacity
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    @available_room += 1
    @bikes.pop
  end

  def dock bike
    fail 'Station Full' if full?
    @available_room -= 1
    @bikes << bike
  end

  def release_broken_bikes
    bikes_to_be_removed = bikes.select(&:broken?)
    bikes.reject!(&:broken?)
    bikes_to_be_removed
  end

  private

  attr_reader :room

  def bike_count
    @bikes.length
  end

  def full?
    bike_count >= @capacity
  end

  def empty?
    bikes.reject(&:broken?).length == 0
  end
end
