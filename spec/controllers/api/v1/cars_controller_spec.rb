require 'rails_helper'

describe Api::V1::CarsController, type: :request do
  let(:car){ create(:car) }
  let(:track){ create(:track) }
  let(:car_max_speed) { "#{car.max_speed}km/h" }

  def check_response_json(max_speed_on_track)
    json = JSON response.body

    expect(json['data']['car']['id']).to eq(car.id)
    expect(json['data']['car']['car_slug']).to eq(car.car_slug)
    expect(json['data']['car']['max_speed']).to eq(car_max_speed)
    expect(json['data']['car']['max_speed_on_track']).to eq(max_speed_on_track)
  end

  describe 'GET #api_v1_car_path' do
    context 'when car slug passed without a track set' do
      it "returns car data as json" do
        get api_v1_car_path car.car_slug

        check_response_json 'no track selected'
      end
    end

    context 'when car slug passed with a track name param set' do
      let(:car_speed_calculator) { Calculators::CarSpeed.new(car, track) }

      before do
        allow_any_instance_of(Track).to receive(:slowing_factor).and_return(0.1)
      end

      it 'returns a max_speed_on_track value' do
        get api_v1_car_path car.car_slug, track: track.name

        check_response_json car_speed_calculator.max_speed_on_track
      end
    end

    context 'when car slug passed with a track name param set to a track that does not exist' do
      it 'returns a max_speed_on_track value track not found' do
        get api_v1_car_path car.car_slug, track: 'doesnotexist'

        check_response_json 'track not found'
      end
    end
  end
end