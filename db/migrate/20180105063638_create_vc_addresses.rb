class CreateVcAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :vc_addresses do |t|
      t.references :inquiry, null: false, foreign_key: true
      t.string :currency, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
