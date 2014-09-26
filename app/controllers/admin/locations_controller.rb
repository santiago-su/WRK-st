class Admin::LocationsController < Admin::AdminController

  def index
    @locations = Location.all.order(:name)
    @location = Location.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    if @location.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
    @locations = Location.all
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.js
    end
  end


  private

  def location_params
    params.require(:location).permit(:name, :description)
  end
end
