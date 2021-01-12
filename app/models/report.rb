class Report < ApplicationRecord
    has_many :parents
    belongs_to :journal_entry
end
