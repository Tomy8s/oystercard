require 'fare'
require 'oystercard'
require 'journey'

describe Fare do

  let(:entry)    { double(:station, :zone=>2) }
  let(:exit_)     { double(:station, :zone=>2) }
  let(:journey) { double(entry_station: entry, exit_station: exit_) }
  let(:no_entry) { double(entry_station: nil, exit_station: exit_) }
  let(:no_exit) { double(entry_station: entry, exit_station: nil) }
  subject(:inita) {described_class.new(journey)}


  describe '#initalization' do
    it 'should be passed in a journey to calculate' do
      expect(inita.current_fare).to be journey
    end
  end

  describe '#fare' do

  it 'returns MINIMUM_FARE if zone calculation is 0' do
    card = Oystercard.new
    station = Station.new(:waterloo, 1)
    station2 = Station.new(:bank, 1)
    card.top_up(90)
    card.touch_in(station)
    expect {card.touch_out(station2)}.to change {card.balance}.by(-described_class::MINIMUM_FARE)
  end

    it 'always returns a positive number' do
      card = Oystercard.new
      station = Station.new(:waterloo, 1)
      station2 = Station.new(:bank, 3)
      card.top_up(90)
      card.touch_in(station)
      expect {card.touch_out(station2)}.to change {card.balance}.by(-3)
    end

    it 'gives PENALTY_FARE if no entry station given' do
      expect(subject.fare(no_entry)).to eq described_class::PENALTY_FARE
    end

    it 'gives PENALTY_FARE if no exit station given' do
      expect(subject.fare(no_exit)).to eq described_class::PENALTY_FARE
    end
  end
end