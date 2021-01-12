class JournalEntry < ApplicationRecord
has_one_attached :clip
has_one attached :thumbnail

    belongs_to :child
    has_many :reports

end
