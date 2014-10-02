class Admin::Clients::ServicesController < Admin::AdminController
  before_filter :get_client

  def get_client
    @client = Client.find(params[:client_id])
  end

  def index
  end
end
