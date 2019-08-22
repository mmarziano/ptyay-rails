class CreateFundraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraisers do |t|
      t.integer :school_id
      t.string :title
      t.string :artwork
      t.string :description
      t.decimal :amt_raised, precision: 16, scale: 2
      t.string :status
      t.integer :goal
      t.date :date
      t.string :school_year
      t.string :admin_notes

      t.timestamps
    end
  end
end
