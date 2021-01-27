class JournalEntry < ApplicationRecord
    include Rails.application.routes.url_helpers
has_one_attached :clip, dependent: :destroy
has_one_attached :thumbnail, dependent: :destroy

    belongs_to :child
    has_one :report

end
