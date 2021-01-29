class Child < ApplicationRecord
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
    belongs_to :parent 
    has_many :journal_entries
    has_many :reports, through: :journal_entries
    has_many :audio_entries
    has_many :audio_reports, through: :audio_entries
    has_many :video_entries
    has_many :video_reports, through: :video_entries
end
