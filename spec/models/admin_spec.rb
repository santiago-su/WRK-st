require 'rails_helper'

describe Admin do
  it "should have many transactions" do
    Admin.reflect_on_association(:transaction)
  end

  it "should have a balance" do
    admin = Admin.create
    admin.balance
  end

end
