module Calculators
  class CarSpeed
    attr_accessor :car, :track

    def initialize(car, track)
      @car = car
      @track = track
    end

    def max_speed
      "#{@car.max_speed}km/h"
    end

    def max_speed_on_track
      @track ? "#{calculate_max_speed_on_track}km/h" : 'track not found'
    end

    private

    def calculate_max_speed_on_track
      @car.max_speed - (total_slowing_factor * @car.max_speed)
    end

    def total_slowing_factor
      @track.slowing_factor + time_frame_slowing_factor
    end

    def time_frame_slowing_factor
      slowing_factor = 0.0
      Time.use_zone @track.time_zone do
        current_time_at_track = Time.zone.now
        beginning_of_day = Time.zone.now.beginning_of_day
        six_am = Time.zone.parse("06:00")
        nine_am = Time.zone.parse("09:00")
        six_pm = Time.zone.parse("18:00")
        nine_thirty_pm = Time.zone.parse("21:30")
        end_of_day = Time.zone.now.end_of_day

        slowing_factor = 0.0 if current_time_at_track.between?(nine_am, six_pm)
        slowing_factor = 0.08 if current_time_at_track.between?(six_pm, nine_thirty_pm)
        slowing_factor = 0.15 if current_time_at_track.between?(nine_thirty_pm, end_of_day)
        slowing_factor = 0.15 if current_time_at_track.between?(beginning_of_day, six_am)
        slowing_factor = 0.08 if current_time_at_track.between?(six_am, nine_am)
      end
      return slowing_factor
    end
  end
end