
class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :journeys

  def initialize
    @journeys = []
  end

  def in_journey?
    return true unless @entry_station.nil?
    false
  end

  def fare
    if penalty?
      PENALTY_FARE
    else
      MINIMUM_FARE
   end
  end

  def start_journey

  end

  def end_journey

  end

  def penalty?
    if start_journey == nil || end_journey == nil
      true
    else
      false
    end
  end


end