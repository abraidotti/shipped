class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @job = Job.new
  end

  def edit
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
      redirect_to new_job_path, notice: "An error occured while creating the new job"
    end
  end

  def update
    @job = Job.find(params[:id])
    if job_boat_params.permitted?
      @job.boats << Boat.find(job_boat_params[:boat_ids])
      @job.save
      redirect_to job_path(@job)
    else
    end
  end

  def remove
  @job = Job.find(params[:id])
  @job.boats.each do |boat,i|
     if boat.id == :boat_id
       @job.boats.delete_at(i)
       break
     end
   end
  end


  private
  def job_boat_params
    params.require(:job).permit(:boat_ids)
  end

  def job_params
    params.require(:job).permit(:name, :description, :origin, :destination, :cost, :containers_needed)
  end
end
