class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.string :payment_method
      t.decimal :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
