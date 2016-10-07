require_relative 'journey'

class JourneyLog

  attr_reader :current_journey

  def initialize
    @log = []
  end

  def start(station)
    @current_journey = Journey.new(station)
    @log << @current_journey
  end

  def finish(station)
    if @current_journey.nil?
      double_touch_out(station)
    else
      single_touch_out(station)
    end
  end

  def journeys
    @log.dup
  end

  def complete_journey?
    if @current_journey.nil? || (!@current_journey.exit_station.nil? && !@current_journey.entry_station.nil?)
      false
    else
      true
    end
  end

  def single_touch_out(station)
    @current_journey = current_journey
    @current_journey.finish(station)
    @current_journey = nil
  end

  def double_touch_out(station)
    @current_journey = Journey.new
    @current_journey.finish(station)
    @log << @current_journey
  end

  private

  def current_journey
    if !complete_journey?
      Journey.new
    else
      @current_journey
    end
  end
end
