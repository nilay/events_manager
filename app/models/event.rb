class Event < ApplicationRecord
	extend Enumerize

	enumerize :status, in: [:draft, :published], default: :draft
	validates_presence_of :name, :description, :location, :start_date, :end_date, presence: true, if: Proc.new{|f| f.status == :published }

	  default_scope {where(deleted: :false)}

	  scope :published, -> {where(status: :published)}
end
