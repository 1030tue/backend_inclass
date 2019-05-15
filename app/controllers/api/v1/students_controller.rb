class Api::V1::StudentsController < ApplicationController

  def index
    @students= Student.all
    render json: @students
  end

  def show
    @student = Student.find(student_params[:id])
    render json: @student
  end

  def create
    @student = Student.create(student_params)
    render json: @student
  end

  def update
    @student = Student.find(student_params[:id])
    @student.update(student_params)
    @student.save
    render json: @student
  end

  def destroy
    @student = Student.find(student_params[:id])
    @student.destroy
  end

  private

  def student_params
    params.permit(:id, :firstname, :lastname, :email, :age, :img, :grade, :gender, :guardians_email, :guardians_phone, :inclass, :demerits)
  end


end
