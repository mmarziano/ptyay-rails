class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :fundraiser_id
      t.integer :user_id 
      t.integer :number_attending
      t.boolean :will_attend, default: true
      t.timestamps
    end
  end
end
