class ReportsController < ApplicationController
    def index 
        reports = Report.all
        render json: reports
    end

    def show
        report = Report.find(params[:id])
        render json: report
    end
    def create
        report = Report.create!(report_params)
        render json: report
    end
    
    def destroy
        report = Report.find(params[:id])
        report.destroy!
        render json: {}
    end

    def update
        report = Report.find(params[:id])
        report.update!(report_params)
        render json: report
    end

    private

    def report_params
        params.permit(:email, :report_id)
    end

end
