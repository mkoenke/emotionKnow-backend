class Report < ApplicationRecord
    has_one_attached :doc
    belongs_to :parent
    belongs_to :journal_entry
end
