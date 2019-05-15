class Api::V1::PeriodsController < ApplicationController
  def index
    @periods= Period.all
    render json: @periods
  end

  def show
    @period = Period.find(period_params[:id])
    render json: @period
  end

  def create
    @period = Period.create(period_params)
    render json: @period
  end

  def update
    @period = Period.find(period_params[:id])
    @period.update(period_params)
    @period.save
    render json: @period
  end

  def destroy
    @period = Period.find(period_params[:id])
    @period.destroy
  end

  private

  def period_params
    params.permit(:id, :teacher_id, :classname, :date, :period_num, :duration)
  end

end
