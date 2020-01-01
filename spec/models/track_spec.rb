require 'rails_helper'

describe Track do
  describe '#slowing_factor' do
    let(:track) { build(:track) }

    it 'should return a number between 0 and 0.35' do
      expect(track.slowing_factor).to be_between(0.0, 0.35)
    end
  end
end
