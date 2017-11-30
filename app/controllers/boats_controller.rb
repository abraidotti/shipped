class BoatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @boats = Boat.where(user_id: current_user.id)
  end

  def new
    @boat = Boat.new
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to boats_path
    else
      redirect_to edit_boat_path, notice: "An error occured while updating the boat"
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
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
    params.require(:boat).permit(:name, :container_amount, :location, :avatar)
  end

end
