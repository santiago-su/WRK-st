class Service < ActiveRecord::Base
  validates_presence_of :name, :description, :amount
end