class Child < ApplicationRecord
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
    belongs_to :parent 
    has_many :journal_entries
    has_many :reports, through: :journal_entries
end
