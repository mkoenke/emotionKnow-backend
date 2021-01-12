class Report < ApplicationRecord
    has_one_attached :doc
    has_many :parents
    belongs_to :journal_entry
end
