class Location < ActiveRecord::Base
  validates_presence_of :name, :description
  belongs_to :client
  has_many :clients
end
