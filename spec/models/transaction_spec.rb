require 'rails_helper'

describe Transaction do

  before :each do
    @transaction = create :transaction
  end
  it "should belong to payment" do
    @transaction.should belong_to(:payment)
  end
  it "should be invalid without type_of_transaction" do
    @transaction.type_of_transaction = nil
    @transaction.should_not be_valid
  end
  it "should be invalid without concept" do
    @transaction.concept = nil
    @transaction.should_not be_valid
  end
  it "should be invalid without amount" do
    @transaction.amount = nil
    @transaction.should_not be_valid
  end
  it "should be invalid without date" do
    @transaction.date = nil
    @transaction.should_not be_valid
  end

end
