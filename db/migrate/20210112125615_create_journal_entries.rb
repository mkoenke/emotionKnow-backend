class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.string :file
      t.string :title
      t.integer :child_id

      t.timestamps
    end
  end
end
