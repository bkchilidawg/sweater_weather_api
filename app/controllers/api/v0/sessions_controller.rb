class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: ErrorSerializer.new("Email and/or password are incorrect").error_json(401), status: :unauthorized
    end
  end
end
