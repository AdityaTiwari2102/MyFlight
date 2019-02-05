class FlightsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      flash[:success] = "Flight created successfully"
      redirect_to flights_path
    else
      render 'new'
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      flash[:success] = "Flight details updated"
      redirect_to flights_path
    else
      render 'edit'
    end
  end

  def destroy
    Flight.find(params[:id]).destroy
    flash[:danger] = "Flight deleted"
    redirect_to flights_path
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    #redirect_to(root_url) unless @user == current_user
    redirect_to(root_url) unless current_user?(@user)
  end

  private
    def flight_params
      params.require(:flight).permit(:airline_name, :flight_code, :airplane_type)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
