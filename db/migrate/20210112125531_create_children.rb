class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :username
      t.string :password
      t.integer :parent_id

      t.timestamps
    end
  end
end
