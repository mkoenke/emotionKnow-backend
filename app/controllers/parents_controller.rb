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
        parent = Parent.create!(parent_params)
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

