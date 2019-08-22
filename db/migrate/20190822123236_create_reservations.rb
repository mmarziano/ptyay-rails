class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :fundraiser_id
      t.integer :household_id 
      t.integer :number_attending
      t.text :attendees
      t.timestamps
    end
  end
end
