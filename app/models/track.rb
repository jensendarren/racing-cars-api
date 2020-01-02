class Track < ApplicationRecord
  #Choose random value of the surface's slowing factor from the range [ 0.. 35 ]
  def slowing_factor
    rand(0..35) * 0.01
  end
end