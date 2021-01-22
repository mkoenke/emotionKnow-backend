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


# {"emotion"=>{"Excited"=>0.1999224506, "Fear"=>0.0530939456, "Angry"=>0.1014188568, "Happy"=>0.4907185692, "Sad"=>0.1008562373, "Bored"=>0.0539899405}}