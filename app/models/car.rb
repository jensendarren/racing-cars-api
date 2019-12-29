class Car < ApplicationRecord
  def as_json options={}
    super({
      :except => [:created_at,:updated_at],
      :methods => [:max_speed_on_track]
    })
  end

  def max_speed
    "#{self[:max_speed]}km/h"
  end

  def max_speed_on_track
    'no track selected'
  end
end
