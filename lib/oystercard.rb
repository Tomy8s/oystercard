require_relative 'journey'
require_relative 'journey_log'
require_relative 'station'
require_relative 'fare'

class Oystercard

  MAXIMUM_BALANCE = 90

 attr_reader :balance, :history

 def initialize
   @balance = 0
   @touch_in = false
   @log = JourneyLog.new
 end

 def top_up(amount)
   fail "Beyond limit of #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
   @balance += amount
 end

 def touch_in(station)
   fail 'Insufficient balance' if balance < Journey::MINIMUM_FARE
   deduct(fare) if @touch_in == true
   @journey = Journey.new(station)
   @touch_in = true
 end

 def touch_out(exit_station)
  @journey = Journey.new if @touch_in == false
  @journey.exit_station = exit_station
  deduct(fare)
  @touch_in = false
 end

 def history
  @log.journey_history
 end

 private

 def fare
   fare = Fare.new(@journey)
   fare.fare(@journey)
 end

 def deduct(amount)
   @balance -= amount
   log(@journey)
 end

 def log(journey)
   @log.log(journey)
 end
end
