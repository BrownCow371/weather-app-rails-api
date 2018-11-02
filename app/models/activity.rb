class Activity < ApplicationRecord
    has_many :activity_conditions
    has_many :conditions, through: :activity_conditions

    validates :desc, presence: true

    def self.suggestion(zip)
        weather = Weather.find_by(zip: zip)

        # need to filter activitied based on condition, wind speed, min and max temp

        possible_activities = Activity.all.select do |activity|
            (activity.min_temp ? weather.temp >= activity.min_temp : true) &&
            (activity.max_temp ? weather.temp <= activity.max_temp : true) &&
            (activity.max_wind_speed ? weather.wind_speed <= activity.max_wind_speed : true) &&
            !!(activity.conditions.find do |condition|
                condition.desc == "Any" || condition.desc == weather.main
            end)
        end

        possible_activities.sample
    end

end