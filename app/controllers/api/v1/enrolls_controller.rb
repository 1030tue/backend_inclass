class Api::V1::EnrollsController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authorized

=======
  skip_before_action :authorized 
>>>>>>> b40dc7ec953d9333e25a41b766faf4d8c0acabeb
  def index
    @enrolls= Enroll.all
    render json: @enrolls
  end

  def show
    @enroll = Enroll.find(enroll_params[:id])
    render json: @enroll
  end

  def create
    @enroll = Enroll.create(enroll_params)
    render json: @enroll
  end

  def update
    @enroll = Enroll.find(enroll_params[:id])
    @enroll.update(enroll_params)
    @enroll.save
    render json: @enroll
  end

  def destroy
    @enroll = Enroll.find(enroll_params[:id])
    @enroll.destroy
  end

  private

  def enroll_params
    params.permit(:id, :student_id, :period_id)
  end

end
