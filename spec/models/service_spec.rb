require 'rails_helper'

describe Service do

  before :each do
    @service = create :service
  end

  it "should belong to client" do
    @service.should belong_to(:client)
  end
  it "should be invalid without name" do
    @service.name = nil
    @service.should_not be_valid
  end
  it "should be invalid without description" do
    @service.description = nil
    @service.should_not be_valid
  end
  it "should be invalid without amount" do
    @service.amount = nil
    @service.should_not be_valid
  end

end
