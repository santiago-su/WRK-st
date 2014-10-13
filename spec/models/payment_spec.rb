require 'rails_helper'

describe Payment do
  it "should have belong to client" do
    Payment.reflect_on_association(:client)
  end
  it "should have many transactions" do
    Payment.reflect_on_association(:transaction)
  end
  it "should be invalid without date" do
    payment = Payment.new(date: nil)
    payment.should_not be_valid
  end
  it "should be invalid without concept" do
    payment = Payment.new(concept: nil)
    payment.should_not be_valid
  end
  it "should be invalid without quantity" do
    payment = Payment.new(quantity: nil)
    payment.should_not be_valid
  end
  it "should be invalid without client_id" do
    payment = Payment.new(client_id: nil)
    payment.should_not be_valid
  end

  # it "should create a transaction" do
  #   payment = Payment.create!(date: Date.now, concept: "Test", quantity: "1", client_id: "1")
  #   payment.create_transaction! == Transaction.create
  # end

end
