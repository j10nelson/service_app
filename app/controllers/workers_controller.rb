class WorkersController < ApplicationController
  def show
      @job = Job.find(params[:id])
  end
end
