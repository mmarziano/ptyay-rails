class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :username
      t.string :email 
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :profile_img
      t.integer :school_id
      t.integer :household_id
      
      t.timestamps
    end
  end
end
