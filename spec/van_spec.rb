require 'van'

describe Van do
  it 'accepts broken bikes from docking station' do
    br_bike     = double :bike, broken?: true
    docking_st = double :docking_station, broken_bikes: [br_bike]
    expect(docking_st).to receive(:release_broken_bikes).and_return([br_bike])

    subject.collect_broken_bikes_from(docking_st)

    expect(subject.bikes).to eq([br_bike])
  end
end
