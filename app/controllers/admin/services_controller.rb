class Admin::ServicesController < Admin::AdminController

  def index
    @services = Service.all.order(:name)
    @service = Service.new
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new service_params
    if @service.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
    @services = Service.all
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.js
    end
  end


  private

  def service_params
    params.require(:service).permit(:name, :description, :amount)
  end
end
