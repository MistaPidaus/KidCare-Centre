class ChangeAssignmentFileColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :assignments, :file, :assignment_file
  end
end
