class CreateHouseholds < ActiveRecord::Migration[5.2]
  def change
    create_table :households do |t|
      t.integer :school_id
      
      t.timestamps
    end
  end
end
