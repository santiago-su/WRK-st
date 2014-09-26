class Admin::TransactionsController < ApplicationController
before_action :authenticate_admin!

  def index
    @transactions = Transaction.order(:date)
    @transaction = Transaction.new(date: Time.zone.now)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new transaction_params
    if @transaction.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @transactions = Transaction.all

  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    respond_to do |format|
      format.js
    end
  end


  private

  def transaction_params
    params.require(:transaction).permit(:amount, :type_of_transaction, :concept, :commentary, :date)
  end

end
