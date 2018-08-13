class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :status
      t.decimal :amount
      t.integer :fee_id

      t.timestamps
    end
  end
end
