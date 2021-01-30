class VideoEntry < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :video, dependent: :destroy
    belongs_to :child
    has_one :report


    def url
        if self.video.attached?
          Rails.application.routes.url_helpers.rails_blob_path(self.video, only_path: true)
        else
          nil
        end
    end
end
