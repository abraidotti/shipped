require 'pry'
class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      redirect_to new_job_path, notice: @job.errors.messages[:origin][0]
    end
  end

  def update
    @job = Job.find(params[:id])
    if job_boat_params[:boat_ids]
      @job.boats << Boat.find(job_boat_params[:boat_ids])
      @job.save
      redirect_to job_path(@job)
    else
      if @job.update(job_params)
        redirect_to job_path(@job)
      else
        redirect_to edit_job_path(@job), notice: @job.errors.full_messages.last
      end
    end
  end

  def remove
  @job = Job.find(params[:id])
  for i in 0...@job.boats.length do
     if @job.boats[i].id == params[:boatid].to_i
       @job.boats.delete(@job.boats[i])
       @job.save
       break
     end
   end
   redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path
  end

  private
  def job_boat_params
    params.require(:job).permit(:boat_ids)
  end

  def job_params
    params.require(:job).permit(:name, :description, :origin, :destination, :cost, :containers_needed)
  end
end
