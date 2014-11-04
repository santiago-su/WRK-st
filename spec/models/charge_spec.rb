require 'rails_helper'

describe Charge do

  before :each do
    @client = create :client
    @charge = Charge.new date: Time.now, quantity: 230, concept: "asdf", client_id: @client.id
  end

  it "should be valid" do
    @charge.should be_valid
  end

  it "should belong to client" do
    @charge.should belong_to(:client)
  end
  it "should be invalid without date" do
    @charge.date = nil
    @charge.should_not be_valid
  end
  it "should be invalid without quantity" do
    @charge.quantity = nil
    @charge.should_not be_valid
  end
  it "should be invalid without concept" do
    @charge.concept = nil
    @charge.should_not be_valid
  end
  it "should be invalid without client_id" do
    @charge.client_id = nil
    @charge.should_not be_valid
  end
end
