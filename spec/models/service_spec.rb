require 'rails_helper'

describe Service do
  it "should have belong to client" do
    Service.reflect_on_association(:client)
  end
  it "should have many charges" do
    Service.reflect_on_association(:charge)
  end
  it "should be invalid without name" do
    service = Service.new(name: nil)
    service.should_not be_valid
  end
  it "should be invalid without description" do
    service = Service.new(description: nil)
    service.should_not be_valid
  end
  it "should be invalid without amount" do
    service = Service.new(amount: nil)
    service.should_not be_valid
  end

end
