require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new(:journey_log) }
  #  describe '#initialize' do

  #    it 'should accept one argument' do
  #      expect(subject).to respond_to(:initialize).with(1).argument
  #    end
  #   end

    describe '#start' do

      it 'should accept one argument' do
        expect(subject).to respond_to(:start).with(1).argument
      end
    end

    describe '#finish' do
      it 'should acccept one argument' do
       expect(subject).to respond_to(:finish).with(1).argument
     end
    end

    describe '#journeys' do
      it 'should return a list with one item for each journey taken' do
        n = rand(10)
        n.times do
          subject.start(:start)
          subject.finish(:finish)
        end
        expect(subject.journeys.length).to eq n
      end
    end
end
