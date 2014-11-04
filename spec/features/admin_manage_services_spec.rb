require "rails_helper"

feature "Admin can manage services" do
  background do
    @service = create :service
    admin = create(:admin)
    sign_in_admin
    visit "/admin/services"
  end

 scenario "Admin can create a service", js: true do
   click_link "Nuevo Servicio"
   within('#new_service_modal') do
    fill_in "Nombre", with: "Servicio prueba"
    fill_in "Tarifa", with: "100"
    fill_in "Descripción", with: "Prueba"
    click_button "Guardar"
  end
  expect(page).to have_content "El servicio ha sido creado"
  within("#service_table") do
    expect(page).to have_content "Prueba"
  end
 end

 scenario "Admin can edit a service", js: true do
   within("#service_#{@service.id}") do
     click_link "Editar"
   end
   within("#edit_service_modal_#{@service.id}") do
     fill_in "Nombre", :with => "Prueba editada"
     click_button "Guardar"
   end
   within("#service_table") do
     expect(page).to have_content "Prueba editada"
   end
 end

 scenario "Admin can destroy a service", js: true do
   within("#service_#{@service.id}") do
     click_link "Eliminar"
     alert = page.driver.browser.switch_to.alert
     page.driver.browser.switch_to.alert.accept
   end
   expect(page).to have_content "El servicio ha sido eliminado"
 end


 scenario "Admin can see a list of existing services" do
   create :service, name: "Servicio 1"
   visit "/admin/services"
   expect(page).to have_content "Servicio 1"
   create :service, name: "Servicio 2"
   visit "/admin/services"
   expect(page).to have_content "Servicio 2"
  end
end
