require 'garage'

describe Garage do
  it 'accepts broken bikes from van' do
    broken_bike = double :bike, broken?: true
    van = double :van, bikes: [broken_bike]
    expect(van).to receive(:release_broken_bikes_to).and_return([broken_bike])

    subject.accepts_broken_bikes_from(van)

    expect(subject.bikes).to eq([broken_bike])
  end
end
