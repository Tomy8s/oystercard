require 'spec_helper'

describe Oystercard do

    let(:station) {double :station}
    let(:entry_station) {double :entry_station}
    let(:exit_station)  {double :exit_station}

    it 'should check if there are empty lists of journeys' do
      expect(subject.journeys).to match_array([])
    end

describe '#touch_in' do

  let(:journey){ double(:journey, entry_station: entry_station, exit_station: exit_station) }

  it 'stores a journey' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys.last.entry_station).to eq entry_station
  end

end

describe '#touch_out' do

  before :each do
    subject.top_up(15)
    subject.touch_in(station)
    subject.touch_out(station)
  end

  it 'deducts the correct money after the journey' do
    expect { subject.touch_out(station) }.to change { subject.balance }.by (-Journey::PENALTY_FARE)
  end

end

  it "won't touch in if below minimum balance" do
    expect{subject.touch_in(station)}.to raise_error 'Insufficient funds for jouney'
  end

  describe 'top_up' do
    before :each do
      @balance = Oystercard::MAXIMUM_BALANCE
    end


    it 'raises an exception if maximum balance is exceeded' do
      subject.top_up(@balance)
      expect{subject.top_up 5}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end


end
