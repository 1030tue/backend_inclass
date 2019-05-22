class Api::V1::TeachersController < ApplicationController
  skip_before_action :authorized
  #, only: [:create]

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
      if @teacher.valid?
        @token = encode_token({ teacher_id: @teacher.id, teachername: @teacher.fullname })
        render json: { teacher: TeacherSerializer.new(@teacher), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create a new teacher' }, status: :not_acceptable
      end
  end


  def profile
    render json: { teacher: TeacherSerializer.new(current_teacher) },
    status: :accepted
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
    params.permit(:id, :fullname, :email, :img, :phone, :subject, :password)
  end


end
