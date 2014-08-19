class Admin::TransactionsController < ApplicationController
before_action :authenticate_admin!

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new transaction_params

    if @transaction.save
      redirect_to admin_transactions_path, notice: "Transacción creada"
    else
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to admin_transactions_path, notice: "Monto actualizado"
    else
      render :edit
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
