require 'capybara/rspec'
require 'docking_station'
require 'bike'
require 'van'
require 'garage'

feature 'van brings broken bikes from docking station to garage' do
  scenario 'collects broken bikes from docking station' do
    docking_st = DockingStation.new
    broken_bike = Bike.new.break
    van = Van.new
    docking_st.dock broken_bike
    van.collect_broken_bikes_from(docking_st)
    expect(van.bikes).to eq([broken_bike])
  end
  scenario 'releases broken bikes to garage' do
    van = Van.new
    broken_bike = Bike.new.break
    garage = Garage.new
    van.dock broken_bike
    van.release_broken_bikes_to(garage)
    expect(van.bikes).to eq([])
  end
end
