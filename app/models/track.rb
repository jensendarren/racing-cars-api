class Track < ApplicationRecord
  def slowing_factor
    rand(0..35) * 0.01
  end
end