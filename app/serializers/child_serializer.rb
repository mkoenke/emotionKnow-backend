class ChildSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :parent_email

  has_many :journal_entries

  def parent_email
    self.object.parent.email
  end
end
