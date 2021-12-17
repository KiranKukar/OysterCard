require './lib/journey.rb'

class Oystercard
  LIMIT_VALUE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :balance, :entry_station, :journeys
   
  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys << { @entry_station => station }
    @entry_station = nil
  end

  def in_journey?
    return true unless @entry_station.nil?
    false
  end


  private

  def deduct(amount)
    # amount = journey.fare
    @balance -= amount
  end
  
end
