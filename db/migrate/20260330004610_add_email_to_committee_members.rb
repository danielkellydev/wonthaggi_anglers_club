class AddEmailToCommitteeMembers < ActiveRecord::Migration[8.0]
  def change
    add_column :committee_members, :email, :string
  end
end
