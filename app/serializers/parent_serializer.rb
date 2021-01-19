class ParentSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :children
end
