require 'journey_log'

describe JourneyLog do

  let(:entry_station) {double(:station, name: :bensensei, zone: 1)}
  let(:exit_station) {double(:station, name: :makers, zone: 2)}

  describe '#initialize' do
    it 'creates a blank log array' do
      expect(subject.journeys).to eq []
    end
  end

  describe '#start' do

    it { is_expected.to respond_to(:start).with(1).argument }
    it 'creates a new journey with the correct entry station' do
      expect(subject.start(entry_station).last).to eq subject.send(:current_journey)
    end
  end

  describe '#finish' do
    it { is_expected.to respond_to(:finish).with(1).argument }
    it 'finishes a journey with the correct exit station' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys.last.exit_station).to eq exit_station
    end
  end

  describe '#journeys' do
    before do
      subject.start(entry_station)
      subject.finish(exit_station)
    end

    it 'returns the journey log' do
      expect(subject.journeys.length).to eq 1
    end

    it 'cannot be altered' do
      subject.journeys.clear
      expect(subject.journeys.length).to eq 1
    end
  end

  describe 'edge cases' do
    it 'creates a journey given touch out without touch in' do
      subject.finish(exit_station)
      expect(subject.journeys.last.exit_station).to eq exit_station
    end

    it 'creates a journey on a double touch out' do
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.finish(exit_station)
      expect(subject.journeys.last.exit_station).to eq exit_station
    end

    it 'creates a journey on a double touch out' do
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.finish(exit_station)
      expect(subject.journeys.length).to eq 2
    end

    it 'creates a journey on a double touch in' do
      subject.start(entry_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys.length).to eq 2
    end
  end


end
