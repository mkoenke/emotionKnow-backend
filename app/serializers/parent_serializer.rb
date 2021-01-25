class ParentSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_one :child
  has_many :journal_entries, through: :child
  # has_many :reports, through: :journal_entries
end
