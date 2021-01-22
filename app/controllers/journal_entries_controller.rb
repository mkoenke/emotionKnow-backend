require 'uri'
require 'net/http'
require 'openssl'
# require 'rest-client'
# require 'open-uri'
# require 'json'


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
                # create helper function to send journal entry content to API and get response of emotion data
                # use emotion data to create Report.new and send to front end to display charts

                # response = RestClient.post "https://apis.paralleldots.com/v5/emotion", { api_key: ENV['parallel_api_key'], text: journal_entry}
                # response = JSON.parse( response )
                # puts response
                # new_report = response.each do |emotion|
                #     Report.create(
                        # title: journal_entry.title,
                        # journal_entry_id: journal_entry.id,
                        # parent_id: journal_entry.child.parent.id,
                        # child_id: journal_entry.child.id,
                        # excited: response["emotion"]["Excited"],
                        # fear: response["emotion"]["Fear"],
                        # angry: response["emotion"]["Angry"],
                        # happy: response["emotion"]["Happy"],
                        # sad: response["emotion"]["Sad"],
                        # bored: response["emotion"]["Bored"],
                #     )
                # end
                # puts new_report

        url = URI("https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request["x-rapidapi-key"] = 'b5e53cdd43msh1789007757d5e6cp16375ejsn5b00f98de59e'
        # request["x-rapidapi-key"] = '9562b59c0emsh93141dff1893ca0p1dce1cjsnc3699e6882d9'
        request["x-rapidapi-host"] = 'twinword-emotion-analysis-v1.p.rapidapi.com'
        # request.body = "text=After%20living%20abroad%20for%20such%20a%20long%20time%2C%20seeing%20my%20family%20was%20the%20best%20present%20I%20could%20have%20ever%20wished%20for."
        request.body = "text=#{journal_entry.content.split(" ").join("%20")}"

        response = http.request(request)
        # puts response.read_body
        resp = response.read_body
        # puts resp
        
        eval_resp = eval(resp)
        puts eval_resp
        
       report_1 = Report.create(
            title: journal_entry.title,
            journal_entry_id: journal_entry.id,
            parent_id: journal_entry.child.parent.id,
            child_id: journal_entry.child.id,
            anger: eval_resp.dig(:emotion_scores, :anger),
            disgust: eval_resp.dig(:emotion_scores, :disgust),
            fear: eval_resp.dig(:emotion_scores, :fear),
            joy: eval_resp.dig(:emotion_scores, :joy),
            sadness: eval_resp.dig(:emotion_scores, :sadness),
            surprise: eval_resp.dig(:emotion_scores, :surprise),
            )
            puts report_1
            
            parsed_resp = JSON.parse resp.gsub('=>', ':')
            puts parsed_resp

            inner_hash = parsed_resp["emotion_scores"]
            puts inner_hash

            report_2 = Report.create(
            title: journal_entry.title,
            journal_entry_id: journal_entry.id,
            parent_id: journal_entry.child.parent.id,
            child_id: journal_entry.child.id,
            anger: inner_hash["anger"],
            disgust: inner_hash["disgust"],
            fear: inner_hash["fear"],
            joy: inner_hash["joy"],
            sadness: inner_hash["sadness"],
            surprise: inner_hash["surprise"],
            )
            puts report_2
         

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
