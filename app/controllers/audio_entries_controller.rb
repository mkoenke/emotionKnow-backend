require 'uri'
require 'net/http'
require 'openssl'
# require 'rest-client'
# require 'open-uri'
# require 'json'




class AudioEntriesController < ApplicationController
    skip_before_action :authorized_child, :authorized_parent, only: [:create, :destroy, :index]
    def index
        audio_entries = AudioEntry.all
        render json: audio_entries
    end

    def show
        audio_entry = AudioEntry.find(params[:id])
        render json: audio_entry
    end

    def create
        audio_entry = AudioEntry.create!(audio_entry_params)
        attached_clip = audio_entry.clip.attach(params[:clip])
       
       clip_url = url_for(audio_entry.clip)
       puts clip_url
       

        # url = Rails.application.routes.url_helpers.rails_blob_path(attached_clip, only_path: true)
        # render json: {message: "Attached to File", url: url, journal: audio_entry }

       


        # url = URI("https://transcribe.p.rapidapi.com/api/v1/transcribe_url/")

        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        # request = Net::HTTP::Post.new(url)
        # request["content-type"] = 'application/json'
        # request["x-rapidapi-key"] = ENV['rapidApi_key']
        # request["x-rapidapi-host"] = 'transcribe.p.rapidapi.com'
        # request.body = "{
        #     \"url\": \"#{clip_url}\"
        # }"

        # response = http.request(request)
        # puts "HERE IS THE RESPONSE"
        # puts response.read_body
                    
          


        url = URI("https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request["x-rapidapi-key"] = ENV['rapidApi_key']
        request["x-rapidapi-host"] = 'twinword-emotion-analysis-v1.p.rapidapi.com'
        request.body = "text=#{audio_entry.content.split(" ").join("%20")}"

        response = http.request(request)
        resp = response.read_body
       
        parsed_resp = JSON.parse resp.gsub('=>', ':')


        inner_hash = parsed_resp["emotion_scores"]
      

        AudioReport.create(
        title: audio_entry.title,
        audio_entry_id: audio_entry.id,
        parent_id: audio_entry.child.parent.id,
        child_id: audio_entry.child.id,
        anger: inner_hash["anger"],
        disgust: inner_hash["disgust"],
        fear: inner_hash["fear"],
        joy: inner_hash["joy"],
        sadness: inner_hash["sadness"],
        surprise: inner_hash["surprise"],
        )
       
        render json: audio_entry
        
    end

    
    def destroy
        audio_entry = AudioEntry.find(params[:id])
        audio_entry.destroy!
        render json: {}
    end

    def update
        audio_entry = AudioEntry.find(params[:id])
        audio_entry.update!(audio_entry_params)
        render json: audio_entry
    end

    private

    def audio_entry_params
        params.permit( :title, :content, :clip, :child_id)
    end

end


