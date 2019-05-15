class Api::V1::TeachersController < ApplicationController

  def index
    @teachers= Teacher.all
    render json: @teachers
  end

  def show
    @teacher = Teacher.find(teacher_params[:id])
    render json: @teacher
  end

  def create
    @teacher = Teacher.create(teacher_params)
    render json: @teacher
  end

  def update
    @teacher = Teacher.find(teacher_params[:id])
    @teacher.update(teacher_params)
    @teacher.save
    render json: @teacher
  end

  def destroy
    @teacher = Teacher.find(teacher_params[:id])
    @teacher.destroy
  end

  private

  def teacher_params
    params.permit(:id, :fullname, :email, :img, :phone, :subjects)
  end


end
