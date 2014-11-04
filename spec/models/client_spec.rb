require 'rails_helper'

describe Client do

  before :each do
    @client = create :client
  end

  it "should have many charges" do
    @client.should have_many(:charges)
  end
  it "should have many payments" do
    @client.should have_many(:payments)
  end
  it "should have many services" do
    @client.should have_many(:services)
  end
  it "should be invalid without name" do
    @client.name = nil
    @client.should_not be_valid
  end
  it "should be invalid without meeting_office_hours" do
    @client.meeting_office_hours = nil
    @client.should_not be_valid
  end
  it "should be invalid without entry_date" do
    @client.entry_date = nil
    @client.should_not be_valid
  end

  it "should have a balance" do
    @client.balance
  end

end
