class ChildSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :parent_email

  has_many :journal_entries

  def parent_email
    self.object.parent.email
  end
end
