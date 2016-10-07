require_relative 'journey'
require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

attr_reader :balance, :entry_station, :exit_station, :in_journey, :journeys, :current_journey
  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds for jouney' if @balance < MINIMUM_BALANCE
    new_journey(station)
    @in_journey = true
  end

  def touch_out(station)
    end_journey(station)
    deduct(@current_journey.fare)
    @in_journey = false
  end

private

  def add_journey
    @journeys << @current_journey
    @in_journey = false
  end

  def deduct(amount)
    @balance -= amount
  end

  def new_journey(station)
    if @in_journey
      deduct(@current_journey.fare)
      add_journey
    end
    @current_journey = Journey.new(station)
  end

  def end_journey(station)
    if @in_journey
      @current_journey.finish(station)
      add_journey
    else
      @current_journey = Journey.new
      @current_journey.finish(station)
      add_journey
    end
  end
end
