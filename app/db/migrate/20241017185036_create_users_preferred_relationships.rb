class CreateUsersPreferredRelationships < ActiveRecord::Migration[7.2]
  def change
    create_table :users_preferred_relationships do |t|
      t.references :preference, null: false, foreign_key: true
      t.references :preferred_relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
