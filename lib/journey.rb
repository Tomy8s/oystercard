class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :fare, :entry_station, :exit_station, :finish

  def initialize(station = nil)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    if entry_station.nil? || exit_station.nil?
      false
    else
      true
    end
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end
end