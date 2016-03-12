class ServicesController < ApplicationController
  before_action :vehicle 

  def index
    @services = @vehicle.services 
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new 
  end

  def create
    if @service = @vehicle.services.create(service_params)
      flash[:notice] = "Service Saved"
    redirect_to vehicle_services_path(@vehicle)
    else 
      flash[:alert] = "Something went Wrong"
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "Service Updated"
      redirect_to vehicle_service_path(@vehicle, @service)
    else
      render :edit 
    end
  end

  def destroy
    service = @service.name
    @service.destroy 
    flash[:notice] = "#{service} deleted"
    redirect_to post_path
  end

  private

  def vehicle
   @vehicle = current_user.vehicles.find(params[:vehicle_id])
  end

  def service_params
    params.require(:service).permit(:name, :provider, :date, :mileage, :description, :avatar)
  end

end
