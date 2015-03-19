class Garage
  def bikes
    @bikes ||= []
  end

  def dock bike
    bikes << bike
  end

  def accepts_broken_bikes_from(van)
    van.release_broken_bikes_to(self).each { |bike| dock(bike) }
  end
end
