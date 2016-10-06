require_relative 'oystercard'
require_relative 'journey'

class Fare

  attr_reader :current_fare, :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(current_journey)
    @current_fare = current_journey
  end

  def fare(current_fare)
    if current_fare.entry_station.nil? || current_fare.exit_station.nil?
      PENALTY_FARE
    else
       calculate_fare
    end
  end

  private

  def calculate_fare
    MINIMUM_FARE + (@current_fare.entry_station.zone - @current_fare.exit_station.zone).abs
  end
end