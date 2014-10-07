class Admin::ChargesController < Admin::AdminController
  before_filter :get_client

  def get_client
    @client = Client.find(params[:client_id])
  end

  def index
    @charge = Charge.new date: Time.zone.now
    @charges = @client.charges
    @payment = Payment.new date: Time.zone.now
    @payments = @client.payments
    @services = Service.all
  end

  def create
    @charge = @client.charges.new(charge_params)
    if @charge.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def update
    @charge = @client.charges.find(params[:id])
    if @charge.update(charge_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @charge = @client.charges.find(params[:id])
    @charge.destroy
    respond_to do |format|
      format.js
    end
  end

  def charge_params
    params.require(:charge).permit(:date, :concept, :quantity, :notes)
  end

end
