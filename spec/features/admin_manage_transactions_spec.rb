require "rails_helper"

feature "Admin can manage transactions" do
  background do
    @transaction = create :transaction, type_of_transaction: 1
    admin = create(:admin)
    sign_in_admin
    visit "/admin/transactions"
  end

 scenario "Admin can create a transaction", js: true do
  click_link "Nuevo movimiento"
  within('#new_transaction_modal') do
    choose "Ingreso"
    fill_in "Monto", with: "100"
    fill_in "Concepto", with: "Prueba"
    fill_in "Notas", with: "Prueba"
    click_button "Guardar"
  end
  expect(page).to have_content "El movimiento ha sido creado"
  within("#transaction_table") do
    expect(page).to have_content "Prueba"
  end
 end

 scenario "Admin can edit a transaction", js: true do
   within("#transaction_#{@transaction.id}") do
     click_link "Editar"
   end
   within("#edit_transaction_modal_#{@transaction.id}") do
     fill_in "Concepto", :with => "Prueba editada"
     click_button "Guardar"
   end
   expect(page).to have_content "Prueba editada"
 end

 scenario "Admin can destroy a transaction", js: true do
   within("#transaction_#{@transaction.id}") do
     click_link "Eliminar"
     alert = page.driver.browser.switch_to.alert
     page.driver.browser.switch_to.alert.accept
   end
   expect(page).to have_content "El movimiento ha sido eliminado"
 end


 scenario "Admin can see a list of existing transactions" do
   visit "/admin/transactions"
   expect(page).to have_content "Prueba"
   create :transaction, type_of_transaction: "1", concept: "Movimiento 2"
   visit "/admin/transactions"
   expect(page).to have_content "Movimiento 2"
  end

  scenario "Admin can see transaction balance" do
    create :transaction, type_of_transaction: "1"
    visit "/admin/transactions"
    expect(page).to have_content "Mi saldo es $200.00"
    create :transaction, type_of_transaction: "2"
    visit "/admin/transactions"
    expect(page).to have_content "Mi saldo es $100.00"
  end
end
