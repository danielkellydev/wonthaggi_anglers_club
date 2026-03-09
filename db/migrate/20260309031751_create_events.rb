class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :location
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :published, null: false, default: false

      t.timestamps
    end
    add_index :events, :slug, unique: true
  end
end
