require 'oystercard'

describe Oystercard do

let(:entry) { double(:station, name: :Central, zone: 1) }
let(:exit)  { double(:station, name: :Nowhere, zone: 1) }
let(:complete_journey) {double(:journey, entry_station: entry, exit_station: exit )}

  describe '#initialize' do
    it 'starts with a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'adds to balance' do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
    end
    it 'rases and error when exceding MAXIMUM_BALANCE' do
      expect{ subject.top_up(described_class::MAXIMUM_BALANCE + 1) }.to raise_error("Beyond limit of #{described_class::MAXIMUM_BALANCE}")
    end
  end

  describe '#touch_in' do
    it 'accepts a station as an argument' do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end
    it 'rases and error when funds low' do
      expect{ subject.touch_in(entry) }.to raise_error('Insufficient balance')
    end
    it 'charges a penlty fare if touched in twice' do
      subject.top_up(described_class::MAXIMUM_BALANCE)
      subject.touch_in(entry)
      expect{ subject.touch_in(entry) }.to change{ subject.balance }.by(-6)
    end
  end

  describe '#touch_out' do
    before do
      subject.top_up(described_class::MAXIMUM_BALANCE)
    end
    it 'charges MINIMUM_FARE on completion of valid journy' do
      subject.touch_in(entry)
      expect{ subject.touch_out(exit) }.to change{ subject.balance }.by(-1)
    end
    it 'charges a penlty fare if touched out twice' do
      subject.touch_out(entry)
      expect{ subject.touch_out(exit) }.to change{ subject.balance }.by(-6)
    end
  end

  describe '#history' do
    before do
      subject.send(:log, complete_journey)
    end
    it 'should provide journey history' do
      expect(subject.history).to include(complete_journey)
    end
  end

end
