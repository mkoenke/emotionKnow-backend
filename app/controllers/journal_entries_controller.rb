require 'uri'
require 'net/http'
require 'openssl'
# require 'rest-client'
# require 'open-uri'
# require 'json'
require "ibm_watson/authenticators"
require "ibm_watson/speech_to_text_v1"
include IBMWatson



class JournalEntriesController < ApplicationController
    skip_before_action :authorized_child, :authorized_parent, only: [:create, :destroy]
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
        attached_clip = journal_entry.clip.attach(params[:clip])
       
       clip_url = url_for(journal_entry.clip)
       puts clip_url

        # url = Rails.application.routes.url_helpers.rails_blob_path(attached_clip, only_path: true)
        # render json: {message: "Attached to File", url: url, journal: journal_entry }

        # authenticator = Authenticators::IamAuthenticator.new(
        # apikey: ENV['ibmcloud_key']
        # )
        # speech_to_text = SpeechToTextV1.new(
        # authenticator: authenticator
        # )
        # speech_to_text.service_url = "https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/e2803c5a-9508-4006-9769-55bfdf36c4e3"

        # speech_to_text.configure_http_client(disable_ssl_verification: true)

        # audio_file = File.open(Dir.getwd + url)
        # future = speech_to_text.await.recognize(
        # audio: audio_file
        # )
        # p future.complete? # If the request is successful, then this will be true
        # output = future.value # The response is accessible at future.value
        # puts output




url = URI("https://transcribe.p.rapidapi.com/api/v1/transcribe_url/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["x-rapidapi-key"] = ENV['rapidApi_key']
request["x-rapidapi-host"] = 'transcribe.p.rapidapi.com'
request.body = "{
    \"url\": \"#{clip_url}\"
}"

response = http.request(request)
puts "HERE IS THE RESPONSE"
puts response.read_body
            
          


        # url = URI("https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/")

        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        # request = Net::HTTP::Post.new(url)
        # request["content-type"] = 'application/x-www-form-urlencoded'
        # request["x-rapidapi-key"] = ENV['rapidApi_key']
        # request["x-rapidapi-host"] = 'twinword-emotion-analysis-v1.p.rapidapi.com'
        # request.body = "text=#{journal_entry.content.split(" ").join("%20")}"

        # response = http.request(request)
        # resp = response.read_body
       
        # parsed_resp = JSON.parse resp.gsub('=>', ':')
        # puts parsed_resp

        # inner_hash = parsed_resp["emotion_scores"]
        # puts inner_hash

        # report_2 = Report.create(
        # title: journal_entry.title,
        # journal_entry_id: journal_entry.id,
        # parent_id: journal_entry.child.parent.id,
        # child_id: journal_entry.child.id,
        # anger: inner_hash["anger"],
        # disgust: inner_hash["disgust"],
        # fear: inner_hash["fear"],
        # joy: inner_hash["joy"],
        # sadness: inner_hash["sadness"],
        # surprise: inner_hash["surprise"],
        # )
        # puts report_2
        render json: journal_entry
        # puts journal_entry
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
