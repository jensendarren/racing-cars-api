module Api
  module V1
    class CarsController < ApplicationController
      before_action :find_by_car_slug

      def show
        render json: {data: @car}
      end

      private
      def find_by_car_slug
        @car = Car.find_by_car_slug(params[:car_slug])
      end
    end
  end
end