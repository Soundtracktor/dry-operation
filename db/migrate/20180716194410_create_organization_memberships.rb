class CreateOrganizationMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_memberships do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
