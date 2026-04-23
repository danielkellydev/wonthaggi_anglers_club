class CreateFishOfTheMonths < ActiveRecord::Migration[8.0]
  def change
    create_table :fish_of_the_months do |t|
      t.date :fishing_date, null: false
      t.string :target_species, null: false
      t.boolean :special_event, null: false, default: false

      t.timestamps
    end

    add_index :fish_of_the_months, :fishing_date
  end
end
