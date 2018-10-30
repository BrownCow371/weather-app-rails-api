class Condition < ApplicationRecord
    has_many :activity_conditions
    has_many :activities, through: :activity_conditions
end