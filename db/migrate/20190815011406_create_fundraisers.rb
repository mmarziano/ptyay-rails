class CreateFundraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraisers do |t|
      t.integer :school_id
      t.string :title
      t.string :artwork
      t.text :description
      t.decimal :amt_raised, precision: 16, scale: 2
      t.string :status
      t.integer :goal
      t.integer :price
      t.time :time
      t.date :date
      t.integer :duration
      t.string :location
      t.text :notice
      t.string :school_year
      t.string :admin_notes

      t.timestamps
    end
  end
end
