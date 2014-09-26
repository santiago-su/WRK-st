class Admin::ClientsController < Admin::AdminController

  def index
    @clients = Client.all.sort_by(&:entry_date).reverse
    @client = Client.new entry_date: Time.zone.now
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new client_params
    if @client.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to admin_clients_path, notice: "Cliente eliminado"
  end

  private

  def client_params
    params.require(:client).permit(:name, :meeting_office_hours, :location_id, :entry_date, :responsible, :email, :description, :phone)
  end
end
