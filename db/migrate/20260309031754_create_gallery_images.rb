class CreateGalleryImages < ActiveRecord::Migration[8.0]
  def change
    create_table :gallery_images do |t|
      t.string :caption
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
