module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car_by_slug, :set_track_by_name

      def show
        car_speed = Calculators::CarSpeed.new(@car, @track)

        render json: { data:
                        { car:
                          { id: @car.id,
                            car_slug: @car.car_slug,
                            max_speed: car_speed.max_speed,
                            max_speed_on_track: (params[:track] ? car_speed.max_speed_on_track : 'no track selected')
                          }
                        }
                      }
      end

      private

      def set_car_by_slug
        @car = Car.find_by_car_slug(params[:car_slug])
      end

      def set_track_by_name
        @track = Track.find_by_name(params[:track])
      end
    end
  end
end
