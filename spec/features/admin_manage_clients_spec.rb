require "rails_helper"

feature "Admin can manage clients" do
  background do
    @client = create :client
    admin = create :admin
    sign_in_admin
    visit "/admin/clients"
  end

 scenario "Admin can create a new client", js: true do
  click_link "Nuevo Cliente"
  within('#new_client_modal') do
    fill_in "Nombre", :with => "Cliente 1"
    fill_in "Horas sala de juntas", with: "42"
    click_button "Guardar"
  end
  expect(page).to have_content "El cliente ha sido creado"
  within("#clients_table") do
    expect(page).to have_content "Cliente 1"
  end
 end

 scenario "Admin can edit a client", js: true do
   within("#client_#{@client.id}") do
     click_link "Detalles"
   end
     current_path.should == "/admin/clients/#{@client.id}"
   click_link "Editar"
   fill_in "Nombre", :with => "Cliente editado"
   click_button "Guardar"
   expect(page).to have_content "El cliente ha sido actualizado"
 end

 scenario "Admin can destroy a client", js: true do
   within("#client_#{@client.id}") do
     click_link "Detalles"
   end
     current_path.should == "/admin/clients/#{@client.id}"
   click_link "Eliminar"
   alert = page.driver.browser.switch_to.alert
   page.driver.browser.switch_to.alert.accept
   current_path.should == "/admin/clients"
   expect(page).to have_content "Cliente eliminado"
 end


 scenario "Admin can see a client charges" do
   within("#client_#{@client.id}") do
     click_link "Movimientos"
   end
   current_path.should == "/admin/clients/#{@client.id}/charges"
   expect(page).to have_content "Movimientos del cliente #{@client.name}"
 end

 scenario "Admin can see a clients transactions when it clicks the balance" do
   within("#client_#{@client.id}") do
     click_link "balance"
   end
   current_path.should == "/admin/clients/#{@client.id}/charges"
   expect(page).to have_content "Movimientos del cliente #{@client.name}"
 end

 scenario "Admin can see a list of existing clients" do
   create :client, name: "Cliente 1"
   visit "/admin/clients"
   expect(page).to have_content "Cliente 1"
   create :client, name: "Cliente 2"
   visit "/admin/clients"
   expect(page).to have_content "Cliente 2"
 end
end
