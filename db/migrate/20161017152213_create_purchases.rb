class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|

      t.integer :purchase_number
      t.string :payment_method
      t.decimal :total_price

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
