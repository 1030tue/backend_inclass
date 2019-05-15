class Api::V1::TripsController < ApplicationController
  def index
    @trips= Trip.all
    render json: @trips
  end

  def show
    @trip = Trip.find(trip_params[:id])
    render json: @trip
  end

  def create
    @trip = Trip.create(trip_params)
    render json: @trip
  end

  def update
    @trip = Trip.find(trip_params[:id])
    @trip.update(trip_params)
    @trip.save
    render json: @trip
  end

  def destroy
    @trip = Trip.find(trip_params[:id])
    @trip.destroy
  end

  private

  def trip_params
    params.permit(:id, :student_id, :period_id, :destination, :duration, :endtime)
  end

end
