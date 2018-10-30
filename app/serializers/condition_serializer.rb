class ConditionSerializer < ActiveModel::Serializer
    attributes :id, :desc, :code
    has_many :activity_conditions
    has_many :activities, through: :activity_conditions
  end