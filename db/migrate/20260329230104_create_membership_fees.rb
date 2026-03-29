class CreateMembershipFees < ActiveRecord::Migration[8.0]
  def change
    create_table :membership_fees do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, precision: 8, scale: 2
      t.string :description
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
