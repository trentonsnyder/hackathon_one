class ServicesController < ApplicationController
  before_action :vehicle 

  def index
    @services = @vehicle.services 
  end

  def show
    @service = Service.find(params[:vehicle_id])
  end

  def new
    @service = Service.new 
  end

  def create
    if @service = @vehicle.service.create(service_params)
      flash[:notice] = "Service Saved"
    redirect_to vehicle_services_path(@vehicle)
    else 
      flash[:alert] = "Something went Wrong"
      render :new
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      flash[:notice] = "Service Updated"
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
    params.require(:service).permit(:name, :provider, :date, :mileage)
  end

end
