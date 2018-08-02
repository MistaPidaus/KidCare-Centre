class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :file
      t.text :description
      t.integer :unit_id

      t.timestamps
    end
  end
end
