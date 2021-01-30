class AudioEntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :audio_report, :clip, :date, :url

  def date 
    self.object.created_at.strftime("%b %d, %Y")
  end

end
