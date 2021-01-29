class ParentSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_one :child
  # has_many :journal_entries, through: :child
  # has_many :audio_entries, through: :child
  # has_many :video_entries, through: :child 
  has_many :reports
  has_many :audio_reports
  has_many :video_reports

end
