class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.string :content
      t.integer :child_id

      t.timestamps
    end
  end
end
