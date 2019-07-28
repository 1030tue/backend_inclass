class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    #byebug
    JWT.encode(payload, ENV['jwt_secret'])
  end

  def auth_header
    #byebug
    request.headers['Authorization']
  end

  def decoded_token
    #byebug
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['jwt_secret'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end


  def current_teacher
    if decoded_token

      teacher_id = decoded_token[0]['teacher_id']
      teacher = Teacher.find_by(id: teacher_id)
    end
  end

  def logged_in?
    !! current_teacher
  end

  def authorized
    render json: { message: 'Please log in' },
    status: :unauthorized unless logged_in?
  end
end
