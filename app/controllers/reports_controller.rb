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
        report = Report.new(report_params)
        parent = Parent.find(params[:id])
        if report.save
            ParentMailer.sentiment_report(parent).deliver_now
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
        params.permit(:file, :title, :doc, :journal_entry_id)
    end

end
