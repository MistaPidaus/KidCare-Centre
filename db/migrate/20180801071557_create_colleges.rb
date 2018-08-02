class CreateColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :state
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
