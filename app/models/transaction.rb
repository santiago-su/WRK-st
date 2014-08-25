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

  def balance
    total = 0
    x = 0
    y = 0
    ingr = Transaction.where(type_of_transaction: "1")
    egre = Transaction.where(type_of_transaction: "2")
    ingr.each { |a| x += a.amount }
    egre.each { |b| y += b.amount }
    total = x - y
  end

end
