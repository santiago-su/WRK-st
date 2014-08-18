class Admin::LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params

    if @location.save
      redirect_to admin_locations_path, notice: "Espacio creado"
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to admin_locations_path, notice: "Producto actualizado"
    else
      render :edit
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
