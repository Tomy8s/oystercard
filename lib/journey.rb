class Journey

<<<<<<< HEAD
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
=======
 attr_accessor :entry_station, :exit_station
 attr_reader :fare

 PENALTY_FARE = 6
 MINIMUM_FARE = 1

 def initialize(entry_station = nil)
   @entry_station = entry_station
   @exit_station = nil
 end

  def fare
    if entry_station.nil? || exit_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
>>>>>>> 6e9139ae376044018cbfebde7d3ba41170606e9d
  end

end
