require "rails_helper"

feature "Admin can manage clients transactions" do
  background do
    @client = create :client
    charge = create :charge, client_id: @client.id
    payment = create :payment, client_id: @client.id
    admin = create :admin
    sign_in_admin
    visit "/admin/clients/#{@client.id}/charges"
  end

  scenario "Admin can create a charge", js: true do
    click_link "Nuevo Cargo"
    within('#new_charge_modal') do
      fill_in "Concepto", with: "Cargo prueba"
      fill_in "Monto", with: "100"
      fill_in "Notas", with: "Prueba"
      click_button "Guardar"
    end
    expect(page).to have_content "El cargo ha sido creado"
    within("#charges_table") do
      expect(page).to have_content "Cargo prueba"
    end
  end

  scenario "Admin can create a payment", js: true do
    click_link "Nuevo Pago"
    within('#new_payment_modal') do
      fill_in "Concepto", with: "Pago prueba"
      fill_in "Monto", with: "100"
      fill_in "Notas", with: "Prueba"
      click_button "Guardar"
    end
    expect(page).to have_content "El pago ha sido creado"
    within("#charges_table") do
      expect(page).to have_content "Pago prueba"
    end
  end

  scenario "Admin can edit a charge", js: true do
    within("#charge_#{@client.id}") do
      click_link "Editar"
    end
    within("#edit_charge_modal_#{@client.id}") do
      fill_in "Concepto", :with => "Prueba editada"
      click_button "Guardar"
    end
      expect(page).to have_content "El cargo ha sido actualizado"
  end

  scenario "Admin can edit a payment", js: true do
    within("#payment_#{@client.id}") do
      click_link "Editar"
    end
    within("#edit_payment_modal_#{@client.id}") do
      fill_in "Concepto", :with => "Prueba editada"
      click_button "Guardar"
    end
    expect(page).to have_content "El pago ha sido actualizado"
  end

  scenario "Admin can destroy a charge", js: true do
    within("#charge_#{@client.id}") do
      click_link "Eliminar"
      alert = page.driver.browser.switch_to.alert
      page.driver.browser.switch_to.alert.accept
    end
    expect(page).to have_content "El cargo ha sido eliminado"
  end

  scenario "Admin can destroy a payment", js: true do
    within("#payment_#{@client.id}") do
      click_link "Eliminar"
      alert = page.driver.browser.switch_to.alert
      page.driver.browser.switch_to.alert.accept
    end
    expect(page).to have_content "El pago ha sido eliminado"
  end



  scenario "Admin can see a list of existing charges or payments" do
    create :charge, client: @client
    create :service, client: @client
    visit "/admin/clients/#{@client.id}/charges"
    within("#charges_table") do
      expect(page).to have_content "Cargo 1"
      expect(page).to have_content "Pago 1"
    end
  end

  scenario "Admin can see a clients transaction balance" do
    create :payment, quantity: "500", client_id: @client.id
    visit "/admin/clients/#{@client.id}/charges"
    expect(page).to have_content "El saldo del cliente es: $500.00"
    create :charge, quantity: "500", client_id: @client.id
    visit "/admin/clients/#{@client.id}/charges"
    expect(page).to have_content "El saldo del cliente es: $0.00"
  end
end
