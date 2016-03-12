class VehiclesController < ApplicationController
  before_action :vehicle, only: [:show, :edit, :destroy ]
  
  def index
    @vehicles = Vehicle.all
  end
  
  def show
    redirect_to vehicle_services_path(@vehicle)
  end

  def new
    @vehicle = Vehicle.new
  end
  
  def create 
    @vehicle = current_user.vehicles.new(vehicle_params)
    if @vehicle.save
      flash[:notice] = "#{@vehicle.model} saved."
      redirect_to vehicles_path(current_user)
    else 
      flash[:alert] = "There was an error while creating your vehicle."
      render :new
    end
  end

  def edit
  end
  
  def update
    if @vehicle.update(vehicle_params)
      flash[:notice] = "#{@vehicle.model updated}"
      redirect_to vehicles_path(current_user)
    else
      flash[:alert] = "There was an error updating your vehicle"
      render :edit
    end
  end
  
  def destroy
    vehicle = @vehicle.model
    @vehicle.destroy
    flash[:notice] = "#{vehicle} removed"
    redirect_to vehicles_path(current_user)
  end

 private
   def vehicle_params
     params.require(:vehicle).permit(:make, :model, :year)
   end
   
   def vehicle
     @vehicle = current_user.vehicles.find(params[:id])
   end
end
