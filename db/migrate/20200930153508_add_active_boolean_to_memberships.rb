class AddActiveBooleanToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :active, :boolean, default: true
  end
end
