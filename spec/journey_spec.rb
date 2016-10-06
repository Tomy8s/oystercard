require 'journey'
require 'oystercard'

describe Journey do

  subject(:no_arguments) {described_class.new}
  subject(:journey)      {described_class.new(:entry_station)}
  let(:card)             { Oystercard.new }
  let(:entry_station)    { double(:station, :zone=>1) }
  let(:exit_station)     { double(:station, :zone=>2) }

  describe '#initialize' do
    it 'sets entry station to nil if none given' do
      expect(no_arguments.entry_station).to be nil
    end

    it 'has exit_station set to nil when initialized' do
      expect(journey.exit_station).to be nil
    end

    it 'will set entry station when passed an argument' do
      expect(journey.entry_station).to be :entry_station
    end
  end

#   describe '#fare' do
#     it 'gives MINIMUM_FARE if used correctly' do
#       subject.entry_station = entry_station
#       subject.exit_station = exit_station
#       expect(subject.fare).to eq described_class::MINIMUM_FARE
#     end

#     it 'gives PENALTY_FARE if no entry station given' do
#       subject.entry_station = nil
#       subject.exit_station = exit_station
#       expect(subject.fare).to eq described_class::PENALTY_FARE
#     end

#     it 'gives PENALTY_FARE if no exit station given' do
#       subject.entry_station = entry_station
#       expect(subject.fare).to eq described_class::PENALTY_FARE
#     end
    #  end
 end