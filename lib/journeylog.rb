class JourneyLog

  attr_reader :history

  def initialize
    @history = []
  end

  def history(journey)
    @history << journey
  end

end
