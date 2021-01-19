class JournalEntry < ApplicationRecord
has_one_attached :clip
has_one_attached :thumbnail

    belongs_to :child
    has_one :report

end
