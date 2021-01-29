class CreateVideoEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :video_entries do |t|
      t.string :title
      t.integer :child_id

      t.timestamps
    end
  end
end
