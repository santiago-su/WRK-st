class Client < ActiveRecord::Base
  validates_presence_of :name, :meeting_office_hours, :location, :entry_date
  has_many :locations
end