require 'rails_helper'

describe Admin do

  it "should have a balance" do
    admin = create :admin
    admin.balance
  end

end
