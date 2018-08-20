class ChangeAssignmentColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :assignments, :unit_id, :course_id
  end
end
