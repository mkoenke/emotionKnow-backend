class ParentsController < ApplicationController
    def index 
        parents = Parent.all
        render json: parents
    end

    def show
        parent = Parent.find(params[:id])
        render json: parent
    end
    def create
        parent = Parent.new(parent_params)
        if parent.save 
            ParentMailer.welcome_email(parent).deliver_now
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
        params.permit(:email, :report_id)
    end

end

