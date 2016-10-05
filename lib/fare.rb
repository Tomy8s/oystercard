require_relative 'oystercard'

class Fare

  attr_reader :current_fare, :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(current_journey)
    @current_fare = current_journey
  end

  def fare
    if @current_fare.entry_station == nil || @current_fare.exit_station == nil
      Oystercard::MINIMUM_FARE
    elsif calculate_fare == 0
      Oystercard::MINIMUM_FARE
    else
       calculate_fare
    end
  end

  private

  def calculate_fare
    (@current_fare.entry_station.zone - @current_fare.exit_station.zone).abs
  end


end
