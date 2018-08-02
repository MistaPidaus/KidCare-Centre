class CreateTaskas < ActiveRecord::Migration[5.1]
  def change
    create_table :taskas do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :address
      t.string :state
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
