class AudioEntry < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :clip, dependent: :destroy

    belongs_to :child
    has_one :audio_report
end
