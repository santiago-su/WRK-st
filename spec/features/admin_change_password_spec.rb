require "rails_helper"

feature "Admin can change his password" do
  scenario do
    admin = create :admin
    sign_in_admin
    visit "admins/edit"
    fill_in "Contraseña actual", with: "secretsecret"
    fill_in "Nueva Contraseña", with: "123456789"
    fill_in "Confirmar nueva contraseña", with: "123456789"
    click_button "Actualizar"
    expect(page).to have_content "Tu contraseña ha sido actualizada."
  end
end
