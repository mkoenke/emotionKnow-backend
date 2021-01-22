class ReportSerializer < ActiveModel::Serializer
  attributes :id, :title, :journal_entry_id, :parent_id, :excited, :fear, :angry, :happy, :sad, :bored
end


