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

  context 'calculating total slowing factor and max speed on track' do
    let(:track_slowing_factor) { 0.1 }
    let(:time_frame_slowing_factor) { 0.2 }
    let(:expected_total_slowing_factor) { track_slowing_factor + time_frame_slowing_factor }
    let(:expected_max_speed_on_track) { car.max_speed - (expected_total_slowing_factor * car.max_speed) }

    before do
      allow(track).to receive(:slowing_factor).and_return(0.1)
      allow(subject).to receive(:time_frame_slowing_factor).and_return(0.2)
    end

    describe '#total_slowing_factor' do
      it 'returns the track slowing factor + the time frame slowing factor' do
        expect(subject.send(:total_slowing_factor)).to eq(expected_total_slowing_factor)
      end
    end

    describe '#max_speed_on_track' do
      it 'calculates the max speed on track baed on the total slowing factor' do
        expect(subject.send(:max_speed_on_track)).to eq("#{expected_max_speed_on_track}km/h")
      end

      context 'when track is nil (not found)' do
        it 'returns track not found message' do
          expect(Calculators::CarSpeed.new(car, nil).max_speed_on_track).to eq('track not found')
        end
      end
    end
  end

  describe '#time_frame_slowing_factor' do
    describe 'returns a slowing factor based on the time of day at the track' do
      after do
        travel_back
      end

      def check_slowing_factor(factor)
        expect(subject.send(:time_frame_slowing_factor)).to eq(factor)
      end

      context 'between 9am - 6pm the slowing factor is 0.0' do
        let(:factor) { 0.0 }

        it 'at Midday' do
          travel_to Time.zone.local(2020, 1, 1, 12, 00, 00)
          check_slowing_factor factor
        end

        it 'at 5pm' do
          travel_to Time.zone.local(2020, 1, 1, 17, 00, 00)
          check_slowing_factor factor
        end
      end

      context 'between 6pm - 9:30pm the slowing factor is 0.08' do
        let(:factor) { 0.08 }

        it 'at 6pm' do
          travel_to Time.zone.local(2020, 1, 1, 18, 00, 00)
          check_slowing_factor factor
        end

        it 'at 9pm' do
          travel_to Time.zone.local(2020, 1, 1, 21, 00, 00)
          check_slowing_factor factor
        end
      end

      context 'between 9:30pm - 6am the slowing factor is 0.15' do
        let(:factor) { 0.15 }

        it 'at 9:30pm' do
          travel_to Time.zone.local(2020, 1, 1, 21, 30, 00)
          check_slowing_factor factor
        end

        it 'at Midnight' do
          travel_to Time.zone.local(2020, 1, 1, 00, 00, 00)
          check_slowing_factor factor
        end

        it 'at 5am' do
          travel_to Time.zone.local(2020, 1, 1, 5, 00, 00)
          check_slowing_factor factor
        end
      end

      context 'between 6am - 9am the slowing factor is 0.08' do
        let(:factor) { 0.08 }

        it 'at 6am' do
          travel_to Time.zone.local(2020, 1, 1, 6, 00, 00)
          check_slowing_factor factor
        end

        it 'at 8am' do
          travel_to Time.zone.local(2020, 1, 1, 8, 00, 00)
          check_slowing_factor factor
        end

        it 'at 9am' do
          travel_to Time.zone.local(2020, 1, 1, 9, 00, 00)
          check_slowing_factor factor
        end
      end
    end
  end
end
