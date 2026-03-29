class CreateSponsors < ActiveRecord::Migration[8.0]
  def change
    create_table :sponsors do |t|
      t.string :name, null: false
      t.string :website_url
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
