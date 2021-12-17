require 'journey'

describe Journey do
  it { is_expected.to respond_to(:in_journey?, :fare, :start_journey, :end_journey, :penalty?, :start, :end) }

  it "expects in_journey to return false" do
    journey = Journey.new
    expect(journey.in_journey?).to eq false
  end 

  it "fare returns PENATLY_FARE when penalty? is true" do
    journey = Journey.new
    allow(journey).to receive(:penalty?) { true }
    expect(journey.fare).to eq 6
  end

  it "fare returns MINIMUM_FARE when penalty? is false" do
    journey = Journey.new
    allow(journey).to receive(:penalty?) { false }
    expect(journey.fare).to eq 1
  end

  it "penalty? returns true if start journey or end journey are nil" do
    journey = Journey.new
    journey.start_journey("Waterloo")
    journey.end_journey(nil)
    expect(journey.penalty?).to eq true
  end

  it "penalty? returns false if start and end journey are both not nil" do
    journey = Journey.new
    journey.start_journey("Waterloo")
    journey.end_journey("Oxford")
    expect(journey.penalty?).to eq false
  end

  it "start_journey returns the station if one has been given" do
    journey = Journey.new
    journey.start_journey("Waterloo")
    expect(journey.start).to eq "Waterloo"
  end

  it "start_journey returns nil if no journey has been started" do
    journey = Journey.new
    expect(journey.start_journey).to eq nil
  end

  it "end_journey returns the station if one has been given" do
    journey = Journey.new
    journey.end_journey("Waterloo")
    expect(journey.end).to eq "Waterloo"
  end

  it "end_journey returns nil if no journey has been started" do
    journey = Journey.new
    expect(journey.end_journey).to eq nil
  end

end