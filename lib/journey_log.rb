class JourneyLog

  attr_reader :journey_history

  def initialize
    @journey_history = []
  end

  def log(journey)
    @journey_history << journey
  end

  def journey_history
    @journey_history.dup
  end

end
