require_relative 'journey'
require_relative 'journeylog'
require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 90

 attr_reader :balance

 def initialize
   @balance = 0
   @touch_in = false
   @log = JourneyLog.new
 end

 def top_up(amount)
   fail "Beyond limit of #{MAXIMUM_BALANCE}" if (balance + money) > MAXIMUM_BALANCE
   @balance += amount
 end

 def touch_in(station)
   fail 'Insufficient balance' if balance < Journey::MINIMUM_FARE
   deduct(@journey.fare) if @touch_in == true
   @journey = Journey.new(station)
   @touch_in = true
 end

 def touch_out(exit_station)
  @journey = Journey.new if @touch_in == false
  @journey.exit_station = exit_station
  deduct(@journey.fare)
  @touch_in = false
 end

 def history
  @log.history
 end

 private

 def deduct(amount)
   @balance -= amount
   log
 end

 def log
   @log.history(@journey)
 end
end