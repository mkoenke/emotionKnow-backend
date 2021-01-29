class AudioEntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :audio_report, :clip

end
