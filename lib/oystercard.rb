require_relative 'journey'
<<<<<<< HEAD
require_relative 'station'
require_relative 'fare'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :history

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @history = []
    @user_touch_in = false
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MINIMUM_BALANCE
    did_user_double_touch_in
    create_journey(entry_station)
    @journey.in_journey?
  end

  def touch_out(exit_station)
    user_did_not_touch_in
    @journey.exit_station = exit_station
    deduct(fare)
    add_journey_to_history
    @journey.in_journey?
  end

  private

  def fare
    calculate_fare = Fare.new(@journey)
    calculate_fare.fare
  end
  
  def add_journey_to_history
    add_to_array
    reset_touch_in
  end

  def did_user_double_touch_in
    if @user_touch_in == true
      deduct(PENALTY_FARE + MINIMUM_FARE)
    end
  end

  def create_journey(entry_station)
    @journey = Journey.new(entry_station)
    @user_touch_in = true
  end

  def user_did_not_touch_in
    if @user_touch_in == false
       create_journey(exit_station)
       deduct(PENALTY_FARE)
    end
  end

  def reset_touch_in
    @user_touch_in = false
  end

  def add_to_array
    @journey.add_journey
    @history << @journey.journey
  end

  def deduct(amount)
    @balance -= amount
  end
=======
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
>>>>>>> 6e9139ae376044018cbfebde7d3ba41170606e9d

end
