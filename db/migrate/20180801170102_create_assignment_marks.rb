class CreateAssignmentMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :assignment_marks do |t|
      t.text :file
      t.decimal :marks
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
