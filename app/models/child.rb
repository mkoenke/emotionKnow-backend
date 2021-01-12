class Child < ApplicationRecord
    belongs_to :parent 
    has_many :journal_entries
end
