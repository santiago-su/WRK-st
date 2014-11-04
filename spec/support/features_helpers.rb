def sign_in_admin
  visit '/admins/sign_in'
  within("#new_admin") do
    fill_in 'Email', :with => 'admin@example.com'
    fill_in 'Contraseña', :with => 'secretsecret'
  end
  click_button 'Iniciar Sesión'
end

# def have_flash_message(msg)
#   within ".alert" do
#     expect(page).to have_content msg
#   end
# end
