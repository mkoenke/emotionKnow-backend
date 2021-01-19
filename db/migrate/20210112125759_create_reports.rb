class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :journal_entry_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
