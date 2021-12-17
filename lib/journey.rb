
class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :start, :end

  def initialize
    @start
    @end
  end

  def in_journey?
    return true unless @start.nil?
    false
  end

  def fare
    if penalty?
      PENALTY_FARE
    else
      MINIMUM_FARE
   end
  end

  def start_journey(station = nil)
    @start = station
  end

  def end_journey(station = nil)
    @end = station
  end

  def penalty?
    if @start == nil || @end == nil
      true
    else
      false
    end
  end

end