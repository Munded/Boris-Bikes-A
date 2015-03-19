require 'docking_station'
require 'bike'
require 'capybara/rspec'

feature 'member of public docks bike' do
  let(:docking_station) { DockingStation.new }
  scenario 'docking station unable to receive when full' do
    20.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end
