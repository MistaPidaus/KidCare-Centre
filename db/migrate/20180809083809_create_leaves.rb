class CreateLeaves < ActiveRecord::Migration[5.1]
  def change
    create_table :leaves do |t|
      t.string :start_date
      t.string :end_date
      t.string :duration
      t.string :reason
      t.integer :user_id

      t.timestamps
    end
  end
end
