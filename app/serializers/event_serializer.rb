class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :start_date, :end_date, :status, :created_at, :updated_at
end
