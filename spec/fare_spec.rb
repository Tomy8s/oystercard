=begin
require 'fare'
require 'oystercard'
require 'journey'

describe Fare do

  let(:entry)    { double(:station, :zone=>2) }
  let(:exit_)     { double(:station, :zone=>2) }
  let(:journey) { {entry_station: entry, exit_station: exit_} }
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
    expect {card.touch_out(station2)}.to change {card.balance}.by(-Oystercard::MINIMUM_FARE)
    end

    it 'always returns a positive number' do
    card = Oystercard.new
    station = Station.new(:waterloo, 1)
    station2 = Station.new(:bank, 3)
    card.top_up(90)
    card.touch_in(station)
    expect {card.touch_out(station2)}.to change {card.balance}.by(-2)
  end
end


end
=end
