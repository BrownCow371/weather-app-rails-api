class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :desc, :max_temp, :min_temp, :max_wind_speed
    has_many :activity_conditions
    has_many :conditions, through: :activity_conditions
  end