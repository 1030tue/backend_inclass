class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session
  before_action :authorized

  def encode_token(payload)
    # payload => { beef: 'steak' }
    JWT.encode(payload, ENV['jwt_secret'])
    # byebug
  end

  def auth_header
    # { 'Authorization': 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # headers: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, ENV['jwt_secret'], true, algorithm: 'HS256')
        # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end


  def current_teacher
    if decoded_token
      # decoded_token=> [{"teacher_id"=>2}, {"alg"=>"HS256"}]
      # or nil if we can't decode the token
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
