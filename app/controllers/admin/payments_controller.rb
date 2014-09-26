class Admin::PaymentsController < ApplicationController
  before_filter :get_client

  def get_client
    @client = Client.find(params[:client_id])
  end


  def create
    @payment = @client.payments.new(payment_params)
    if @payment.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def update
    @payment = @client.payments.find(params[:id])
    if @payment.update(payment_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @payment = @client.payments.find(params[:id])
    @payment.destroy
    respond_to do |format|
      format.js
    end
  end

  def payment_params
    params.require(:payment).permit(:date, :concept, :quantity, :notes)
  end

end
