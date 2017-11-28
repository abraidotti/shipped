class BoatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @boats = Boat.where(user_id: current_user.id)
  end

  def new
    @boat = Boat.new
  end

  def edit
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def create
    @boat = current_user.boats.new(boat_params)
    if @boat.save
      redirect_to boats_path
    else
      redirect_to new_boat_path, notice: "An error occured while creating the new boat"
    end
  end

  private
  def boat_params
    params.require(:boat).permit(:name, :container_amount, :location)
  end

end
