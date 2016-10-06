
require 'journey_log'

describe JourneyLog do

  let(:complete_journey) {double(:journey, entry_station: :Liverpool, exit_station: :Waterloo )}
  let(:bad_journey)      {double(:journey, entry_station: nil, exit_station: :Waterloo)}

  describe '#initialize' do
   it 'starts with an empty array' do
     expect(subject.journey_history).to be_empty
   end
  end

  describe '#log' do
   it 'should add a complete journey to the array' do
     subject.log(complete_journey)
     expect(subject.journey_history).to include complete_journey
   end

   it 'should add incomplete journeys to the array' do
     subject.log(bad_journey)
     expect(subject.journey_history).to include bad_journey
   end

   it 'should be able to add more than one journey' do
     subject.log(bad_journey)
     subject.log(complete_journey)
     expect(subject.journey_history).to include(complete_journey, bad_journey)
   end
  end

  describe '#journey_history' do
    it 'should return a copy of @journey_history' do
      subject.log(bad_journey)
      subject.log(complete_journey)
      subject.journey_history.pop
      expect(subject.journey_history).to include(complete_journey, bad_journey)
    end

  end

end
