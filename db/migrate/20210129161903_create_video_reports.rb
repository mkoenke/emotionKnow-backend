class CreateVideoReports < ActiveRecord::Migration[6.0]
  def change
    create_table :video_reports do |t|
      t.string :title
      t.integer :video_entry_id
      t.integer :child_id
      t.integer :parent_id
      t.decimal :anger
      t.decimal :disgust
      t.decimal :fear
      t.decimal :joy
      t.decimal :sadness
      t.decimal :surprise

      t.timestamps
    end
  end
end
