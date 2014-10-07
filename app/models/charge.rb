class Charge < ActiveRecord::Base
  validates_presence_of :date, :quantity, :concept, :client_id
  belongs_to :client
  belongs_to :service
end
