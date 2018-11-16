class AddTotalScoreToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :total_score, :integer
  end
end
