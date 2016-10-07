require 'spec_helper'

describe Journey do

  let(:station) { double :station, zone: 1 }
  subject {Journey.new(station)}

#   it 'returns a journey when finished' do
#    expect(subject.exit_station(station)).to eq subject
#  end

  describe 'Initialization' do
    it 'has a default penalty fare' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    it 'sets journey as incomplete' do
      expect(subject).not_to be_complete
    end
  end

  context 'given an entry station' do

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    context 'given an exit station' do
      let(:station2) { double :station2}

      before do
        subject.finish(station2)
      end

      it 'calculates a fare' do
        expect(subject.fare).to eq 1
      end

      it 'knows that a journey is complete' do
        expect(subject).to be_complete
      end
    end
  end

end
