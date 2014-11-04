FactoryGirl.define do

  factory :admin do
    email "admin@example.com"
    password  "secretsecret"
  end

  factory :client do
    name "Cliente 1"
    meeting_office_hours  2
    entry_date Time.now
  end

  factory :transaction do
    amount 100
    concept "Prueba"
    date Time.now
    notes ""
  end

  factory :service do
    name "Servicio 1"
    description "Prueba"
    amount 100
  end

  factory :payment do
    concept "Pago 1"
    quantity 100
    date Time.now
    notes ""
  end

  factory :charge do
    concept "Cargo 1"
    quantity 100
    date Time.now
    notes ""
  end
end
