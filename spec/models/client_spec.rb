require 'rails_helper'

describe Client do
  it "should have many charges" do
    Client.reflect_on_association(:charges)
  end
  it "should have many payments" do
    Client.reflect_on_association(:payment)
  end
  it "should have many services" do
    Client.reflect_on_association(:service)
  end
  it "should be invalid without name" do
    client = Client.new(name: nil)
    client.should_not be_valid
  end
  it "should be invalid without meeting_office_hours" do
    client = Client.new(meeting_office_hours: nil)
    client.should_not be_valid
  end
  it "should be invalid without entry_date" do
    client = Client.new(entry_date: nil)
    client.should_not be_valid
  end

  it "should have a balance" do
    client = Client.create
    client.balance
  end

end
