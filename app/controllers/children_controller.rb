class ChildrenController < ApplicationController
    def index 
        children = Child.all
        render json: children
    end

    def show
        child = Child.find(params[:id])
        render json: child
    end
    def create
        child = Child.create!(child_params)
        render json: child
    end
    
    def destroy
        child = Child.find(params[:id])
        child.destroy!
        render json: {}
    end

    def update
        child = Child.find(params[:id])
        child.update!(child_params)
        render json: child
    end

    private

    def child_params
        params.permit(:username, :password, :parent_id)
    end

end
