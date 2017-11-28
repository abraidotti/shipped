class JobsController < ApplicationController
  def new
  end

  def edit
  end

  def index
    @jobs = Job.all
  end

  def show
  end
end
