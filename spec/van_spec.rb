require 'van'

describe Van do
  it 'accepts broken bikes from docking station' do
    broken_bike = double :bike, broken?: true
    docking_station = double :docking_station, broken_bikes: [broken_bike]
    subject.collect_broken_bikes_from(docking_station)
    expect(subject.bikes).to eq([broken_bike])
  end
end
