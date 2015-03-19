class Van
  def bikes
    @bikes ||= []
  end

  def dock bike
    bikes << bike
  end

  def collect_broken_bikes_from(docking_station)
    docking_station.release_broken_bikes.each { |bike| dock(bike) }
  end

  def release_broken_bikes_to(*)
    bikes_to_be_removed = bikes.select(&:broken?)
    bikes.reject!(&:broken?)
    bikes_to_be_removed
  end
end
