class ParentsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def index 
        parents = Parent.all
        render json: parents
    end

    def show
        parent = Parent.find(params[:id])
        render json: parent
    end
    def create
        parent = Parent.create(parent_params)
        # if parent.save 
        #     ParentMailer.welcome_email(parent).deliver_now
        # end 
        render json: parent
    end
    
    def destroy
        parent = Parent.find(params[:id])
        parent.destroy!
        render json: {}
    end

    def update
        parent = Parent.find(params[:id])
        parent.update!(parent_params)
        render json: parent
    end

    private

    def parent_params
        params.require(:parent).permit(:email)
    end

end

