class CreateCompetitions < ActiveRecord::Migration[8.0]
  def change
    create_table :competitions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
