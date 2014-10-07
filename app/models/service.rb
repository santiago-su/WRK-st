class Service < ActiveRecord::Base
  validates_presence_of :name, :description, :amount
  belongs_to :client
  has_many :charges
end
