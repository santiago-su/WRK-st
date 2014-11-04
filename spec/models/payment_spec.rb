require 'rails_helper'

describe Payment do

  before :each do
    @client = create :client
    @payment = create :payment, client_id: @client.id
  end

  it "should belong to client" do
    @payment.should belong_to(:client)
  end

  it "should be invalid without date" do
    @payment.date = nil
    @payment.should_not be_valid
  end
  it "should be invalid without concept" do
    @payment.concept = nil
    @payment.should_not be_valid
  end
  it "should be invalid without quantity" do
    @payment.quantity = nil
    @payment.should_not be_valid
  end
  it "should be invalid without client_id" do
    @payment.client_id = nil
    @payment.should_not be_valid
  end

end
