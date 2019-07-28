
class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    teacher = Teacher.find_by(email: login_params[:email])
    if teacher && teacher.authenticate(login_params[:password])
      token = encode_token({ teacher_id: teacher.id, email: teacher.email })
      render json: { teacher: TeacherSerializer.new(teacher), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password 💎' }, status: :unauthorized
    end
  end




  private
  def login_params
    params.require(:teacher).permit(:email, :password)
  end
end
