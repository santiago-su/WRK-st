class Admin::LocationsController < ApplicationController

  def index
    @locations = Location.all
    @location = Location.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params

    if @location.save
      format.html { redirect_to @location, notice: 'Espacio creado.' }
      format.json { render action: 'show', status: :created, location: @location }
      format.js   { render action: 'show', status: :created, location: @location }
    else
      format.html { render action: 'new' }
      format.json { render json: @location.errors, status: :unprocessable_entity }
      format.js   { render json: @location.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to admin_locations_path, notice: "Espacio actualizado"
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
