require 'rails_helper'

describe Car do
  let(:car) { build(:car) }

  it 'should be valid' do
    expect(car).to be_valid
  end
end
