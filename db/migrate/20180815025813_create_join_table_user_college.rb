class CreateJoinTableUserCollege < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :colleges do |t|
       t.index [:user_id, :college_id]
      # t.index [:college_id, :user_id]
    end
  end
end
