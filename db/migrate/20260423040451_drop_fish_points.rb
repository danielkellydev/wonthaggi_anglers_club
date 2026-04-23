class DropFishPoints < ActiveRecord::Migration[8.0]
  def change
    drop_table :fish_points do |t|
      t.string :name, null: false
      t.integer :points, null: false
      t.string :notes
      t.integer :position, default: 0, null: false
      t.timestamps
    end
  end
end
