class Transaction < ActiveRecord::Base
  validates_presence_of :amount, :type_of_transaction, :concept, :date

  def ingreso(transaction)
    if transaction.type_of_transaction == "1"
      "x"
    end
  end

  def egreso(transaction)
    if transaction.type_of_transaction == "2"
      "x"
    end
  end

  def balance(transactions)
    total = 0
    ingr = @transactions.select { |r| r.type_of_transaction == "1"}
    egre = @transactions.select { |g| g.type_of_transaction == "2"}
    total = ingr.amount - egr.amount
    total
  end

end
