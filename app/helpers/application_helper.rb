module ApplicationHelper

  def charge_services_data  
    @services.map do |x|
      ["#{x.name}  $#{x.amount}", x.id, {'data-service-amount'=> x.amount,
      'data-service-name'=> x.name, 'data-service-description'=> x.description}]
    end
  end
end
