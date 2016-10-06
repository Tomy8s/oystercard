class Journey

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
    endi
  end

end
