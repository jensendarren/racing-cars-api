require 'rails_helper'

describe Calculators::CarSpeed do
  let(:car){ create(:car) }
  let(:track){ create(:track) }
  let(:car_max_speed) { "#{car.max_speed}km/h" }

  subject { Calculators::CarSpeed.new(car, track)  }

  describe '#max_speed' do
    it 'returns the max car speed in km/h' do
      expect(subject.max_speed).to eq car_max_speed
    end
  end

  describe '#time_frame_slowing_factor' do
    it 'returns a slowing factor based on the time of day at the track' do
      expect(subject.send(:time_frame_slowing_factor)).to eq(0.15)
    end
  end
end
