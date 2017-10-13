class CreateLens < ActiveRecord::Migration[5.1]
  def change
    create_table :lens do |t|
      t.string :name, null: false
      t.integer :focal_length, null: false
      t.integer :generation, null: false
    end
  end
end
