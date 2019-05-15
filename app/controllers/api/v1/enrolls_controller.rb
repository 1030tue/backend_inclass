class Api::V1::EnrollsController < ApplicationController
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
