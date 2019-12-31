class Track < ApplicationRecord
  def slowing_factor
    rand(0..35).to_f * 0.01
  end
end