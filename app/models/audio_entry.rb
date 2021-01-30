class AudioEntry < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :clip, dependent: :destroy

    belongs_to :child
    has_one :audio_report

    def url
        if self.clip.attached?
          "http://localhost:3000/#{Rails.application.routes.url_helpers.rails_blob_path(self.clip, only_path: true)}"
        else
          nil
        end
    end
end
