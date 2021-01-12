class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :email
      t.integer :report_id

      t.timestamps
    end
  end
end
