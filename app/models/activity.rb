class Activity < ApplicationRecord
    has_many :activity_conditions
    has_many :conditions, through: :activity_conditions

    validates :desc, presence: true
end