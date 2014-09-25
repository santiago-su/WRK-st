class Admin::ChargesController < ApplicationController
  before_filter :get_client

  def get_client
    @client = Client.find(params[:client_id])
  end

  def index
    @charge = Charge.new
    @charges = @client.charges
    @payment = Payment.new
    @payments = @client.payments
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
    @client.charges.find(params[:id]).destroy
    redirect_to admin_client_charges_path(@client), notice: "Cargo eliminado"
  end

  def charge_params
    params.require(:charge).permit(:date, :concept, :quantity, :notes)
  end

end
