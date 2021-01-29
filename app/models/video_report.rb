class VideoReport < ApplicationRecord
    belongs_to :parent
    belongs_to :video_entry
end
