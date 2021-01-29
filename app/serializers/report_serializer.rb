class ReportSerializer < ActiveModel::Serializer
  attributes :id, :title, :journal_entry_id, :child_id, :parent_id, :excited, :anger, :disgust, :fear, :joy, :sadness, :surprise
end


