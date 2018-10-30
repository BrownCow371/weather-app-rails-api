class ActivityConditionSerializer < ActiveModel::Serializer
    attributes :id, :condition_id, :activity_id
    belongs_to :activity
    belongs_to :conditions
  end