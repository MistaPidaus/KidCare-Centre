class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.text :attachment
      t.integer :course_id

      t.timestamps
    end
  end
end
