module BikeContainer
  def bikes
    @bikes ||= []
  end

  def collect_broken_bikes_from(place)
    dock if place == 'Docking_Station' && 
  end

  def dock(bike)
    bikes << bike
  end
end
