class CreateCommitteeMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :committee_members do |t|
      t.string :role, null: false
      t.string :name, null: false
      t.string :phone
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
