class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email 
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :profile_img
      t.boolean :admin, :default => false
      t.integer :school_id
      t.integer :household_id
      
      t.timestamps
    end
  end
end
