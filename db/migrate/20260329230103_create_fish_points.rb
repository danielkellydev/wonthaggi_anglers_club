class CreateFishPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :fish_points do |t|
      t.string :name, null: false
      t.integer :points, null: false
      t.string :notes
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
