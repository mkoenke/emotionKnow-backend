class JournalEntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :report, :date

  def date 
    self.object.created_at.strftime("%b %d, %Y")
  end

end
