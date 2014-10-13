require 'rails_helper'

describe Transaction do
  it "should have belong to payment" do
    Transaction.reflect_on_association(:payment)
  end
  it "should be invalid without type_of_transaction" do
    transaction = Transaction.new(type_of_transaction: nil)
    transaction.should_not be_valid
  end
  it "should be invalid without concept" do
    transaction = Transaction.new(concept: nil)
    transaction.should_not be_valid
  end
  it "should be invalid without amount" do
    transaction = Transaction.new(amount: nil)
    transaction.should_not be_valid
  end
  it "should be invalid without date" do
    transaction = Transaction.new(date: nil)
    transaction.should_not be_valid
  end

end
