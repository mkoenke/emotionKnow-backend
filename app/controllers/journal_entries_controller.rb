class JournalEntriesController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy]
    def index
        journal_entries = JournalEntry.all
        render json: journal_entries
    end

    def show
        journal_entry = JournalEntry.find(params[:id])
        render json: journal_entry
    end

    def create
        journal_entry = JournalEntry.create!(journal_entry_params)
        render json: journal_entry
    end
    
    def destroy
        journal_entry = JournalEntry.find(params[:id])
        journal_entry.destroy!
        render json: {}
    end

    def update
        journal_entry = JournalEntry.find(params[:id])
        journal_entry.update!(journal_entry_params)
        render json: journal_entry
    end

    private

    def journal_entry_params
        params.permit(:file, :title, :content, :clip, :thumbnail, :child_id)
    end

end
