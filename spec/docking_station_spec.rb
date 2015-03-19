require 'docking_station'

describe DockingStation do
  it 'releases bikes that are not broken' do
    working_bike = double :bike, broken?: false
    subject.dock working_bike
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    expect(subject.dock :bike).to eq [:bike]
  end
  it 'raises an error when bikes are not available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises an error when docking station is full' do
    20.times { subject.dock :bike }
    expect { subject.dock :bike }.to raise_error 'Station Full'
  end
  it 'does not release broken bikes' do
    broken_bike = double :bike, broken?: true
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'can calculate available room after docking' do
    5.times { subject.dock :bike }
    expect(subject.available_room).to eq 15
  end
  it 'can calculate available room after releasing' do
    bike = double :bike, broken?: false
    17.times { subject.dock bike }
    subject.release_bike
    expect(subject.available_room).to eq 4
  end
end
