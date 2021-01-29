class VideoEntry < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :video, dependent: :destroy
    belongs_to :child
    has_one :report

end
