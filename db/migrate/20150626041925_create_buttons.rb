class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :title
      t.integer :hits
      t.integer :user_id

      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
