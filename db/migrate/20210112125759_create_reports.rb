class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :journal_entry_id
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

