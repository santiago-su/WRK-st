class Transaction < ActiveRecord::Base
  validates_presence_of :amount, :type_of_transaction, :concept, :date
  belongs_to :payment
end
