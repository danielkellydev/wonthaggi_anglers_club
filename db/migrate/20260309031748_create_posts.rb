class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :category, null: false, default: "news"
      t.boolean :published, null: false, default: false
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
