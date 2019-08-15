class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :teacher
      t.integer :school_id
      
      t.timestamps
    end
  end
end
