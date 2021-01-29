class AudioReportSerializer < ActiveModel::Serializer
  attributes :id, :title, :audio_entry_id, :child_id, :parent_id, :anger, :disgust, :fear, :joy, :sadness, :surprise
  
end
