class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
    def create
      @child = Child.find_by(username: child_login_params[:username])
      if @child && @child.authenticate(child_login_params[:password])
        token = encode_token({ child_id: @child.id })
        render json: { child: ChildSerializer.new(@child), jwt: token }, status: :accepted
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def child_login_params
      params.permit(:username, :password)
    end
  end