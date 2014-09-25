class Payment < ActiveRecord::Base
  validates_presence_of :date, :concept, :quantity, :client_id
  belongs_to :client
end
