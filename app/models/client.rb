class Client < ActiveRecord::Base
  validates_presence_of :name, :meeting_office_hours, :entry_date
  has_many :charges
end
