    require 'uri'
    require 'net/http'
    require 'openssl'
    # require 'rest-client'
    # require 'open-uri'
    # require 'json'
 
    
    
    class VideoEntriesController < ApplicationController
        skip_before_action :authorized_child, :authorized_parent, only: [:create, :destroy, :index]
        def index
            video_entries = VideoEntry.all
            render json: video_entries
        end
    
        def show
            video_entry = VideoEntry.find(params[:id])
            render json: video_entry
        end
    
        def create
            video_entry = VideoEntry.create!(video_entry_params)
            attached_video = video_entry.video.attach(params[:video])
           
           video_url = url_for(video_entry.video)
           
    
            # url = Rails.application.routes.url_helpers.rails_blob_path(attached_video, only_path: true)
            # render json: {message: "Attached to File", url: url, journal: video_entry 
    
            # url = URI("https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/")
    
            # http = Net::HTTP.new(url.host, url.port)
            # http.use_ssl = true
            # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
            # request = Net::HTTP::Post.new(url)
            # request["content-type"] = 'application/x-www-form-urlencoded'
            # request["x-rapidapi-key"] = ENV['rapidApi_key']
            # request["x-rapidapi-host"] = 'twinword-emotion-analysis-v1.p.rapidapi.com'
            # request.body = "text=#{video_entry.content.split(" ").join("%20")}"
    
            # response = http.request(request)
            # resp = response.read_body
           
            # parsed_resp = JSON.parse resp.gsub('=>', ':')
    
    
            # inner_hash = parsed_resp["emotion_scores"]
          
    
            # VideoReport.create(
            # title: video_entry.title,
            # video_entry_id: video_entry.id,
            # parent_id: video_entry.child.parent.id,
            # child_id: video_entry.child.id,
            # anger: inner_hash["anger"],
            # disgust: inner_hash["disgust"],
            # fear: inner_hash["fear"],
            # joy: inner_hash["joy"],
            # sadness: inner_hash["sadness"],
            # surprise: inner_hash["surprise"],
            # )
           
            # render json: video_entry
            
        end
    
        
        def destroy
            video_entry = VideoEntry.find(params[:id])
            video_entry.destroy!
            render json: {}
        end
    
        def update
            video_entry = VideoEntry.find(params[:id])
            video_entry.update!(video_entry_params)
            render json: video_entry
        end
    
        private
    
        def video_entry_params
            params.permit( :title, :video, :child_id)
        end
    
    end
    
    
    



