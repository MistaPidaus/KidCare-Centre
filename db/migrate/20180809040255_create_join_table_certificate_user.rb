class CreateJoinTableCertificateUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :certificates, :users do |t|
      # t.index [:certificate_id, :user_id]
       t.index [:user_id, :certificate_id]
       t.timestamps
    end
  end
end
