class Journey

  attr_accessor :exit_station, :entry_station, :journey

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @journey = {}
  end

  def add_journey
    @journey.merge!({entry_station: @entry_station, exit_station: @exit_station})
    reset_stations
    @journey
  end

  def in_journey?
    !!entry_station
  end

  def reset_stations
    @entry_station = nil
    @exit_station = nil
  end

end
