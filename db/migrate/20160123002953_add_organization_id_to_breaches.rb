class AddOrganizationIdToBreaches < ActiveRecord::Migration
  def change
    add_column :breaches, :organization_id, :integer
  end
end
