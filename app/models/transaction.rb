class Transaction < ActiveRecord::Base

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

end
