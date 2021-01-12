class ParentMailer < ApplicationMailer
    default from: 'notifications@emotionknow.com'

    def welcome_email
        @parent = params[:parent]
        @url  = 'http://example.com/login'
        mail(to: @parent.email, subject: 'Welcome to EmotionKnow!')
    end

    def sentiment_report
        @parent = Parent.find(params[:id])
        mail(to: @parent.email, subject: "Your child's sentiment report")
    end 
end
