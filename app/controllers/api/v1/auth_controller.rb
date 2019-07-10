
class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    # byebug
    teacher = Teacher.find_by(email: login_params[:email])
    #Teacher#authenticate comes from BCrypt
    if teacher && teacher.authenticate(login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ teacher_id: teacher.id, email: teacher.email })
      # byebug
      render json: { teacher: TeacherSerializer.new(teacher), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password 💎' }, status: :unauthorized
    end
  end


  # def auto_login
  #   if current_teacher
  #     render json: current_teacher
  #   else
  #     render json: {errors: "Invalid email or password"}
  #   end
  # end


  private
  def login_params
    params.require(:teacher).permit(:email, :password)
  end
end
