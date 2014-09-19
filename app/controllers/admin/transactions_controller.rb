class Admin::TransactionsController < ApplicationController
before_action :authenticate_admin!

  def index
    @transactions = Transaction.all.sort_by(&:date)
    @transaction = Transaction.new
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new transaction_params
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to admin_transactions_path, notice: "Su transacción ha sido guardada" }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @transactions = Transaction.all

  end

  def update
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to admin_transactions_path, notice: "Transacción eliminada"
  end


  private

  def transaction_params
    params.require(:transaction).permit(:amount, :type_of_transaction, :concept, :commentary, :date)
  end

end
