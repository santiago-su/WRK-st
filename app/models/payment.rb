class Payment < ActiveRecord::Base
  validates_presence_of :date, :concept, :quantity, :client_id
  belongs_to :client
  has_many :transactions

  def create_transaction!
    transactions.create!(concept: concept, date: date, amount: quantity, notes: notes, type_of_transaction: "1")
  end
end
