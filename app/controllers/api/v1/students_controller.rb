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
    Enroll.create(student_id: @student.id, period_id: 1)
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
    params.permit(:id, :firstname, :lastname, :email, :age, :img, :grade, :gender, :guardians_name, :relationship_to_student, :guardians_email, :guardians_phone, :inclass, :demerits, :enrolledClasses)
  end


end
