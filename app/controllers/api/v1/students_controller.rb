class Api::V1::StudentsController < ApplicationController
  skip_before_action :authorized

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
    Enroll.create(student_id: @student.id, period_id: params[:period_id])
    render json: @student
  end


  def update
    @student = Student.find(student_params[:id])
    @student.update(student_params)
    Trip.create(student_id: @student.id, period_id: params[:period_id], destination: params[:destination], start_time: Time.new)
    @student.save
    render json: @student
  end


  # def update
  #   @student = Student.find(student_params[:id])
  #   @student.update(student_params)
  #   Trip.create(student_id: @student.id, period_id: params[:period_id], destination: params[:destination], start_time: Time.new)
  #   @student.save
  #   render json: @student
  # end

  def updateTimer
    @student = Student.find(student_params[:id])
    @student.update(student_params)
    @student.trips.last.update(endtime:Time.new, duration: Time.new - @student.trips.last.start_time)
    @student.save
    render json: @student
  end


  def destroy
    @student = Student.find(student_params[:id])
    @enroll=Enroll.find_by(student_id: student_params[:id])
    @enroll.destroy
    @student.destroy
  end

  private

  def student_params
    params.permit(:id, :firstname, :lastname, :email, :age, :img, :grade, :gender, :guardians_name, :relationship_to_student, :guardians_email, :guardians_phone, :inclass, :demerits, :enrolledClasses)
  end


end
