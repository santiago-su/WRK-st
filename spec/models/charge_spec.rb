require 'rails_helper'

describe Charge do
  it "should belong to client" do
    Charge.reflect_on_association(:client)
  end
  it "should belong to service" do
    Charge.reflect_on_association(:service)
  end
  it "should be invalid without date" do
    charge = Charge.new(date: nil)
    charge.should_not be_valid
  end
  it "should be invalid without quantity" do
    charge = Charge.new(quantity: nil)
    charge.should_not be_valid
  end
  it "should be invalid without concept" do
    charge = Charge.new(concept: nil)
    charge.should_not be_valid
  end
  it "should be invalid without client_id" do
    charge = Charge.new(client_id: nil)
    charge.should_not be_valid
  end
end
