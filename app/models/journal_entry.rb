class JournalEntry < ApplicationRecord
    belongs_to :child
    has_many :reports
end
