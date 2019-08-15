class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grade
      t.integer :school_id
      t.integer :household_id
      t.integer :classroom_id
      
      t.timestamps
    end
  end
end
