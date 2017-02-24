class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      @job[:job_status] = params[:job_status]
      @job[:worker_id] = current_worker.id
      if @job.save
        respond_to do |format|
          format.html { redirect_to jobs_path(@job) }
          format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end


end
