class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.boolean :published
      t.integer :college_id

      t.timestamps
    end
  end
end
