require "rails_helper"

describe "Admin sign in", :type => :feature do
  before :each do
    Admin.create(:email => 'admin@example.com', :password => 'secretsecret')
  end

  it "signs me in" do
    visit '/admins/sign_in'

    within("#new_admin") do
      fill_in 'Email', :with => 'admin@example.com'
      fill_in 'Contraseña', :with => 'secretsecret'
    end
    click_button 'Iniciar Sesión'

    expect(page).to have_content 'Sesión iniciada.'
  end
end
