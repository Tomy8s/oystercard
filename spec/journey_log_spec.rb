require 'journey_log'

describe JourneyLog do

   describe '#initialize' do

     it 'should accept one argument' do
       expect(subject).to respond_to(:initialize).with(1).argument
     end
    end

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

end
