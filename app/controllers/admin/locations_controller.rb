class Admin::LocationsController < ApplicationController

  def index
    @locations = Location.all.order(:name)
    @location = Location.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    respond_to do |format|
      if @location.save
        format.js
      else
        render nothing: true
      end
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
    respond_to do |format|
      if @location.update(location_params)
        format.js
      else
        render nothing: true
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to admin_locations_path, notice: "Espacio eliminado"
  end


  private

  def location_params
    params.require(:location).permit(:name, :description)
  end
end
