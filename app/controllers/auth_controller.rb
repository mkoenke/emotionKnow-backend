class AuthController < ApplicationController
    skip_before_action :authorized_child, :authorized_parent, only: [:create, :create_parent]
  
    def create
      @child = Child.find_by(username: child_login_params[:username])
      if @child && @child.authenticate(child_login_params[:password])
        token = encode_token({ child_id: @child.id })
        render json: { child: ChildSerializer.new(@child), jwt: token }, status: :accepted
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
    
    def create_parent
      @parent = Parent.find_by(email: parent_login_params[:email])
      puts @parent
      if @parent && @parent.authenticate(parent_login_params[:password])
        token = encode_token({ parent_id: @parent.id })
        puts token
        render json: { parent: ParentSerializer.new(@parent), jwt: token }, status: :accepted
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end 
  
    private
  
    def child_login_params
      params.permit(:username, :password)
    end

    def parent_login_params
      params.permit(:email, :password)
    end
  end