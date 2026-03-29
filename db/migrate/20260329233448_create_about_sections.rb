class CreateAboutSections < ActiveRecord::Migration[8.0]
  def change
    create_table :about_sections do |t|
      t.string :title, null: false
      t.integer :position, null: false, default: 0
      t.boolean :published, default: true, null: false

      t.timestamps
    end
  end
end
